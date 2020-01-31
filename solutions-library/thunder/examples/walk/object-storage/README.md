# Object Storage
This module will create multiple buckets in OCI.

## Description

The terraform modules uses the following variables:
* Bucket parameters
  * compartment_name - The compartment name in which the bucket will be created
  * name - The name of the bucket
  * access_type - The type of public access enabled on this bucket. If a bucket is set to NoPublicAccess it allows an authenticated caller to access the bucket and its contents. When ObjectRead is enabled on the bucket, public access is allowed for the GetObject, HeadObject, and ListObjects operations. When ObjectReadWithoutList is enabled on the bucket, public access is allowed for the GetObject and HeadObject operations.
  * storage_tier - The type of storage tier of this bucket. A bucket is set to 'Standard' tier by default, which means the bucket will be put in the standard storage tier. When 'Archive' tier type is set explicitly, the bucket is put in the Archive Storage tier. The 'storageTier' property is immutable after bucket is created.
  * events_enabled - A property that determines whether events will be generated for operations on objects in this bucket.


## Example

In our example one standard bucket is created with no public access and no events enabled.

The compartment_ids will be external to the bucket_params in order to offer multiple ways of linking them from a terraform perspective.
In the example from below, there is a list of compartments containing 1 element. By setting in vcn_params `compartment_name` to sandbox, The buckets will be created the sandbox compartment `ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq`. All lists can be extended in order to satisfy your needs.

```
compartments    = {
  sandbox = "ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq"
}

bucket_params   = {
  hur-buck-1 = {
    compartment_name = "sandbox"
    name              = "hur-buck-1"
    access_type       = "NoPublicAccess"
    storage_tier      = "Standard"
    events_enabled    = false 
  }
}
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

## Useful links
https://docs.cloud.oracle.com/iaas/Content/Object/Concepts/objectstorageoverview.htm
https://www.terraform.io/docs/providers/oci/r/objectstorage_bucket.html