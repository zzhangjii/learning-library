# Network Examples

Here are some useful examples on Network

## Description

The Network module is able to create vcns, subnets, internet gateways, nat gateways, security lists and network security groups

* VCN parameters
  * compartment_name - The name of the compartment in which the VCN will be created
  * display_name - The name of the vcn
  * vcn_cidr - The cidr block of the vcn
  * dns_label - The dns label of the vcn

* Internet Gateway parameters
  * display_name - The display name of the Intenet gateway
  * vcn_name - The name of the vcn used for the internet gateway association

* Nat Gateway parameters
  * display_name - The display name of the NAT gateway
  * vcn_name - The name of the vcn used for the NAT gateway association

* Route Table parameters
  * display_name - The display name of the Route Table
  * vcn_name - The name of the vcn used for the Route Table association
  * route_rules parameters
    * destination - Cidr block destination
    * use_igw - Whether you want to use an Internet Gateway in the route rule
    * igw_name - The name of the internet gateway used for the Route Table association
    * ngw_name - The name of the nat gateway used for the Route Table assocation

* Security Lists parameters
  * display_name - The display name of the Security Lists
  * vcn_name - The name of the vcn used for the Security Lists association
  * egress_rules parameters
    * stateless - Whether the rule is staless or not
    * protocol - Can be set to 1 (ICMP), 6 (TCP), 17 (UDP) or ALL
    * destination - cidr block destination
  * ingress_rules parameters
    * stateless - Whether the rule is staless or not
    * protocol - Can be set to 1 (ICMP), 6 (TCP), 17 (UDP) or ALL
    * source_type - Can be CIDR_BLOCK or SERVICE_CIDR_BLOCK
    * source - cidr block source
    * tcp_options parameters (can be an empty list and no tcp rules will be created)
      * min - port value
      * max - port value
    * udp_options parameters (can be an empty list and no udp rules will be created)
      * min - port value
      * max - port value

* Network Security Group parameters
  * display_name - The display name of the NSG
  * vcn_name - The name of the vcn used for the NSG association

* Network Security Groups Rules parameters
  * nsg_name - The name of the NSG used for the NSG rule association
  * protocol - Can be set to 1 (ICMP), 6 (TCP), 17 (UDP) or ALL
  * stateless - Whether the rule is staless or not
  * direction - Can be INGRESS (will force source and source type rules) or EGRESS (will force destination and destination type rules)
  * destination - cidr block destination (null if the direction is set to INGRESS)
  * destination_type - Can be CIDR_BLOCK (null if the direction is set to INGRESS)
  * source - cidr block source (null if the direction is set to EGRESS)
  * source_type - Can be CIDR_BLOCK (null if the direction is set to EGRESS)
  * tcp_options parameters (can be an empty list and no tcp rules will be created)
    * destination_ports parameters (can be an empty list if you want to use source_ports)
      * min - port value
      * max - port value
    * source_ports parameters (can be an empty list if you want to use destination_ports)
      * min - port value
      * max - port value
  * udp_options parameters (can be an empty list and no udp rules will be created)
    * destination_ports parameters (can be an empty list if you want to use source_ports)
      * min - port value
      * max - port value
    * source_ports parameters (can be an empty list if you want to use destination_ports)
      * min - port value
      * max - port value

* Subnet parameters
  * display_name - The name of the subnet
  * vcn_cidr - The cidr block of the subnet
  * dns_label - The dns label of the subnet
  * is_subneT_private - Whether the subnet is private or not
  * sl_name - The name of the security list used for the Subnet association
  * rt_name - The name of the route table used for the Subnet association
  * vcn_name - The name of the vcn used for the Subnet association


## Example
In the provided example, the following resources are created: 
* 2 VCNS
  * hurricane 1
    * One Internet Gateway
    * One Nat Gateway
    * 2 Route tables (one with igw rule, the other with ngw rule)
    * One Security List
    * One NSG with INGRESS rules
    * 2 Subnets (one public, one private)

  * hurricane 2
    * One Internet Gateway
    * One Nat Gateway
    * 2 Route tables (one with igw rule, the other with ngw rule)
    * One Security List
    * One NSG with EGRESS rules
    * 2 Subnets (one public, one private)

The compartment_ids will be external to the vcn params in order to offer multiple ways of linking them from a terraform perspective.
In the example from below, there is a list of compartments containing 1 element. By setting in vcn_params `compartment_name` to sandbox, The network will be created in the first element of the list: `ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq`. All lists can be extended in order to satisfy your needs.


The example is based on terraform.tfvars values:

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1..aaaaaaaaiu3vfcpbjwwgpil3xakqts4jhtjq42kktmisriiszdvvouwsirgq"
}

vcn_params = {
  hur1 = {
    compartment_name  = "sandbox"
    display_name      = "hur1"
    vcn_cidr          = "10.0.0.0/16"
    dns_label         = "hur1"
  }
  hur2 = {
    compartment_name  = "sandbox"
    display_name      = "hur2"
    vcn_cidr          = "11.0.0.0/16"
    dns_label         = "hur2"
  }
}

igw_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name    = "hur1"
  },
  hurricane2 = {
    display_name = "hurricane2"
    vcn_name     = "hur2"
  }
}

ngw_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
  },
  hurricane2 = {
    display_name = "hurricane2"
    vcn_name     = "hur2"
  }
}

rt_params = {
  hurricane1pub = {
    display_name = "hurricane1pub"
    vcn_name     = "hur1"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        igw_name   = "hurricane1"
        ngw_name   = null
      },
    ]
  },
  hurricane1priv = {
    display_name = "hurricane1priv"
    vcn_name     = "hur1"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = false
        igw_name   = null
        ngw_name   = "hurricane1"
      },
    ]
  },
  hurricane2pub = {
    display_name = "hurricane2pub"
    vcn_name     = "hur2"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        ngw_name   = null
        igw_name   = "hurricane2"
      },
    ]
  },
  hurricane2priv = {
    display_name = "hurricane2priv"
    vcn_name     = "hur2"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = false
        ngw_name   = "hurricane2"
        igw_name   = null
      },
    ]
  }
}

sl_params = {
  Hurricane1 = {
    vcn_name     = "hur1"
    display_name = "Hurricane1"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        tcp_options = []
        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "80"
            max = "80"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "17"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = []

        udp_options = [
          {
            min = "80"
            max = "80"
          },
        ]
      },
    ]
  }
  Hurricane2 = {
    vcn_name    = "hur2"
    display_name = "Hurricane2"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        tcp_options = []
        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "80"
            max = "80"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "17"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = []

        udp_options = [
          {
            min = "80"
            max = "80"
          },
        ]
      },
    ]
  },
}



nsg_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
  },
  hurricane2 = {
    display_name = "hurricane2"
    vcn_name     = "hur2"
  }
}

nsg_rules_params = {
  hurricane1 = {
    nsg_name         = "hurricane1"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "11.0.0.0/16"
    source_type      = "CIDR_BLOCK"
    destination      = null
    destination_type = null
    tcp_options = [
      {
        destination_ports = [
          {
            min = 22
            max = 22
          }
        ],
        source_ports = []
      }
    ]
    udp_options = []
  }
  hurricane2 = {
    nsg_name         = "hurricane2"
    protocol         = "17"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "10.0.0.0/16"
    destination_type = "CIDR_BLOCK"
    source           = null
    source_type      = null
    udp_options      = [
      {
        source_ports = [
          {
            min = 22
            max = 22
          }
        ],
        destination_ports = []
      }
    ]
  tcp_options = []
  }
}


subnet_params = {
  hur1pub = {
    display_name               = "hur1pub"
    cidr_block                 = "10.0.1.0/24"
    dns_label                  = "hur1pub"
    is_subnet_private          = false
    sl_name                    = "Hurricane1"
    rt_name                    = "hurricane1pub"
    vcn_name                   = "hur1"
  }
  hur1priv = {
    display_name               = "hur1priv"
    cidr_block                 = "10.0.2.0/24"
    dns_label                  = "hur1priv"
    is_subnet_private          = true
    sl_name                    = "Hurricane1"
    rt_name                    = "hurricane1priv"
    vcn_name                   = "hur1"
  }
  hur2pub = {
    display_name               = "hur2pub"
    cidr_block                 = "11.0.1.0/24"
    dns_label                  = "hur2pub"
    is_subnet_private          = false
    sl_name                    = "Hurricane2"
    rt_name                    = "hurricane2pub"
    vcn_name                   = "hur2"
  }
  hur2priv = {
    display_name               = "hur2priv"
    cidr_block                 = "11.0.2.0/24"
    dns_label                  = "hur2priv"
    is_subnet_private          = true
    sl_name                    = "Hurricane2"
    rt_name                    = "hurricane2priv"
    vcn_name                   = "hur2"
  }
}
```


This is just an example, but the number of the resources can be increased/decreased to suit any needs.
For example if you want to increase the number of subnets instances to 3 in the first VCN, you will have to modify the subnet_params variable in the terraform.tfvars file.

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
https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/overview.htm