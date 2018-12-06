# Monolithic to Microservice Experience -- Setup
  ![](images/050/Title.png)
	
# Log into your Trial Account and Create Infrastructure

You will create all required infrastructure components within your Trial account.

## Your Trial Account

### **STEP 1**: Your Oracle Cloud Trial Account

  - You have already applied for and received your Oracle Cloud Trial Account.

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

### **STEP 4**: Create an Autonomous Transaction Processing (ATP) Instance

ATP Verbage.......

  - Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Database** section of the menu, click **Autonomous Transaction Processing** .

    ![](images/050/image11.png)

  - Select the **Compartment** `monoTOmicro` and click **Create Autonomous Transaction Processing Database**.

    ![](images/050/image12.png)

  - Select the **Compartment** `monoTOmicro` if it is not already selected. Enter the **Display Name** `AlphaOffice`, **Database Name** `orcl`, enter the **Administrator Password** of `a1phaOffice1_` and Click **Create Autonomous Transaction Processing Database**

    ![](images/050/image13.png)

    ![](images/050/image14.png)

  - After approximately 5 minutes, the ATP instance is now **Available**

    ![](images/050/image15.png)