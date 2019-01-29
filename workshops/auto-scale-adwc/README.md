# Oracle Autonomous Data Warehouse Auto Scaling Workshop
The purpose of this document is to help setting up the Autonomous data warehouse Auto scaling demo on your tenancy. This document covers systematic process to install the demo into any tenancy on oracle cloud.

Time to Complete
Approximately 180 minutes.
## Getting Started

### Goals for this workshop

**1. Get comfortable with Oracle's public cloud services**

**2. ADWCS Provisioning**

**3. DBaaS Provisioning**

**4. APEX and ORDS Installation**

**5. Auto Scaling Demo Installation**

**6. Manage and Monitor an ADW instance**

**7. Auto Scale up/down an ADW instance**
### Acquire an Oracle Cloud Trial Account

 If you already have an Oracle Cloud account then you can skip this section. If you don't have an Oracle Cloud account then you can quickly and easily sign up for a free trial account that provides:
  $300 of free credits good for up to 3500 hours of Oracle Cloud usage
 Credits can be used on all eligible Cloud Platform and Infrastructure services for the next 30 days
 Your credit card will only be used for verification purposes and will not be charged unless you 'Upgrade to Paid' in My Services
 Click on the image below to go to the trial sign-up page which will allow you to request your free cloud account:

  <a href="https://myservices.us.oraclecloud.com/mycloud/signup?language=en&sourceType=:ex:tb:::RC_NAMK181017P00031:ADW_IMHOL&SC=:ex:tb:::RC_NAMK181017P00031:ADW_IMHOL&pcode=NAMK181017P00031" target="_blank"><img src="http://www.oracle.com/webfolder/technetwork/tutorials/learning_path/images/700705-auto-dw-social-bn728_-152.png"/></a>

  Once your trial account is created, you will receive a Welcome to Oracle Cloud email that contains your cloud account password along with links to useful collateral. Click here to sign into the Oracle Cloud, go to: <a href="https://myservices.us.oraclecloud.com/mycloud/signup?language=en&sourceType=:ex:tb:::RC_NAMK181017P00031:ADW_IMHOL&SC=:ex:tb:::RC_NAMK181017P00031:ADW_IMHOL&pcode=NAMK181017P00031" target="_blank">https://cloud.oracle.com</a>



#### What is an Autonomous Data Warehouse?

Oracle Autonomous Data Warehouse is built around the market leading Oracle database and comes with fully automated data warehouse specific features that deliver outstanding query performance.  This environment is delivered as a fully managed cloud service running on optimized high-end Oracle hardware systems.  You don’t need to spend time thinking about how you should store your data, when or how to back it up or how to tune your queries.  

We take care of everything for you.

Click here to <a href="https://www.youtube.com/watch?v=tZMZODoi2xw" target="_blank">watch our short video</a> that explains the key features in Oracle's Autonomous Data Warehouse.

Oracle’s Autonomous Data Warehouse is the perfect quick-start service for fast data loading and sophisticated data reporting and analysis.  Oracle manages everything for you so you can focus on your data.

Read on to begin your Getting Started journey with Oracle Autonomous Data Warehouse.


#### Lab Prerequisites – Required Software
- Oracle APEX Release 18.2.0.00.12
- Oracle REST Data Services 18.4

<a href="https://cloudcustomerconnect.oracle.com/resources/32a53f8587/summary" target="_blank">**Cloud Customer Connect**</a> Forum for Autonomous Data Warehouse
If you have a question during this workshop then use the Autonomous Data Warehouse Forum to post questions, connect with experts, and share your thoughts and ideas about Oracle Autonomous Data Warehouse.

Are you are completely new to the <a href="https://cloudcustomerconnect.oracle.com/resources/32a53f8587/summary" target="_blank">**Cloud Customer Connect**</a> forums? Visit our  <a href="https://cloudcustomerconnect.oracle.com/pages/1f00b02b84" target="_blank">Getting Started forum page</a> to learn how to best leverage community resources.

### Notional Architecture
![](./images/1.PNG)
![](./images/Notional_Architecure.PNG)

#### What Do You Need?
Before starting this instruction, you should:
-	Have already procured and activated a trial or paid subscription to the following cloud services.
-	Oracle Database Cloud - Database as a Service (DBaaS). Don't have a subscription? Go to Oracle Store or [Oracle Try It](https://cloud.oracle.com/database)
-	Capacity requirement 
-	**Minimum 2 OCPU for DBaaS 256GB of storage**
-	**Minimum 5 OCPU for Autonomous Data warehouse cloud and 1 TB of storage**
-	Subscription to Oracle Autonomous Data Warehouse
-	Your Oracle Cloud user name, password, and identity domain

locate your account details in the New Account Information email that you received from Oracle Cloud when your user account was set up. If you do not have your New Account Information email, contact your account administrator.
-	Tenancy in Oracle Cloud Infrastructure, including the creation of a compartment and the setting of access to resources (see Oracle Cloud Infrastructure documentation for setting up your tenancy).
-	Oracle SQL Developer (see Oracle Technology Network download site). Version 18.3 or later. Versions 18.2 or later contain enhancements for key Autonomous Data Warehouse features. 
Note:
If you are a Windows user on 64-bit platform, download the 'Windows 64-bit with JDK 8 included' distribution as it includes the files necessary to run SQL Developer and connect to your Autonomous Data Warehouse database. 

If you are using a SQL Developer version earlier than 18.2, see the documentation topic Connecting with Oracle SQL Developer (earlier than Version 18.2).
-	Have installed PuTTY for Windows. PuTTY is available from many sites, but you can reach the main download site [Download putty](http://www.putty.org)
-	Have installed the latest version of Oracle SQL Developer from [SQL Developer Download](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html)
-	Have one of the supported browsers:
1.	Microsoft Internet Explorer: version 9 or 10; set Browser Mode to IE9 or IE10
2.	Mozilla Firefox: version 24 and later
3.	Google Chrome: version 29 and later
4.	Apple Safari: version 6

### Proceed to the Lab Guides
- Once you are viewing the Workshop's GitHub Pages website, you can see a list of Lab Guides at any time by clicking on the **Menu Icon**

![](./images/WorkshopMenu.png)





