# ADW Examples

Here are some useful examples on ADW

## Description

The ADW module is able to create ADW/ATP databases.

* Parameters
  * compartment_name - The compartment name in which the ADW/ATP will be created
  * cpu_core_count - The number of CPUs for the ADW/ATP
  * size_in_tbs - The ADW/ATP database size in terrabytes
  * db_name - The name of the databases
  * db_workload - The workload of the database (Supported values are "DW" for ADW and "OLTP" for ATP)
  * enable_auto_scaling - Whether you want to have auto scaling enables
  * is_free_tier - Whether you want your ADW to be included in the always free

## Example
In the provided example, the following resources are created based on the db_workload type (DW will create an ADW, OLTP will create an ATP)

* 1 ADW 
  * hurriadw
* 1 ATP
  * hurriatp

The compartment_ids will be external to the adw params in order to offer multiple ways of linking them from a terraform perspective.
In the example from below, there is a list of compartments containing 2 elements. By setting in adw_params `compartment_name` to sandbox, The ad will be created in the first element of the list: `ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq`. All lists can be extended in order to satisfy your needs.


The example is based on terraform.tfvars values:

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq"
}

adw_params = {
  hurriatp = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriatp"
    db_workload         = "OLTP"
    enable_auto_scaling = false
    is_free_tier        = false
  }
  hurriadw = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriadw"
    db_workload         = "DW"
    enable_auto_scaling = false
    is_free_tier        = false
  }
}

Don't forget to populate the provider with the details of your tenancy as specified in the main README.md file.

## Running the code

```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply

# If you are done with this infrastructure, take it down
$ terraform destroy
```

## Useful Links
https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/adboverview.htm