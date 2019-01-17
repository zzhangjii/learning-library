# Monolithic to Microservice Experience -- Setup

  ![](images/050/Title.png)

## Introduction ans Overview

In this lab you are guided through using many of the Oracle's Cloud Services to support a transition from a monolithic on-prem environment to a Cloud based microservices environment. Along the way you'll by using the Compute Cloud Service (IaaS) which supports the Docker, Kubernetes and Autonomous Transaction Processing Database. Then you'll be using the Autonomous Visual Builder (Integration). The high level flow will be:

- Lab 050: Provision supporting services (Client Image, Database, Visual builder Instance)
- Lab 100: Populate your database with seed data
- Lab 200: Create a Compute Instance and use Docker to deploy a Java based REST application
- Lab 300: Deploy and explore the REST services application into a Kubernetes Cluster
- Lab 400: Create a Visual Builder Mobile application to use the REST endpoints of the Java application. 

***To log issues***, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives in this Lab

- Start up the supporting Client Image
- Clone GIT Repository
- Create Autonomous Transaction Processing (ATP) Database
- Provision a new Visual Builder Cloud Service and Application

# Infrastructure Setup

You will create all required infrastructure components that support this workshop.
  
## Startup your Jumpstart Client Image

The client image is a pre-installed Compute Service Instance that has GIT and SQL Developer already installed. You will use VNC Viewer to access this instance.

### **STEP 1**: Your Oracle Cloud Trial Account

  - You have already applied for and received your Oracle Cloud Trial Account.

### **STEP 2**: Connect to Client Image

Fill in the text/image for connecting to client image running in OCI using VNC Viewer......

### **STEP 3**: Clone GIT Repository

Fill in the text/image for opening terminal window and running the "git clone...." command......

## Your Trial Account

### **STEP 1:** Your Oracle Cloud Trial Account

You have already applied for and received your Oracle Cloud Trial Account.
  
### **STEP 2**: Log in to your OCI dashboard

  - Once you receive the **Get Started Now with Oracle Cloud** Email, make note of your **Username, Password and Cloud Account Name**.

    ![](images/050/image1.png)

  - From any browser go to

    [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in)

  - Enter your **Cloud Account Name** in the input field and click the **Next** button.

    ![](images/050/image2.png)

  - Enter your **Username** and **Password** in the input fields and click **Sign In**.

    ![](images/050/image3.png)

  - In the top left corner of the dashboard, click the **Guided Navigation Drawer**

    ![](images/050/image4.png)

  - Click to expand the **Services** submenu, then click **Compute**

    ![](images/050/image5.png)
	
### **STEP 3**: Create a Compartment

Compartments are used to isolate resources within your OCI tenant. User-based access policies can be applied to manage access to compute instances and other resources within a Compartment.

  - Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Governance and Administration** section, select **Identity** and select **Compartments**.

    ![](images/050/image6.png)

    ![](images/050/image7.png)

  - Click **Create Compartment**

    ![](images/050/image8.png)

  - In the **Name** field, enter `monoTOmicro`. Enter a **Description** of your choice. Click **Create Compartment**.

    ![](images/050/image9.png)

  - In a moment, your new Compartment will show up in the list.

    ![](images/050/image10.png)

### **STEP 4**: Create an Autonomous Transaction Processing (ATP) Database

We require a Database to store the Alpha Office data which is accessed later in this workshop.  We will create an Autonomous Transaction Processing (ATP) Database to load data into.  Autonomous Transaction Processing is one of a family of cloud services built on the self-driving, self-securing, and self-repairing Oracle Autonomous Database.  Autonomous Transaction Processing uses machine learning and automation to eliminate human labor, human error, and manual tuning, delivering unprecedented cost saving, security, availability, and production. Autonomous Transaction Processing supports a complex mix of high-performance transactions, reporting, batch, IoT, and machine learning in a single database, allowing much simpler application development and deployment and enabling real-time analytics, personalization, and fraud detection.

  - Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Database** section of the menu, click **Autonomous Transaction Processing** .

    ![](images/050/image11.png)

  - Select the **Compartment** `monoTOmicro` and click **Create Autonomous Transaction Processing Database**.

    ![](images/050/image12.png)

  - Select the **Compartment** `monoTOmicro` if it is not already selected. Enter the **Display Name** `AlphaOffice`, **Database Name** `orcl`, enter the **Administrator Password** of `a1phaOffice1_` and Click **Create Autonomous Transaction Processing Database**

    ![](images/050/image13.png)

    ![](images/050/image14.png)

  - After approximately 5 minutes, the ATP instance is now **Available**

    ![](images/050/image15.png)

## Visual Builder Instance Creation

You will use the Autonomous Visual Builder Cloud Service to create an instance.

### **STEP 1**: Create a New Visual Builder Cloud Service

In this step you will create a VBCS instance that will be used in Lab 400. It takes about 20 minutes for the underlying infrastructure to be created. We just need to fire off the create instance process at this point. We'll check the status of the instance at the beginning of Lab 400.

- From the OCI console go back to your Services Dashboard by clicking on the hamburger menu in the upper left hand side of the page and selecting **Administration-->My Services Dashboard**

  ![](images/050/LabGuide50-vbcs1.png)

  ![](images/050/LabGuide50-vbcs2.png)

- You should be back at the main Dashboard:

  ![](images/050/cloud_dash.png)

- Click the **Customize Dashboard** button.

  ![](images/050/custom_dash.png)

- Then select `Autonomous Visual Builder` and click the **Show** button.

  ![](images/050/show_dash_vb.png)

- You should see the following:

  ![](images/050/LabGuide50-80c36c4c.png)

### **STEP 2**: Create a New Visual Builder Instance

- In the Autonomous Visual Builder panel click the hamburger menu and right-click **Open Service Console** and **Open link in new tab**.

  ![](images/050/LabGuide50-6196f9d1.png)

- Next, click the **Create Instance** button.

  ![](images/050/LabGuide50-11580389.png)

- On the next screen set your `Instance Name` to:

  ```
  monoTOmicro
  ```
  
- Enter a `Description` and for the `Region` select **No Preference**.

  ![](images/050/LabGuide50-vbcs3.png)

- Review your information and press **Create**.

  ![](images/050/LabGuide50-vbcs4.png)

- You will see the following screen once your request is submitted. The refresh button can to used to update the provioning status:

  ![](images/050/LabGuide50-fcc49616.png)

- You should see your instance being created. We will check for completion at the beginning of Lab 400.

  ![](images/050/LabGuide50-vbcs5.png)

**This completes the Lab!**

**You are ready to proceed to [Lab 100](LabGuide100.md)**