// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.

#----------- IAM Resources --------
comp_params = {
  sandbox = {
    name          = "sandbox"
    description   = "The sandbox compartment contains crawl, walk, run resources for the framework including IAM."
    enable_delete = false
  }
}

user_params = {
  Root_IAMAdmin = {
    name        = "Root_IAMAdmin"
    description = "User allowed to modify the Administrators and NetSecAdmins group"
    group_name = "Root_IAMAdminManagers.grp"
  }
}

group_params = {
  "Root_IAMAdminManagers.grp" = {
    name        = "Root_IAMAdminManagers.grp"
    description = "Group for users allowed to modify the Administrators and NetSecAdmins group."
  }
}

policy_params = {
  "Root_IAMAdminManagers.pl" = {
    name           = "Root_IAMAdminManagers.pl"
    description    = "Root_IAMAdminManagers.pl"
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaaksusyefovxt64bsovu523r5ez6qz25pcnqjw2a243qjmft5n7drq"

    statements = [
      "ALLOW GROUP Root_IAMAdminManagers.grp to read users IN TENANCY",
      "ALLOW GROUP Root_IAMAdminManagers.grp to read groups IN TENANCY",
      "ALLOW GROUP Root_IAMAdminManagers.grp to manage users IN TENANCY",
      "ALLOW GROUP Root_IAMAdminManagers.grp to manage groups IN TENANCY where target.group.name = 'Administrators'",
      "ALLOW GROUP Root_IAMAdminManagers.grp to manage groups IN TENANCY where target.group.name = 'Tenancy_NetSecAdmins.grp'",
    ]
  }
}

#-----------------------------------



#----------- Network Resources -----
vcn_params = {
  hur1 = {
    compartment_name  = "sandbox"
    display_name      = "hur1"
    vcn_cidr          = "10.0.0.0/16"
    dns_label         = "hur1"
  }
}

igw_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name    = "hur1"
  }
}

ngw_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
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
}


nsg_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
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
}

#-----------------------------------


#------------- ADW/ATP -------------
adw_params = {
  hurriatpfree = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriatpfree"
    db_workload         = "OLTP"
    enable_auto_scaling = false
    is_free_tier        = true
  }
}
#-----------------------------------



#------------ Compute --------------
linux_images = {
  ap-mumbai-1    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa46gx23hrdtxenjyt4p5cc3c4mbvyiqxcb3mmrxnmjn3rfxgvqcma"
  ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaavwjewurl3nvcyq6bgpbrapk4wfwu6qz2ljlrj2yk3cfqexeq64na"
  ap-sydney-1    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaae5qy5o6s2ve2lt4aetmd7s4ydpupowhs6fdl25w4qpkdidbuva5q"
  ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaa54xb7m4f42vckxkrmtlpys32quyjfldbkhq5zsbmw2r6v5hzgvkq"
  ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaagupuj5dfue6gvpmlzzppvwryu4gjatkn2hedocbxbvrtrsmnc5oq"
  eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3bu75jht762mfvwroa2gdck6boqwyktztyu5dfhftcycucyp63ma"
  eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaadx6lizhaqdnuabw4m5dvutmh5hkzoih373632egxnitybcripb2a"
  sa-saopaulo-1  = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa3ke6hsjwdshzoh4mtjq3m6f7rhv4c4dkfljr53kjppvtiio7nv3q"
  uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaasutdhza5wtsrxa236ewtmfa6ixezlaxwxbw7vti2wyi5oobsgoeq"
  us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaaox73mjjcopg6damp7tssjccpp5opktr3hwgr63u2lacdt2nver5a"
  us-langley-1   = "ocid1.image.oc2.us-langley-1.aaaaaaaaxyipolnyhfw3t34nparhtlez5cbslyzbvlwxky6ph4mh4s22zmnq"
  us-luke-1      = "ocid1.image.oc2.us-luke-1.aaaaaaaa5dtevrzzxk35dwslew5e6zcqljtfu5hzolcedr467gzuqdg3ls5a"
  us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaauuj2b3bvpbtpcyrfdvxu7tuajrwsmajhn6uhvx4oquecap63jywa"
}

instance_params = {
  hur1 = {
    ad                   = 1
    shape                = "VM.Standard2.8" #VM.Standard.E2.1.Micro
    hostname             = "hur1"
    boot_volume_size     = 50
    preserve_boot_volume = true
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = "/u01:/dev/oracleoci/oraclevdb"
    freeform_tags        = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
  },
}

bv_params = {
  bv10 = {
    ad             = 1
    display_name   = "bv10"
    bv_size        = 50
    instance_name  = "hur1"
    device_name    = "/dev/oracleoci/oraclevdb"
    freeform_tags        = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
  }
}

windows_images = {
  ap-mumbai-1	   = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa4eoqz2o7ssqm63dkzvny5sld5tibr2ynvmyyp6mwoeblfdcjjtkq"
  ap-seoul-1	   = "ocid1.image.oc1.ap-seoul-1.aaaaaaaakb7oq5eiao3rlyha6kf7emogydoy32p3mb22hn3gbwsm7ussfaca"
  ap-sydney-1	   = "ocid1.image.oc1.ap-sydney-1.aaaaaaaah4oxmrdqptmcbpdigixfhrxii7rkaspmpq4fppnn3wc6xas2simq"
  ap-tokyo-1	   = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaagltuwbdjcdfmvj4gkzb7e32g5aedu6yfdzbmmqkxrrv4d7shixia"
  ca-toronto-1	 = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa2iaism6emqvjzgszpnpi7v725herq7u2fdiwswgrplcv4u3g4w6a"
  eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa2rsmgdpbkbo5yrkpynd7mbl5nxpwhyrkp4nd4ev3hzcpfmkosu3q"
  eu-zurich-1	   = "ocid1.image.oc1.eu-zurich-1.aaaaaaaawo4g3t6s34okuj7huyrixkucmxtfaqeiqhvsfiok4gxhe3pdpmaa"
  sa-saopaulo-1	 = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaanunxttcfebrg3t34jupfsiy2dqry4wkoaak5h3pckpitylzm44qq"
  uk-london-1	   = "ocid1.image.oc1.uk-london-1.aaaaaaaaanixvr63v5v5vvz5qv2c73m6vvc6okwrrqggfvqthyygalm536ra"
  us-ashburn-1	 = "ocid1.image.oc1.iad.aaaaaaaaizov2horgjtlxsklhi3cxxjxbcpxzxmtfj5jiftygo76fetussuq"
  us-langley-1	 = "ocid1.image.oc2.us-langley-1.aaaaaaaafiwiumrgcipjddg7cha7otxo46dd5hiw7za5llbwnugrgclxqbga"
  us-luke-1	     = "ocid1.image.oc2.us-luke-1.aaaaaaaaelf7bq6rtwsxhvkjh6eumoa77ebniwkbyntfti5gtkgvwqnk6dsq"
  us-phoenix-1	 = "ocid1.image.oc1.phx.aaaaaaaatte3vcpa7kkogul7zbvnxfjsgwzptmbx7n7qqrzk62skron5on7a"
}

win_instance_params = {}

win_bv_params = {}
#-----------------------------------

lb_params = {
  hur-lb = {
    shape             = "10Mbps-Micro"
    compartment_name  = "sandbox"
    subnet_names      = ["hur1pub"]
    display_name      = "hur-lb"
    is_private        = false
  }
}

backend_sets = {
  hur1-bs = {
    name        = "hur1-bs"
    lb_name     = "hur-lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
}

listeners = {
  hur-list = {
    lb_name           = "hur-lb"
    name              = "hur-list"
    backend_set_name  = "hur1-bs"
    port              = 80
    protocol          = "HTTP"
    ssl               = []
  }
}

backend_params = {
  hur1-bs = {
    backendset_name  = "hur1-bs"
    use_instance     = true
    instance_name    = "hur1"
    lb_name          = "hur-lb"
    port             = 80
  }
}

certificates      = {}

bucket_params   = {
  hur-buck-1 = {
    compartment_name  = "sandbox"
    name              = "hur-buck-1"
    access_type       = "NoPublicAccess"
    storage_tier      = "Standard"
    events_enabled    = false
  }
}
