# Module 4: Create and Modify an APEX App

## Introduction

In this module, you will create a new APEX application that will utilize the database objects you created in the previous module. You will then extend the application by adding Interactive Grid and Calendar pages.

***To log issues***, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Module 4 Objectives

- Create an app from a script
- Add an Interactive Grid page and create records
- Enhance and save the Interactive Grid
- Add a Calendar page

## Parts

### **Part 1:** Create an app from a script

In Module 3, Part 1, you used Quick SQL to create a script which you subsequently ran to create several tables. The Results page of running the script has a button that allows you to create a new application based on the script. APEX will parse the script to identify the tables and then create pages in the new app to view and edit data within those tables. In this part, you will create an app based on the script you previously ran.

1. Return to your APEX Workspace. You may need to re-authenticate if your previous session expired. If you need the APEX URL, return to the ATP Service Console, click **Development** in the menu on the left, then select **Oracle Application Express**. To log in, enter **DEMO** for the Workspace and Username fields and **`SecretPassw0rd`** for the password, then click **Sign In**.

   ![](images/4/log-in-to-workspace.png)

2. Click the down arrow in the **SQL Workshop** tab, then select **SQL Scripts**.

   ![](images/4/navigate-to-sql-scripts.png)
3. Click the number link in the Results column to view the results of the previous runs of the script.

   ![](images/4/click-number-in-results-column.png)
4. Click the magnifying glass icon in the View Results column.

   ![](images/4/click-view-results-icon.png)
5. Click **Create App from Script**.

   ![](images/4/click-create-app-from-script.png)
6. Set Name to **App from a Script** and then click the popup icon for Appearance. In the dialog, select **Vita - Slate** and then click **Save Changes**.

   ![](images/4/create-an-application.png)

   Next, click **Check All** for Features and then click **Create Application**.

   ![](images/4/create-an-application-2.png)
   
   After the app is created, you'll be redirected to the application home page in the Application Builder.
7. Click **Run Application** to see the app at runtime. 

   ![](images/4/app-home-page-in-builder.png)
8. Take a moment to explore the pages that APEX created on top of the tables identified in the script.

   ![](images/4/app-from-a-script-runtime.png)

### **Part 2:** Add an Interactive Grid page and create records

Thus far, you've used high-level wizards to generate applications: first from a spreadsheet and then from a script. In this part, you'll work at a lower level to add a new Interactive Grid page the application created in the previous part. After that, you'll use the new page to add some data to the HOL_TODOS table.

1. todo

### **Part 3:** Enhance and save the Interactive Grid

A page in APEX is made up of various components, such as regions, items, and buttons. Once created, these components can be declaratively configured via the Page Designer, an IDE like tool built into APEX. In this part, you'll use the Page Designer to make some changes to the Interactive Grid region created in the previous step. You'll then make some additional changes to the appearance of the Interactive Grid. 

1. todo

### **Part 4:** Add a Calendar page

APEX includes different components for viewing and working with data in different ways, including forms, reports, charts, and much more. One of the easiest ways to visualize data related to dates is with a calendar. In this part, you'll create a new calendar page in your application to view data in the HOL_TASKS table. 

1. todo

## Summary

You have completed the lab, well done! 
