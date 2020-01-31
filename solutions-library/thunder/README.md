# Oracle ISV Thunder Cloud Adoption Framework

This crawl, walk, run framework leverages our experiences and best practices in assisting
ISV organizations around the world adopting OCI. This project is open source and maintained by Oracle Corp. 

In the span of a few days or hours, the code examples provided here establish an easy to understand path to gaining operational proficiency in OCI, including the vast majority components required to build and operate your software. Use as little or as much as you find useful here to shorten your time to market, we welcome the collaboration.

Why bother with creating all the infrastructure manually, or creating all the terraform code from scratch when the only thing that you will have to modify in order to achieve the desired infrastructure is a **terraform.tfvars** file?

>***DISCLAIMER:***: The code examples provided here are not an alternative to training/enablement activities or reviewing the [OCI documentation](https://docs.cloud.oracle.com/iaas/Content/home.htm). Users are expected to be comfortable operating on the linux command line and have familiarity with Public Cloud concepts and tools including [Terraform](https://github.com/hashicorp/terraform), [Python](https://www.python.org/), and [Ansible](https://github.com/ansible/ansible).


## Dependencies

- OCI Tenancy
- Workstation with Terraform installed or quickly spin up [Oracle Cloud Developer Image](https://cloudmarketplace.oracle.com/marketplace/en_US/listing/54030984) from OCI Marketplace **_available directly through Console_**


## Getting Started

Before working through the examples, set up a config file with the required credentials on your Workstation or Instance described in Dependencies. See [SDK and Tool Configuration](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/sdkconfig.htm) for instructions.

The examples are organized as follows:

|  Type  |  Description  |  C1  |  C2  |  C3  |  C4  |  C5  |
|:------:|:-------------:|:----:|:----:|:----:|:----:|:----:|
| [enterprise_tier](./examples/enterprise_tier/README.MD)  | Contains all terraform components  | -  | -  | -  | -  | -  |
| [free_tier](./examples/free_tier/README.MD)  | Contains the always free components  | -  | -  | -  | -  | -  |
| **crawl** | The crawl is just getting the basics set up in OCI. How do I establish the basic building blocks needed for my journey?   |  [adw/atp](./examples/crawl/adw/README.md) |  [dbaas](./examples/crawl/dbaas/README.md) |  [iam](./examples/crawl/iam/README.md) | [instances](./examples/crawl/adw/README.md)  |  [network](./examples/crawl/network/README.md) |
| **walk** | When you're looking to walk, the way you want to think about it is: In the crawl stage, you've established the foundations in the environment, now you're ready to start introducing components and concepts to take advantage of scale.   | [dns](./examples/walk/dns/README.md)  | [fss](./examples/walk/fss/README.md)  | [instance-principal](./examples/walk/instance-principal/README.md)  | [load balancer](./examples/walk/load-balancer/README.md)  | [object storage](./examples/walk/object-storage/README.md)  |
| **run** | Now as you move on to the run, you're ready to start visualizing what your application will look like in OCI and designing your Architecture. You can also think through what your operating model will look like.  | [backup and restore](./examples/run/backup-restore/README.md)  | [glusterfs](./examples/run/glusterfs/README.md)  | [grafana](./examples/run/grafana/Readme.md)  | [start-stop](./examples/run/start-stop/README.md)  | -  |


All the phases will need an oci provider which can be defined in the terraform.tfvars or *.auto.tfvars file in every component and the values must reflect your OCI tenancy:
```
provider_oci = {
  tenancy       = ""
  user_id       = ""
  fingerprint   = ""
  key_file_path = ""
  region        = ""
}
```