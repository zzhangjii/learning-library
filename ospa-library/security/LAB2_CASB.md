![](./media/securitytitle.png)
# Lab 2:  Oracle CASB Cloud Service

## Table of Contents

- [Module 1: Logging to CASB Community Tenant](#module-1--logging-to-casb-community-tenant)
- [Module 2: Create and monitor a sanctioned application](#module-2--create-and-monitor-a-sanctioned-application)
- [Module 3: Create a Policy Alert and Display Threats](#module-3--create-a-policy-alert-and-display-threats)
- [Module 4: Oracle CASB Monitoring Oracle Cloud Infrastructure](#module-4--oracle-casb-monitoring-oracle-cloud-infrastructure)
- [Module 5: Create a Policy for OCI](#module-5--create-a-policy-for-oci)
- [Module 6: Run a Report in CASB](#module-6--run-a-report-in-casb)
- [Module 7: Demo Data Loss Protection](#module-7--demo-data-loss-protection)



***** 

**Disclaimer:  This lab is designed ONLY for large learning groups and assumes the groups are sharing the Oracle Cloud environment to execute this lab.**


## Mama Maggy's security monitoring business needs for SaaS and OCI

Shannon Kim, Director/Manager of IT is seeking to improve the security monitoring capabilities across On-Premise and Cloud services.
Security Operation Center is overwhelmed because of the number of alerts receive daily. They are barely able to respond on time and proactively identify a threat.
Security might sound as a stopper for the users, but she needs to introduce a solution that helps both, Line-of-Business and IT to keep the environment safe, available and without introducing radical changes to the user experience.
The organization needs to shift from a reactive to a proactive approach. That's why Mamma Maggy as opts for Oracle CASB Cloud Service. CASB Keeps enterprises secure by automating responses to threats with forensics, incident management, orchestration and remediation through native capabilities as well as integration with existing technologies.
Security evolves to become a business enabler and she knows that the best fit to meet this requirement is Oracle CASB Cloud Service.
Her team is on its way of implementing CASB to monitor SaaS applications and OCI. You as the SOC Manager have to integrate these services with the solution and put them ready to reduce no only the amount of alerts received, but human intervention.



## Module 1:  Logging to CASB Community Tenant

**Who Should Complete This Lab:  All Participants**


*	We are purposefully using our “Community” tenant instead of the tenant associated with the Cloud Account. 
*	The “Community” tenant is a persistent sandbox environment where Oracle employees can try out CASB features.
* Let’s register ourselves and become a member of the “Community”. Open your browser to the CASB “trial” pod: https://trial.palerra.net.
* Login to CASB using the Tenant admin account

**NOTE: Tenant User id and Password will be delivered by the instructor**

![CASB Console](./media/casb_login1.png)
<p align="center"> Figure 1-1 </p>  

* Click the following in sequence as shown in the image to navigate to the administration dashboard

![CASB Console](./media/casb_login2.png)
<p align="center"> Figure 1-2 </p>

*	Add your First, Last and email address (highlighted in yellow). Leave Role as “Tenant Admin” and click “Save”. 

![CASB Console](./media/casb_login3.png)
<p align="center"> Figure 1-3 </p>


* You should receive an email within a few minutes.

![CASB Console](./media/casb_login3.png)
<p align="center"> Figure 1-4 </p>

* Now you are CASB Tenant administrator. Use your recently created account to login to Oracle CASB Cloud Service


## Module 2:  Create and monitor a sanctioned application

The following hands-on labs assume that you are familiar with Oracle Cloud Platform console navigation, as well as access to Oracle CASB Cloud Service console.
In order to ease the process, we recommend using two separate browsers or windows.
We will enroll third-party services as part of the exercises and it's requires to navigate back and forth between CASB and the vendors' dashboards to complete the lab.

For the purpose of this workshop, you will be using Oracle CASB community tenant which you may use indefinitely for whatever CASB features you’d like to try for yourself.

**NOTE: CASB is a dynamic service that is, by design, constantly in flux. As a result, what you see in the console may not match exactly with the lab screenshots. Screenshots are provided solely for illustrative purposes to help guide you directionally through the CASB console.**

For consistency and for the ease of use-cases implementation, you will use a personal **email account (e.g. Gmail, Yahoo, Outlook) to sign-up for your Salesforce and Box developer instances**, and for CASB application registration you will use the following naming convention:

`COSE_location+room_appName_GroupNumber` *(e.g. **COSE_AU1_Salesforce_G1**, **COSE_AU1_Salesforce_G2**)*


Following this name convention will help us to clean up the environment once the lab is completed.

****
## Monitoring SaaS applications
Oracle CASB monitors your sanctioned applications after a simple registration process. This enables you to manage risk events from a centralized platform instead of having to monitor the individual application to remediate security threats. Oracle CASB monitors risk events such as blacklisted IP addresses, anomalous user behavior and unwanted security configurations in the application.
As part of this first part of the module, we will enroll two applications used broadly by our customers base. The main goal of this section of the lab is to guide you through the process of configuring the applications to later integrate them with CASB.

### Add Box as a Sanctioned Application - Who Should Complete This Lab:  All Participants

* Navigate to [Developer Box](https://developer.box.com/)
  *  Click the Console button in the top right corner

![Box Console](./media/box_console.png)
<p align="center"> Figure 2-1 </p>  

  * Click **Sign up**

![Box Sign Up](./media/box_signup.png)
<p align="center"> Figure 2-2 </p>  

  * Select the section Individual Plans and click to Sign Up in the Individual account

![Box Select Plan](./media/box_selectplan.png)
<p align="center"> Figure 2-3 </p>  

  * Enter required information and click **Submit**, you will receive a verification email
  **Note: You must sign-up with your personal account (e.g. Gmail, Yahoo, Outlook)**

![Box Verify Account](./media/box_verifyaccount.png)
<p align="center"> Figure 2-4 </p>  


  * Once you have the account for Box, you have to configure it for monitoring.

* Now that you have create your developer account on Box, let's configure the service account for Monitoring

    * Log in to developer.box.com
    * Go to My Apps and create an application

![Box Create Application](./media/box_createapp_1.png)
<p align="center"> Figure 2-5 </p>  


  * Select **Custom App** and click **Next**

![Box Create Application](./media/box_createapp_2.png)
<p align="center"> Figure 2-6 </p>  

  * Select the recommended authentication method OAuth 2.0 with JWT (Server Authentication) and click **Next**

![Box Create Application](./media/box_authentication.png)
<p align="center"> Figure 2-7 </p>  


  * Give an unique name to your app and click **Create App**

![Box Create Application](./media/box_uniquename.png)
<p align="center"> Figure 2-8 </p>  


  * Click on your new application, and in the section Configuration, select the following:

  1. Authentication Method: OAuth 2.0 with JWT (Server Authentication)
  ![Box Config app](./media/box_appconfig_1.png)
<p align="center"> Figure 2-9 </p>  

  2. Application access: **Enterprise**
  ![Box Config app](./media/box_appconfig_2.png)
<p align="center"> Figure 2-10 </p>  

  3. Save your changes. An Admin Console tab is now added to your main Box.com account.

* Create the Dedicated Oracle CASB Cloud Service User
    * Create a dedicated user for Oracle CASB Cloud Service in the Box account that you want to monitor. This user is dedicated for use by Oracle CASB Cloud Service and shouldn’t be used for any other purpose.
    * Log in to the Box developer account.
    * Select the Admin Console tab.
    * Click the Users & Groups section.
    * Click the + Users button.


 ![Box Config app](./media/box_usercreation.png)
<p align="center"> Figure 2-11 </p>  


* In the Name field, give the service account an identifier (example: occs.trialservice).
* If you are going to be the tenant master administrator for Oracle CASB Cloud Service, then provide your email address in the Email field and click **Add User**

 ![Box Config app](./media/box_usercreation_2.png)
<p align="center"> Figure 2-12 </p> 

* Open the recently created user and grant this user the Co-Admin role. This account must have either the Admin or Co-Admin role.

 ![Box Config app](./media/box_useredit.png)
<p align="center"> Figure 2-13 </p>  

* Assign additional privileges to this user.
At a minimum, the user should be able to run new reports and access existing reports. If you want to be able to push security controls from Oracle CASB Cloud Service to this Box instance, then this user must also have these privileges:

`Users and Groups: Manage users`

`Users and Groups: Manage groups`

`Reports and Settings: View settings and apps for your company`

`Reports and Settings: Edit settings and apps for your company`

`Reports and Settings: Run new reports and access existing reports`

![Box Config user](./media/box_priv.png)
<p align="center"> Figure 2-14 </p>  


* Click **Save**


* In the users list you should be able now to see the Oracle CASB Cloud Service user that you just created.

![Box New Account](./media/box_newaccount.png)
<p align="center"> Figure 2-15 </p>  


* Check the email account that you provided for that user.
You should have a message from Box telling you to set a password for this user.

![Box Verification](./media/box_password_verification.png)
<p align="center"> Figure 2-16 </p>  

* Create a complex password for this account.
For example, at least 12 characters in length, with a combination of uppercase and lowercase letters, numbers, and special characters.

![Box New Password](./media/box_newpassword.png)
<p align="center"> Figure 2-17 </p>  


* You will use this email addrress and password to register your Box instance in Oracle CASB Cloud Service. Have a recovery procedure in case there are issues with the account.


### Registering a Box instance (Push Security Controls Mode) - Who Should Complete This Lab:  1 Participant for group

**NOTE: Due to capacity constraints, We will group individuals on teams of three to register the application in CASB. Instructor will provide group numbers. During the registration process learners must use the following name convention COSE_First-Two-letters-of-the location_APP_Group] (e.g. COSE_AU1_BOX_G1, COSE_AU2_BOX_G2)**

* You will add or register your Box instance to Oracle CASB Cloud Service to be monitored, and with the capability to push security configuration settings.
To register a Box instance with the Oracle CASB Cloud Service, you need the user ID (email address) and password that belongs to a Box administrator with the appropriate privileges in the account that you want to monitor. This user must be dedicated to the Oracle CASB Cloud Service. We will use the co-admin user that we created in the previous steps.

* In push security controls mode, Oracle CASB Cloud Service checks various security control values in the Box instance, and sets them to the values that you set at registration time. Later, you receive notifications when these security configuration settings change.

* Oracle CASB Cloud Service monitors these settings in Box:

  * Password policies, authentication policies, and session settings: These are in the Box business settings page, Security tab.
  * Settings: These additional security settings are in the Box business settings page, Content & Sharing tab.


* Login to your Cloud dashboard and open Oracle CASB Cloud Service console
* Select Applications from the Navigation menu.
* Click **Add/Modify App**
* In the Select an app type page, click the icon for box and click **Next**.


![CASB add box](./media/casb_addbox.png)
<p align="center"> Figure 2-18 </p>  

* In the Select an instance page, enter a unique name for your application instance.

![CASB box name](./media/casb_boxname.png)
<p align="center"> Figure 2-19 </p>  

* Click **Next**.
* In the Select monitoring type page, select Push controls and monitor to have Oracle
CASB Cloud Service set your preferred values in the application and subsequently monitor for deviations from these values.

![CASB box push config](./media/casb_boxpush.png)
<p align="center"> Figure 2-20 </p>  

* Oracle CASB Cloud Service generates a security control alert in Risk Events whenever it detects a mismatch between the selections that you make on this page and the settings in the Box instance.

* Click **Next**.

* In the Select security controls page, select the Standard security controls. In this mode, you will ensure that these values are set to the application's own defaults.
* Select the checkbox.

![CASB box security controls](./media/casb_box_securitycontrols.png)
<p align="center"> Figure 2-21 </p>  

* Click **Next**.
* In the Enter credentials page, select Sign in with Box username and password.
* Enter the credentials for the dedicated co-admin user that you set up to communicate with Oracle CASB Cloud Service.
  * User name. The username of the Oracle CASB Cloud Service user.
  * Password. The password of the Oracle CASB Cloud Service user.

![CASB box testing credentials](./media/casb_box_credentials.png)
<p align="center"> Figure 2-22 </p>  

* When you are done entering your credentials, click **Test Credentials**. A new window pops up to ask you if you set the right permissions for that user in your Box account. Click **Ok**.

![CASB box accept credentials](./media/casb_box_credentials_2.png)
<p align="center"> Figure 2-23 </p>  

* It can take a minute or two for the application to receive and accept your credentials.
* When testing is done, you see a success message.
* Click **Submit**
* Click **Done**
* When the registration process is complete, your application instance appears on the Applications page. You start to see data for this instance after 30 minutes or so; although a complete synchronization will take longer.

****

### Add SalesForce as a Sanctioned Application - Who Should Complete This Lab:  1 Participant for group

**Note: The learner signing up for Salesforce must differ from the participant that have requested the SSO access via IDCS on LAB 1**

You’ll now add SalesForce as a sanctioned application for monitoring in Oracle CASB, so this business critical application remains compliant with security standards.

**NOTE: If you have a Salesforce developer account you can move to *Create Salesforce CASB Profile* section.**

* Navigate to [Developer SalesForce](https://developer.salesforce.com/)
    * Click the **Sign-up** button in the top right corner
    * Enter the required information
    * Click **Sign me up**

**Note: You must sign-up with your personal account (e.g. Gmail, Yahoo, Outlook)**

![SF registration](./media/sf_registration.png)
<p align="center"> Figure 2-24 </p>  


* You will get an email to confirm your account. Click **Verify Account**


![SF verification](./media/sf_verification.png)
<p align="center"> Figure 2-25 </p>  


* Create a password for your account

![SF Create Password](./media/sf_password.png)
<p align="center"> Figure 2-26 </p>  


### Create Salesforce CASB Profile

* Login to your Salesforce account.
* On the left Panel navigate to Users =  Profiles
    * Click **New Profile**

![SF Create profile](./media/sf_profile.png)
<p align="center"> Figure 2-27 </p>  

* Existing Profile needs to be set to System Administrator and Profile Name can be named whatever you like, for example, CASBUSER.

![SF Set profile](./media/sf_setprofile.png)
<p align="center"> Figure 2-28 </p>  

* Press save

* Navigate to Users =  Users 
    * Click **New User**

![SF create user](./media/sf_createuser.png)
<p align="center"> Figure 2-29 </p>  

* The following Screen will appear. Fill in the required fields. User License must be set to Salesforce.

*Note: You must use another email address for this new account. (e.g. oracle.com)*
    
  * Profile name will be the name of the profile we previously created (e.g. CASBUSER)
  * Save

![SF modify user](./media/sf_user_profile.png)
<p align="center"> Figure 2-30 </p>  


* An email will be triggered allowing for verification

![SF verification](./media/sf_verification_newuser.png)
<p align="center"> Figure 2-31 </p>  

* Click to Verify account in the link attached in the email and fill password details for the new user. Now you will see the following:

![SF Dahsboard](./media/sf_dashboard.png)
<p align="center"> Figure 2-32 </p>  

This is the last step we need to complete in SalesForce.

### Registering a Salesforce instance (Push Security Controls Mode) - Who Should Complete This Lab:  1 Participant for group

**NOTE: Due to capacity constraints, We will group individuals on teams of three to register the application in CASB. Instructor will provide group numbers. During the registration process learners must use the following name convention COSE_First-Two-letters-of-the location_APP_Group] (e.g. COSE_AU1_SALESFORCE_G1, COSE_AU2_SALESFORCE_G2)**

* Open CASB Console and select the SalesForce application to add the instance in Oracle CASB.

![CASB SF enrolment](./media/casb_sf_enroll.png)
<p align="center"> Figure 2-33 </p>  

* Enter a unique name for you instance. Click the checkboxes from the picture below. Click **Next**.

![CASB SF Unique name](./media/casb_sf_uniquename.png)
<p align="center"> Figure 2-34 </p>  

* Select Push controls and monitor

![CASB SF Push](./media/casb_sf_push.png)
<p align="center"> Figure 2-35 </p>  

* Select Standard Security Controls. Check Approval box and Press Next

![CASB SF security controls](./media/casb_sf_securitycontrols.png)
<p align="center"> Figure 2-36 </p>  

* You will redirected to the below page. Login with the user information created with the CASB profile (e.g. casbuser). Do not use your Salesforce developer administrator credentials.

![CASB SF credentials](./media/casb_sf_allowcredentials.png)
<p align="center"> Figure 2-37 </p>  

* Allow Access

![CASB SF Allow Access](./media/casb_sf_allowaccess.png)
<p align="center"> Figure 2-38 </p>  


* Success! You will now be able to monitor SalesForce! Click **Done** to finish

![CASB SF completion](./media/casb_sf_complete.png)
<p align="center"> Figure 2-39 </p>  

[Back to Top](#table-of-contents)
****

## Module 3:  Create a policy alert and display threats

**Who Should Complete This Lab:  All Participants**

In Oracle CASB you can create application specific to specify the monitoring you want for your sanctioned applications. This adds another layer of customizable security for you. Oracle CASB also has pre-made Managed Policies for the applications to make sure application specific security can be enabled from the beginning.
You will now create a policy in CASB that will trigger an alert every time a user is logged in to SalesForce.

### Create a policy

* Login to your cloud platform account and select Oracle CASB Cloud Service.
* Select Configuration in the Navigation menu to the left 
* Select Policy Management
* Click **New Policy**
    * Fill out the fields as shown below
    * Click **Next**

![CASB Create new policy](./media/casb_sf_newpolicy.png)
<p align="center"> Figure 3-1 </p>  


* Fill out the fields as shown below. For the purpose of this lab we recommend you to use the following name convention for policies: COSE_FIRST-LETTER-OF-YOUR-NAME_LASTNAME_APPLICATION *(e.g. COSE_a_casas_salesforce)*
* Click **Next**

![CASB Create new policy_2](./media/casb_sf_newpolicy_2.png)
<p align="center"> Figure 3-2 </p>  

* Select the application type as Salesforce, and add the application instance created in the previous steps *(e.g. COSE_AU1_SALESFORCE_G1)*
* Change Resource to **Login History** 
* Check the **Regular Expresion** option  
* On the regular expresion field enter .*
* Click **Next**

![CASB Create new policy_3](./media/casb_sf_newpolicy_3.png)
<p align="center"> Figure 3-3 </p>  

* Click **Next**

![CASB Create new policy_4](./media/casb_sf_newpolicy_4.png)
<p align="center"> Figure 3-4 </p>  

* Populate fields as shown below. You can fill the message box with anything you consider such as "Verify SalesForce login activities". click **Next**

![CASB Create new policy_5](./media/casb_sf_newpolicy_5.png)
<p align="center"> Figure 3-5 </p>  

* Review details previously entered and click **Submit**

![CASB Create new policy_6](./media/casb_sf_newpolicy_review.png)
<p align="center"> Figure 3-6 </p>  

We must now trigger the policy that we created

* Log in to the [Salesforce console](https://developer.salesforce.com) as the **user we created to be monitored by Oracle CASB**

* Once logged in to Salesforce, you should be able to see the dashboard

![Login SF](./media/sf_login.png)
<p align="center"> Figure 3-7 </p>  


* This triggered the policy and an alert for Salesforce was generated. Every time a user logs in to Salesforce, you will be able to check it in your Salesforce instance. Navigate back to Oracle CASB Cloud Service console and click on **Policy alerts** and you will see all the alerts received for Salesforce.

![CASB SF alert](./media/casb_sf_policyalerts.png)
<p align="center"> Figure 3-8 </p>  

* Click on a single policy alert generated by an authentication action to see the details

![CASB SF alert_2](./media/casb_sf_polictyalerts_2.png)
<p align="center"> Figure 3-9 </p>  

### Trigger action in Box account that will be detected as a threat in Oracle CASB - Who Should Complete This Lab:  All Participants


* Check your IP. You can use any service or go to google and type `my ip`

![Check IP](./media/checkip.png)
<p align="center"> Figure 3-10 </p>  


* Go to the Oracle CASB dashboard, section Configuration, **Manage IP Addresses**

![Check IP](./media/casb_manageip.png)
<p align="center"> Figure 3-11 </p>  
 

*  Click Add IP Address in the Blacklist section

![](./media/image69.jpeg)
<p align="center"> Figure 3-12 </p>  

*  Enter your IP address and select your recently added Box application instance

![](./media/image70.jpeg)
<p align="center"> Figure 3-13 </p>  

*  Click Save. Your IP address should appear now in the black list


To make Oracle CASB detect a threat, log in to your Box account and do any activity. For example, you can upload a file with the word **Top Secret** as content (required for the last lab). Oracle CASB detects that you’ve logged in Box through the blacklisted IP address and generates an alert

![](./media/image71.png)
<p align="center"> Figure 3-14 </p>  

*  Log in to your Box account as the user that we created to be
    monitored by CASB

![](./media/image72.jpeg)
<p align="center"> Figure 3-15 </p>  

*  Once you can see the dashboard, go to My Files

![](./media/image73.jpeg)
<p align="center"> Figure 3-16 </p>  

*  Create a folder as shown below

![](./media/image74.jpeg)
<p align="center"> Figure 3-17 </p>  

* Upload the file inside the folder

![](./media/image75.jpeg)
<p align="center"> Figure 3-18 </p>  

* These actions should have generated a threat in Oracle CASB for your Box account. It should also be displayed in the access map as red pins referencing suspicious events.

![](./media/image76.jpeg)
<p align="center"> Figure 3-19 </p>  

* You can click on the red pin to check the detected suspicious events

![](./media/image77.jpeg)
<p align="center"> Figure 3-20 </p>   

* Click on the suspicious events to have a better view of this

![](./media/image78.jpeg)
<p align="center"> Figure 3-21 </p>   

* Check your Box instance to see the generated threats for it

![](./media/image79.jpeg)
<p align="center"> Figure 3-22 </p> 

* Click on the threats to check their details

![](./media/image80.jpeg)
<p align="center"> Figure 3-23 </p> 

[Back to Top](#table-of-contents)

****

## Module 4:  Oracle CASB Monitoring Oracle Cloud Infrastructure


Oracle CASB has the broadest support of infrastructure as cloud services (IaaS). It enables you to monitor infrastructure provided by Amazon Web Services, Microsoft Azure, and Oracle Infrastructure Cloud (OCI). With Oracle CASB you can monitor all layers of your IT.
 
To monitor OCI, CASB requires credentials with the appropriate OCI access. This section explains how to complete these steps. To accomplish this you’ll first need to create an account, group and policy within OCI. As a part of those steps you will require a signed RSA key.
 
Once you have the OCI credentials, then you’ll register the OCI tenant within Oracle CASB for monitoring. Please follow the steps below to complete the registration process.

### **DEMO** - Register OCI tenant

**NOTE: due to capacity constraints, Instructor will guide you through the process of registering OCI tenants in CASB. Learners will use this App for the incoming labs**

* First, sign into your cloud account

![](./media/image81.jpeg)
<p align="center"> Figure 4-1 </p> 

* Go to the dashboard
    
    *  Click on the menu in the bottom left corner of the cloud service ![](./media/image82.png)
    *  Click Open Service console

![](./media/image83.jpeg)
<p align="center"> Figure 4-2 </p> 
 
Note: if you do not see any Compute instance in the dashboard, click to Customize Dashboard and select Show for Compute.

* Click on the Navigation ![](./media/image2.png) menu at the top left to add users


* Scroll down, click on Identity Users

  ![](./media/image84.jpeg)
  <p align="center"> Figure 4-3 </p> 

*  Click create user

![](./media/image85.jpeg)
<p align="center"> Figure 4-4 </p> 

*  Populate fields as shown below.

*  Click Create

  ![](./media/image86.jpeg)
  <p align="center"> Figure 4-5 </p> 

*  Click Groups in the left hand menu
    
    *  Click Create Group button
    
    *  Populate name and description fields as shown below
    
    *  Click Submit

  ![](./media/image87.jpeg)
  <p align="center"> Figure 4-6 </p> 

*  Click Policies in the left hand menu
    
    * Select Compartment from the dropdown menu
    
    * Click on the root compartment. In order to create the policy, it must be on the root compartment.

  ![](./media/image88.jpeg)
  <p align="center"> Figure 4-7 </p> 

*  Create the policy
    
  * Click create policy
    
  * Populate fields as shown below
  
  * On the policy statement field, add the following line "Allow group 
  *name_of_the_group_you_created* to read all-resources IN TENANCY" 
    
  * Click Create
    ![](./media/image89.jpeg)
    <p align="center"> Figure 4-8 </p> 

*  Click on **Groups**
    
  * Click on the group we just created
    
  * Click Add user to Group (to the previously created CASB group)
    
  * Select user created previously(**MY_CASB_ACCOUNT**) and click add

 ![](./media/image90.jpeg)
<p align="center"> Figure 4-9 </p> 

* Now you have to create a new key pair. Ensure that you have a public/private key pair available for use by Oracle Cloud Infrastructure (OCI) before you prepare and register an OCI instance to be monitored by Oracle CASB Cloud Service.
    
    * In Oracle CASB, select Configuration from the Navigation menu. If the Navigation Menu is not displayed,click the Navigation Menu icon in the upper left corner ![](./media/image2.png)
    
    
    * From the Configuration submenu, select **CASB Key-Pair Management**.
    
    * If the Key generation date is not new enough, according to your organization's security policies, click Create new keys.
    
    * Click Generate new keys.

    * The User public key field is updated with a new key value. ![](./media/image91.png)
  

* Click Copy to Clipboard icon to copy the User public key value to the clipboard. ![](./media/image92.png)


* You can also use the Download icon to download the public key to a file.
![](./media/image93.jpeg)
<p align="center"> Figure 4-10 </p> 

*  Go to OCI, Click Identity and then Users
    
  * Click on the user we previously created.
    
  * Add a public key we generated to the user
    
  * Click on API Keys
    
  * Click on Add Public Key
  ![](./media/image94.jpeg)
  <p align="center"> Figure 4-11 </p> 

* Copy/Paste the public key from CASB into OCI.
    
    * Include the lines “Begin Public Key” and “End Public Key”
    
    * Click Add

![](./media/image95.jpeg)
<p align="center"> Figure 4-12 </p> 

###  **DEMO** - Register OCI in CASB to monitor activity

* Open a new tab on your browser and go to the Oracle CASB dashboard

* Select Applications from the Navigation menu in the upper left corner ![](./media/image2.png)

* Click Add/Modify App

* Select OCI and Click Next (bottom right corner of the screen)

  ![](./media/image96.jpeg)
  <p align="center"> Figure 4-13 </p> 

* Enter unique name into the field for your OCI instance. Then click Next

![](./media/image97.jpeg)
<p align="center"> Figure 4-14 </p> 

* As you can see, you can add three types of OCI instances in Oracle CASB Cloud Service, based on the type of OCI compartment that is monitored:

![](./media/image98.jpeg)
<p align="center"> Figure 4-15 </p> 

  - **OCI Tenancy** - the root compartment that contains all of your
    organization's compartments and other Oracle Cloud Infrastructure
    cloud resources. Everything in all compartments and sub-compartments
    is monitored.

  - **Compartment under a registered Tenancy** - a specified compartment
    under a registered OCI tenancy. Only the collection of related
    resources within the specified compartment, which are accessible
    only by certain groups that have been given permission by an
    administrator in your organization, are monitored.

  When you register a compartment inside a tenancy that is already
  registered in Oracle CASB Cloud Service, the compartment inherits
  access credentials from the parent tenancy, so you only have to
  specify the compartment name.

  - **A Standalone Compartment** – an OCI compartment that is accessed
    directly, without first registering the OCI tenancy in Oracle CASB
    Cloud Service. As with a compartment under a registered tenancy,
    only the collection of related resources within the specified
    compartment, which are accessible only by certain groups that have
    been given permission by an administrator in your organization, are
    monitored.

  In our case, we will select the first option.

* Go to OCI

* Copy Tenancy OCID and paste into Tenancy OCID field.

* To get the tenancy OCID from the Oracle Cloud Infrastructure Console, go to the Tenancy Details page:

  Open the navigation menu, under Governance and Administration, go to **Administration** and click **Tenancy Details.**
  
  ![](./media/image99.jpeg)
  <p align="center"> Figure 4-16 </p> 
  
  The tenancy OCID is shown under **Tenancy Information**. Click **Copy** to copy it to your clipboard.
  
  ![](./media/image100.jpeg)
  <p align="center"> Figure 4-17 </p> 

* Get the user's OCID in the Console on the page showing the user's details. To get to that page:
    
    * If you're signed in as the user: Open the **User** menu ) in the upper right corner and click **User Settings**. ![](./media/image101.png)
    * If you're an administrator doing this for another user: Open the navigation menu. Under **Governance and Administration**, go to **Identity** and click **Users**. Select the user created from the list (MY_CASB_ACCOUNT).

![](./media/image102.jpeg)
<p align="center"> Figure 4-18 </p> 

* Now back to the OCI app in Oracle CASB. Ensure all of the fields are populated with the Tenancy OCID and User OCID credentials as shown below:
    
    * Click test credentials. You have to receive the green notification that the direct connection was initiated successfully before the submit button will appear.
    
    * Click **Submit**

![](./media/image103.jpeg)
<p align="center"> Figure 4-19 </p> 

* You should see the screen above.

    * Click **Done**
  
  ![](./media/image104.jpeg)
  <p align="center"> Figure 4-20 </p> 

[Back to Top](#table-of-contents)

****

## Module 5:  Create a Policy for OCI 

**Who Should Complete This Lab:  All Participants**
 
You’ll now create a policy in Oracle CASB that triggers a policy alert every time a user is created in OCI.

### Create a policy

*  Click on Configuration (Left-hand menu)
    
    * Select Policy Management

![](./media/image55.jpeg)
<p align="center"> Figure 5-1 </p> 

*  Click New Policy
    
    * Fill out the fields as shown below. For the purpose of this lab we recommend you to use the following name convention for policies: COSE_FIRST-LETTER-OF-YOUR-NAME_LASTNAME_APPLICATION *(e.g. COSE_a_casas_oci)*
  
    * Click Next

![](./media/image105.jpeg)
<p align="center"> Figure 5-2 </p> 

*  Fill out the fields as shown below. Click Next.

![](./media/image106.jpeg)
<p align="center"> Figure 5-3 </p> 

*  Click Next

![](./media/image107.jpeg)
<p align="center"> Figure 5-4 </p> 

*  Click Next

![](./media/image108.jpeg)
<p align="center"> Figure 5-5 </p> 

*  Populate fields as shown below. Click Next.

 ![](./media/image109.jpeg)
 <p align="center"> Figure 5-6 </p> 

*  Review details previously entered. Click Submit.
![](./media/image110.jpeg)
<p align="center"> Figure 5-7 </p> 

*  Your screen should show the green notification that a new policy has been added.

![](./media/image111.jpeg)
<p align="center"> Figure 5-8 </p> 

### Trigger the policy that we created - Who Should Complete This Lab:  1 Participant for group

*  In the OCI Console under the compute tile press the menu for Compute ![](./media/image82.png)

    
* Click Open Service Console
    
![](./media/image112.jpeg)
<p align="center"> Figure 4-9 </p> 

* Open the Navigation menu in the top left corner
    
    *  Navigate to Identity ![](./media/image2.png)    
    *  Click Users
    
    ![](./media/image113.jpeg)
    <p align="center"> Figure 5-10 </p> 

* This will take you to the create user screen. Click Create User

![](./media/image114.jpeg)
<p align="center"> Figure 5-11 </p>


* Name your user and fill out the description. The rest can remain blank. Press Create

![](./media/image115.jpeg)
<p align="center"> Figure 5-12 </p>

***YOU HAVE NOW CREATED A USER WHICH WILL TRIGGER THE CASB USER POLICY***

 ![](./media/image116.jpeg)
 <p align="center"> Figure 5-13 </p>

* After some minutes, you will be able to see the policy alert in the Oracle CASB dashboard. Go to Applications and click to the OCI recently added instance to see the health summary

![](./media/image117.jpeg)
<p align="center"> Figure 5-14 </p>

* As you can see, there is a policy alert. Click on View Details to see the specifics of the user creation event.

![](./media/image118.jpeg)
<p align="center"> Figure 5-15 </p>

[Back to Top](#table-of-contents)

****

## Module 6:  Run A Report in CASB 

**Who Should Complete This Lab:  All Participants**

Oracle CASB offers a variety of predefined reports providing detailed insight into potential security risks. Unless noted otherwise, reports
by default display three days of data, with up to 90 days of data available.

### Run a report

*  Open the Navigation menu in the top left corner of the CASB Dashboard ![](./media/image2.png)
    
    *  Click Reports

![](./media/image119.jpeg)
<p align="center"> Figure 6-1 </p>

*  Scroll down to Oracle Cloud Infrastructure Privileged IAM changes –
    Users and Groups
    
    * Double click the name or press the play button on the report you
        want to run

![](./media/image120.jpeg)
<p align="center"> Figure 6-2 </p>

* You will now be presented with your report findings

![](./media/image121.jpeg)
<p align="center"> Figure 6-3 </p>

[Back to Top](#table-of-contents)

****


## Module 7:  **DEMO** Data Loss Protection

 
Oracle CASB’s Data Loss Protection (DLP) scans and detects files in sanctioned application for sensitive data that follows a defined information type pattern in a rule. Oracle CASB can then manage the situation by tagging the detected files as containing sensitive data, quarantining the files in folders that only administrators can access or completely delete the files from the application. It’s easy to use and has the flexibility to define any
type of data that needs to be detected and secured.
In this you’ll see how Oracle CASB is able to detect sensitive information in a managed document in your Box account.

### **DEMO** - Config Data Loss Protection in CASB

*  Click to Configuration DLP Management

![](./media/image122.jpeg)
<p align="center"> Figure 7-1 </p>

*  Click Add Rule

![](./media/image123.jpeg)
<p align="center"> Figure 7-2 </p>

*  In the first section Content, select the Information Types box and –Top Secret- Keyword and click Next.

**Note: In the community tenant you must select the *Top Secret Documents* option in addition to *Information Type - Top Secret SY***
    
![](./media/image124.jpeg)
<p align="center"> Figure 7-3 </p>

*  In the second section Remediation, select the options shown below and click Next. This section describes the action to take after the selected content is detected. In this case, the document will be classified as highly confidential, an alert will be created and the document will be quarantined (the document will be moved to a path only accessible by the administrator)

![](./media/image125.jpeg)
<p align="center"> Figure 7-4 </p>

*  In the last section, enter the following parameters and click Save.
![](./media/image126.jpeg)
<p align="center"> Figure 7-5 </p>

*  Now your rule should appear in the list of DLP rules.

![](./media/image127.jpeg)
<p align="center"> Figure 7-6 </p>


### Enable DLP for the group BOX account - Who Should Complete This Lab:  1 Participant for group

*  To enable Oracle CASB scan the files in your Box account, you have to enter the internal domain of your account. In this case, the internal domain is a custom domain that you can set in the administrative section for your Box account. 

* Log in to your Box developer account and navigate to the Admin Console.
* In the left pane, click Enterprise Settings.
* At the top of the page, click Custom Setup.
* Company Profile: Here you will have the option to include your company name as well as designate a custom URL

![](./media/box_custom_domain.png)
<p align="center"> Figure 7-7 </p>

*  The next step is to enable the data protection for your Box account. To do that, go to the section Applications and click to your Box application *(e.g. COSE_AU1_BOX_G1)*, select Modify and Update Data Protection. 
![](./media/image128.jpeg)
<p align="center"> Figure 7-8 </p>

* Check the box Enable DLP and select the root folder to monitor.

![](./media/image129.jpeg)
<p align="center"> Figure 7-9 </p>

*  Click Next and once you see the success message, click Done.

![](./media/image130.jpeg)
<p align="center"> Figure 7-10 </p>

* Now you will be able to run retroactive scans to detect any Top Secret words in the documents in Box. For that, go to DLP Management section and click to Retroactive scan.

![](./media/image131.jpeg)
<p align="center"> Figure 7-11 </p>

* Click to Add Scan and fill out as shown below. Click Run Scan.

![](./media/image132.jpeg)
<p align="center"> Figure 7-12 </p>

* Now your scan will appear in the list.

![](./media/image133.jpeg)
<p align="center"> Figure 7-13 </p>

* You can click on the eye icon to see all related information.
![](./media/image134.jpeg)
<p align="center"> Figure 7-14 </p>

* To verify if your document was scan are classified, click to the
    section Data

![](./media/image135.jpeg)
<p align="center"> Figure 7-15 </p>

* To verify if any alert was created, you can go to Risk Events section and filter for the category DLP Alert 
![](./media/image136.jpeg)
<p align="center"> Figure 7-16 </p>

* Now you can also verify if your file was quarantined. Log in to your Box account and click to My Files. You will be able to see how Oracle CASB quarantined your file.

![](./media/image137.jpeg)
<p align="center"> Figure 7-17 </p>

 **As you logged in as administrator, you will be able to click on the folder and see the file.**



****
**You have successfully connected and monitor third-party apps and OCI with Oracle CASB Cloud Service.**

**Now that you have completed this Hands-on lab, each group must remove the registered third-party apps (Salesforce and Box) in CASB.**

* Click on main menu and applications
* Search the application registered during the exercises (e.g. COSE_AU1_BOX_G1)
* Left click on the application
* Select **Remove**

![](./media/casb_remove.png)
<p align="center"> Figure Appendix 1 </p>

* Confirm by clicking **OK**.

![](./media/casb_remove_2.png)
<p align="center"> Figure Appendix 2 </p>

* Repeat above steps for every application registered during the lab

***END OF LAB***

[Back to Top](#table-of-contents)   
