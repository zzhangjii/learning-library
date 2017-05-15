![](images/500/lab500.png)

Update May 2, 2017

## Introduction

This is the fifth of five GoldenGate Cloud Service labs, and will review GGCS monitoring.

To log issues and view the lab guide source, go to the [github oracle](https://github.com/pcdavies/GoldenGateCloudService/tree/master/workshops/goldengate/issues) repository.

## Objectives

- Configure GGCS for monitoring.
- Start monitoring services and review activity.

## Required Artifacts

- Access to your Oracle Cloud account, and GGCS and the Compute image.

### **STEP 1**: Configure On-premise

- Log into VNC and open file browser in the Compute instance.
	- **Edit the following file and udate the IP address with the GGCS IP:** `/u01/app/oracle/product/ggcc_instance/conf/agent.properties`

![](images/500/i1.png)

- Update the following fields:
    - **ggInstanceHost=** `<ip address of on prem vm>`
    - **ggccServiceHost=** `<ip address of ggcs vm>`
    - **proxy-127.0.0.1=** `<ip address of ggcs vm>`

![](images/500/i2.png)

- Start GoldenGate Cloud Service agent:
    - **Open the workshop folder on the desktop.**
    - **Double click on the following file:** `start_ggccagent.sh` 
    - **Select Run in Termainl.  LEAVE THIS WINDOW OPEN**

![](images/500/i3.png)

-  Open a new terminal window:
    - **Enter the following:** `cd $GGHOME`
    - **Start ggsci:** `./ggsci`
    - **Start jagent:** `start jagent`

![](images/500/i4.png)

### **STEP 2**: Configure GGCS

- Open a terminal window on the OGG Compute image and ssh to GGCS:
	- **SSH to GGCS:** `ssh -i /home/oracle/Desktop/GGCS_Workshop_Material/keys/ggcs_key opc@<your ggcs IP address>`
	- **Switch to user oracle:** `sudo su - oracle`
    - **Enter the following:** `cp /u02/data/ggcc/agent/conf/agent.properties /u02/data/ggcc/agent/conf/agent.properties_bu`
    - **Edit the file and replace 11.111.111.111 placeholders with student ip addresses of the ggcs VM. Leave other parameters at the default:** `vi /u02/data/ggcc/agent/conf/agent.properties`
        - `ggInstanceHost=11.111.111.111`
        - `ggccServiceHost=11.111.111.111`
	- **Use the arrows on your keyboard to navigate to the IP address**
	- **Use the `i` character to enter insert mode and the `[ESC]` key to exit insert mode**
	- **Enter your DBCS IP address:** see highlighted text below
	- **Use the `x` key to delete characters**
	- **To save enter `:` character and then `x` character**

![](images/500/i5.png)

- Open a ggsci command shell and enter the following.
    - **Enter:** `cd $GGHOME`
    - **Start ggsci:** `./ggsci`
    - **Create datastore:** `create datastore`
    - **Review processes:** `info all`
    - **Stop processes:** `stop *`
    - **Stop Manager:** `stop mgr`
    - **Start Manager:** `start mgr`
    - **Start DW Processes:** `start *DW`

![](images/500/i6.png)

- Add weblogic credentials by executing the following: (**Note - screen shot below shows creds have already been created at the point of screen capture for this lab doc)
    - **Exit ggsci:** `exit`
    - **Enter:** `/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties createServerCred`

![](images/500/i7.png)

- ********************************************** START BACK HERE MONDAY AM TO FINISH DOC *******************************************

- Enter and confirm (these are from the weblogic instance designated when GGCS instance was created):
    - **Username:**  `weblogic`
    - **Password:**  `ggcs2017_`

7.      Start the agent by running the following

/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties start

Note: If you ever need to stop the agents, in the above commands, replace start with stop.

8.      Integrate the agent with the GoldenGate instance

/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties intgGGSCI $GGHOME

9.      Start the jagent

GGSCI > start jagent
GGSCI > info all

10.   Open GoldenGate Control Console from GoldenGate Cloud Service Console (hamburger menu to right of service name)
 
Log in with
               Username:  weblogic
               Password:  ggcs2017_

11.   Review
·        Catalog/Instances
·        Catalog Tasks
·        Policies

12.   Review Dashboard Hot Tables (if data is not showing then use SQLDeveloper gentrans.sql to run some data through)

13.   GGSCI > stop EXTDW process

14.   Review Changes in status in instances, tasks.

15.   Look at notifications. Should be a service unavailable notification.

16.   GGSCI > start EXTDW process

17.   Review Changes in status in instances, tasks. 