// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.

locals {
  linux_instances = {
    for instance in oci_core_instance.this:
      instance.display_name => { "id" : instance.id, "ip": instance.public_ip != "" ? instance.public_ip : instance.private_ip }
  }
  
  windows_instances = {
    for idx, instance in oci_core_instance.win_this:
      instance.display_name => { "id" : instance.id, "ip": instance.public_ip != "" ? instance.public_ip : instance.private_ip, "username": data.oci_core_instance_credentials.windows_credentials[idx].username, "password": data.oci_core_instance_credentials.windows_credentials[idx].password }
  }
  
  linux_ids = {
    for instance in oci_core_instance.this:
      instance.display_name => instance.id
  }

  windows_ids = {
    for instance in oci_core_instance.win_this:
      instance.display_name => instance.id
  }

  linux_private_ips = {
    for instance in oci_core_instance.this:
      instance.display_name => instance.private_ip
  }

  windows_private_ips = {
    for instance in oci_core_instance.win_this:
      instance.display_name => instance.private_ip
  }
  
  all_instances   = merge(local.linux_ids, local.windows_ids)
  all_private_ips = merge(local.linux_private_ips, local.windows_private_ips)
}

output "linux_instances" {
  value = local.linux_instances
}

output "windows_instances" {
  value = local.windows_instances
}

output "all_instances" {
  #value = merge(oci_core_instance.this.id, oci_core_instance.win_this[each.key].id)
  value = local.all_instances
}

output "all_private_ips" {
  value = local.all_private_ips
}