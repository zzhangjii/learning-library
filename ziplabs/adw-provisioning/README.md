---
layout: ziplab
description: Learn how to provision and get started with Oracle Autonomous Data Warehouse Cloud.
tags: Oracle Cloud, Autonomous Data Warehouse, ADW, Oracle Cloud Infrastructure, OCI
permalink: /ziplabs/adw-provisioning/index.html
---
# Provisioning Autonomous Data Warehouse Cloud #

## Before You Begin ##
This 20-minute lab walks you through the steps to get started using the Oracle Autonomous Data Warehouse Cloud (ADWC) on Oracle Infrastructure Cloud (OCI). You will provision a new ADWC database and connect to the database using Oracle SQL Developer.

### Background ###
Dropwizard is an open source Java framework that you can use to quickly create RESTful web services. Dropwizard integrates several components and Java frameworks that can help you build more robust applications.

In this tutorial, you create and deploy a web service for an employee directory application to Oracle Application Container Cloud Service. Data for the application is stored in an in-memory database. You test the REST service by using an HTML5 JavaScript client.

### What Do You Need? ###
* Access to an instance of Oracle Autonomous Data Warehouse Cloud
* [Oracle SQL Developer 18.2](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html) 
* [Oracle's Java Development Kit 8 (JDK 8)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* The Analytic Views setup file: [LabSetup.sql](files/LabSetup.sql) 


## Sign in to Oracle Cloud ##
1. In a web browser, go to [https://cloud.oracle.com](https://cloud.oracle.com) and click **Sign In**.
    ![](img/Picture100-2.png)
    [Description of the illustration Picture-100-2.png](files/Picture100-2.txt)
2. From the **Cloud Account** drop-down menu, select **Cloud Account with Identity Cloud Service**.
3. Enter your Cloud Account Name and click **My Services**.
    ![](img/Picture100-3.png)
    [Description of the illustration Picture-100-3.png](files/Picture100-3.txt)
4. Enter your Cloud Account credentials and click **Sign In**.
    ![](img/Picture100-4.png)
    [Description of the illustration Picture-100-4.png](files/Picture100-4.txt)


## Create an ADWC Instance ##
1. Once you are logged in, you are taken to the Cloud dashboard where you can see all the services available to you. To access Oracle Cloud Infrastructure (OCI) dashboard, click on **Customize Dashboard**.
2. Find **Compute** under **Infrastructure** and click on **Show**.
3. Now you should see Compute service under your dashboard. Click on **Compute**.
4. This will bring you to the service details page. Click on **Open Service Console** on top right of your screen to bring you to OCI dashboard.
5. Once you are on OCI dashboard page, click on the hamburger **menu** icon on the top left of the screen.
6. Click on **Autonomous Data Warehouse** from the menu.
7. Click on **Create Autonomous Date Warehouse** button to start the instance creation process.
8. The Create Autonomous Data Warehouse dialog appears. At the top of the dialog, click the **Click here** to enable compartment selection so that the ADWC instance is in a specific compartment.
9. In the Create Autonomous Data Warehouse dialog, enter the following information:
     * **Display Name**: `ADW Finance Mart`
     * **Database Name**: `ADWFINANCE`
     * **CPU Core Count**: `1`
     * **Storage (TB)**:  `1`
     * **Administrator Credentials**: Create a password for the ADMIN user of the service instance. The password must meet the following requirements:
        * The password must be between 12 and 60 characters long and must include at least one uppercase letter, one lowercase letter, and one numeric character.
        * The password cannot contain the double quote (") character.
        * The password must be different from the last 4 passwords used.
     * **License Type**: `License Included`
     * **Tags**: (Optional) Tagging is a metadata system that allows you to organize and track resources within your tenancy. Tags are composed of keys and values which can be attached to resources. 
10. Click on the **Create Autonomous Data Warehouse** button to start provisioning the instance. 
11. The Create Autonomous Data Warehouse dialog closes. On the console, the State field indicates that the data warehouse is **Provisioning**. When creation is completed, the State field changes from **Provisioning** to **Available**. 


## Download the Credentials Zip File ##
Once you have created the data warehouse, download the credentials zip file for client access to that data warehouse. As ADWC only accepts secure connections to the database, you need to download a wallet file containing your credentials first. You will use this file in the next tutorial to connect SQL Developer to your Autonomous Data Warehouse database.

1. In the console, in the menu across from the name of your new data warehouse, select **Service Console**.
2. A dialog opens to sign in to the service console. Enter the following information:
     * **Username**: `admin`
     * **Password**: Enter the administrator password you specified when you created your service instance.
3. The service console opens in the **Overview** mode. Click **Administration** in the left navigation pane.
4. Click **Download Client Credentials**.
5. You are prompted to create a password for the credentials zip file. Enter a password and click **Download**.
6. Store the zip file. You will use the zip file in the next step to define a SQL Developer connection to your Autonomous Data Warehouse Cloud database.

Note: Version 18.2.0 of SQL Developer drops the requirement to enter the Autonomous Data Warehouse keystore password and does not provide the keystore password field in the dialog for creating a connection. If using SQL Developer version 18.2.0 or newer, you do not use this password.


## Connect to the Database using SQL Developer ##
1. Open SQL Developer on your local computer. 
2. In the Connections panel, right-click **Connections** and select **New Connection**.
3. Fill in the connection details:
     * **Connection Name**: `admin_low`
     * **Username**: `admin`
     * **Password**: Enter the admin user's password that you or your Autonomous Data Warehouse Cloud administrator specified when creating the service instance.
     * **Connection Type**: `Cloud PDB`
     * **Configuration File**: Click **Browse**, and select the **Client Credentials** zip file, downloaded from the Autonomous Data Warehouse Cloud service console by you.
     * **Keystore Password**:
        * **For SQL Developer 18.2.0 or newer**: Starting with version 18.2.0, SQL Developer does not require that you enter a Keystore Password and does not provide the Keystore Password field.
        * **For SQL Developer older version**: Enter the password that was generated when you downloaded the Client Credentials zip file from the Autonomous Data Warehouse Cloud console.
     * **Service**: There are 3 pre-configured database services for each database. Pick **&lt;databasename&gt;_low"** for this lab. These service levels map to the LOW, MEDIUM, and HIGH consumer groups, which provide different levels of performance and concurrency.
4. Click **Test**. "Status: Success" should display at the left-most bottom of the New/Select Database Connection dialog.
5. Click **Save** to save the connecton information.
6. Click **Connect** to connect the database. An entry for the new connection appears under Connections.


## Explore Analytic Views ##
Analytic views provide a fast and efficient way to create analytic queries of data stored in existing database tables and views. They're very useful for Data Warehouse Architects. Analytic views organize data using a dimensional model. They allow you to easily add aggregations and calculations to data sets and to present data in views that can be queried with relatively simple SQL.

1. Download [LabSetup.sql](files/LabSetup.sql) to your machine.
2. Execute the following from SQL Developer.
    <pre><code>@"&lt;Local_Path&gt;/LabSetup.sql</code></pre>


## Want to Learn More? ##
* [Autonomous Cloud Platform Courses](https://learn.oracle.com/pls/web_prod-plq-dad/dl4_pages.getpage?page=dl4homepage&get_params=offering:35573#filtersGroup1=&filtersGroup2=.f667&filtersGroup3=&filtersGroup4=&filtersGroup5=&filtersSearch=) from Oracle University 
* [Analytic Views](https://docs.oracle.com/en/database/oracle/oracle-database/12.2/dwhsg/overview-analytic-views.html#GUID-2A7F2187-752E-44D9-B674-C32C9A397638) in the Oracle Help Center
* [ADWC Test Drive Workshop](https://oracle.github.io/learning-library/workshops/journey4-adwc/?page=README.md)


