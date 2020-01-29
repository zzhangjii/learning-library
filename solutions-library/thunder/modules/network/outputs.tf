// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
output "vcns" {
  value = {
    for vcn in oci_core_virtual_network.vcn:
      vcn.display_name => map(vcn.id, vcn.cidr_block)
  }
}

output "subnets" {
  value = {
    for subnet in oci_core_subnet.subnets:
      subnet.display_name => map(subnet.id, subnet.cidr_block)
  }
}

output "subnets_ids" {
  value = {
    for subnet in oci_core_subnet.subnets:
      subnet.display_name => subnet.id
  }
}
