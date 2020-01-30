// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
resource "oci_core_virtual_network" "vcn" {
  for_each       = var.vcn_params
  cidr_block     = each.value.vcn_cidr
  compartment_id = var.compartment_ids[each.value.compartment_name]
  display_name   = each.value.display_name
  dns_label      = each.value.dns_label
}

resource "oci_core_internet_gateway" "igw" {
  for_each       = var.igw_params
  compartment_id = oci_core_virtual_network.vcn[each.value.vcn_name].compartment_id
  vcn_id         = oci_core_virtual_network.vcn[each.value.vcn_name].id
  display_name   = each.value.display_name
}

resource "oci_core_nat_gateway" "ngw" {
  for_each       = var.ngw_params
  compartment_id = oci_core_virtual_network.vcn[each.value.vcn_name].compartment_id
  vcn_id         = oci_core_virtual_network.vcn[each.value.vcn_name].id
  display_name   = each.value.display_name
}

resource "oci_core_route_table" "route_table" {
  for_each = var.rt_params
  compartment_id = oci_core_virtual_network.vcn[each.value.vcn_name].compartment_id
  vcn_id         = oci_core_virtual_network.vcn[each.value.vcn_name].id
  display_name   = each.value.display_name

  dynamic "route_rules" {
    iterator = rr
    for_each = each.value.route_rules
    content{
      destination       = rr.value.destination
      network_entity_id = rr.value.use_igw ? oci_core_internet_gateway.igw[lookup(rr.value, "igw_name", null)].id : oci_core_nat_gateway.ngw[lookup(rr.value, "ngw_name", null)].id
    }
  }
}

resource "oci_core_security_list" "sl" {
  for_each       = var.sl_params
  compartment_id = oci_core_virtual_network.vcn[each.value.vcn_name].compartment_id
  vcn_id         = oci_core_virtual_network.vcn[each.value.vcn_name].id
  display_name   = each.value.display_name

  dynamic "egress_security_rules"{
    iterator = egress_rules
    for_each = each.value.egress_rules
    content {
      stateless   = egress_rules.value.stateless
      protocol    = egress_rules.value.protocol
      destination = egress_rules.value.destination
    }
  }


  dynamic "ingress_security_rules" {
    iterator = ingress_rules
    for_each = each.value.ingress_rules
    content {
      stateless   = ingress_rules.value.stateless
      protocol    = ingress_rules.value.protocol
      source      = ingress_rules.value.source
      source_type = ingress_rules.value.source_type

        dynamic "tcp_options" {
          iterator = tcp_options
          for_each = (lookup(ingress_rules.value, "tcp_options", null) != null) ? ingress_rules.value.tcp_options : []
          content {
            max = tcp_options.value.max
            min = tcp_options.value.min
          }
        }

        dynamic "udp_options" {
          iterator = udp_options
          for_each = (lookup(ingress_rules.value, "udp_options", null) != null) ? ingress_rules.value.udp_options : []
          content {
            max = udp_options.value.max
            min = udp_options.value.min
          }
        }
    }
  }
}


resource "oci_core_network_security_group" "nsg" {
  for_each         = var.nsg_params
  compartment_id   = oci_core_virtual_network.vcn[each.value.vcn_name].compartment_id
  vcn_id           = oci_core_virtual_network.vcn[each.value.vcn_name].id
  display_name     = each.value.display_name
}

resource "oci_core_network_security_group_security_rule" "nsg_rules" {
  for_each                  = var.nsg_rules_params
  network_security_group_id = oci_core_network_security_group.nsg[each.value.nsg_name].id
  protocol                  = each.value.protocol
  stateless                 = each.value.stateless
  direction                 = each.value.direction

  source                    = each.value.direction == "INGRESS" ? each.value.source : null
  source_type               = each.value.direction == "INGRESS" ? each.value.source_type : null

  destination               = each.value.direction == "EGRESS" ? each.value.destination : null
  destination_type          = each.value.direction == "EGRESS" ? each.value.destination_type : null


  dynamic "tcp_options" {
    iterator = tcp_options
    for_each = each.value.tcp_options != null ? each.value.tcp_options : []
    content {
      dynamic "destination_port_range" {
        iterator  = destination_ports
        for_each  = lookup(tcp_options.value, "destination_ports", null) != null ? tcp_options.value.destination_ports : []
          content {
            min = destination_ports.value.min
            max = destination_ports.value.max
          }
      }
      dynamic "source_port_range" {
        iterator  = source_ports
        for_each  = lookup(tcp_options.value, "source_ports", null) != null ? tcp_options.value.source_ports : []
          content {
            min = source_ports.value.min
            max = source_ports.value.max
          }
      }
    }
  }

  dynamic "udp_options" {
    iterator = udp_options
    for_each = each.value.udp_options != null ? each.value.udp_options : []
    content {
      dynamic "destination_port_range" {
        iterator  = destination_ports
        for_each  = lookup(udp_options.value, "destination_ports", null) != null ? udp_options.value.destination_ports : []
          content {
            min = destination_ports.value.min
            max = destination_ports.value.max
          }
      }

      dynamic "source_port_range" {
        iterator  = source_ports
        for_each  = lookup(udp_options.value, "source_ports", null) != null ? udp_options.value.source_ports : []
          content {
            min = source_ports.value.min
            max = source_ports.value.max
          }
      }
    }
  }
}


resource "oci_core_subnet" "subnets" {
  for_each                   = var.subnet_params
  cidr_block                 = each.value.cidr_block
  display_name               = each.value.display_name
  dns_label                  = each.value.dns_label
  prohibit_public_ip_on_vnic = each.value.is_subnet_private
  compartment_id             = oci_core_virtual_network.vcn[each.value.vcn_name].compartment_id
  vcn_id                     = oci_core_virtual_network.vcn[each.value.vcn_name].id
  route_table_id             = oci_core_route_table.route_table[each.value.rt_name].id
  security_list_ids          = [oci_core_security_list.sl[each.value.sl_name].id]
}
