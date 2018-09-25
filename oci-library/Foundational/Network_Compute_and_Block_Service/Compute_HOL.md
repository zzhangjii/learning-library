# Virtual Cloud Network, Compute and Block Service Practice
  
## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Practice 1: Signing in to the Console ](#practice-1)

[Practice 2: Managing Users, Groups and Policies to Control Access](#practice-2)


## Overview

Oracle has built Oracle Cloud Infrastructure(OCI) platform that can run both Oracle workloads and cloud native applications.  In this hands on lab, we will walk through getting an apache webserver running on a compute instance on OCI. 

The purpose of this lab is to get familiar with Oracle Cloud Infrastructures primitives. At the end of this lab, you will be familiar with creating a virtual cloud network, launching an instance, and accessing the instance. Creating a Block Volume service and attaching that block volume to an instance. 

## Pre-Requisites

- Oracle Cloud Infrastructure account credentials (User, Password, and Tenant)  

## Practice-1 
### __Signing in to the Console__

**Overview**

In this practice, you sign in to the Oracle Cloud Infrastructure console using your credentials.

Assumptions

**Note:** Some of the UIs might look a little different than the screenshots included in the instructions, but you can still use the instructions to complete the hands-on labs.

**Before You Begin**

To sign in to the Console, you need the following:

- Tenant, User name and Password

- URL for the Console: [https://console.us-ashburn-1.oraclecloud.com/](https://console.us-ashburn-1.oraclecloud.com/)

- Any browser from the supported browsers list (Recommended)

**Note:**

- **For this lab we use _cloud.admin_ and <your-name@domain.com> as the user name to demonstrate the scenarios. You must use your cloud.admin when you perform these tasks.**

- Oracle Cloud Infrastructure supports the latest versions of Google Chrome, Firefox and Internet Explorer 11.

- When you are provisioned, you will receive a customized URL for your organization. For example, https://console.us-ashburn-1.oraclecloud.com_?tenant="your-tenant-id"

- If you omit the tenant argument, the system will ask you to input your tenancy before you can log in.

**Duration: 5 minutes**

**Tasks**

**1** - Sign In

 a) Open a supported browser and go to the Console URL. For example, [https://console.us-ashburn-1.oraclecloud.com](https://console.us-ashburn-1.oraclecloud.com).

 b) Enter your tenant name: <Tenant> and click **Continue**

<img width="803" alt="image001" src="https://user-images.githubusercontent.com/32341971/46043337-975b3b00-c0cc-11e8-9b0b-88b6c8abaed5.png">

 c) Oracle Cloud Infrastructure is integrated with Identity Cloud Services, you will see a screen validating your Identity Provider. You can just click **Continue**.

 ![]( ../Identity_Access_Management/img/image002.png)

 d) Enter your user name and password

 - **Username:** cloud.admin
 - **Password:** _instructor will provide password_

 ![]( ../Identity_Access_Management/img/image003.png)

When you sign in to the Console, the home page is displayed.

 ![]( ../Identity_Access_Management/img/image004.png)

The home page gives you quick links to the documentation and to Oracle Support.
