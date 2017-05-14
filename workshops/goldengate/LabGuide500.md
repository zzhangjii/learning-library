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

### **STEP 1**On Prem

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

### **STEP 1**On GGCS

1.      Navigate to /u02/data/ggcc/agent/conf folder. This folder contains the agent.properties file. Make a copy of the agent.properties file to save the original version, and then open it for editing.

2.      Replace 11.111.111.111 placeholders with student ip addresses of the ggcs VM. Leave other parameters at the default.

ggInstanceHost=11.111.111.111
ggccServiceHost=11.111.111.111

3.      cd $GGHOME

4.      ./ggsci

5.      Create datastore and bounce processes

GGSCI > create datastore
GGSCI > info all
GGSCI>  stop *
GGSCI > stop mgr
GGSCI > start mgr
GGSCI > start *DW

6.      Add weblogic credentials by executing the following:

/u01/app/oracle/middleware/ggccagent/bin/ggccAgent.sh /u02/data/ggcc/agent/conf/agent.properties createServerCred

Enter and confirm (these are from the weblogic instance designated when GGCS instance was created):
               Username:  weblogic
               Password:  ggcs2017_

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