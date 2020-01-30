# Always Free Resources
In this example, only always free resources are created:
* 1 Compute Instance (having a Micro shape)
* 1 Autonomous Transaction Processing DB
* 1 Standard Bucket (you can get 20GB of objects in it)
* 1 Compartment
* 1 User
* 1 Group
* 1 Policy
* 1 VCN with 1 subnet
* 1 Load balancer having one backend set, one listener and one backend

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
https://docs.cloud.oracle.com/iaas/Content/FreeTier/resourceref.htm