# Lab 400: Data Loading into ATP
## Introduction

In this lab, you will be uploading files to the Oracle Cloud Infrastructure (OCI) Object Storage, creating sample tables, loading data into them from files on the OCI Object Storage, and troubleshooting data loads with errors.

You can load data into Autonomous DW Cloud using Oracle Database tools, and Oracle and 3rd party data integration tools. You can load data:

from files local to your client computer, or
from files stored in a cloud-based object store
For the fastest data loading experience Oracle recommends uploading the source files to a cloud-based object store, such as Oracle Cloud Infrastructure Object Storage, before loading the data into your Autonomous DW Cloud.

To load data from files in the cloud into your Autonomous DW Cloud database, use the new PL/SQL DBMS_CLOUD package. The DBMS_CLOUD package supports loading data files from the following Cloud sources: Oracle Cloud Infrastructure Object Storage, Oracle Cloud Infrastructure Object Storage Classic, and Amazon AWS S3.

This lab shows how to load data from Oracle Cloud Infrastructure Object Storage using two of the procedures in the DBMS_CLOUD package:

create_credential: Stores the object store credentials in your Autonomous DW Cloud schema.
You will use this procedure to create object store credentials in your Autonomous DW Cloud admin schema.
copy_data: Loads the specified source file to a table. The table must already exist in Autonomous DW Cloud.
You will use this procedure to load tables in your admin schema with data from data files staged in the Oracle Cloud Infrastructure Object Storage cloud service.


To **log issues**, click [here](https://github.com/oracle/learning-library/issues/new) to go to the github oracle repository issue submission form.

## Objectives

- Learn how to use the SQL Developer Data Import Wizard
- Learn how to upload files to the OCI Object Storage
- Learn how to define object store credentials for ADWC
- Learn how to create tables in your database
- Learn how to load data from the Object Store
- Learn how to troubleshoot data loads

## Required Artifacts

- Please ensure you are connected to your cloud account and have provisioned an ATP instance. Refer LabGuide100ProvisionAnATPDatabase.md
- You have installed Oracle SQL Developer

## Steps

### **STEP 1: Work in Progress**