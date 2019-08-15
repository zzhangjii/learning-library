# Lab 4: Create and Modify APEX Application

## Introduction

In this lab, you will create a new application that will utilize the database objects you created in the previous lab. You will create and modify an application with an Interactive Grid and Calendar page.

***To log issues***, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Lab 4 Objectives

- Create Interactive Grid
- Enhance the Interactive Grid
- Save Report
- Add a Calendar page

## Steps

### **STEP 1:** Create Interactive Report and Form

- Click **Create App from Script**
{Note: If you are back on SQL Scripts, and don’t see the “Create App from Script” button perform the following steps:1. Within the Results column, click “1” for the script you just ran. 2. Under View Results, click the magnifying glass. The results page shown above should now be displayed again}

  ![](images/Lab400/001.png)

- For Name, enter **Projects** and click **Appearance**. For Theme Style, select **Vita-Slate** and click **Save Changes**.

  ![](images/Lab400/002.png)

- For Features, click **Check All**.

  ![](images/Lab400/003.png)

- Click **Create Application**.

  ![](images/Lab400/004.png)

- Your new application will be displayed in Page Designer. Click **Run Application**.

  ![](images/Lab400/005.png)

- Enter your credentials and review your new application.

  ![](images/Lab400/006.png)

- From the development environment, click **App Builder**, and then select **Create**.

  ![](images/Lab400/007.png)

- Click **New Application**.

  ![](images/Lab400/021.png)

- In the Create App Wizard, click **Load Blueprint** and for Projects, click **Load**. 

  ![](images/Lab400/008.png)

- Click **Add Page** and then click **Interactive Grid**.

  ![](images/Lab400/009.png)

- For Page Name, enter **Milestones**, for Table or View, select **HOL_MILESTONES** and click **Add Page**.

  ![](images/Lab400/010.png)

- Click and hold the mouse when hovering over the hamburger for the Milestones – Interactive Grid page. Move it up until the page is under Projects and release the mouse.

  ![](images/Lab400/011.png)

- For Milestones – Interactive Report with Form page, click **Edit** and then click **Delete**.

  ![](images/Lab400/012.png)

- Click **Create Application**. In Page Designer, click **Run Application**.

  ![](images/Lab400/013.png)

- In the runtime environment, click **Milestones**.

  ![](images/Lab400/014.png)

### **STEP 2:** Enhance the Interactive Grid

- In the Developer Toolbar, click **Edit Page 6**.

  ![](images/Lab400/015.png)

- In Page Designer, under Milestones, click **Columns** and click **PROJECT_ID**.

  ![](images/Lab400/016.png)

- In the Property Editor, update the following and click **Save and Run the App**.
  -  Identification: Type – select **Select List**
  -  Heading: Heading – enter **Project**
  -  List of Values: Type – select **SQL Query**
  -  List of Values – SQL Query enter **select name d, id r from hol_projectsorder by 1**
  -  Display Extra Values – click **No**
  -  Display Null Value – click **No** 

  ![](images/Lab400/017.png)

- Select one of the projects in the list and you see that it is now a select list.

  ![](images/Lab400/022.png)

- Select the list to see all the projects you can select from.

  ![](images/Lab400/023.png)

- You can also select one of the Due Date values to see the Date Picker widget is available.

  ![](images/Lab400/024.png)

- You can change the columns that are displayed. Click **Actions** and select **Columns**.

  ![](images/Lab400/025.png)

- Uncheck some of the columns. In this case, uncheck Row Version, Updated and Updated By and click **Save**.

  ![](images/Lab400/026.png)

- You want to see all the Milestones by Project so you will need to add a control break on Project. Click **Actions** and select **Format** > **Control Break**.

  ![](images/Lab400/027.png)

- Select the **+** and select the **Project** column, then click **Save**.

  ![](images/Lab400/028.png)

- Note that the control break on Project was applied.

  ![](images/Lab400/031.png)

### **STEP 3:** Save Report

- You want to save this report so you don't need to apply the changes you just made everytime. Click **Actions**, select **Report**, select **Save As**.

  ![](images/Lab400/029.png)

- Select **Alternative** for Type, enter a Name and click **Save**.

  ![](images/Lab400/030.png)

- Note the Report List in the Interactive Tool bar is now available. If you want to go back to the Primary Report, you can select it from the list.

  ![](images/Lab400/031.png)

### **STEP 4:** Create Calendar Page

- You want to create a schedule of all your projects in a calendar. Click the Application link in the developer toolbar.

  ![](images/Lab400/032.png)

- Click **Create Page**.

  ![](images/Lab400/033.png)

- Select **Calendar** and click **Next**.

  ![](images/Lab400/034.png)

- Enter **Calendar** for Page Name, select **Breadcrumb** for Breadcrumb and click **Next**.

  ![](images/Lab400/035.png)

- Select **Create a new navigation menu entry** and click **Next**.

  ![](images/Lab400/036.png)

 - Select **HOL_PROJECTS** for Table / View Name and make sure only the following columns are in the right column and click **Next**.

   - ID
   - ROW Version
   - Name
   - PROJECT_LEAD
   - STATUS
   - COMPLETED_DATE

  ![](images/Lab400/037.png) 

- Select **NAME** for Display Column, **COMPLETED_DATE** for Start Date Column and End Date Column and click **Create**.

  ![](images/Lab400/038.png)

- Click **Save and Run Page**.

  ![](images/Lab400/039.png)

- The Calendar is displayed. You may need to change the month to see any projects. Note that the new Calendar page is an entry in the Left Navigation.

  ![](images/Lab400/040.png)

**This completes the Lab!**

