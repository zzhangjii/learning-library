
![](images/ICON.png)

# From files to Object Storage, then to ADWC and OAC                                    

When you need a visualization and want to keep up with the data source updates, Oracle provides the perfect tools, all you need to do is to link them together. This workshop walks you through all the steps to set up the pipeline. In order to get started, you will need to provision a **Virtual Machine (VM)**, **Oracle Object Storage**, **Oracle Autonomous Data Warehouse (ADW)**, **Oracle Autonomous Analytic Cloud Service (OAC)** (or using local **Oracle Data Visualization Desktop (DVD)** free with the purchase of ADW service). Information about how to provision those instances can be found inside upper level workshop folders.

A typical workflow contains 3 steps:
1. Obtain the data from various resources and upload it into object storage, this step can be automated through scheduling a script job in VM;  
2. Load the data from object storage into ADWC, this step can be automated through scheduling a notebook job in ADWC; 
3. Refresh the visualization in OAC or DVD to reflect the data updates in ADWC.  

## Goals for this workshop

 - Get comfortable with Oracle's public cloud services
 - Load data into the object store
 - Load data from the object store
 - Use Oracle Machine Learning SQL notebooks
 - Schedule SQL notebook job
 - Use Oracle Analytics CLoud (OAC) with ADW
 - Use Oracle Data Visualization Desktop (DVD) with ADW

# Workshop Overview

**Prerequisites – Required Software**

*1. Data Visualization Desktop (DVD)*
  DVD tool comes free with the purchase of ADWC service, it is a local version of OAC with basic functions. 
  To download and install Data Visualization Desktop please follow <a href="https://www.oracle.com/technetwork/middleware/oracle-data-visualization/downloads/oracle-data-visualization-desktop-2938957.html" target="_blank"> this link </a>, and select the operating system for your computer. This page also has instructions on how to install DVD on Windows and Mac OSX.

  If you already have Data Visualization Desktop installed on your computer then please check the version. The minimum version that is required to connect to an Oracle Autonomous Data Warehouse is 12c 12.2.5.0.0.

## Step 1: Remotely Upload data into Oracle Object Storage 
This lab walks you through the steps of logging into Oracle Cloud, accessing the Oracle Autonomous Data Warehouse console and provisioning your first Autonomous Data Warehouse. The last part of this lab will explore how to connect to your new data warehouse using Oracle SQL Developer.

**Key Objectives**:

- Learn how to sign-in to the Oracle Public Cloud
- Learn how to provision a new Autonomous Data Warehouse instance
- Learn how to download the client credentials wallet file
- Learn how to connect from Oracle SQL Developer

**[Click here to run Lab 1](LabGuide1.md)**

<a href="https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:24294" target="_blank">**Click here to watch a video demonstration**</a> of provisioning a new autonomous data warehouse.

<a href="https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:22790 " target="_blank">**Click here to watch a video demonstration**</a> of connecting to your new Autonomous Data Warehouse using SQL Developer.

## Step 2: Automatically load data from Object Storage into ADWC
In this lab you will explore the free sample data sets that are included witin your new autonomous data warehouse. As part of this lab you will experiment with the selecting different levels of database services that come with your Autonomous Data Warehouse.

**Key Objectives**:

- Learn about the different levels of Autonomous Data Warehouse service (HIGH, MEDIUM, LOW)
- Learn about the Star Schema Benchmark (SSB) and Sales History (SH) sample data sets
- See how the different levels of database service affect performance and concurrency

**[Click here to run Lab 2](LabGuide2.md)**

<a href="https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:22791" target="_blank">**Click here to watch a video demonstration**</a> of running queries against the sample data sets that are part of your Autonomous Data Warehouse.


## Step 3: Visualize data in ADWC using OAC or DVD
In this lab, you will be uploading files to Oracle Object Storage, creating new sample tables, loading data into those sample tables from files on the OCI Object Storage, and troubleshooting errors relating to your data load jobs.

**Key Objectives**:

- Learn how to upload files to the Oracle Cloud Infrastructure (OCI) Object Storage
- Learn how to load data from an object store
- Learn how to use the SQL Developer Data Import Wizard to load data
- Learn how to troubleshoot data loads

**[Click here to run Lab 3](LabGuide3OOW.md)**

<a href="https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:22792" target="_blank">**Click here to watch a video demonstration**</a> of loading data into your Autonomous Data Warehouse


## Step 4: Test
In this lab, you will be querying files directly on Oracle Object Storage without loading them to your autonomous data warehouse.

**Key Objectives**:

- Learn how to define external tables against Oracle Object Store data sets
- Learn how to query external tables
- Learn how to create data warehouse user

**[Click here to run Lab 4](LabGuide4.md)**





## Learn More About Autonomous Data Warehouse...

Use these links to get more information about Oracle Autonomous Data Warehouse

 - <a href="https://www.oracle.com/database/data-warehouse/index.html" target="_blank">Oracle Autonomous Data Warehouse website</a>
 - <a href="http://www.oracle.com/us/products/database/autonomous-dw-cloud-ipaper-3938921.pdf" target="_blank">Oracle Autonomous Data Warehouse ipaper</a>
 - <a href="https://docs.oracle.com/en/cloud/paas/autonomous-data-warehouse-cloud/index.html" target="_blank">Oracle Autonomous Data Warehouse Documentation</a>
 - <a href="https://docs.oracle.com/en/cloud/paas/autonomous-data-warehouse-cloud/tutorials.html" target="_blank">Additional Autonomous Data Warehouse Tutorials</a>
