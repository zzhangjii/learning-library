// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
variable "provider_oci" {
  type = map(string)
}

variable "compartment_ids" {
  type = map(string)
}

variable "subnet_ids" {
  type = map(string)
}

variable "linux_images" {
  type = map(string)
}

variable "instance_params" {
  description = "Placeholder for the parameters of the instances"
  type        = map(object({
    ad                   = number
    shape                = string
    hostname             = string
    boot_volume_size     = number
    assign_public_ip     = bool
    preserve_boot_volume = bool
    compartment_name     = string
    subnet_name          = string
    ssh_public_key       = string
    device_disk_mappings = string
    freeform_tags        = map(string)
  }))
}

variable "bv_params" {
  description = "Placeholder the bv parameters"
  type        = map(object({
    ad             = number
    display_name   = string
    bv_size        = number
    instance_name  = string
    device_name    = string
    freeform_tags  = map(string)
  }))
}

variable "windows_images" {
  type = map(string)
}

variable "win_instance_params" {
  description = "Placeholder for windows instances"
  type        = map(object({
    ad                   = number
    shape                = string
    hostname             = string
    boot_volume_size     = number
    assign_public_ip     = bool
    preserve_boot_volume = bool
    compartment_name     = string
    subnet_name          = string
    device_disk_mappings = string
    freeform_tags        = map(string)
  }))
}

variable "win_bv_params" {
  description = "Placeholder for windows bv"
  type        = map(object({
    ad             = number
    display_name   = string
    bv_size        = number
    instance_name  = string
    freeform_tags  = map(string)
  }))
}
