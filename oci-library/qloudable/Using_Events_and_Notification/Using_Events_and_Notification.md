# Using Events and Notification
## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Sign in to OCI Console and configure Notification and Event](#sign-in-to-oci-console-and-configure-notification-and-event)

[Create VCN and compute instance and verify notifications](#create-vcn-and-compute-instance-and-verify-notifications)

[Delete the resources](#delete-the-resources)

## Overview

The Oracle Cloud Infrastructure Notifications service broadcasts messages  to distributed components through a publish-subscribe pattern, delivering secure, highly reliable, low latency and durable messages for applications hosted on Oracle Cloud Infrastructure and externally.
The Notifications service enables you to set up communication channels for publishing messages using topics  and subscriptions . When a message is published to a topic, the Notifications service sends the message to all of the topic's subscriptions.
In this lab we will verify notifications when a compute instance is launched and deleted

**Some Key points;**

**We recommend using Chrome or Edge as the broswer. Also set your browser zoom to 80%**


- All screen shots are examples ONLY. Screen shots can be enlarged by Clicking on them

- Login credentials are provided later in the guide (scroll down). Every User MUST keep these credentials handy.

- Do NOT use compartment name and other data from screen shots.Only use  data(including compartment name) provided in the content section of the lab

- Mac OS Users should use ctrl+C / ctrl+V to copy and paste inside the OCI Console

- Login credentials are provided later in the guide (scroll down). Every User MUST keep these credentials handy.

**Cloud Tenant Name**
**User Name**
**Password**
**Compartment Name (Provided Later)**

**Note:** OCI UI is being updated thus some screenshots in the instructions might be different than actual UI

## Pre-Requisites

1. OCI Training : https://cloud.oracle.com/en_US/iaas/training

2. Familiarity with OCI console: https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/console.htm

3. Overview of Networking: https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/overview.htm

4. Familiarity with Compartments: https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/concepts.htm

5. Connecting to a compute instance: https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/accessinginstance.htm

## Sign in to OCI Console and configure Notification and Event

* **Tenant Name:** {{Cloud Tenant}}
* **User Name:** {{User Name}}
* **Password:** {{Password}}
* **Compartment:**{{Compartment}}


1. Sign in using your tenant name, user name and password. Use the login option under **Oracle Cloud Infrastructure**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Grafana/img/Grafana_015.PNG" alt="image-alt-text">

2. First we will create a Notification topic and subscribe to this topic. From OCI Services menu,Click **Notifications** under **Application Integration**

3. Click **Create Topic** and fill out the dialog box:

- **Name**: Provide a name
- **Description**: Provide a description

3. Click **Create**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Using_Events_and_Notification/img/Events_001.PNG" alt="image-alt-text">

4. Once the topic state changes to **Active**, Click the topic Name. Click **Create Subscription** and fill out the dialog box:

- **PROTOCOL**: Email
- **EMAIL**: Provide your email id

5. Click **Create**

6. Subscription details screen will be displayed with subscription status showig **Pending**.

7. Check the email account you specifed and click the verification link for this subscription. Switch back to OCI console window and verify the subscription status chanegd to **Active**

8. You are now subsribed to a Notification topic. Next we will configure Events that will publish messages to this Notification topic.

9. From OCI Services menu,Click **Event Service** under **Application Integration**

10. Click **Create Rule**, Fill out the dialog box:

- **DISPLAY NAME** : Provide a name
- **DESCRIPTION** : Provide a description

Under **Rule Conditions**

- Ensure **Event Type** is selected
- **SERVICE NAME**: Compute
- **EVENT TYPE** : Choose these 4 Types from the drop down menu. **Instance-Launch Begin**, **Instance-Launch End**, **Instance-Terminate Begin**, **Instance-Terminate End**

Under **Actions**

- **ACTION TYPE**: Notifications
- **NOTIFICATIONS COMPARTMENT**: Choose your compartment 
- **TOPIC**: Choose the topic created earlier

11. Click **Create Rule**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Using_Events_and_Notification/img/Events_002.PNG" alt="image-alt-text">


**We have now configured Notification service and tied events to it with a specific compartment. When a new compute instance is launched or terminated an email notification will be sent to the email address specified**

## Create VCN and compute instance and verify notifications

1. From the OCI Services menu,Click **Virtual Cloud Network** under Networking and Click **Create Virtual Cloud Network**

2. Select the compartment assigned to you from drop down menu on left part of the screen

**NOTE:** Ensure the correct Compartment is selected under COMPARTMENT list

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL001.PNG" alt="image-alt-text">


<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL002.PNG" alt="image-alt-text">

3. Fill out the dialog box:

- **Create in Compartment:** Has the correct compartment
- **Name:** Enter easy to re¬member name
- **Create Virtual Cloud Network Plus Related Resources:** Select this option.
- Click **Create Virtual Cloud Network**
- Click **Close**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL003.PNG" alt="image-alt-text">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL004.PNG" alt="image-alt-text">
            
            
4. From OCI services menu, Click **Instances** under **Compute** 

8. Click Create Instance. Fill out the dialog box:


- **Name:** Enter a name 
- **Availability Domain:** Select availability domain
- **Image Operating System:** For the image, we recommend using the Latest Oracle Linux available.
- **Choose Instance Type:** Select Virtual Machine
- **Choose Instance Shape:** Select VM shape (Choose from VM.Standard2.1, VM.Standard.E2.1, VM.Standard1.1, VM.Standard.B1.1)
- **Configure Boot Volume:** Leave the default
- **Add SSH Keys:** Leave empty
- **Virtual Cloud Network Compartment:** Choose your compartment
- **Virtual Cloud Network:** Select the VCN you created in the previous section. 
- **Subnet Compartment:** Choose your compartment. 
- **Subnet:** Choose the first Subnet

9. Click **Create**

**NOTE:** If 'Service limit' error is displayed choose a different shape from VM.Standard2.1, VM.Standard.E2.1, VM.Standard1.1, VM.Standard.B1.1  OR choose a different AD

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0011.PNG" alt="image-alt-text">


3. Select the compartment assigned to you from drop down menu on left part of the screen

**NOTE:** Ensure the correct Compartment is selected under COMPARTMENT list

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL001.PNG" alt="image-alt-text">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL002.PNG" alt="image-alt-text">

4. Fill out the dialog box:


- **Name:** Enter easy to remember name
- **Create in Compartment:** Has the correct compartment
- **Create Virtual Cloud Network Plus Related Resources:** Select this option.
- Click **Create Virtual Cloud Network**
- Click **Close**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL003.PNG" alt="image-alt-text">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL004.PNG" alt="image-alt-text">
              
## Create ssh keys and compute instance

1. Click the Apps icon in the toolbar and select  Git-Bash to open a terminal window.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL006.PNG" alt="image-alt-text">

2. Enter command 
```
ssh-keygen
```
**HINT:** You can swap between OCI window, 
git-bash sessions and any other application (Notepad, etc.) by Clicking the Switch Window icon 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL007.PNG" alt="image-alt-text">

3. Press Enter When asked for 'Enter File in which to save the key', 'Created Directory, 'Enter passphrase', and 'Enter Passphrase again.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL008.PNG" alt="image-alt-text">

4. You should now have the Public and Private keys:

/C/Users/ PhotonUser/.ssh/id_rsa (Private Key)

/C/Users/PhotonUser/.ssh/id_rsa.pub (Public Key)

**NOTE:** id_rsa.pub will be used to create 
Compute instance and id_rsa to connect via SSH into compute instance.

**HINT:** Enter command 
```
cd /C/Users/PhotonUser/.ssh (No Spaces) 
```

and then 

```
ls 
```
to verify the two files exist. 

5. In git-bash Enter command  
```
cat /C/Users/PhotonUser/.ssh/id_rsa.pub
```

, highlight the key and copy 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL009.PNG" alt="image-alt-text">

6. Click the apps icon, launch notepad and paste the key in Notepad (as backup)

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0010.PNG" alt="image-alt-text">

7. Switch to the OCI console. From OCI servies menu, Click **Instances** under **Compute** 

8. Click Create Instance. Fill out the dialog box:


- **Name:** Enter a name 
- **Availability Domain:** Select availability domain
- **Image Operating System:** Click **Change Image Source**. In the new window, Click **Oracle Images** Choose **Oracle Cloud Developer Image**. Scroll down, Accept the Agreement and Click **Select Image**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Deploying_OCI_Streaming_service/img/Stream_009.PNG" alt="image-alt-text">


- **Choose Instance Type:** Select Virtual Machine
- **Choose Instance Shape:** Select VM shape (Choose from VM.Standard2.1, VM.Standard.E2.1, VM.Standard1.1, VM.Standard.B1.1)
- **Configure Boot Volume:** Leave the default
- **Add SSH Keys:** Choose 'Paste SSH Keys' and paste the Public Key saved earlier.
- **Virtual Cloud Network Compartment:** Choose your compartment
- **Virtual Cloud Network:** Select the VCN you created in the previous section. 
- **Subnet Compartment:** Choose your compartment. 
- **Subnet:** Choose the first Subnet

9. Click **Create**

**NOTE:** If 'Service limit' error is displayed choose a different shape from VM.Standard2.1, VM.Standard.E2.1, VM.Standard1.1, VM.Standard.B1.1  OR choose a different AD

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0011.PNG" alt="image-alt-text">

10. Switch to your email account and verify an event indicating compute instance launch was received

11. Wait for Instance to be in **Running** state. 

12. Switch to your email account and verify an event indicating compute instance create was received


## Delete the resources

1. Switch to  OCI console window

2. If your Compute instance is not displayed, From OCI services menu Click **Instances** under **Compute**

3. Locate first compute instance, Click Action icon and then **Terminat** 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0016.PNG" alt="image-alt-text">

4. Make sure Permanently delete the attached Boot Volume is checked, Click Terminate Instance. Wait for instance to fully Terminate

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0017.PNG" alt="image-alt-text">

5. Switch to your email account and verify an event indicating compute instance terminate was received

6. Once the compute instance is fully terminted another email notification will arrive

7. From OCI services menu Click **Virtual Cloud Networks** under Networking, list of all VCNs will 
appear.

7. Locate your VCN , Click Action icon and then **Terminate**. Click **Delete All** in the Confirmation window. Click **Close** once VCN is deleted

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0018.PNG" alt="image-alt-text">

8. Navigate to **Functions** under **Developer Servies**. Click the action icon and Click **Delete**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Fn/img/Fn_002.PNG" alt="image-alt-text">

9. From OCI Services menu,Click **Notifications** under **Application Integration**. Click your Topic name

10. Click **Delete**

11. From OCI Services menu,Click **Event Service** under **Application Integration**

12. Click your Rule name and Click **Delete**. In the dialog box type **DELETE** and click **Delete**
 

**Congratulations! You have successfully completed the lab**
