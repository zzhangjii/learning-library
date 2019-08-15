# Lab 3: Build Database Objects in Autonomous Database

## Introduction

In this lab, you will create database objects using Quick SQL and then view the database objects in SQL Developer Web. In SQL Developer Web, you will create an additional table and then view all the database objects as a Data Model.

***To log issues***, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Lab 3 Objectives

- Create Database Objects using Quick SQL
- View Database Objects in SQL Developer Web
- View Data Model
- Create New Table and Add to Data Model

## Steps

### **STEP 1:** Create Database Objects using Quick SQL

-  Select **SQL Workshop**, then select **SQL Scripts**.

   ![](images/Lab300/001b.png)

-  Click **Quick SQL**.

   ![](images/Lab300/002b.png)

-  Copy the following into the left pane Quick SQL window area. Review the code and click **Generate DDL**.
<pre>
  team_members /insert 10
    username /nn /upper
    full name
    email /nn
    phone_number
    profile
    photo file
  projects /insert 20
    name /nn
    project_lead /nn /references team_members
    budget num
    status vc30 /nn /check ASSIGNED, IN-PROGRESS, COMPLETED
    completed_date
    description
    milestones /insert 30
      name /nn
      due_date /nn
      description
    tasks /insert 100
      name /nn
      assignee /nn /references team_members
      milestone_id /references milestones
      start_date /nn
      end_date
      cost num
      description
      is_complete_yn /check Y, N
  view project_tasks projects tasks
</pre>

-  You can also access the data from [here](lab-resources/quicksql.txt).

   ![](images/Lab300/003.png)

-  Note the DDL that is generated. You may want to change some of the settings, click **Settings**.

   ![](images/Lab300/004.png)

-  Change the following settings and click **Save Changes**.

   -  Object Prefix, enter **HOL**

   -  On Delete, select **Restrict**

   -  Primary Keys, select **12c Identity Data Types**

   -  Date Data Type, select **TIMESTAMP WITH LOCAL TIME ZONE**

   -  **Audit Columns**, check Include

   -  **Row Version Number**, check Include

   ![](images/Lab300/005.png)

   ![](images/Lab300/006.png)

-  Click **Save SQL Script**.

   ![](images/Lab300/007.png)

-  Enter **HOL** for Script Name and click **Save Script**.

   ![](images/Lab300/008.png)

-  Click **Review and Run**.

   ![](images/Lab300/007.png)

-  Click **Run**.

   ![](images/Lab300/009.png)

-  Click **Run Now**.

   ![](images/Lab300/010.png)

-  The script ran and you now see the log. Scroll to the bottom to see the summary

   ![](images/Lab300/011.png)

   ![](images/Lab300/012.png)

-  You can view the database objects that were created and view the data that was loaded. Select **SQL Workshop** and select **Object Browser**.

   ![](images/Lab300/013.png)

-  Search for **HOL** to see the tables you created. Select **HOL_PROJECTS**. Review the columns in the table.

   ![](images/Lab300/015.png)

-  Click the **Data** tab to see the data that was loaded.

   ![](images/Lab300/016.png)

### **STEP 2:** View Database Objects in SQL Developer Web

In this section, you will access SQL Developer Web and review the current objects and make some modifications to the Data Model.

-  Switch to the Service Console tab in your browser. Select **SQL Developer Web**.

   ![](images/Lab300/017.png)

-  Log in to SQL Developer Web as the **admin** user.

   ![](images/Lab300/018.png)

-  You created your database objects in the demo schema so you will need to open up your worksheet as that user. In the URL in your browser, change **admin** to **demo** and press enter.

   ![](images/Lab300/019.png)

-  Log in as the **demo** user.

   ![](images/Lab300/020.png)

-  The worksheet is displayed. Close the help popup.

   ![](images/Lab300/021.png)

-  To see all the tables you added previously, in the search area, enter **HOL** and click the refresh button.

   ![](images/Lab300/022.png)

-  All the tables you created are displayed. Expand the **HOL_PROJECTS** table to see the columns.

   ![](images/Lab300/023.png)

-  Enter the following SQL in the right area and click the Run icon to see the data in the table.

<pre>select * from hol_projects;</pre>

   ![](images/Lab300/023.png)

-  The data is displayed.

   ![](images/Lab300/026.png)

### **STEP 3:** View Data Model

-  Let's view the tables in a Data Model Diagram. Click the **Data Model** tab. Close the Help popup.

   ![](images/Lab300/027.png)

-  Search for **HOL** again and click Refresh. Then drag the **HOL_MILESTONES** table to the right side of the window.

   ![](images/Lab300/028.png)

-  Drag the other three tables to the right. Note that the foreign keys are detected and drawn on the Data Model.

   ![](images/Lab300/029.png)

-  Click the **HOL_PROJECTS** table in the diagram. Note that the detail is displayed in the right navigator.

   ![](images/Lab300/030.png)

### **STEP 4:** Create New Table and Add to Data Model

-  You want to create a new table. In the Navigator, click the **'+'** icon.

   ![](images/Lab300/031.png)

-  Enter **HOL_TODOS** for the table name and click the **'+'** to create a new column.

   ![](images/Lab300/032.png)

-  Select the new column **NEW_COLUMN_1** and in the area at the bottom of the dialog, enter **id** for Name and select **NUMBER** for Data Type. Also select the checkbox for **PK** to make it the primary key for this new table. Click **'+'** to create another column.

   ![](images/Lab300/033.png)

-  Create the following columns and then click **Apply**.
**NAME - VARCHAR(50)** (Note, just change the number 20 to 50)
**STATUS = VARCHAR(20)**

   ![](images/Lab300/034.png)

-  The script is generated and is executed. Click **Close**.

   ![](images/Lab300/035.png)

-  In the Navigator, click the Refresh icon to see the new HOL_TODOS table.

   ![](images/Lab300/036.png)

-  You want to be able to assign a team member to a todo so you want to create a new column called TEAM_MEMBER_ID and create a foreign key to the HOL_TEAM_MEMBERS table. Right-click on the **HOL_TODOS** table and select **Edit...**.

   ![](images/Lab300/037.png)

-  Add a new column called **TEAM_MEMBER_ID** and click **Apply**.

   ![](images/Lab300/038.png)

-  The script to create the new column ran successfully. 

   ![](images/Lab300/039.png)

-  Click the **Foreign Key** option on the left side of the dialog.

   ![](images/Lab300/040.png)

-  Click the '+' to create a new foreign key. Select it in the list and change the name to TEAM_MEMBER_ID. 

   ![](images/Lab300/041.png)

-  The script to create the new column ran successfully. . Click the **Foreign Key** option on the left side of the dialog. Select the **HOL_TEAM_MEMBERS** table and select the **HOL_TEAM_MEMBERS_ID_PK** constraint. On the right side, select **TEAM_MEMBER_ID** for local column and click **Apply**.

   ![](images/Lab300/042.png)

-  The script to create the foreign key ran successfully. Click **Close**.

   ![](images/Lab300/043.png)

-  Drag the new HOL_TODOS table from the Navigator to the Diagram. You notice that the new foreign key is displayed between HOL_TEAM_MEMBERS and HOL_TODOS.

   ![](images/Lab300/044.png)





