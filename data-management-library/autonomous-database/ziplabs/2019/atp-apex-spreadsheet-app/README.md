---
layout: ziplab
description: Creating an App from a Spreadsheet for Oracle Autonomous Cloud Service
tags: Oracle Cloud, Autonomous Data Warehouse, ADW, ATP, Apex, Oracle Cloud Infrastructure, OCI, Object Store, Data Load
permalink: /data-management-library/autonomous-database/ziplabs/2019/atp-apex-spreadsheet-app/index.html

---
# Oracle APEX on ATP Hands-On Lab 
## *Creating an App from a Spreadsheet* for Oracle Autonomous Transaction Processing Service
### Overview
This lab walks you through uploading a spreadsheet into an Oracle database table, and then creating an application based on this new table. You will then play with the Interactive Report and improve the attached form. Lastly, you will add a Calendar page and then link it to the existing form page.

Rather than trying to email a spreadsheet to gather information from different people, simply create an app in minutes, and email the URL. This single source-of-truth, multi-user, secured, scalable app is so much better than having 20 (incomplete) spreadsheets!

### What Do You Need? ###
* Access to an instance of Oracle Autonomous Data Transaction Processing (ATP) or Oracle Autonomous Data Warehouse (ADW)

## Section 1
### Getting Started - Obtaining a Workspace
_Note: If you have a workspace on the Autonomous Database Cloud Service then you can skip this section and move to Section 2._

### Step 1.1 - Accessing APEX
* Sign into your Oracle Cloud service
* Click the hamburger (top left),  select Autonomous Data Warehouse or Autonomous Transaction Processing, based on which service(s) you have defined.
![](img/section1/image1.png)

* Click **Your Database** from the list
![](img/section1/image2.png)

* Click **Service Console** 
![](img/section1/image3.png)

* Click **Development**
* Click **APEX** ***
![](img/section1/image4.png)

### Step 1.2 - Creating a Workspace

* To sign into APEX Administrative Services for Password enter your OCI Password
* Click **Sign In to Administration**

![](img/section1/image5.png)

* Given this is your first time entering APEX, click **Create Workspace**
![](img/section1/image6.png)

* For Database User enter an appropriate name
* Enter a Password *Click the ? Icon to see password complexity rules*

* Click **Create Workspace**

![](img/section1/image7.png)

_Note: The Database User will be used for the Workspace Name. If you want you can update the Workspace Name_

### Step 1.3 - Log into your New Workspace
* Click on the link within the success message {easiest technique} OR Click on the Admin user (top right), click **Sign Out**, and then click **Return to Sign In Page**
![](img/section1/image8.png)

* Sign into your new Workspace 

    - Workspace – enter ***Your Workspace Name***

    - Username – enter ***Your Database User***

    - Password – enter ***Your OCI Password***

    - Remember workspace and username - **Check**

* Click **Sign In**

![](img/section1/image9.png)

_Note: Enter the Workspace Name and Database User entered in Step 2c above_

* Given this is your first time entering your new Workspace, click **Set APEX Account Password**
![](img/section1/image10.png)

* For your user profile enter the following:

    - Email Address - enter ***your email address***
![](img/section1/image11.png)

    - Enter New Password - enter ***your OCI Password***

    - Confirm Password - enter ***your OCI Password***

* Click **Apply Changes**

![](img/section1/image12.png)

## Section 2
### Building your first app - Creating an App from a Spreadsheet

### Step 2.1 - Logging In
* Log into your workspace
* Click **App Builder**
* Click **Create a New App**

![](img/section2/image1.png)

### Step 2.2 - Selecting App Type
* Click **From a File**

![](img/section2/image2.png)

### Step 2.3 - Loading Sample Data
* Click **Copy and Paste**

* For Sample Data Set select **Project and Tasks**

![](img/section2/image3.png)

* Click **Next**

### Step 2.4 - Naming the Table
* Enter Table Name ***SPREADSHEET***

* Click **Load Data**

![](img/section2/image4.png)

### Step 2.5 - Verifying Records Loaded
* Check that 73 rows are loaded

* Click **Continue to Create Application Wizard**

![](img/section2/image5.png)

### Step 2.6 - Naming the App
* Enter Name ***App from a Spreadsheet***

* Next to Features, click **Check All**

![](img/section2/image6.png)

### Step 2.7 - Create Application
* Click **Create Application**

![](img/section2/image7.png)

### Step 2.8 - App in Page Designer
* Your new application will be displayed in Page Designer

* Click **Run Application**

![](img/section2/image8.png)

### Step 2.9 - Runtime App
* Enter your user credentials

* Play around with your new application

![](img/section2/image9.png)

## Section 3
### Using the Runtime Environment - Improving the Report and Form

### Step 3.1 - Sort the Interactive Report
* Your new application will be displayed in Page Designer

* Click **Spreadsheet**
* Click **Actions**, select **Data**, select **Sort**

![](img/section3/image1.png)

* For 1, select **Start Date** 
* For 2, select **End Date**
* click **Apply**

![](img/section3/image2.png)

### Step 3.2 - Add a Computation
* Click **Actions**, select **Data**, select **Compute**
* Column Label enter **Budget V Cost**
* Format Mask select **$5,234.10**
* Computation Expression enter **I – H**
* Click **Apply**

![](img/section3/image3.png)

### Step 3.3 - Add a Chart
* Click **Actions**, select **Chart**
* Label select **Project**
* Value select __**Budget V Cost__
* Function select **Sum**
* Sort select **Label – Ascending**
* Orientation select **Horizontal**
* Click **Apply**


![](img/section3/image4.png)

* Use **View Report / View Chart** icons to switch views ***

![](img/section3/image5.png)
![](img/section3/image6.png)

### Step 3.4 - Save Report
* Click **Actions**, select **Report**, select **Save Report**
* For Save, select **As Default Report Settings**

![](img/section3/image7.png)

* Default Report Type, select **Alternative**
* Name, enter **Date Review**
* Click **Apply**

![](img/section3/image8.png)

### Step 3.5 - Restrict the Status
* In the runtime environment, click the edit icon on a record
* A modal page will be displayed
* In the Developer Toolbar, click **Quick Edit**
* Hover over the **Status** item (until a blue outline appears) and click the mouse
* Page Designer displays with focus on the Status item

![](img/section3/image9.png)

* In Page Designer, within the Property Editor (right pane), for Type select **Select List**
* Under List of Values, for Type select **SQL Query**
* Next to SQL Query, click **Code Editor**

![](img/section3/image10.png)

* Within the Code Editor, enter the following:

        select distinct status d, status r
        from spreadsheet
        order by 1

* Click **Validate**
* Click **OK**

![](img/section3/image11.png)

* Display Extra Values, select **No**
* Null Value Display, enter **- Select Status -**
* Click **Save** (In the toolbar - top right)

![](img/section3/image12.png)

### Step 3.6 - Run the App
* Navigate back to the runtime environment
* Refresh the browser
* Edit a record
* Click **Status**

![](img/section3/image13.png)


## Want to Learn More? ##
* [Autonomous Database Cloud Certification](https://education.oracle.com/en/data-management/autonomous-database/product_817?certPage=true) from Oracle University
* [Autonomous Cloud Platform Courses](https://learn.oracle.com/pls/web_prod-plq-dad/dl4_pages.getpage?page=dl4homepage&get_params=offering:35573#filtersGroup1=&filtersGroup2=.f667&filtersGroup3=&filtersGroup4=&filtersGroup5=&filtersSearch=) from Oracle University
* [Oracle Application Express Training and Certification](https://education.oracle.com/database-application-development/oracle-apex/product_172) from Oracle University


