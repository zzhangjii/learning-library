---
layout: ziplab
description: Building a Proof-of-concept
---

# **Application Development in APEX **
## **Building a Proof-of-concept**
## Overview
This lab starts with a napkin design of data structures we would
like to use for a proof-of-concept. Using Quick SQL you will quickly
define the data structures and utilize various table and column
directives to better define the tables and also create some
dummy data. You will then be creating an application based on
the new tables. Lastly, you will be updating some of the generated
components to improve the initial app.

*From napkin design to demo-ready, proof-of-concept app,
complete with some dummy data, in minutes - Viola!*

## **Section 1** - Obtaining a Workspace
*{Note: If you have a workspace on https://apex.oracle.com then you can skip this section and move to Section 2}*

### **Step 1.1**

1. Go to https://apex.oracle.com
1. Click **Get Started for Free**

![](https://i.imgur.com/FpMd2UK.png[/img])


### **Step 1.1b**

1. Click **Request a Free Workspace**

![](https://i.imgur.com/11dGjfL.png[/img])

### **Step 1.2**

1. What Type of Workspace 1. Click Application Development
1. Enter your Identification details – First Name, Last Name, Email, Workspace

   *{Note: For workspace enter a unique name,
such as first initial and last name}*
1. Enter Schema details – Schema Name


  *{Note: For schema name enter the same name
as you entered for workspace}*
1. Complete the wizard

### **Step 1.3**

1. Check your email. You should get an email from oracle- application-express_ww@oracle.com
within a few minutes


   *{Note: If you don’t get an email go
back to Step 1 and make sure to enter
your email correctly}*
1. Click Create Workspace
1. Click Continue to Log In Screen
1. Reset your password

![](https://i.imgur.com/vnslkIt.png[/img])

## **Section 2** - Defining new data structures - Using Quick SQL*

## Oracle Spreadsheet Table
![](https://i.imgur.com/8TkzNms.png[/img])

## Napkin Design - Improved data model for Projects
![](https://i.imgur.com/l8LEEtn.png[/img])

### **Step 2.1 - Open Quick SQL**

1. Log into your workspace
1. Click **SQL Workshop**
1. Click **SQL Scripts**

![](https://i.imgur.com/4TBd8Rf.png[/img])

4. Click **Quick SQL**

![](https://i.imgur.com/Gdublvv.png[/img])

### **Step 2.2 1. Enter shorthand for Team Members table**

1. Enter the Table Name {Team Members}
1. Indent 2 or more spaces and enter the column names

![](https://i.imgur.com/CulnRgR.png[/img])

*Note: You don’t need to enter all of the column names shown,
as you will load a complete script later in this lesson*

### **Step 2.3 1. Enter details for Projects table**
1. Enter the Table Name in the first column {Projects}
1. Indent 2 or more spaces and enter the column names

![](https://i.imgur.com/jtu2T6K.png[/img])

### **Step 2.4 – Review Help**

1. Click **Help**
1. Click **Table Directives**

![](https://i.imgur.com/55CTUHD.png[/img])

### **Step 2.4b – Review Help**

1. Click **Column Directives**

![](https://i.imgur.com/pV4Sw3X.png[/img])

### **Step 2.4c – Review Help**

1. Click **Data Types**

![](https://i.imgur.com/6p8xUN6.png[/img])

### **Step 2.5 - Improve the Shorthand**

1. Close **Help**
1. Enter **/insert xx** for tables
1. Enter **/nn** for mandatory columns
1. Enter **/references team_members** for project lead column
1. Enter **num** for budget column
1. Enter **/vc30** and **/check ASSIGNED,
IN-PROGRESS, COMPLETED** for
status column

![](https://i.imgur.com/C6zTGtJ.png[/img])

### **Step 2.6 1. Enter details for a child table**

1. Enter the Table Name indented
{Milestones}

![](https://i.imgur.com/IEYZU5c.png[/img])

1. Indent 2 or more spaces and
enter the column names


![](https://i.imgur.com/qt8TUXO.png[/img])

### **Step 2.7 1. Enter details for another child table**

1. Enter the Table Name indented
{Tasks}
1. Indent 2 or more spaces and
enter the column names

![](https://i.imgur.com/VYYEL8e.png[/img])

### **Step 2.8 – Complete the Shorthand**

1. Copy the following URL into a new window in your browser:
{Remember you are on Slide 21 if you click the link directly}

https://www.oracle.com/technetwork/developer-tools/apex/application-express/apex-beginner-quicksql-5095785.txt

2. Copy and Paste the full script
into the **Quick SQL Shorthand pane**

3. Click **Generate SQL**

![](https://i.imgur.com/9lW6S17.png[/img])

### **Step 2.9 – Update the Settings**

1. Click **Settings**
- Object Prefix, enter **hol**
- On Delete, select **Restrict**
- Primary Keys, select **12c Identity Data Types**
- Date Data Type, select **TIMESTAMP WITH LOCAL TIME ZONE**
- Audit Columns, check Include
- Row Version Number, check Include
2. Click **Save Changes**

![](https://i.imgur.com/nZVvx71.png[/img])

### **Step 2.10 – Save, Review, and Run the Script**

1. Click **Save SQL Script**
1. For Script Name, enter **hol**
1. Click **Save Script**
1. Click **Review** and **Run**

![](https://i.imgur.com/e2I6k3z.png[/img])

*Note: The script will be displayed in
the Script Editor within SQL Scripts*

1. Click **Run**
1. Click **Run Now**

![](https://i.imgur.com/CyYXjko.png[/img])

## **Section 3** - Creating an app on the tables from Quick SQL - *Using the Create Application Wizard*

### **Step 3.1 – Start the Create App Wizard**

1. Click **Create App** from Script

![](https://i.imgur.com/7TPFNiS.png[/img])

*{Note: If you are back on SQL Scripts, and don’t see the “Create
App from Script” button perform the following steps*:
1. *Within the Results column, click “1” for the script you just ran*.
2. *Under View Results, click the magnifying glass*.

*The results page shown above should now be displayed again}*

### **Step 3.2 – Name the App and Update Appearance**

1. For Name, enter **Projects**
1. Click **Appearance**
1. For Theme Style, select **Vita-Slate**

![](https://i.imgur.com/EOCdLPq.png[/img])

### **Step 3.3 – Add Features**

1. For Features, click **Check All**

![](https://i.imgur.com/4ZadDjE.png[/img])

### **Step 3.4 - Create Application**

1. Click **Create Application**

![](https://i.imgur.com/P9SETCW.png[/img])

### **Step 3.5 – App in Page Designer**

1. Your new application will be displayed in Page Designer
1. Click **Run Application**

![](https://i.imgur.com/gwEA0V5.png[/img])

### **Step 3.6 - Runtime App**

1. Enter your **credentials**
1. Play around with your new application

![](https://i.imgur.com/Zsgy9GN.png[/img])

## **Section 4** - Improving the App - *Updating a Page*

### **Step 4.1 - Restart the Create App Wizard**

1. From the development environment, click **App Builder**, and then select **Create**

![](https://i.imgur.com/F0CAdtA.png[/img])

1. Click **New Application**

### ** Step 4.2 - Load Blueprint**

1. In the Create App Wizard, click **Load Blueprint**
1. For Projects, click **Load**

![](https://i.imgur.com/7XSTr20.png[/img])

### **Step 4.3 – Add a Page**

1. Click **Add Page**
1. Click **Interactive Grid**

![](https://i.imgur.com/Kq1R8CL.png[/img])

1. For Page Name,
enter **Milestones**
1. For Table or View, select
**HOL_MILESTONES**
1. Click **Add Page**

![](https://i.imgur.com/MvavpGO.png[/img])

### **Step 4.4 – Reorder a Page**

1. Click and hold the mouse when hovering over the hamburger for
the **Milestones – Interactive Grid** page
1.  Move it up until the page is under Projects
1.  Release the mouse

![](https://i.imgur.com/TfTn4Mv.png[/img])

### **Step 4.5 – Delete a Page**

1. For **Milestones – Interactive Report with Form** page, click **Edit**
1. Click **Delete**

![](https://i.imgur.com/vzjSc1z.png[/img])

### **Step 4.6 – Create App and Run**

1. Click **Create Application**
1.  In Page Designer, click **Run Application**

![](https://i.imgur.com/CGbb0t1.png[/img])

### **Step 4.7 – Navigate to Milestones**

1.  In the runtime environment, click **Milestones**

![](https://i.imgur.com/3E0HN6u.png[/img])

1.  In the Developer Toolbar, click **Edit Page 6**

![](https://i.imgur.com/pu8QZ3m.png[/img])

### **Step 4.7 – Navigate to Milestones**

1.  In the runtime environment, click **Milestone**

![](https://i.imgur.com/zLnAiV6.png[/img])

2.  In the developer toolbar, click **Edit Page 6**

![](https://i.imgur.com/71NFdPc.png[/img])

### **Step 4.8 – Update Project ID Column**

1.  In Page Designer, under Milestones, click **Columns**
1. Click **PROJECT_ID**

![](https://i.imgur.com/hyzTFq6.png[/img])

### **Step 4.8b – Update Project ID Column**

1.  In the Property Editor, update the following:


   - Identification: Type – select **Select List**

   - Heading: Heading – enter **Project**

   - List of Values: Type – select **SQL Query**

   - List of Values – SQL Query enter **select name d, id r from hol_projects order by 1**
    - Display Extra Values – click **No**
   - Display Null Value – click **No**
2. Save and Run the App

![](https://i.imgur.com/fcUYtLE.png[/img])

### **Step 4.9 – Hide Columns**

1.  In the runtime environment, click **Actions**, select **Columns**
1. Uncheck Displayed for **Id, Row Version, Created, Created By,
Updated**, and **Updated By**
1. Click **Save**

![](https://i.imgur.com/pAqSeax.png[/img])

### **Step 4.10 – Save the Report**

1.  In the runtime environment, click **Actions**, select **Report**,
select **Save**

![](https://i.imgur.com/xvAVJPG.png[/img])

## **Learn More** *Useful Links*

- **APEX on Autonomous** https://apex.oracle.com/autonomous
- **APEX Collateral** https://apex.oracle.com
- **Tutorials** https://apex.oracle.com/en/learn/tutorials
- **Community** https://apex.oracle.com/community
- **External Site + Slack** http://apex.world
