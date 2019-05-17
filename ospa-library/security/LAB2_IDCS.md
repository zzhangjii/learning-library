 ![](./media/securitytitle.png)
# Lab 2:  Oracle Identity Cloud Service

## Table of Contents

- [Module 1: Create and monitor a sanctioned application](#module-1--create-and-monitor-a-sanctioned-application)
- [Module 2: Create a Policy Alert and Display Threats](#module-2--create-a-policy-alert-and-display-threats)
- [Module 3: Oracle CASB Monitoring Oracle Cloud Infrastructure](#module-3--oracle-casb-monitoring-oracle-cloud-infrastructure)
- [Module 4: Create a Policy for OCI](#module-4--create-a-policy-for-oci)
- [Module 5: Run a Report in CASB](#module-5--run-a-report-in-casb)
- [Module 6: Data Loss Protection](#module-6--data-loss-protection)



***** 

 
# Lab Configuration and Details

 For the workshop lab exercises, the current version of the Oracle Identity Cloud Service (IDCS) is being demonstrated.
 
 You will use Free Oracle Cloud trial accounts.
 
 This workshop is hosted in the Oracle Public Cloud (OPC). It includes a combination of cloud services, hosted on-premises software and 3rd
 party software. Aside from the Identity Cloud Service, the remaining components are included to enable demonstrating integration, including
 identity synchronization, federation, authentication, SSO and more.

 This workbook is primarily designed to provide the necessary
 instructions and context to allow you to complete the labs in the
 Oracle Identity Cloud Service Workshop. If you would like additional
 information about the Oracle solution, you can contact your local
 Oracle account team and/or review some of the following publicly
 available information about the solution.

 For consistency and for the ease of use-cases implementation, you will
 use a Gmail account. The following summarizes the components in our
 workshop:
 

  * [Oracle Identity Cloud](https://cloud.oracle.com/en_US/identity)

  * [Oracle CASB Cloud Service](https://cloud.oracle.com/en_US/casb)

  * Salesforce – used for IDCS Application Integration and CASB Create
    and Monitor a sanctioned Application use-cases

 The following configuration information is provided to assist with
 accessing lab assets:

  * Workshop Actors
    
      * IDCS End Users (e.g. employees, customers, partners, etc.)
    
      * IDCS Administrators

# Overview: Oracle Identity Cloud Service

## Introduction

 Identity Cloud Service is Oracle’s next generation comprehensive security and identity platform that provides an innovative, fully integrated service that delivers all the core identity and access management capabilities through a Cloud platform “as a service”. The design of Identity Cloud Service (IDCS) is based on micro service architecture which is naturally aligned with Cloud principles of Scalability, Elasticity, Resilience, Ease of Deployment, Functional Agility, Technical Adoption and Organization Alignment.
 
 At high level, Oracle Identity Cloud Service offers the following
 functionalities:

  * Identity & Access Management

  * Integration with on-prem Active Directory or 3rd party Identity
    Systems

  * Single-Sign-On (SSO)

  * User Authentication Service

  * Identity Federation service (SAML)

  * OAuth services

  * Auditing & Reporting Services

### Concepts and Terminology

 

  * **OAUTH 2.0** – OAUTH is a standard protocol for delegating authorization. It’s a way for an entity to be authorized to access resources (services, API, data) stored in a remote provider. For example, an on-premises application might leverage the IDCS REST API to retrieve information about users or groups from IDCS for use within its application. The REST API is protected by the OAUTH service, to ensure the client application is registered and authorized to a specific scope of REST API. Thus, OAUTH prevents internet-visible services (such as IDCS REST API) from being consumed by an unauthorized user or application.

  * **SAML 2.0** – SAML stands for *Security Assertion Mark-up
    Language*. It is a standard for federating user authentication. SAML
    defines two participating entities, the Service Provider and the
    Identity Provider. When a user attempts to access an application or
    service (at the Service Provider) which is configured for SAML,
    rather than log the user in through local ID/PW, the SP causes the
    user authentication to be performed by the Identity Provider. There
    is therefore a trust relationship established between SP and IDP.
    Oracle IDCS can be configured to take the role of Service Provider
    and/or Identity Provider. As a service provider, IDCS enables
    self-service profile management, password reset, etc.

  * **Identity Provider** – This type of provider, also known as an
    Identity Assertion provider, provides identifiers for users who want
    to interact with Oracle Identity Cloud Service using a website
    that's external to Oracle Identity Cloud Service.


### IDCS Architecture

 Oracle Identity Cloud Service is a new platform service which is
 available as part of Oracle’s broad portfolio of PaaS services. IDCS
 is implemented as a set of micro-services, and the design philosophy
 is API-first with support for modern standards such as SCIM, OAUTH,
 SAML and OpenID Connect.
 
 The following diagram illustrates the IDCS architecture, organized as
 a series of service layers.

![](./media/image4.jpeg)


# Business Drivers

 In new competitive business landscape organizations are trying to
 launch new services in a quickest timeframe to take early bird
 advantage. They want to reach out to more *users* and endorse their
 brand through social media. They want to launch mobile applications to
 give better services to their *customers* and get competitive
 advantage. Most of these organizations are developing and hosting
 these services using PaaS/SaaS model so that can avoid hassles of
 developing or managing them in-house.
 
 Security is one of the most critical and important aspects for every
 new initiative. Data loss & leakage risks, unauthorized access through
 ***misuse of credentials*** and ***improper access controls***,
 hijacking of accounts and malicious insiders are some of the biggest
 concerns that are always present in the ever faster delivery of these
 new services.
 
 Identity & Access Management (IAM) can provide a single aggregated
 view of identities to all systems, it enables multi-channel access and
 provides a platform to define and enforce policies at one layer to
 ensure consistency. An important consideration for these organizations
 is to define how IAM is implemented for these new
 initiatives/services. They can implement security for each application
 in a monolithic, distinct and unique fashion for that application or
 they can leverage a platform approach which can give them a shared
 single identity across multiple applications, shared services, and
 shared policies across multiple applications and provide cross channel
 visibility. The ability to enable business and drive new opportunities
 through a solid secure infrastructure and a platform designed for this
 kind of business agility is where the new business opportunity lies
 today.
 
 This workshop shows how **Oracle Identity Cloud Service (IDCS)** enable organizations to rapidly develop fast, reliable and secure services for their new
 business initiatives.

### Navigation between IDCS and Cloud My Services Dashboards

 * Personas:
 
 IDCS Administrator
 
 Let’s first get used to how to access IDCS from within Oracle’s Cloud
 console and how to move between the two dashboards.
 
 * Login to your Oracle Cloud Account:
 [Login to your Cloud Account](https://cloud.oracle.com/en_US/sign-in)

![](./media/image5.jpeg)

 * On the login page, enter your user name and password and click **Sign In**
 
 * You will be presented with a dashboard displaying the various cloud
 services available to this account.
 
 ![](./media/image6.png)
 
 * From the **Cloud My Services** dashboard, click on **Users** in the upper right-hand corner. Then click on **Identity Console** button located towards upper right-hand corner again.

![](./media/image7.png)

 * If you have logged in using your administrator Account, the users are shown up in IDCS admin console. Other admin console sections are also available.
 
 ![](./media/image8.jpeg)
 
 * In the upper left-hand corner select the navigator menu or sometimes referred to as the "General Menu”. Select **Dashboard**. This will display the **Identity Cloud Service** dashboard.
 
 * Click on the navigator menu to hide it.

![](./media/image9.jpeg)

* To return to the Cloud Console, do the following:

  *  Select the **My Home** menu from the upper right corner of the
    screen.

![](./media/image10.jpeg)

  *  Then select the Dashboard button at top right of screen. This will
    return you to the **Cloud My Services** dashboard. Or just use your
    bookmarked URL as suggested earlier.

 ![](./media/image11.jpeg)

# IDCS Quick Tour

 Return to the IDCS dashboard and click on the navigator menu
 (hamburger menu).

![](./media/image12.jpeg)

 You may navigate around IDCS from the dashboard screen items or
 through the menu on the left. Note the **My Services** link at the
 bottom of the menu list. This provides a shortcut to **Cloud My
 Services** dashboard.
 
 The IDCS documentation may be accessed through the **Learn More**
 button on the dashboard.
 
 Click on the following menus and just get familiar with the content:

  * Users

  * Groups

  * Settings

  * Security

 We’ll get into the details shortly, but this will give you a quick
 navigation overview of the menus and services available.

# Module 1:  User Management

 It is often a requirement for organizations to on-board an employee or contractor or some identity manually into a central identity systems like IDCS. In this use case, an IDCS user administrator will manually add a new user in IDCS service. Typically, this would occur through automated provisioning, bulk flat-file import or synchronization with your on- premises Active Directory.
 
 The IDCS features are built 100% using the IDCS REST API service. Therefore, any task we perform interactively in the web interface could also be performed via custom app, using these same REST API calls. It’s a clear advantage of Oracle’s API-first architecture with IDCS.
 
 IDCS supports user (also groups) on-boarding from on-premises **Active Directory**, using file upload, REST API, on-premises **Oracle Identity Management** solution, or manually from IDCS admin console. For the workshop we will be using file upload option and API calls user management.

### Create User in UI (Persona: Administrator)

*  Go to IDCS Admin console using your administrator account
    credentials. Select the **Users** menu on the left and click
    **+Add** or select the **Add a user** icon from the dashboard.

![](./media/image13.png)

*  Fill in all required fields and click **Finish**. For this lab purposes, create a dummy account using your personal email address (e.g. *name@gmail.com*). We will use this account as part of our Single Sign-On module.

 ![](./media/image14.png)

*  Verify user creation
    
      * Go to the **Users** tab in admin console. Verify that the new
        users are visible on the console.

 ![](./media/image15.jpeg)


 
## API User Creation with REST API’s (Persona: Administrator) – OPTIONAL

 This use case involves making API calls to IDCS using a REST client;
 in this case Postman. The Postman collection of relevant REST API
 calls is provided to each participant.

### Register a client POSTMAN application in IDCS

*  Navigate to your tenant https://**<yourtenant>**/ui/v1/adminconsole
 
 ![](./media/image23.jpeg)

*  Select the Applications tab from the IDCS dashboard presented after log in

![](./media/image24.png)

*  Click the **Add** button to create a new application for Postman use. In order for Postman to be able to call IDCS REST APIs, it first requires to have a **CLIENT_ID** and **CLIENT_SECRET** that authorize Postman to do so. This can be achieved by creating a Confidential Application type into IDCS with specific authorization grant types as you will see into the following steps.

 ![](./media/image25.jpeg)

*  Select Confidential Application from the pop-up menu of application types:

![](./media/image26.jpeg)

*  Set the **Name** to “Postman”. Then click **Next**

 ![](./media/image27.jpeg)

*  Click “**Configure this application as a client now**” in order toprovide the authorization grant types and the API role.

![](./media/image28.jpeg)

![](./media/image29.jpeg)

*  Select all the Allowed Grant Types checkboxes and set Redirect URL to [**https://localhost.**](https://localhost/) Go to “**Grant the client access to Identity Cloud Service Admin APIs**” section (bottom of the page) and add the following API role “**Identity Domain Administrator**”. This way you are basically granting access for this IDCS app to the full set of IDCS APIs.

*  Finally, click **Next**.

![](./media/image30.jpeg)

*  Make no changes in the next screens and click **Next**

 ![](./media/image31.png)

* For finalizing the IDCS app that grants API roles to Postman via Auth2.0 standard click **Finish.**

![](./media/image32.jpeg)

* Once the application is created, note down the **Client ID** and the **Client Secret** then click **Close.** These will be used by Postman desktop application to call IDCS APIs using the Auth2.0 standard protocol.

![](./media/image33.jpeg)

* Click the **Activate** button. Don’t forget to activate the application

![](./media/image34.jpeg)

* Confirm the application activation

![](./media/image35.png)

* The application is now active and ready to use.
 
 ![](./media/image36.jpeg)
 
* Sign out from IDCS

###  Configure Postman
    
    1.  Open **Postman**. Ignore all startup messages if any.

![](./media/image37.jpeg)

2.  First we need to import IDCS Postman environment variables, global
    variables and IDCS API collection. Click the Import button on the
    left upper corner:

 ![](./media/image38.jpeg)

3.  Select “**Import from Link**” and provide the following URL to
    import the environment variables:
    [<span class="underline"https://github.com/oracle/idm-samples/raw/master/idcs-</span
    <span class="underline"rest-clients/example\_environment.json</span](https://github.com/oracle/idm-samples/raw/master/idcs-rest-clients/example_environment.json)
    and then click **Import**

4.  To import the Oracle Identity Cloud Service REST API Postman
    collection, on the Postman main page, click **Import**.

5.  In the Import dialog box, select “**Import From Link**”, paste the
    following GitHub Postman collection URL into the box, and then click
    **Import**:

 [<span class="underline"https://github.com/oracle/idm-samples/raw/master/idcs-rest-</span](https://github.com/oracle/idm-samples/raw/master/idcs-rest-clients/REST_API_for_Oracle_Identity_Cloud_Service.postman_collection.json)
 [<span class="underline"clients/REST\_API\_for\_Oracle\_Identity\_Cloud\_Service.postman\_collection.json</span](https://github.com/oracle/idm-samples/raw/master/idcs-rest-clients/REST_API_for_Oracle_Identity_Cloud_Service.postman_collection.json)
 
 ![](./media/image39.png)

6.  To import the global variables file, click **Import**.

7.  In the Import dialog box, select **“Import From Link”,** paste the
    following GitHub Postman Globals URL into the box, and then click
    **Import**:

 [<span class="underline"https://github.com/oracle/idm-samples/raw/master/idcs-rest-</span](https://github.com/oracle/idm-samples/raw/master/idcs-rest-clients/oracle_identity_cloud_service_postman_globals.json)
 [<span class="underline"clients/oracle\_identity\_cloud\_service\_postman\_globals.json</span](https://github.com/oracle/idm-samples/raw/master/idcs-rest-clients/oracle_identity_cloud_service_postman_globals.json)

8.  Click on the **Settings** button (cogwheel icon) to **Manage
    Environments**

 ![](./media/image40.png)

9.  Click on the newly created environment which will be like “Oracle
    Identity Cloud Service Example Environment with Variables” and it
    will probably be the only one available in your cases.

![](./media/image41.png)

10. Set the following parameters current values in order to be able to
    obtain an IDCS access token:

 HOST: <span class="underline"https://\<your IDCS tenant\</span Ex:
 https://idcs-
 8ba16123120745658135edd99d8a5c78.identity.oraclecloud.com CLIENT\_ID:
 *\<the Postman IDCS Client application CLIENT\_ID\* CLIENT\_SECRET:
 *\<the Postman IDCS Client application CLIENT\_SECRET\*

![](./media/image42.png)

11. Click the **Environment** drop-down list, and then select the
    updated environment from the list.

 ![](./media/image43.png)

3.  Request an Access Token
    
    12. On the **Collections** tab, expand **OAuth**, and then
        **Tokens**.
    
    13. Select **Obtain access\_token (client credentials),** and then
        click **Send**. The access token is returned in the response
        from Oracle Identity Cloud Service.
    
    14. Highlight the access token content between the quotation marks,
        and then **right- click**. In the shortcut menu, select **Set:
        Oracle Identity Cloud Service Example Environment with
        Variables**  In the secondary menu, select **access\_token**.
        The highlighted content is assigned as the access token value.

 ![](./media/image44.jpeg)

4.  Create an IDCS User via API
    
    15. On the **Collections** tab, expand **Users**, and then
        **Create**.
    
    16. Select **Create a user**. The request information appears with
        some default values as can be seen into below print screen. You
        can either change them as per your preference or you can simply
        use the default filled values.
    
    17. Click **Body**, and then click **Send**.

![](./media/image45.jpeg)

18. In the response, confirm that the status **201 Created** appears and
    that the response body displays details about the user that was
    successfully created in Oracle Identity Cloud Service.

19. While in the IDCS UI you can see the user as being created.

![](./media/image46.png)

 You can also **modify** and **delete** users and a lot more via REST
 API. For more information, please check the documentation below.

### More information

 Tutorial 1: Oracle Identity Cloud Service: First REST API Call
 [<span class="underline"http://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/idcs/idcs\_rest\_1stcall\_obe/r</span](http://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/idcs/idcs_rest_1stcall_obe/rest_1stcall.html)
 [<span class="underline"est\_1stcall.html</span](http://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/idcs/idcs_rest_1stcall_obe/rest_1stcall.html)
 
 Tutorial 2: Oracle Identity Cloud Service: Managing Users Using REST
 API Calls
 [<span class="underline"http://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/idcs/idcs\_rest\_users\_obe/re</span](http://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/idcs/idcs_rest_users_obe/rest_users.html)
 [<span class="underline"st\_users.html</span](http://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/idcs/idcs_rest_users_obe/rest_users.html)
 
 Note: a complete list of IDCS tutorials may be found at
 [<span class="underline"https://docs.oracle.com/en/cloud/paas/identity-cloud/tutorials.html</span](https://docs.oracle.com/en/cloud/paas/identity-cloud/tutorials.html)

# Lab: Configure SSO and Provisioning (Salesforce)

 Oracle Identity Cloud Service (IDCS) provides integration with any
 service that can be integrated via **SAML** (Security Access Markup
 Language) protocol. Administrations will be able to manage users into
 various applications via single control panel and end users will be
 able get to applications via single click.
 
 IDCS provides support for standard SAML 2.0 Browser POST Login &
 Logout Profiles.
 
 Please note, that though IDCS supports SAML and OpenID Connect/OAuth,
 there are many times when a non-SAML enabled system requires SSO. IDCS
 App Gate provides support for non-SAML systems that use header-based,
 cookie-based or form-fill SSO. App Gate is an Nginx-based, software
 appliance deployed in a proxy configuration that can be deployed on
 AWS, OCI, OCI-C or on-premises in VMWare or Oracle Virtualbox. It is
 delivered via Identity Cloud Service and available for IDCS Standard
 customers.
 
 This lab is intended to demonstrate federated Single Sign-on (SSO)
 with a 3rd party SaaS application. The purpose is to illustrate the
 business value of having IDCS as a central Identity Provider for your
 growing portfolio of Oracle and non-Ora
 
 In this hands-on exercise, we will setup integration with
 **Salesforce** using SAML. IDCS will act as **IdP** (Identity
 Provider) and Salesforce org as **SP** (Service Provider also known as
 a Relying Party)

1.  Download IDCS Metadata to a local XML file. Metadata is available
    from the following location - https://\<your
    tenant\/fed/v1/metadata. Depending on the browser you are using,
    the simplest way of doing this is to right click anywhere on the
    page and chose “Save as” option  provide a name and save it as XML
    file. Try not to use the copy / paste option as the xml file may be
    altered.

 ![](./media/image47.jpeg)

2.  Register for a Salesforce developer account at
    [https://developer.salesforce.com/.](https://developer.salesforce.com/)

 This part was covered in the Pre-requisites file.
 
 ![](./media/image48.jpeg)
 
 Once registered, check your email and verify the account registration
 and then log into Salesforce.
 
 Note: you may have to select “Switch to Salesforce Classic”.

3.  Access Salesforce application using the URL provided after
    registration, click on the profile menu as per below print screen
    and select the option: **“Switch to Salesforce Classic”**.

![](./media/image49.jpeg)

4.  Go to **Setup** into the upper tab menu, near the profile.

5.  Register a custom Domain. Go to **Domain Management** -\ **My
    Domain** and register a domain of your choosing. This is to have a
    custom application URL dedicate for our use case.

 This part was covered in the Pre-requisites file.
 
 ![](./media/image50.jpeg)

6.  Check your email for the domain login and login.

7.  Bring up the **setup** page.

![](./media/image51.jpeg)

8.  From side menu bar, go to **Security Controls** -\ **Single Sign-On
    Settings**

![](./media/image52.jpeg)

9.  Click on **Edit** and enable **Federated Single Sign-On Using SAML**
    option.

![](./media/image53.png)

10. Click on **New from Metadata File** button to import IDCS metadata.
    Select the downloaded metadata file using **Choose File** button.
    Click on **Create**.

![](./media/image54.png)

11. Keep all the default information and click on **Save**

![](./media/image55.jpeg)

 Below are the details for this example. Note, your URLs and domain
 information will be different.

![](./media/image56.jpeg)

![](./media/image57.jpeg)

12. Make note the following:

<!-- end list --

  - Organization ID value

  - Org Domain Name value.

![](./media/image58.jpeg)

 Now that the Salesforce configurations are done, we need to configure
 IDCS to be aware of the Salesforce application.

13. Go to IDCS admin console -\ navigation menu -\ **Applications**

 ![](./media/image59.jpeg)

14. Click on **Add** button and select **App Catalog** and search for
    Salesforce. Click on **Add.**

 ![](./media/image60.jpeg)

15. On the first page of configuration screen provide the
    **Organization**

 **ID** and **Domain Name** values that you made note of from within
 Salesforce.

![](./media/image61.jpeg)

16. Click on **Next** to move to the SSO configuration

 ![](./media/image62.jpeg)

17. Click on **Finish** button

18. **Activate** the application

 ![](./media/image63.png)

## Assign Apps to Group (Persona: Administrator)

 In IDCS you have the option to assign access to users directly, by
 direct assignment to a specific application, or indirectly using
 dedicated groups. For the purpose of the use case we’ll be using
 groups to provide users access to Salesforce application.

1.  Go to IDCS admin console -\ **Groups** menu

2.  Add a group labeled **Employee**. Check the box **User can request
    access**.

 ![](./media/image64.png)

3.  Click on **Finish**

4.  Go to the **Access** tab. Click on **Assign**.

5.  Select **Salesforce** and click on **OK**.

![](./media/image65.jpeg)

 Moving back to Salesforce in order to create a corresponding account
 for one that we have into IDCS.

1.  **Login** into **Salesforce** as an administrator.

2.  Go to **Setup**.

3.  On the left panel, click on **Manage Users**, then on **Users** and
    then on **New User**.

4.  Create a user as shown below. Be sure to use the email address as
    the login and use one that matches an account in IDCS. In this case,
    I’ve used <span class="underline" </span
    [<span class="underline"oracleuser3003@gmail.com</span.](mailto:oracleuser3003@gmail.com)

5.  Set the **User License** to **Salesforce Platform**.

![](./media/image66.jpeg)

 Now that the account is available in Salesforce and IDCS has the
 authenticated account you are ready to test.

## Request Group Access (Persona: End User)

 Remember that we have created the **Employee** group into IDCS which
 is having access to Salesforce application but there is no user
 assigned yet to it. Since we chose the option
 
 **“User can request access”** at the creation of the group, now we
 should be able to request access to it and implicitly to the
 Salesforce application.

1.  Close your browser to clear the cache and then login into IDCS
    (https://idcs-\<\<Your IDCS
    Instance\\.identity.oraclecloud.com/ui/v1/myconsole).

2.  From **My Apps** page, click on **+ Add** access request button.

![](./media/image67.jpeg)

3.  From the **Groups** tab, select **Employee** group and select the
    **+** sign.

![](./media/image68.jpeg)

4.  Click on + sign to request access to the group. Provide
    justification on the resulting popup page. Click on **OK**. This is
    an auto approved request and access should be granted immediately
    without the need of and administrator intervention.

 ![](./media/image69.jpeg)

5.  Go to **My Profile** section from menu located top-right

![](./media/image70.jpeg)

6.  Ensure that **Employee** group is visible under **My Access**
    sub-tab

 ![](./media/image71.png)

7.  Ensure that Salesforce applications are visible now on the **My
    Apps** page

![](./media/image72.png)

## Verify SSO Configuration (Persona: End User)

1.  Click on the **Salesforce Chatter** app from **My Apps** page

2.  Ensure that user is automatically logged into Salesforce Chatter
    (**SSO**)

![](./media/image73.jpeg)

 You should now see the same user profile information, that you started
 within IDCS, within Salesforce without having had to log into
 Salesforce.

## Configure Provisioning and Synchronization (Persona: Administrator)

 **- OPTIONAL**

1.  <span id="bookmark19" class="anchor"</spanObtaining Host Name,
    Organization ID, and Domain Name from Salesforce

 A host name, organization ID, and a domain name are required before
 you can configure the Salesforce app in Oracle Identity Cloud Service.
 You obtain these values from Salesforce.

1.  In the left navigation menu of the home page, search and click
    Single Sign-On Settings. The Single Sign-On Settings page appears.

![](./media/image74.jpeg)

2.  Under the SAML Single Sign-On Settings section, **click** the name
    that you provided for your identity provider in the **Single Sign-On
    Settings page**. The SAML Single Sign-On Settings page appears.

3.  Make note of the host name from the value given in the **Entity ID**
    field: <span class="underline"https://\<Host\_Name</span\.

4.  Under the Endpoints section, make note of the domain name and the
    organization ID from the **Salesforce Login URL**:
    https://\<**Domain\_Name**\.my.salesforce.com?so=\<**Organization\_ID**\.
    The domain name appears at the beginning and the organization ID
    appears at the end of the URL.

![](./media/image75.png)

2.  <span id="bookmark20" class="anchor"</spanObtaining the Consumer
    Key and Consumer Secret from Salesforce

 **Consumer key** and **consumer secret** values are required before
 you enable provisioning for the Salesforce app. You obtain these
 values from Salesforce.

5.  Switch to **Lightning Experience** in Salesforce, click the
    **cogwheel** on the top right corner of the page and select
    **Setup**.

![](./media/image76.jpeg)

6.  In the left navigation menu of the home page, search and click **App
    Manager**. The Lightning Experience App Manager page appears.

![](./media/image77.jpeg)

7.  In the right corner of the page, click **New Connected App**. The
    New Connected App page appears.

![](./media/image78.png)

8.  Under the Basic Information section, enter the Connected App Name of
    the app that you want to connect.

9.  Enter the **Contact Email** of the administrator.

10. Under the API(Enable OAuth Settings) section, select the **Enable
    OAuth Settings**

 check box.

11. Enter any public domain URL that receives the access token from the
    authorization server in the **Callback URL** field. For example,
    [<span class="underline"https://login.salesforce.com</span.](https://login.salesforce.com/)

12. In the Selected OAuth Scopes field, select Full access(full) under
    the **Available OAuth** Scopes list, and then click Add to give full
    access to modify the OAuth.

![](./media/image79.jpeg)

13. Scroll down and click **Save**.

14. Wait for 2-10 minutes for the changes to take effect on the server
    before using the connected app, and then click **Continue**. The
    newly created app page appears.

15. Under the API (Enable OAuth Settings) section, click “**Click to
    reveal**” next to the

 **Consumer Secret** field.

![](./media/image80.png)

16. Make note of the **Consumer Key** and **Consumer Secret** values.

<!-- end list --

3.  <span id="bookmark21" class="anchor"</spanDeriving the
    Administrator Password from Salesforce

 **<span class="underline"A security token must be appended to the
 administrator password</span** before you enable provisioning and
 synchronization for Salesforce app. You obtain the token value from
 Salesforce.
 
 The final value will look like this:
 
 \<yourSalesforceAdminPassword + securityToken(ex:
 LKdMzECdjFKYSj028WJhU1GG)\

17. In the upper-right corner of the **Salesforce** home page, click the
    user icon, and then click Settings from the drop-down list.

![](./media/image82.jpeg)

18. In the left navigation menu, search and click **Reset My Security
    Token.**

 ![](./media/image83.jpeg)

19. On the Reset My Security Token page, click **Reset My Security
    Token**. A security token is sent to the email address of the
    administrator.

20. Make note of the security token, and
    **<span class="underline"append the security token to the
    administrator password.</span**

 \<yourSalesforceAdminPassword + securityToken(ex:
 LKdMzECdjFKYSj028WJhU1GG)\ NOTE: the \<\, + and example must not be
 included

4.  <span id="bookmark22" class="anchor"</spanEnabling Provisioning
    and Synchronization for Salesforce

 Provisioning will provide you with the following available operations:
 
 **Create Account**: Automatically creates a Salesforce account when
 Salesforce access is granted to the corresponding user in Oracle
 Identity Cloud Service.
 
 **De-activate Account**: Automatically deactivates or activates a
 Salesforce account when the Salesforce access is deactivated or
 activated for the corresponding user in Oracle Identity Cloud Service.
 
 **Delete Account:** Automatically removes an account from Salesforce
 when Salesforce access is revoked from the corresponding user in
 Oracle Identity Cloud Service.
 
 Beside this you have the ability to map attributes between the user
 account fields defined in Salesforce and the corresponding fields
 defined in Oracle Identity Cloud Service.

21. Go to IDCS admin console

22. Select the Salesforce applications that you have created previously

23. On the Provisioning page, select **Enable Provisioning**.

24. A window will pop up. Click “**Grant Consent**”

25. Fill in the **Host Name, Administrator Username**, **Administrator
    Password**, **Client ID** and **Client Secret** that you derived in
    the previous steps from Salesforce

![](./media/image84.jpeg)

26. Click **Test Connectivity** to verify the connection with
    Salesforce. Oracle Identity Cloud Service displays a confirmation
    message.

27. Scroll down on the Provisioning page, select **Enable
    Synchronization**.

 ![](./media/image85.jpeg)
 
 This option will synchronize the existing account details from
 Salesforce and link them to the corresponding Oracle Identity Cloud
 Service users.

5.  <span id="bookmark23" class="anchor"</spanTesting Synchronization
    in IDCS

<!-- end list --

1.  On the applications page, select **Import**.

![](./media/image86.png)

2.  Click on **Import** and wait for a moment

3.  Click **Refresh**

![](./media/image87.png)

4.  The imported users that were imported from IDCS will be displayed.

![](./media/image88.jpeg)

# Lab: Configure Federation - Social Identity Provider (Google) - OPTIONAL

 An **identity provider**, known as an **Identity Assertion provider**,
 provides identifiers for users who want to interact with Oracle
 Identity Cloud Service using a website that's external to Oracle
 Identity Cloud Service. A **service provider** is a website such as
 Oracle Identity Cloud Service that hosts applications. You can enable
 an identity provider and define one or more service providers. Your
 users can then access the applications hosted by the service providers
 directly from the identity provider.
 
 Oracle Identity Cloud Service (IDCS) supports social identity
 providers so that users can log in to IDCS with their social
 credentials. Social login feature allows users to self-register in
 IDCS if they do not already have an account.
 
 Following Social providers comes out-of-the-box with IDCS -

  - Facebook

  - Google

  - LinkedIn

  - Microsoft

  - Twitter

 IDCS also supports any generic social identity provider that is OpenID
 Connect compliant.
 
 The following links are to a video showing the configuration with
 Google and IDCS. The screens are dated, but the parameters and
 concepts are helpful.
 [<span class="underline"https://apexapps.oracle.com/pls/apex/f?p=44785:24:3378877762177:::24:P24\_CONTEN</span](https://apexapps.oracle.com/pls/apex/f?p=44785%3A24%3A3378877762177%3A%3A%3A24%3AP24_CONTENT_ID%2CP24_PREV_PAGE%3A21307%2C24)
 [<span class="underline"T\_ID,P24\_PREV\_PAGE:21307,24</span](https://apexapps.oracle.com/pls/apex/f?p=44785%3A24%3A3378877762177%3A%3A%3A24%3AP24_CONTENT_ID%2CP24_PREV_PAGE%3A21307%2C24)
 or
 [<span class="underline"https://youtu.be/-OwFAGJw3vo</span](https://youtu.be/-OwFAGJw3vo)
 
 Another video – with more detail, but with the older style screens:
 [<span class="underline"https://www.youtube.com/watch?v=JU8ArDvzWq0</span](https://www.youtube.com/watch?v=JU8ArDvzWq0)

## Configure Social Provider (Persona: Administrator)

 A quick tutorial for integrating Google Sign-in into your web app is
 found at this link:
 [<span class="underline"https://developers.google.com/identity/sign-in/web/sign-in</span](https://developers.google.com/identity/sign-in/web/sign-in)
 
 This guide also provides a detailed tutorial on how to integrate
 Google as an IdP for IDCS.
 
 In order to use Google as an IdP for IDCS, we need to obtain Auth 2.0
 credentials from Google. This can be done by having a developer
 account on google and create an application for this purpose.

1.  To start, please click on the following link:
    <span class="underline"[
    https://developers.google.com/identity/protocols/OpenIDConnect](https://developers.google.com/identity/protocols/OpenIDConnect)</span

2.  Scroll down to the sub-heading “**Obtain OAuth 2.0 credentials**”
    and click on the hyperlinked **Credentials page**. A new Window will
    open which will ask you to login with your Google account. **Sign
    in** with your Google account.

 ![](./media/image89.jpeg)

3.  Click on **Select a project** and select **NEW PROJECT.**

 ![](./media/image90.png)

4.  Choose a name for your project and click **CREATE**.

5.  Under APIs and Services, click on **OAuth consent screen**.

6.  Choose an **Application name**.

![](./media/image91.jpeg)

7.  For **authorized domains**, choose **oraclecloud.com** and click on
    **Save**.

![](./media/image92.jpeg)

8.  Click on **Create credentials** and select **OAuth client ID**.

![](./media/image93.jpeg)

9.  Choose **Web application** and a **name**.

10. Set the **Authorized redirected URL** to the following
    <span class="underline"https://\<IDCStenant\/oauth2/v1/social/callback</span

11. Click on **Create** in order to create the keys.

 ![](./media/image94.jpeg)

12. You will receive the **client ID** and the **client secret**. Save
    those for later.

 ![](./media/image95.jpeg)
 
 Now return to **IDCS** and enter the provider parameter values in
 order to configure Google as a Social IdP.

1.  Go to IDCS admin console -\ **Security** tab -\ **Identity
    Providers** from the left sidebar menu

2.  Click on **Add Social IDP**

3.  Select the type as **Google**. Provide a name of the provider and
    click **Next**.

 ![](./media/image96.jpeg)

4.  Fill in the **Client ID** and **Client Secret** we obtained before.

![](./media/image97.png)

5.  Click on **Finish** and **Activate** the provider

 ![](./media/image98.jpeg)
 
 After this we have a social IdP defined into IDCS but this is not
 currently visible into the sign in page. Next steps will be to assign
 it to a IDP policy and make it visible into the login page.

6.  Enable the option **Show on Login Page**

![](./media/image99.jpeg)

 Once setup for to **Show on Login Page**, you’ll see an “eye”.

![](./media/image100.png)

7.  Go to IDCS admin console -\ **Security** menu -\ **IDP Policies**
    from the left sidebar menu

 ![](./media/image101.jpeg)

8.  Select **Default Identity Provide Policy** and then select
    **Identity Providers** tab. Add Google login to the providers list.

![](./media/image102.jpeg)

## Verify Social Login (Persona: End User)

 Now login into IDCS, but select the Google provider link for the
 social logins.

![](./media/image103.jpeg)![](./media/image104.jpeg)

 In case a user has been already created in IDCS, you are redirected to
 IDCS and logged in to IDCS with your user credentials from Google. You
 have finished with this part of the tutorial and can skip the
 following instructions for those users who do not have a user yet in
 IDCS.
 
 In case you do not have a user yet, you will be prompted with an
 additional message from IDCS that you do not have an account and that
 you need to register. In this case, click on the hyperlinked text
 “**Click here to register**”.

![](./media/image105.jpeg)

 Enter the necessary fields and click on **Register**. You are now
 successfully registered and can use IDCS with Google as an IdP.

# Lab: Configure Federation – External Identity Provider (Okta)

 An **identity provider**, known as an **Identity Assertion provider**,
 provides identifiers for users who want to interact with Oracle
 Identity Cloud Service using a website that's external to Oracle
 Identity Cloud Service. A **service provider** is a website such as
 Oracle Identity Cloud Service that hosts applications. You can enable
 an identity provider and define one or more service providers. Your
 users can then access the applications hosted by the service providers
 directly from the identity provider.
 
 For this exercise, a website can allow users to log in to Oracle
 Identity Cloud Service with Okta credentials. Okta acts as the
 identity provider and Oracle Identity Cloud
 
 Service functions as the service provider. Okta verifies that the user
 is an authorized user and returns information to Oracle Identity Cloud
 Service.

1.  ## Configure Okta (Persona: Administrator)
    
    1.  Go to Okta and signup for a developer account:
        <span class="underline"[
        https://www.okta.com/integrate/signup/](https://www.okta.com/integrate/signup/)</span

 This part was covered in the Pre-requisites file.

2.  Once you have your trial account credential, then login using the
    URL you’ve received after requesting the trial (the custom one, ex:
    <span class="underline" </span
    [<span class="underline"https://oracleworkshop.oktareview.com</span](https://oracleworkshop.oktareview.com/)
    ) and go to **Applications**. In upper left menu select **Classic
    UI**

![](./media/image106.png)

3.  Select **Add Application** button. Then select **Create New App**
    button.

 ![](./media/image107.jpeg)

4.  Select **SAML2.0** in the next screen.

![](./media/image108.jpeg)

5.  Provide an application name – **IDCS\_SP**.

 ![](./media/image109.jpeg)

6.  On **Configure SAML** page, enter all the Service Provider related
    SAML details. Here are some important fields to be filled:

<!-- end list --

  - **Single Sign on URL** – this is the assertion consumer url which is
    generally of the format <span class="underline"https://IDCS
    Instance URL/fed/v1/sp/sso</span

  - **Audience URI (SP Entity ID)** – this is the service provider
    entity ID which is generally of the format
    <span class="underline"https://IDCS Instance URL/fed</span \*\*\*
    NOTE: The IDCS instance is different than the Single Sign On URL. Be
    sure to look carefully at the IDCS Metadata.

  - **Default Relay state** – This identifies a specific application
    resource in an IDP initiated SSO scenario. This can be left blank
    too.

  - **Name ID Format** – Identifies SAML processing rules. Use the
    default value ‘**Unspecified**’ unless the application explicitly
    requires a specific format

  - **Application Username** – Determines default value for a user’s
    application username. The application username will be used for
    assertions subject statement. Leave default as **Okta username.**

 In the IDCS Metadata file the following URLs are found (note your
 instance name will be different).
 
 Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
 Location="https://idcs-
 ca1e1a3b83fe47fbbba8a53c00e4fcda.identity.oraclecloud.com/fed/v1/idp/sso"/

  - Use this for **Single sign on URL** on Okta screen

 entityID="https://idcs-ca1e1a3b83fe47fbbba8a53c00e4fcda.identity-
 test.oraclecloud.com/fed"

  - Use this for **Audience URL (SP Entity ID)** on Okta screen. \*\*
    Notice the slight change of the instance name\!\!

 The following link provides the instance metadata:
 
 https://idcs-\<tenant
 \_ID\.identity.oraclecloud.com**/fed/v1/metadata**

![](./media/image110.jpeg)

7.  Complete the application creation process.

8.  Go to the app that you just created and click on **Sign On** tab.
    From here there IDP metadata file can be exported. Export the
    metadata (click on the **Identity Provider metadata** link).

![](./media/image111.jpeg)

9.  The metadata will be displayed in another browser window. Save it to
    an xml file by right click and choose “Save as”, as you’ll need this
    in a few minutes inside of IDCS.

 ![](./media/image112.jpeg)

10. Now select the **Assignments** tab.

 Okta users needs to be assigned to this application in order for
 access to be granted during SSO.

![](./media/image113.jpeg)

11. Assign users to this application.

 It should be a user that is already available into IDCS. If not, keep
 in mind that it needs to be created into IDCS as well in order for the
 integration to work.
 
 ![](./media/image114.jpeg)

2.  ## Configure IDCS (Persona: Administrator)
    
    12. Login to IDCS Admin console and go to **Security** -\
        **Identity Providers**. Click on

**Add SAML IDP**. Enter the name of the application and description and
click next.

![](./media/image115.jpeg)

13. Upload Okta metadata xml file that was exported previously.

 ![](./media/image116.jpeg)

14. Set the following parameters:

<!-- end list --

  - Identity Provider User Attribute = **Name ID**

  - Oracle Identity Cloud Service User Attribute = **Username**

  - Requested NameID Format = **Unspecified**

![](./media/image117.jpeg)

15. Go to **Next** screens. On the export screen there is nothing to do
    as we had already retrieve the IDCS metadata from the URL and is no
    need to download them again.

 ![](./media/image118.jpeg)

16. Click **Next** and then **Test Login** on the next screen. Make sure
    to use a username for the test that exists on both the IDP and SP
    environments. Otherwise the assertion will fail.

![](./media/image119.png)

 You should see a result like the following if everything is working.

![](./media/image120.png)

17. Click **Next** and then click **Activate** button.

![](./media/image121.png)

18. Click **Finish** to complete the process and you’ll be returned to
    the **Identity Providers** screen. Select the menu to **Show on
    Login Page.**

 ![](./media/image122.png)

19. Go to **Security** -\ **IDP Policies** and open the **Default
    Identity Provide Policy**

![](./media/image123.jpeg)

20. Select the **+ Assign** menu option and add the Okta Provider.

![](./media/image124.png)

## Login in to IdP (Persona: End User)

 Now go to the IDCS admin console and you’ll see the additional sign in
 option.

![](./media/image125.jpeg)

 Select the Okta login option and then you’ll be asked for your Okta
 credentials and if authenticated successfully the request will be sent
 to the IDCS My Apps screen. Note: for federation to work, you need to
 login with an account that is defined in both IDCS and Okta.

# Lab: Enabling Conditional MFA in IDCS

 Multi-Factor Authentication (MFA) is a method of authentication that
 requires the use of more than one factor to verify a user’s identity.
 
 With MFA enabled in Oracle Identity Cloud Service, when a user signs
 in to an application, they are prompted for their user name and
 password, which is the first factor – something that they know. The
 user is then required to provide a second type of verification. This
 is called 2-Step Verification. The two factors work together to add an
 additional layer of
 
 security by using either additional information or a second device to
 verify the user’s identity and complete the login process.
 
 Users are increasingly connected, accessing their accounts and
 applications from anywhere. As an administrator, when you add MFA on
 top of the traditional user name and password, that helps you to
 protect access to data and applications. This also reduces the
 likelihood of online identity theft and fraud, which secures your
 business applications even if an account password is compromised.

1.  ## Select MFA factors that you want to enable (Persona: Administrator)
    
    1.  Login into IDCS Admin console as an administrator
        <span class="underline"https://\<yourtenant\/ui/v1/adminconsole</span
    
    2.  Navigate to **Security** -\ **MFA**
    
    3.  **Select** the **MFA factor**s that you want to enable and then
        **click** on **Save**.

![](./media/image126.jpeg)

4.  To manage MFA factor specific setting, you can click on the
    configure link besides the Factor or navigate to **Security**-\
    **MFA** -\ ***\<Specific Factor\***

## Define a Sign-On Policy for Salesforce (Persona: Administrator)

 A sign-on policy allows identity domain administrators, security
 administrators, and application administrators to define criteria that
 Oracle Identity Cloud Service uses to determine whether to allow a
 user to sign in to Oracle Identity Cloud Service or prevent a user
 from accessing Oracle Identity Cloud Service.
 
 Oracle Identity Cloud Service provides you with a default sign-on
 policy that contains a default sign-on rule. Oracle Identity Cloud
 Service evaluates the criteria of the rule for any user attempting to
 sign in to Oracle Identity Cloud Service. By default, this rule allows
 all users to sign in to Oracle Identity Cloud Service. This means
 whichever authentication the user uses, either local authentication,
 by supplying a user name and password, or authentication by using an
 external identity provider, will be sufficient.
 
 However, you can build upon this policy by adding other sign-on rules
 to it. By adding these rules, you can prevent some of your users from
 signing in to Oracle Identity Cloud Service. Or, you can allow them to
 sign in, but prompt them for an additional factor to access resources
 that are protected by Oracle Identity Cloud Service, such as the My
 Profile console or the Identity Cloud Service console.

5.  Navigate to **Security** -\ **Network Perimeters**

![](./media/image127.jpeg)

6.  Click on **Add** to add a new Network Perimeter. Enter an IP range
    as shown below.

![](./media/image128.jpeg)

7.  Click **Save.**

![](./media/image129.jpeg)

8.  Navigate to **Security** -\ **Sign On policies**

![](./media/image130.jpeg)

9.  To define a Sign-On-Policy for the Salesforce App **click** on
    **Add**.

10. Enter a **Policy Name** and **Description** in the Details section.

![](./media/image131.jpeg)

 ![](./media/image132.png)

11. **Click** on **\** button to move to the next section.

12. In the **Sign-On Rules section** click on **Add** to add a new rule.

![](./media/image133.jpeg)

13. Create a rule to prompt for MFA when a user belongs to the
    Salesforce Employees group. Ensure following field are set.

<table
<thead
<tr class="header"
<th<blockquote
<p<strongField</strong</p
</blockquote</th
<th<strongValue</strong</th
</tr
</thead
<tbody
<tr class="odd"
<td<blockquote
<pRule Name</p
</blockquote</td
<tdMFA for Saleforce Employees</td
</tr
<tr class="even"
<td<blockquote
<pAnd is a member of these Groups</p
</blockquote</td
<tdSalesforce Employees</td
</tr
<tr class="odd"
<td<blockquote
<pPrompt for additional Factor</p
</blockquote</td
<tdChecked</td
</tr
<tr class="even"
<td<blockquote
<pEnrollment</p
</blockquote</td
<tdOptional</td
</tr
<tr class="odd"
<td<blockquote
<pFrequency of additional factor when</p
</blockquote</td
<tdOnce per Session</td
</tr
<tr class="even"
<td<blockquote
<pusing a trusted device</p
</blockquote</td
<td</td
</tr
</tbody
</table

 ![](./media/image134.png)

14. Click **Save**.

![](./media/image135.png)

15. Click **Add** to add a second rule. Ensure following field are set.

<table
<thead
<tr class="header"
<th<blockquote
<p<strongField</strong</p
</blockquote</th
<th<strongValue</strong</th
</tr
</thead
<tbody
<tr class="odd"
<td<blockquote
<pRule Name</p
</blockquote</td
<tdBlock from blacklisted IP</td
</tr
<tr class="even"
<td<blockquote
<pAnd user’s client IP address is</p
</blockquote</td
<tdIn one or more of these networks</td
</tr
<tr class="odd"
<td</td
<tdBlacklisted IP’s</td
</tr
<tr class="even"
<td<blockquote
<pAccess is</p
</blockquote</td
<tdDenied</td
</tr
</tbody
</table

![](./media/image136.jpeg)

16. Click **Save** to save the **Rule**.

17. To move the **Block from blacklisted IP** rule to the top click on
    the reorder icon and drag the rule to the top.

![](./media/image137.png)

18. **Click** on the **Apps** tab.

19. **Click** on **Assign** button, **Select** the **Salesforce App**
    and **Click** on **OK.**

![](./media/image138.png)

20. Navigate back to Sign-On Policies and **Activate** the **Salesforce
    App Policy**

![](./media/image139.png)

3.  ## Sign-in as an end user with MFA (Persona: End User)
    
    21. Sign in to IDCS console with a user account that has been
        assigned to the Salesforce application
    
    22. Click on the **Salesforce** tile

![](./media/image140.jpeg)

23. You will be prompted to enable 2-Step verification for your account.
    **Click** on **Enable** to enable 2-Step Verification for the
    account. Note as Enrollment was set as Optional in the Sign-On
    policy the end user is given the option to skip this step

![](./media/image2.png)

24. Select the Auth Factor that you want to enroll. For now, select
    mobile app.

<!-- end list --

  - MFA Options in Oracle Identity Cloud Service: Mobile Authenticator
    Application

![](./media/image142.jpeg)

25. Download the Oracle Mobile Authenticator App on your mobile phone.

26. If your mobile has internet connectivity
    
    1.  Scan the QR code.

27. If your mobile does not have internet connectivity or you are using
    a 3rd party authenticator (e.g. Google Authenticator)
    
    2.  Check “scan offline QR code” and scan the new offline QR code
        that is generated.
    
    3.  After you scan the QR code, the mobile app will generate OTP’s
        every 30 seconds.
    
    4.  Enter the OTP in the passcode field and click Verify.

 ![](./media/image143.png)

28. Once you scan the QR code or enter the OTP (offline mode) your
    mobile app will be enrolled and you will see a Successfully Enrolled
    screen.

![](./media/image144.jpeg)

 You can enroll additional 2-Step Verification methods by clicking on
 the available method.

  - MFA Options in Oracle Identity Cloud Service: Security Questions

<!-- end list --

1.  Click on Security Questions

2.  Select question that you want to use, enter answers that you will
    remember and optionally enter hits for each answer.

![](./media/image145.jpeg)

  - MFA Options in Oracle Identity Cloud Service: Email

<!-- end list --

1.  Click on **Email**

2.  An email containing a **passcode** will be sent to your email
    address.

3.  Enter the passcode in the **Passcode** field and click **Verify**.

![](./media/image146.jpeg)

  - MFA Options in Oracle Identity Cloud Service: Text Message (SMS)

<!-- end list --

1.  Click on Mobile Number.

2.  Enter your mobile number and click on Send.

3.  An SMS (text message) containing an OTP will be sent to your mobile
    number.

4.  Enter the OTP in the passcode field and click on verify

 ![](./media/image147.jpeg)

5.  On the successfully enrolled screen click Done and you will be
    redirected to the Salesforce App.

6.  Click on the Logout link to logout.

7.  Now directly access the Salesforce App URL

8.  Enter your username and password

9.  A notification will be sent to your phone.

 ![](./media/image148.jpeg)

![](./media/image149.png)

10. Open the notification that your received on your phone and tap on
    Allow

11. You will be signed into the Salesforce app.

12. Click on Logout.

13. Now directly access the Salesforce URL

14. Enter your username and password

15. Click on Use backup verification methods.

16. The list of enrolled backup 2-Step Verification methods is
    displayed.

![](./media/image150.jpeg)

17. Select Security Questions

18. Answer the security Question and click verify

 ![](./media/image151.jpeg)

19. You will be signed into the Salesforce app.

20. You can try other 2-Step methods as well.

# Lab: Enabling Adaptive MFA in IDCS

 Adaptive Security is an advanced feature that provides strong
 authentication capabilities for your users, based on their behavior
 within Oracle Identity Cloud Service, and across multiple
 heterogeneous on-premises applications and cloud services.
 
 When activated, the Adaptive Security feature can analyze a user’s
 risk profile
 
 within Oracle Identity Cloud Service based on their historical
 behavior, such as too many unsuccessful login attempts, too many
 unsuccessful MFA attempts, and real-time device context like logins
 from unknown devices, access from unknown locations, blacklisted IP
 addresses, and so on.

1.  ## Enabling Risk Provider (Persona: Administrator)
    
    1.  Login into IDCS Admin console as an administrator
        <span class="underline"https://\<yourtenant\/ui/v1/adminconsole</span
    
    2.  Navigate to **Security** -\ Adaptive
    
    3.  The list of Risk Providers is displayed
    
    4.  Select Edit from the Default Risk provider menu

![](./media/image152.jpeg)

![](./media/image153.png)

5.  On this page you can view or edit the Default Risk provider
    configurations.

![](./media/image154.jpeg)

6.  You can adjust the Low, Medium and High Risk Range.

7.  You can select risk events that you want to enable/disable and also
    associate a risk score with the event.

8.  Navigate back **Security** -\ Adaptive.

9.  Click on the Adaptive Security toggle located at the top of the page
    to enable the feature.

 ![](./media/image155.jpeg)

10. You can add additional Risk Providers by clicking on the Add button.
    IDCS currently support integration with Symantec Cloud SOC.
    Integration with Oracle CASB and other 3rd party risk providers are
    also planned.

11. For this lab we will use the Default Risk Provider.

<!-- end list --

2.  ## Use Risk as a condition in Sign-On Policy (Persona: Administrator)
    
    12. Log into IDCS Admin console as an administrator

 https://idcs-tenant.identity.oraclecloud.com/ui/v1/adminconsole

13. Navigate to **Security** -\ **Sign On policies**

14. **Click** on **Edit** to edit the Salesforce App Policy

![](./media/image156.png)

15. Navigate to the Sign-On Rules tab and **Click** on **Edit** to edit
    the MFA for Salesforce Employees rule

![](./media/image157.png)

16. You can now use Risk as a condition in the Rule.

17. ![](./media/image158.png)Add condition

### Risk Provider Name Operator

 ![](./media/image159.jpeg)**Score**
 
 7\) Scroll down and click Save.
 
 Default Risk Provider
 
 \< (less than, note default is greater 90

3.  ## End User risk evaluation (Persona: Administrator / End User)
    
    18. Log into IDCS Admin console as an administrator

 https://idcs-tenant.identity.oraclecloud.com/ui/v1/adminconsole

19. Navigate to User and click on Add

20. Create a user with the following details
    
    1.  First Name: Demo
    
    2.  Last Name: User2
    
    3.  User Name: demo.user2
    
    4.  Email: *\<your email address\*

21. Click on the Groups tab and assign the Salesforce Employee group the
    user.

![](./media/image160.jpeg)

22. Logout of IDCS.

23. ![](./media/image161.png)Activate the user by clicking on the
    activation link that was sent to the user’s email address.

 ![](./media/image162.jpeg)

24. Enter a password when prompted.

25. Click on the Continue link on the password set success page.

26. Click on the Salesforce application tile to launch the application
    in a new tab.

![](./media/image163.png)

27. Click on Enable to enable 2-Step verification

28. Enroll any 2-Step verification

29. Click done you will be prompted for MFA.

30. Logout

![](./media/image2.png)

31. Log into IDCS Admin console as an administrator

 https://idcs-tenant.identity.oraclecloud.com/ui/v1/adminconsole

32. Navigate to the User

33. Notice that each user now has an associated risk.

 ![](./media/image164.jpeg)

34. Click on Demo User2

35. Click on the Security tab.

36. The Default Risk Provider has generated a risk score of 12 for this
    user based on the risk events that we enabled and configured.

 ![](./media/image165.jpeg)

37. Click on the Default Risk Provider tile and then scroll down to view
    Risk Incident Details.

38. On this page you get a historical view of risk score and the list of
    Risk Events.

![](./media/image166.jpeg)

# Additional Tutorials, Videos and References for IDCS

 Get Started
 
 [<span class="underline"https://docs.oracle.com/en/cloud/paas/identity-cloud/index.html</span](https://docs.oracle.com/en/cloud/paas/identity-cloud/index.html)
 
 Tutorials
 
 [<span class="underline"https://docs.oracle.com/en/cloud/paas/identity-cloud/tutorials.html</span](https://docs.oracle.com/en/cloud/paas/identity-cloud/tutorials.html)
 
 Videos
 
 [<span class="underline"https://docs.oracle.com/en/cloud/paas/identity-cloud/videos.html</span](https://docs.oracle.com/en/cloud/paas/identity-cloud/videos.html)
 
 A-Team Chronicles - PaaS – Security
 [<span class="underline"http://www.ateam-oracle.com/paas-security/</span](http://www.ateam-oracle.com/paas-security/)
 
 IMC Blog
 
 [<span class="underline"https://blogs.oracle.com/imc</span](https://blogs.oracle.com/imc)

![](./media/image2.png)
