// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ids[var.instance_params[keys(var.instance_params)[0]].compartment_name]
}


data "template_file" "block_volumes_templates" {
  for_each    = var.instance_params
  template = file("${path.module}/../../userdata/linux_mount.sh")

  vars = {
    device_disk_mappings = each.value.device_disk_mappings
  }
}

data "template_cloudinit_config" "config" {
  for_each      = var.instance_params
  gzip          = false
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "cloudinit.sh"
    content_type = "text/x-shellscript"
    content      = data.template_file.block_volumes_templates[each.value.hostname].rendered
  }
}

resource "oci_core_instance" "this" {
  for_each             = var.instance_params
  availability_domain  = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad -1].name
  compartment_id       = var.compartment_ids[each.value.compartment_name]
  shape                = each.value.shape
  display_name         = each.value.hostname
  preserve_boot_volume = each.value.preserve_boot_volume
  freeform_tags        = each.value.freeform_tags


  create_vnic_details {
    assign_public_ip = each.value.assign_public_ip
    subnet_id        = var.subnet_ids[each.value.subnet_name]
    hostname_label   = each.value.hostname
  }

  source_details {
    boot_volume_size_in_gbs = each.value.boot_volume_size
    source_type             = "image"
    source_id               = var.linux_images[var.region]
  }

  metadata = {
    ssh_authorized_keys = file(each.value.ssh_public_key)
    user_data           = data.template_cloudinit_config.config[each.value.hostname].rendered
  }
}

resource "oci_core_volume" "block" {
  for_each            = var.bv_params
  availability_domain = oci_core_instance.this[each.value.instance_name].availability_domain
  compartment_id      = oci_core_instance.this[each.value.instance_name].compartment_id
  display_name        = each.value.display_name
  size_in_gbs         = each.value.bv_size
  freeform_tags       = each.value.freeform_tags
}

resource "oci_core_volume_attachment" "attachment" {
  for_each        = var.bv_params
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.this[each.value.instance_name].id
  volume_id       = oci_core_volume.block[each.value.display_name].id
  device          = each.value.device_name
}

data "template_file" "win_block_volumes_templates" {
  for_each    = var.win_instance_params
  template    = file("${path.module}/../../userdata/win_mount.ps1")

  vars = {
    device_disk_mappings = each.value.device_disk_mappings
  }
}

data "template_cloudinit_config" "win_config" {
  for_each      = var.win_instance_params
  gzip          = false
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "cloudinit.ps1"
    content_type = "text/x-shellscript"
    content      = data.template_file.win_block_volumes_templates[each.value.hostname].rendered
  }
}

resource "oci_core_instance" "win_this" {
  for_each             = var.win_instance_params
  availability_domain  = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad -1].name
  compartment_id       = var.compartment_ids[each.value.compartment_name]
  shape                = each.value.shape
  display_name         = each.value.hostname
  preserve_boot_volume = each.value.preserve_boot_volume
  freeform_tags        = each.value.freeform_tags

  create_vnic_details {
    assign_public_ip = each.value.assign_public_ip
    subnet_id        = var.subnet_ids[each.value.subnet_name]
    hostname_label   = each.value.hostname
  }

  source_details {
    boot_volume_size_in_gbs = each.value.boot_volume_size
    source_type             = "image"
    source_id               = var.windows_images[var.region]
  }

  metadata = {
    user_data = data.template_cloudinit_config.win_config[each.value.hostname].rendered
  }
}

data "oci_core_instance_credentials" "windows_credentials" {
  for_each    = var.win_instance_params
  instance_id = oci_core_instance.win_this[each.value.hostname].id
}

resource "oci_core_volume" "win_block" {
  for_each            = var.win_bv_params
  availability_domain = oci_core_instance.win_this[each.value.instance_name].availability_domain
  compartment_id      = oci_core_instance.win_this[each.value.instance_name].compartment_id
  display_name        = each.value.display_name
  size_in_gbs         = each.value.bv_size
  freeform_tags       = each.value.freeform_tags
}

resource "oci_core_volume_attachment" "win_attachment" {
  for_each        = var.win_bv_params
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.win_this[each.value.instance_name].id
  volume_id       = oci_core_volume.win_block[each.value.display_name].id
}
