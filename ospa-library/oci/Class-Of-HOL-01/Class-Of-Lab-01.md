![](./media/image1.png)

## Class of SE - HOL Part 1 - Cloud access and creating a compartment
Contents

[Section 1. Overview](#overview)

[Section 2. Oracle Cloud Account](#oracle-cloud-account)

[Section 3. Create a Compartment](#create-a-compartment)


## 
#
# Overview

This lab will introduce you to the Oracle Cloud Infrastructure service.
In part one we'll login and verify that our accounts are working and setup correctly. 
Then we'll create a compartment that will contain the resources we'll create as the course progresses.  This lab is designed to be a step by step introduction to the basic OCI services.

## Objectives

1.  Obtain and access an Oracle Cloud Account

2.  Create a Compartment and a VCN

## Requirements

  - Supported web browswer
  - Internet access
  - Pre-provisioned cloud account
  
  ## Lab Purpose and Requirements

The purpose of this workshop is to familiarize attendees with the feature functionality of Oracle Cloud Infrastructure. It is assumed that attendees have a solid understanding of basic related concepts such as familiarity with Linux administration, basic network principles, and data storage technologies.

To optimize your experience there are some general guidelines that will help you get the most from these lab exercises.

  - **Read through an entire exercise before executing any of the steps.** 
  Merely following the screen shots or script files without understanding the flow will diminish your learning experience.

  - **Follow the steps as shown in the workshop manual.**
    Don’t freestyle during the labs. This is a live environment. If you want to do something that is not in the labs, ask the lab instructor first. In particular, do not create, delete, or alter any database objects without asking first.

  - **There is no prize for finishing first; there is no penalty for finishing last.** 
  The goal is to gain a firm understanding of Oracle Cloud Infrastructure.

  - **Ask questions freely.** 
  The only dumb questions are those that are not asked.

# Oracle Cloud Account

1.  Login to the Oracle Cloud. Your username and tenancy have been
    created in advance. Your login information will be sent via email.
    Look for an email from Oracle Cloud.

![](./media/image6.png)

*<p align="center">Figure 1: Sample email </p>*


2.  Click the link in the email to access your
    services directly. Use the ***userid*** and ***temporary password***
    from the email to login. You will be asked to change your password.
    Be prepared with a strong password that meets the security criteria.

**Note:** *Your username will be your Oracle email address.*

> ![](./media/image8.png)

*<p align="center"> Figure 2: Cloud Account login screen</p>*

> ![](./media/image9.png)

*<p align="center"> Figure 3: Password reset screen</p>*

> ***Password Criteria:***

  - *Password must have at least 12 characters*
  - *Password cannot exceed 40 characters*
  - *Password cannot contain the First or Last Name of the user*
  - *Password cannot contain the user name*
  - *Password must have at least 1 lower case character*
  - *Password must have at least 1 upper case character*
  - *Password must have at least 1 numeric character*
  - *Cannot repeat the last 4 passwords*

**Note:** *If you <span class="underline">haven’t received an
introduction email</span> you can login directly and request a password reset. Open a browser and
navigate to:* <span class="underline">
<https://cloud.oracle.com/en_US/sign-in>.</span> *Use the ‘**Can’t Sign
In**’ link to reset your password, a password reset link will be sent to
your email.  The initial invitation will expire within 24 hours.  If your login offer has expired, contact an admin.*

![](./media/image10.png)

*<p align="center"> Figure 4: Reset password</p>*

3.  After you’ve successfully logged in, you should arrive at the Guided
    Journey screen. Choose the hamburger icon at the top left of the
    screen click **Services**, and choose **Compute.**  This will take you to the OCI interface.

![](./media/image11.png)

*<p align="center"> Figure 5: Guided Journey Screen</p>*

# Create a Compartment

Compartments are logical containers used to isolate resources within your OCI tenant.  Creating resources in the root compartment is not a best practice.  During the lab exercises, we suggest that you create a compartment for your team. You can create all required resources and apply user based
access policies within a compartment.

1.  Click the **hamburger icon** in the upper left corner to open the navigation menu. Under the **Identity** section of the menu, click **Compartments**

![](./media/image12.png)

*<p align="center"> Figure 6: OCI Console Compartments menu</p>*

2. Click **Create Compartment**

**Note:** *If you don’t have the proper permissions, see your tenancy administrator*

![](./media/image13.png)

*<p align="center"> Figure 7:  Create compartment button</p>*

3.  Choose a descriptive **name** and enter it in the name field. Enter
    a **Description** and click **Create Compartment**.

![](./media/image14.png)

*<p align="center"> Figure 8: Create compartment dialog</p>*

4.  The compartment name will show up in the list.

![](./media/image15.png)

*<p align="center"> Figure 9: Compartment List</p>*

**Note:** If you want to view the compartment details, change the
compartment name, or delete the compartment, click the ellipses and
choose an option.

![](./media/image16.png)

*<p align="center"> Figure 10: Compartment options</p>*

![](./media/image99.png)

This lab segment is complete.    If there is time left before the next lecture, browse the OCI cloud interface and familiarize yourself with the layout and basic services.  Wait for the instructor to let you know when to begin section 2.

[Back to top](#Class-of-SE---HOL-Part-1---Cloud-access-and-creating-a-compartment)

##