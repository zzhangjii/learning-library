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

	- Click the **Menu icon** in the upper left corner to open the navigation menu. Under the **Core Infrastructure** section, select **Object Storage** and select **Compartments**.

		![](images/100/image5.png)

	- Select the **Compartment** `monoTOmicro` and click **Create Bucket**

		![](images/100/media/image6.png)

	- In the **Bucket Name** field, enter `atpData` and click **Create Bucket**

		![](images/100/image7.png)
