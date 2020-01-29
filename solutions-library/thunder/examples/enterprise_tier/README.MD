# Enterprise Tier Resources
In this example, all the resources from crawl and walk are instantiated.
You have full flexibility on provisioning the resources from here (you can scale anything up or down)

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