# Autonomous Data Warehouse
  
## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Practice 1: Create text file channels.txt ](#practice-1)

[Practice 2: Sign in to OCI Console](#practice-2)

[Practice 3: Create an Autonomous Data Warehouse Database](#practice-3)

[Practice 4: Download the client credentials for ADW Database](#practice-4)

[Practice 5: Create a bucket in Object Storage and upload the channels.txt file](#practice-5)

[Practice 6: Creating an Auth token for OCI user](#practice-6)

[Practice 7: Login to the ADW database and store the object store credentials](#practice-7)

[Practice 8: Load data into CHANNELS table using channels.txt file](#practice-8)

## Overview

Oracle Autonomous Data Warehouse Cloud provides an easy-to-use, fully autonomous database that scales elastically, delivers fast query performance and requires no database administration. In this hands on lab, we will walk through deploying an Autonomous Data Warehouse database and loading a table using a text file that is stored in object storage. The purpose of this lab is to get familiar with Oracle Autonomous Data Warehouse primitives. At the end of this lab, you will be familiar with launching an Autonomous Data Warehouse database, creating an object storage bucket and loading a table using a text file stored in object storage.

## Pre-Requisites

- Oracle Cloud Infrastructure account credentials (User, Password, and Tenant) with available service limit for Autonomous Data Warehouse
- SQL Developer installation on the laptop and basic knowledge of executing SQL scripts in the SQL Worksheet of SQL Developer
- SQL Developer can be downloaded from http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html
- A simple text editor like Notepad, vi or Sublime.

## Practice-1
### __Create text file channels.txt__

Download the channel text file from this link:   and save it to your desktop.

This file will be loaded into Object Storage and later used to load data into the CHANNELS table.

## Practice-2
### __Sign in to OCI Console__

1) Open a supported browser and go to the Console URL. For example, [https://console.us-ashburn-1.oraclecloud.com](https://console.us-ashburn-1.oraclecloud.com).

2) Enter your tenant name: <Tenant> and click **Continue**

 ![]( img/image001.png)

3) Oracle Cloud Infrastructure is integrated with Identity Cloud Services, you will see a screen validating your Identity Provider. You can just click **Continue**.

 ![]( img/image002.png)

4) Enter your user name and password

 - **Username:** cloud.admin
 - **Password:** _instructor will provide password_

 ![]( img/image003.png)

When you sign in to the Console, the home page is displayed.

 ![]( img/image004.png)

The home page gives you quick links to the documentation and to Oracle Support.

## Practice-3
### __Create an Autonomous Data Warehouse__

1) Click on **Menu** /> **Autonomous Data Warehouse** 

2) Select **Demo** Comparment and click **Create Autonomous Data Warehouse** 

![]( img/image005.png)

3) Enter the following information:

	a) Display Name: ADW Finance
	b) Database Name: ADWFINANCE
	c) CPU Core Count: 1
	d) Storage: 1
	e) Password: Demo_2018DB##
	f) Confirm Password: Demo_2018DB##
	g) Click **Create Autonomous Data Warehouse** 

![]( img/image006.png)

![]( img/image007.png)

4)  



