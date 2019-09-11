# Module 1: Create an APEX Workspace

## Introduction

Oracle Application Express (APEX) is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP) services. To start, you will need to create an ATP instance and then access APEX from within the instance's Service Console. 

***To log issues***, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Module 1 Objectives

- Log in to your Oracle Cloud account
- Create an Autonomous Transaction Processing instance
- Create a new workspace in APEX
- Log in to your new workspace

## Parts

### **Part 1:** Log in to your Oracle Cloud account

In this part, you will log into your Oracle Cloud account so that you can start working with various services.

1. You should have signed up for your Oracle Cloud trial account. If not, return to the Lab Introduction and complete Part 1.

2. Once you receive the **Get Started Now with Oracle Cloud** email, make note of your **Username**, **Password**, and **Cloud Account Name**.

3. From any browser go to [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in).

4. Enter your **Cloud Account Name** in the input field and click the **Next** button.

   ![](images/1/enter-oracle-cloud-account-name.png)

5. Enter your **Username** and **Password** in the input fields and click **Sign In**.

   ![](images/1/enter-user-name-and-password.png)

### **Part 2:** Create an Autonomous Transaction Processing instance

In this part, you will create an instance of the Autonomous Transaction Processing database service.

1. From the Cloud Dashboard, select the navigation menu icon in the upper left-hand corner and then select **Autonomous Transaction Processing**.

   ![](images/1/select-atp-in-nav-menu.png)

2. Click **Create Autonomous Database**.

   ![](images/1/click-create-autonomous-database.png)

3. Leave all of the default selections, enter **`SecretPassw0rd`** for the ADMIN password, then click **Create Autonomous Database**.

   ![](images/1/atp-settings-1.png)
   ![](images/1/atp-settings-2.png)
   ![](images/1/atp-settings-3.png)

   After clicking **Create Autonomous Database**, you will be redirected to the Autonomous Database Details page for the new instance. Continue to the next part when the status changes from **PROVISIONING...** to **AVAILABLE**.

### **Part 3:** Create a new workspace in APEX

When you first access APEX you will need to log in as an APEX instance administrator to create a workspace. A workspace is a logical domain where you define APEX applications. Each workspace is associated with one or more database schemas (database users) which are used to store the database objects, such as tables, views, packages, and more. These database objects are generally what APEX applications are built on top of.

1. Click the **Service Console** button.

   ![](images/1/click-atp-service-console.png)

2. Click **Development** option in the menu on the left, then click the **Oracle Application Express** option.

   ![](images/1/click-application-express.png)

3. Enter the password for the Administration Services and click **Sign In to Administration**. The password is the same as the one entered for the ADMIN user when creating the ATP instance: **`SecretPassw0rd`**

   ![](images/1/log-in-as-admin.png)

4. Click **Create Workspace**.
  
  ![](images/1/welcome-create-workspace.png)

5. Enter the following details and click **Create Workspace**.

   | Property | Value |
   | --- | --- |
   | Database User | **DEMO** |
   | Password | **`SecretPassw0rd`** |
   | Workspace Name | **DEMO** |
  
   ![](images/1/create-workspace.png)

6. Click the **DEMO** link in the success message. This will log you out of APEX administration so that you can log into your new workspace. 
	
   ![](images/1/log-out-from-admin.png)

7. Enter **`SecretPassw0rd`** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

   ![](images/1/log-in-to-workspace.png)

## Summary

This completes Module 1. At this point, you know how to create a new Autonomous Transaction Processing instance and create an APEX workspace within it. [Click here](2-create-an-app-from-a-spreadsheet.md) to navigate to Module 2.