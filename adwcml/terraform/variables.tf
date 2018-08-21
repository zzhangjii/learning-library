variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {default = "./keys/oci_api_key.pem"}
variable "region" {default = "us-ashburn-1"}
variable "compartment_ocid" {}
variable "ssh_public_key" {default = "./keys/publicKey"}
variable "ssh_private_key" {default = "./keys/privateKey"}
variable "HostUserName" {default = "opc"}

# Choose an Availability Domain
variable "AD" {default = "1"}

variable "InstanceShape" {default = "VM.Standard1.1"}

variable "InstanceImageOCID" {
  type = "map"

  default = {
    // Oracle-provided image "Oracle-Linux-7.4-2017.12.18-0"
    // See https://docs.us-phoenix-1.oraclecloud.com/Content/Resources/Assets/OracleProvidedImageOCIDs.pdf
    us-phoenix-1   = "ocid1.image.oc1.iad.aaaaaaaaquftss3mo7u7tixebqugwfpmhje7a4cixgy6pez7za3ljcoa3ucq"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaaquftss3mo7u7tixebqugwfpmhje7a4cixgy6pez7za3ljcoa3ucq"
    eu-frankfurt-1 = "ocid1.image.oc1.iad.aaaaaaaaquftss3mo7u7tixebqugwfpmhje7a4cixgy6pez7za3ljcoa3ucq"
  }
}

variable "256GB" {default = "50"}
variable "BootStrapFile" {default = "./userdata/bootstrap"}
variable "user_name" {}
variable "deployment_short_id" {}
variable "deployment_auuid" {}
variable "user_email" {}
