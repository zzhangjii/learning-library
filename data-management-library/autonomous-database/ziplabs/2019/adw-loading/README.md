---
layout: ziplab
description: Learn how to load data from an Oracle Object Store into the Oracle Autonomous Data Warehouse.
tags: Oracle Cloud, Autonomous Data Warehouse, ADW, Oracle Cloud Infrastructure, OCI, Object Store, Data Load
permalink: /data-management-library/autonomous-database/ziplabs/2019/adw-loading/index.html
---
# Loading Data into the Autonomous Database #

## Before You Begin ##
This 15-minute lab walks you through the steps to get load data from external databases into the Oracle Autonomous Data Warehouse (ADW) on Oracle Cloud Infrastructure (OCI). This lab assumes you have already provisioned an ADW instance.

### Background ###
You can load data into Autonomous Database using Oracle Database tools and 3rd party data integration tools. Data can be loaded:

-   from files local to your client computer, or

-   from files stored in a cloud-based object store

For the fastest data loading experience Oracle recommends uploading the source
files to a cloud-based object store before loading the data into your Autonomous Database.

Today we will use the PL/SQL **DBMS_CLOUD** package. The DBMS_CLOUD package supports loading
data files from the following Cloud sources: 
1. Oracle Cloud Infrastructure Object Storage (OCI Object Storage)
2. Oracle Cloud Infrastructure Object Storage Classic
3. Amazon AWS S3

This tutorial shows how to load data from OCI Object
Storage using two of the procedures in the DBMS_CLOUD package:

-   `create_credential`: Stores the object store credentials in your Autonomous
    Database schema.

-   `copy_data`: Loads the specified source file to a table. 


### What Do You Need? ###
* Access to an instance of Oracle Autonomous Data Warehouse (ADW)


## Load a data file to your Object Store ##
Oracle Cloud Infrastructure offers two distinct storage class tiers.  Object Storage, for data which you need fast, immediate and frequent access and Archive Storage, for data which you seldom or rarely access.  In this ziplab you will stage data into an object store in the Oracle Cloud Infrastructure Object Storage service.

1.  Log in to your Oracle Cloud Infrastructure Console

2.  Select **Object Storage** -> **Object Storage** from the drop down menu on the top left of the Oracle Cloud Infrastructure console

    ![](img/adw-loading-object-storage2.png)

3.  Select **Create Bucket** to create a bucket to load your data in.  This will be your staging area.  Later in this lab you will move the data from this staging area to your ADW instance.
For this lab, we'll use the `root` compartment.
![](img/adw-loading-create-bucket-screen.png)


4.  Enter the following information: 
    * **Bucket Name**:  `bucket-<city you were born in>-<your initials>`  (example: *bucket-london-kam*)
    * **Storage Tier**:  `Standard`
     * **Encryption**: `Encrypt using Oracle Managed Keys`
![](img/adw-loading-create-bucket.png)


5. Click **Create Bucket**.

6.  Click on the bucket name you just created.  
![](img/adw-loading-buckets.png)
 

7. Review the screen. Note you have created an empty bucket with no objects in it and the visibility is set to private. 
![](img/adw-loading-bucket-screen.png)

8.  Click [here](https://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/adwc/OBE_Loading%20Your%20Data/files/datafiles_for_sh_tables.zip) to download the zip file with your objects.  Open up your file browser and extract the zip file.

9.  Click **Upload Object** button to begin selecting the data files to upload to the bucket.  Click on **select files** to choose your extracted data files.
![](img/adw-loading-select-files.png)


10.  **Select the two data files** `customers.dat` and `sales.dat` and click **Open**.  Once the files are finished loading, click **Upload Objects** to load. 
![](img/adw-loading-load-bucket-2-new.png)

11.  Once complete, verify *both* *.dat files have a status of *`Finished`* and click **Close**.

12. Your bucket should have 2 objects, customers.dat and sales.dat loaded.  *If this were a true data load, you may be loading hundreds of large files here.*


12.  The final step will be to change the visibility of your bucket. Click the **Edit Visibility** button at the top of your Bucket Details screen.


13. Change the visibility to **Public**, accept all other defaults.  Click **Save Changes**.

14. Your bucket should now be visible and public.  Verify and proceed to setting up your Auth token.
![](img/adw-loading-bucket-info.png)



## Create an Object Store Auth Token ##

To load data from the OCI object store, you need to create an Auth Token for your object store account. The
communication between your Autonomous Database and the object store relies on this Auth Token and username/password authentication.

1.  If you have logged out of Oracle Cloud Infrastructure Object Storage, please log back in.

2.  From the menu on the top left select **Identity->Users**. Once on the Users Page click on your username
![](img/adw-loading-identity-users.png) 

3.  Select your username.  Click **Auth Tokens** under **Resources** on the left of the console.
![](img/adw-loading-user-screen.png) 



4.  Click **Generate Token**.
![](img/adw-loading-user-token.png) 

5.  A pop-up dialog appears. Set the Auth Token by performing the following
    steps:

    -   In the pop-up dialog, enter a description.  Click the **Generate Token** button.
    ![](img/adw-loading-token-description.png)

    -   Copy the generated token to notepad located on your desktop. The token does not appear again and you WILL NEED this token to load your data into ADW.
![](img/adw-loading-generated-token.png)

    -   Click **Close**.






## Create Object Store Credentials in your Autonomous Database ##

Now that you have created an object store Auth Token, its time to store the credentials of the object store in ADW instance.

1.  Let's navigate to SQL Developer web to prepare your ADW instance for the staged data.  
Go back to your ADW instance via the menu.
![](img/adw-loading-adw-instance.png)

2.  Click on the ADW instance you created in a previous exercise and verify it is still running.
![](img/adw-loading-adw-instance2.png)

3.  Click on **Service Console**.  If the service console does not open a new tab, ensure pop up blocker is turned off for your browser.  Click on **Development** to access the developer tools for ADB.
![](img/adw-loading-service-console.png)

4.  Click on **SQL Developer Web**.
![](img/adw-loading-navigate-sql-dev.png)


5.  Enter your database admin username from the previous exercise and login to your ADW instance. 

    Note:  When you provisioned your ADW instance you wrote down an admin password for your new database.  Use this to log in to SQL Developer web.  You can go back to your ADW instance and reset your admin password via the menu.
![](img/adw-loading-sql-dev-logging-in.png)

6. SQL Developer Web has an interface similar to the installed client.  Note where the Worksheet is and the Query Results.

7.   In SQL Developer Web, use the create_credential procedure of the DBMS_CLOUD package to store the object store credentials in your database.  This pl/sql procedure takes in the following arguments:
-  credential name
- Oracle cloud username
- Authorization token created earlier

    Copy the pl/sql procedure (to the worksheet area of SQL Developer web below) and fill in the username and password.  
    ```SQL
    begin  
    DBMS_CLOUD.create_credential (  
    credential_name => 'OBJ_STORE_CRED',  
    username => '<your username\>',  
    password => '\<your Auth Token\>'  
    ) ;  
    end;  
    /
    ```
    ![](img/adw-loading-create-credential.png)

8.  Press the green arrow to run the worksheet.  Once the correct information is entered, you should get a message that the ``PL/SQL procedure completed``
![](img/adw-loading-sql-output.png)

9.  Your object store's credentials are stored in
your ADW instance now.  

## Copy Data from Object Store to Autonomous Database Tables ##

Before data is copied, the tables and objects need to be created in ADW.  In this lab you will create the target objects.

1. Copy the sql script below to create the SALES and CUSTOMER table.
````SQL
CREATE TABLE sales (
prod_id NUMBER NOT NULL,
cust_id NUMBER NOT NULL,
time_id DATE NOT NULL,
channel_id NUMBER NOT NULL,
promo_id NUMBER NOT NULL,
quantity_sold NUMBER(10,2) NOT NULL,
amount_sold NUMBER(10,2) NOT NULL);

CREATE TABLE customers (
cust_id NUMBER NOT NULL,
cust_first_name VARCHAR2(20) NOT NULL,
cust_last_name VARCHAR2(40) NOT NULL,
cust_gender CHAR(1) NOT NULL,
cust_year_of_birth NUMBER(4) NOT NULL,
cust_marital_status VARCHAR2(20) ,
cust_street_address VARCHAR2(40) NOT NULL,
cust_postal_code VARCHAR2(10) NOT NULL,
cust_city VARCHAR2(30) NOT NULL,
cust_city_id NUMBER NOT NULL,
cust_state_province VARCHAR2(40) NOT NULL,
cust_state_province_id NUMBER NOT NULL,
country_id NUMBER NOT NULL,
cust_main_phone_number VARCHAR2(25) NOT NULL,
cust_income_level VARCHAR2(30) ,
cust_credit_limit NUMBER ,
cust_email VARCHAR2(50) ,
cust_total VARCHAR2(14) NOT NULL,
cust_total_id NUMBER NOT NULL,
cust_src_id NUMBER ,
cust_eff_from DATE ,
cust_eff_to DATE ,
cust_valid VARCHAR2(1) );

````
2. Paste it in your SQL Developer Web worksheet area overwriting any existing commands.
![](img/adw-loading-sql-worksheet-tables.png)

3.  Select the entire script and press the green play button.

    ![](img/adw-loading-green-play.png)


4. Once the script has run review the output to ensure the table has been created successfully.  You should see the two tables created.
![](img/adw-loading-sql-worksheet-tables.png)

Now you have empty tables and staged data in the OCI Object store. To get the data from the object store to your ADB instance, you need to get some information about the object. To move the data we will be using the dbms_cloud.copy_data procedure.  The procedure takes information about the location of the data you staged in your object store.

 ````SQL
    begin
    dbms_cloud.copy_data(
        table_name =>'<ENTER_TABLE_NAME>',
        credential_name =>'OBJ_STORE_CRED',
        file_uri_list =>'https://swiftobjectstorage.<region name>.oraclecloud.com/v1/<tenant name>/tutorial_load_adwc/chan_v3.dat',
        format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true')
    );
    end;
    /
````

5. Select **Object Storage->Object Storage** from the menu.  Select your bucket. 

6.  In the objects section, locate your data file.  Click on the three dots on the right. 
![](img/adw-loading-bucket-visibility-2.png)

7. Click **View Object Details**.  Copy the URL Path by pressing `<CTRL-C>`.  Copy the url to your notepad.
![](img/adw-view-object-details.png)
![](img/adw-view-object-details-customers.png)


8.  Repeat steps 6-8 for the 2nd table and return to your SQL Developer Workbench screen.  

9.  Copy the dbms_cloud.copy_data code twice in your workbench window. Replace the table_name with each of your tables (CUSTOMERS and SALE) and the file_uri_list with the string you saved in notepad.  *Be sure to coy the correct file_uri_list to the correct table or you will receive an error*

    ````SQL
    begin
        dbms_cloud.copy_data(
            table_name =>'<ENTER_TABLE_NAME>',
            credential_name =>'OBJ_STORE_CRED',
            file_uri_list =>'https://swiftobjectstorage.<region name>.oraclecloud.com/v1/<tenant name>/tutorial_load_adwc/chan_v3.dat',
            format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true')
        );
    end;
    /
    ````

10. Select both commands and press the green play button.


11. In the Script Output, once you see the message `PL/SQL procedure successfully completed.`, Query the tables to see the rows that were inserted.  Success! Notice that the data has been copied from the object store to the tables in your ADW instance.

    ![](img/adw-sql-dev-copy-data.png)
  

This can be done for multiple tables providing an easy migration path from your existing databaset to Autonomous Database.

## Want to Learn More? ##
* [Autonomous Cloud Platform Courses](https://learn.oracle.com/pls/web_prod-plq-dad/dl4_pages.getpage?page=dl4homepage&get_params=offering:35573#filtersGroup1=&filtersGroup2=.f667&filtersGroup3=&filtersGroup4=&filtersGroup5=&filtersSearch=) from Oracle University 
* [Autonomous Data Warehouse Cloud Certification](https://education.oracle.com/en/data-management/autonomous-database/product_817?certPage=true) from Oracle University
* [ADW Test Drive Workshop](https://oracle.github.io/learning-library/workshops/journey4-adwc/?page=README.md)


