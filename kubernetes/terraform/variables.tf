variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {
  default = "./oci_api_key.pem"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "compartment_ocid" {}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0nysWs1m+sdoaK15mMIvLEiN+ofDhi9qNEXbPby+a76cJl4zD26P3cErUjE2HVLizuLoec5XzrcKLOz53/0f9hulwZRzapsbIZlPDLBoL+HcuqRyD23YMf6ETg780E3cKZvDVtVCKZg0R2H8QGs9yrnKHt0zhXp6FwKuinfVvMhY3rOM23bYRoI3Y4WiREMSDWLkNTXxAJqUPtcxPVVU388OpWznAsEYiioiwt/KsNU1MECpcK93vihdUMJ15GamPptplS+0Bu1nmYHOvkp9UHEsq+SNKw57sO8S2dgJtpDmT3Hyth8ZvgW+pYOEGAD7PwxFfUm2km/XuRUDF7HfB computekey"
}

variable "ssh_private_key" {
  default = "./ckey"
}

# Choose an Availability Domain
variable "AD" {
  default = "1"
}

variable "InstanceShape" {
  default = "VM.Standard1.1"
}

variable "InstanceImageOCID" {
  type = "map"

  default = {
    // Oracle-provided image "Oracle-Linux-7.4-2017.12.18-0"
    // See https://docs.us-phoenix-1.oraclecloud.com/Content/Resources/Assets/OracleProvidedImageOCIDs.pdf
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaav4gjc4l232wx5g5drypbuiu375lemgdgnc7zg2wrdfmmtbtyrc5q"

    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaa33siliry4le3hrl2oemn73bl2kbhw7iziv2d55xziwq3yn5yfepa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt1.aaaaaaaajdge4yzm5j7ci7ryzte7f3qgcekljjw7p6nexhnsvwt6hoybcu3q"
  }
}

variable "256GB" {
  default = "50"
}

variable "BootStrapFile" {
  default = "./userdata/bootstrap"
}

variable "user_name" {}
variable "deployment_short_id" {}
variable "deployment_auuid" {}
variable "user_email" {}
