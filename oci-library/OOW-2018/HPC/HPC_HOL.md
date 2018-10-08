# Computational Fluid Dynamics Simulation on Oracle Cloud Infrastructure
  
## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Practice 1: Open Gitbash on your Desktop ](#practice-1-open-gitbash-on-your-desktop)

[Practice 2: Access the control node](#practice-2-access-the-control-node)

[Practice 3: Deploy your HPC Cluster](#practice-3-deploy-your-hpc-cluster)

[Practice 4: Run OpenFOAM to generate your simulation](#practice-4-run-openfoam-to-generate-your-simulation)

[Practice 5: Sign in to OCI Console](#practice-2-sign-in-to-oci-console)

## Overview

High Performance Computing and storage in the cloud can be very confusing and it can be difficult to determine where to start. This Hands on LAB is designed to be a first step in expoloring a cloud based HPC storage and compute architecture. There are many different configuration that could be used, but this lab focuses on a bare metal compute system and a Lustre file system that is attached. After deployment fully independant and functioning IaaS HPC compute and storage cluster has been deployed based on the architecture below.

## Pre-Requisites

- Oracle Cloud Infrastructure account credentials (User, Password, and Tenant) with available service limit for Bare Metal Shapes.

## Practice-1: Open Gitbash on your Desktop

1) Open Gitbash on your desktop. It is already installed for you. 

![](img/gitbash001.png)

## Practice 2: Access the control node

1) On Gitbash terminal use SSH command to connect to the control node with this information:

- **username**: *xxxx*
- **IP address**: *X.X.X.X*

```
# ssh username@IPAddress
```

## Practice 3: Deploy your HPC Cluster

1) After login, change into home directory by typing:

```
# cd oci-hpc-ref-arch
```
2) Deploy your Cluster by typing:

```
# ./cli_deploy.sh $C
```
> **Note:**  $C is a variable with your designated compartment. It will be automatically loaded for you after login. 

![](img/c_deploy.png)

3) Wait for the HPC cluster to deploy. It will take about 20 minutes

![](img/c_deploy001.png)

4) Open a web browser and type in the **GOTTY** IP address that was shown at the bottom of the deployment terminal window like this http://IPaddress:8080 and use the following information to authenticate:

- **user**: opc
- **password**: *xxxxxxx*

![](img/c_deploy002.png)


## Practice 4: Run OpenFOAM to generate your simulation

1) After login into the GOTTY, execute the following command:

```
# cd /mnt/blk/share/data/OpenFOAM/oci-hpc-foam-motorbike; source Allrun 2 52
```

2) While OpenFOAM is running, open another tab in your web browser and navigate to the other output that was written to the terminal after deployment:

- Ganglia: http://IPaddress/gangllia
- Grafana: http://IPaadress:3000

## Practice 5: Sign in to OCI Console

1) Open a supported browser and go to the Console URL. For example, [https://console.us-ashburn-1.oraclecloud.com](https://console.us-ashburn-1.oraclecloud.com).

2) Enter your tenant name: <Tenant> and click **Continue**

 ![](img/image001.png)

3) Oracle Cloud Infrastructure is integrated with Identity Cloud Services, you will see a screen validating your Identity Provider. You can just click **Continue**.

 ![](img/image002.png)

4) Enter your user name and password

 - **Username:** _instructor will provide username_
 - **Password:** _instructor will provide password_

 ![](img/image003.png)

When you sign in to the Console, the home page is displayed.

 ![]( img/image004.png)

The home page gives you quick links to the documentation and to Oracle Support.
