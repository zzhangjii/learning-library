# DbaaS Examples

Here are some useful examples on DbaaS

## Description

The DbaaS module is able to create DbaaS.

* Parameters
  * compartment_name - The compartment name in which the DB will be created
  * subnet_name - The name of the subnet in which the DB will be created
  * ad - The availability domain number in which the DB will be created
  * cpu_core_count - The number of CPUs for the DB
  * db_edition - The DB edition (can be STANDARD_EDITION, ENTERPRISE_EDITION, ENTERPRISE_EDITION_HIGH_PERFORMANCE, ENTERPRISE_EDITION_EXTREME_PERFORMANCE)
  * db_name - The name of the database
  * db_admin_password - The admin password of the DB
  * db_workload - The workload of the database
  * pdb_name - The name of the pdb
  * enable_auto_backup - Whether you want auto backups or not
  * db_version - The version of the DB (11.2.0.4, 12.1.0.2, 12.2.0.1)
  * display_name - The display name of the database system
  * disk_redudancy - The disk redundancy
  * shape - The shape of the database 
  * ssh_public_key - The path to the ssh public key which will be uploaded on the DB system
  * hostname - The hostname of the node
  * data_storage_size_in_gb - The data storage size of the DB
  * license_model - The license model
  * node_count - Number of DB nodes

## Example
In the provided example, there are 2 DB Systems created

* hur1dbaas
* hur2dbaas

The compartment_ids and subnet_ids will be external to the database params in order to offer multiple ways of linking them from a terraform perspective.
In the example from below, there is a list of compartments containing 1 element and a list of subnets containing one element. By setting in database_params `compartment_name` to sandbox, The databases will be created in the following compartment `ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq`. The same thing is happening to subnet_ids. All lists can be extended in order to satisfy your needs.

The example is based on terraform.tfvars values:

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq"
}

subnet_ids      = {
  hur1pub = "ocid1.subnet.oc1.iad.aaaaaaaanqbpaze4zgpkk22uocphhwlqr2qkhql66bo66rqtx2ylqulvfbeq"
}

database_params = {
  hur1dbaas = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION"
    db_name                 = "hur1dbaas"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "hur1pdbdbaas"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "hur1dbaas"
    disk_redundancy         = "HIGH"
    shape                   = "VM.Standard2.8"
    subnet_name             = "hur1pub"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "hur1dbaas"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  },
  hur2dbaas = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
    db_name                 = "hur2dbaas"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "hur2pdbdbaas"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "hur2dbaas"
    disk_redundancy         = "NORMAL"
    shape                   = "VM.Standard2.8"
    subnet_name             = "hur1pub"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "hur2dbaas"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  },
}
```

This is just an example, but the number of the resources can be increased/decreased to suit any needs.

For example if you want to increase the number of DB systems to 3, you will have to modify the db_params variable in the terraform.tfvars file, by adding another map containing the configurations of the new dbaas.

```

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
https://cloud.oracle.com/database/faq
https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/databaseoverview.htm