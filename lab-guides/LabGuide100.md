# Monolithic to Microservice Experience -- Autonomous Microservice Data Structure Configuration

# Object Storage Setup, OCI User Creation and Auth Token Generation

### **STEP 1**: Log in to your OCI dashboard

  - From any browser go to

    [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in)

  - Enter your **Cloud Account Name** in the input field and click the **Next** button.

	![](images/100/image1.png)

  - Enter your **Username** and **Password** in the input fields and click **Sign In**.

	![](images/100/image2.png)

  - In the top left corner of the dashboard, click the **Guided Navigation Drawer**

	![](images/100/image3.png)

  - Click to expand the **Services** submenu, then click **Compute**

	![](images/100/image4.png)

### **STEP 2**: Create Object Storage Bucket

  - Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Core Infrastructure** section, select **Object Storage** then **Object Storage** .

	![](images/100/image5.png)

  - Select the **Compartment** `monoTOmicro` and click **Create Bucket**

	![](images/100/image6.png)

  - In the **Bucket Name** field, enter `atpData` and click **Create Bucket**

	![](images/100/image7.png)
	
  - In a moment, your new Object Storage Bucket will show up in the list

	![](images/100/image8.png)

### **STEP 3**: Upload Data Pump File into Object Storage Bucket

  - Click on the `atpData` Bucket and click **Upload Object**

	![](images/100/image9.png)

  - **Browse** or **Drag/Drop** the Data Pump DMP `.../monolithic-to-microservice/lab-resources/database/expdp_alpha121.dmp` included in the GIT repository you cloned earlier. Click **Upload Object**

	![](images/100/image10.png)

  - In a moment, the file will be uploaded to Object Storage

	![](images/100/image11.png)

### **STEP 4**: Create OCI User 

  - Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Governance and Administration** section, select **Identity** and select **Users**.

	![](images/100/image12.png)

  - Click **Create User**

	![](images/100/image13.png)

  - Enter the **Name** `impdp-ATP` and desired **Description** and click **Create**

	![](images/100/image14.png)

  - In a moment, your new user will show up in the list

	![](images/100/image15.png)

  - Click on the new user `impdp-ATP`, select the **Resource** `Groups` and click **Add User to Group**

	![](images/100/image16.png)

  - Select the `Administrators` group and click **Add**

	![](images/100/image17.png)

**STEP 5**: Generate Auth Token for OCI User

  - For the new user `impdp-ATP`, select the **Resource** `Auth Tokens` and click **Generate Token**

	![](images/100/image18.png)

  - Enter a **Description** and click **Generate Token**

	![](images/100/image19.png)

  - Click **Copy** and save the value of the **Generated Token** in a text document. You will need it later when executing the **DBMS_CLOUD.create_credential** Package.

	![](images/100/image20.png)

# Setup SQL Developer Connection to ATP, Create Database User and DBMS_CLOUD Credential in ATP

### **STEP 6**: Download ATP Wallet Zip File

  - Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Database** section, select **Autonomous Transaction Processing**.

	![](images/100/image21.png)

  - Select the **AlphaOffice** ATP Database

	![](images/100/image22.png)

  - Click **DB Connection**

	![](images/100/image23.png)

  - Click **Download**

	![](images/100/image24.png)

  - Enter the **Password** `a1phaOffice1_` and click **Download**

	![](images/100/image25.png)

  - The ATP Wallet file **Wallet_orcl.zip** contains the following files

	![](images/100/image26.png)

### **STEP 7**: Create SQL Developer Connection to ATP Database

  - Open **SQL Developer** available on the client image

  - In the **Connections** Pane, Click ![](images/100/image27.png)

	![](images/100/image28.png)

  - Enter/Select the following values, click **Test**. After a `Successful` **Status**, click **Save**, then **Connect**

	```
	Connection Name:	atp-AlphaOffice-Admin
	Username:		admin
	Password: 		a1phaOffice1_
	Select 			Save Password
	Connection Type:	Cloud Wallet
	Configuration File:	The Wallet_orcl.zip you downloaded in the previous step
	```
	
	![](images/100/image29.png)

### **STEP 8**: Create Database User in ATP Database

  - In the **SQL Developer Worksheet**, execute the following SQL Statements to create the `alpha` database user.
	
	```
	create user alpha identified by "a1phaOffice1_";
	grant dwrole to alpha;
	```

	![](images/100/image30.png)

### **STEP 9**: Create DBMS_CLOUD Credential 

  - In the same **SQL Developer Worksheet**, execute the following SQL Statements to create the **DBMS_CLOUD Credential** `impdp_OBJ_STORE`.

	```
	begin
	  DBMS_CLOUD.create_credential(
		credential_name => 'impdp_OBJ_STORE',
		username => 'impdp-ATP',
		password => 'Auth Token Generated in STEP 5'
	  );
	end;
	/
	```
	
	![](images/100/image31.png)

# Import Data Pump Export file into ATP Databse and Download/Inspect Data Pump Log File 

### **STEP 10**: Add DBA View and ATP SQL Developer Connection 

### **STEP 11**: Import Data into ATP Instance using Data Pump Import Wizard

### **STEP 12**: Review Data Pump Import Log