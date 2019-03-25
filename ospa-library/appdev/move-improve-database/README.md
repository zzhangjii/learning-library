![](media/image1.png)

# Move and Improve Database - Lab Guide

## Lab Overview 

This lab is for the “Show It and Build It: Move and Improve Database”
workshop. It is designed to let you show customers how to create an ATP
database and load it easily.

In this lab, you will: create an Autonomous Transaction Processing (ATP)
database and load it with data. ATP data may be loaded in many ways;
this exercise uses Oracle SQL Developer to load a table from a
comma-delimited (.csv) file and also uses SQL Developer to import data
using Oracle Data Pump.

Upon completion of the lab you should be able to demonstrate its steps
quickly and easily for customers and if necessary assist in creating ATP
databases and loading them.

## Lab Activities 

You will be using an Oracle Cloud tenancy that is enabled for Compute,
ATP, and Object Storage to represent your client’s target environment.
Each lab exercise accomplishes an important step; if you are already
familiar with some steps feel free to skip them.

Lab files associated with this lab guide will provide example source
data in .csv and .dmp form along with a PL/SQL script. Feel free to
substitute your own or your customer’s data to make the lab
more-realistic.

To make things faster and simpler; the two steps in moving data are
accomplished with Oracle SQL Developer; most DBAs are already familiar
with this tool.

**Prerequisites**: You will be working with the Oracle Cloud and doing
some minor text editing; to accomplish this lab you will need:

  - Internet access and a browser

  - Admin access (username and password) to an Oracle Cloud
    Infrastructure (OCI) tenancy with service limits for Compute,
    Autonomous Transaction Processing (ATP) and Object Storage

  - SQL Developer 18.3 (or more recent) downloaded and installed; it may
    be obtained here:
    <https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html>

  - A simple text editor, Notepad is sufficient if you don’t have a
    preference

  - This setup will take you approximately 15 minutes

## 

# Lab 1 : [Create ATP Database](Lab1.md)

# Lab 2 : [Obtain Connection Credentials](Lab2)

# Lab 3 : [Using Oracle Object STORAGE](Lab3)

# Lab 4 : [Connect with cloud wallet](Lab4)

# Lab 5 : [Load table USING .csv file](Lab5)

# Lab 6 : [Import Using Data Pump](Lab6)
