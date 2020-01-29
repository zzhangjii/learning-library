# Instance Principal Examples

Below there is a simple example of how to create the required resources in order to make an instance principal.
This procedure describes how you can authorize an instance to make API calls in Oracle Cloud Infrastructure services. After you set up the required resources and policies, an application running on an instance can call Oracle Cloud Infrastructure public services, removing the need to configure user credentials or a configuration file.

## Description

The terraform module uses the following variables:

* Instance principal parameters
  * dg_description - The description of the dynamic group
  * dg_name - The name of the dynamic group
  * policy_description - The description of the policy
  * policy_name - The name of the policy
  * instance_name - The name of the instance

## Example

In the example, the following components are created:
  * one dynamic group
  * one policy 

A list of instances is given in this example and based on those instances, a dynamic group and a policy for it are created. The dynamic group will make the instance principal and the policy will give it permissions all over the tenancy.


```
instances = {
  hur1 = "ocid1.instance.oc1.eu-frankfurt-1.antheljsuvrz6sqckiihatrzthfbuk4fasdsih5672yay37q4rq5kyz7w74a"
}

instance_principal_params = {
  web = {
    dg_description     = "instance principal web"
    dg_name            = "web"
    policy_description = "web"
    policy_name        = "web"
    instance_name      = "hur1"
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
https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/callingservicesfrominstances.htm
https://www.terraform.io/docs/providers/oci/r/identity_dynamic_group.html