![](images/400/lab400.png)

Update May 2, 2017

## Introduction

This is the fourth of five GoldenGate Cloud Service labs, and will review GGCS monitoring.

To log issues and view the lab guide source, go to the [github oracle](https://github.com/pcdavies/GoldenGateCloudService/issues) repository.

## Objectives

- Configure GGCS for monitoring.
- Start monitoring services and review activity.

## Required Artifacts

- Access to your Oracle Cloud account, and GGCS and the Compute image.

### **STEP 1**: Configure On-premise

- Log into VNC on the Compute instance and open Firefox WEB browser and go to `<ip addresss of ggcs vm>:7809/groups`.  All processes should be up and running.  This is necessary to ensure the monitoring agent will start the first time.

![](images/400/i1.1.png)

- Next open a file browser in the Compute instance.
	- **Edit the following file and udate the IP address with the GGCS IP:** `/u01/app/oracle/product/ggcc_instance/conf/agent.properties`

![](images/400/i1.png)

- Update the following fields:
    - **ggInstanceHost=** `<ip address of on prem vm>` Field ***OG1***
    - **ggccServiceHost=** `<ip address of ggcs vm>` Field ***GG1***
    - **proxy-127.0.0.1=** `<ip address of ggcs vm>` Field ***GG1***

![](images/400/i2.png)

- Start GoldenGate Cloud Service agent:
    - **Open the workshop folder on the desktop.**
    - **Double click on the following file:** `start_ggccagent.sh` 
    - **Select Run in Termainl.  LEAVE THIS WINDOW OPEN**

![](images/400/i3.png)

-  Open a new terminal window:
    - **Enter the following:** `cd $GGHOME`
    - **Start ggsci:** `./ggsci`
    - **Start jagent:** `start jagent`

![](images/400/i4.png)

### **STEP 2**: Configure GGCS

- Open a terminal window on the OGG Compute image and ssh to GGCS:
	- **SSH to GGCS:** `ssh -i /home/oracle/Desktop/GGCS_Workshop_Material/keys/ggcs_key opc@<your ggcs IP address>` Field ***GG1***
	- **Switch to user oracle:** `sudo su - oracle`
    - **Enter the following:** `cp /u02/data/ggcc/agent/conf/agent.properties /u02/data/ggcc/agent/conf/agent.properties_bu`
    - **Edit the file and replace 11.111.111.111 placeholders with student ip addresses of the ggcs VM. Leave other parameters at the default:** `vi /u02/data/ggcc/agent/conf/agent.properties`
        - `ggInstanceHost=11.111.111.111` Field ***GG1***
        - `ggccServiceHost=11.111.111.111` Field ***GG1***
	- **Use the arrows on your keyboard to navigate to the IP address**
	- **Use the `i` character to enter insert mode and the `[ESC]` key to exit insert mode**
	- **Enter your DBCS IP address:** see highlighted text below
	- **Use the `x` key to delete characters**
	- **To save enter `:` character and then `x` character**

![](images/400/i5.png)

- Open a ggsci command shell and enter the following.  Note the data store may already exist, if so ignore messages that relate to this.
    - **Enter:** `cd $GGHOME`
    - **Start ggsci:** `./ggsci`
    - **Create datastore:** `create datastore`
    - **Review processes:** `info all`
    - **Stop Manager:** `stop mgr`
    - **Start Manager:** `start mgr`
    - **Start DW Processes:** `start *`

![](images/400/i6.png)

- Add weblogic credentials by executing the following: (**Note - screen shot below shows creds have already been created at the point of screen capture for this lab doc)
    - **Exit ggsci:** `exit`
    - **Enter:** `/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties createServerCred`
    - **You will be prompted separately for weblogic username (enter twice) and password (enter twice):**
        - **Userid:**: Field ***GG2***
        - **Confirm Userid:** Field ***GG2***
        - **Password:** Field ***GG3***
        - **Confirm Password:** Field ***GG3***

![](images/400/i7.png)

- Start the agent by running the following.  **BE SURE TO LEAVE THIS WINDOW OPEN, DO NOT CLOSE IT!**
    - **Run the following:** `/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties start`

![](images/400/i8.png)

- Open a new terminal window and SSH into ggcs.  Run a process that Integrates the agent with the GoldenGate instance. Then log into ggsci and start jagent.
	- **SSH to GGCS:** `ssh -i /home/oracle/Desktop/GGCS_Workshop_Material/keys/ggcs_key opc@<your ggcs IP address>` Field ***GG1***
	- **Switch to user oracle:** `sudo su - oracle` 
    - **Run the following:**  `/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties intgGGSCI $GGHOME`
    - **Enter:** `ggsci`
    - **Enter:** `info all`
    - **Enter:**  `start jagent`
    - **Confirm the agent is runnning:** `info all`

![](images/400/i9.png)

### **STEP 3**: Review Monitoring Services

- Return to your web browser and log into Oracle Cloud and open GoldenGate Control Console from GoldenGate Cloud Service Console (hamburger menu to right of service name)
    - **Log into Oracle cloud:** Fields ***CS1***, ***CS2***, ***CS3***, and ***CS4***

![](images/400/i10.png)

- Access the console using the hamburger menu on the right and log into the Console:
    - **Username:**  Field ***GG2***
    - **Password:**  Field ***GG3***

![](images/400/i11.png)

![](images/400/i12.png)

- Review
    - **Catalog/Instances**
    - **Catalog Tasks**
    - **Policies**

![](images/400/i13.png)

- Review Dashboard Hot Tables.  Click on the largest bar graph.

![](images/400/i14.png)

- Note the replication detail.

![](images/400/i14.1.png)

- Navigate to instances.  To help clarify which is the on-premise instance and which is the GGCS instance click on the name and rename it.  Provide the names GGCS and On-Prem.  This particular screenshot uses IP addresses from a different instance and will not be consistent with others used throughout these labs.

![](images/400/i14.5.png)

![](images/400/i14.4.png)

- Note the status of the two instances (up and available).

![](images/400/i14.2.png)

- Navigate to tasks.  Review activity.

![](images/400/i14.6.png)

- Return to ggsci and stop EXTDW process.  You may need to open a new terminal window (if you closed it previously):
	- **SSH to GGCS:** `ssh -i /home/oracle/Desktop/GGCS_Workshop_Material/keys/ggcs_key opc@<your ggcs IP address>` Field ***GG1***
	- **Switch to user oracle:** `sudo su - oracle` 
    - **Enter the following:**  `stop EXTDW`

![](images/400/i14.3.png)

- Return to the Console and review Changes in status in instances, tasks.  

![](images/400/i15.1.png)

- Review Notifications.  Note the service is down.

![](images/400/i16.png)

- Go back to ggsci and start EXTDW process.
    - **Enter the following:** `start EXTDW`

![](images/400/i17.png)

- Return to the Console and review changes in status in instances, tasks. Note service is back up.

![](images/400/i18.png)
