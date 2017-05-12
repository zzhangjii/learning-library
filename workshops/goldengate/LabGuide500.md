![](images/500/lab500.png)

Update May 2, 2017

## Introduction

This is the fourth of five GoldenGate Cloud Service labs, and covers the third use case: Replication and transformation of data from a DBCS 12c pluggable database to a DBCS 12c reporting data warehouse with Business Intelligence analytics access.

![](images/100/i4.png)

This workshop will walk you through replacation of data from a DBCS 12c Pluggable database to another DBCS 12c Pluggable database.  This lab will introduce data transformations as part of the replication process, and will show how you can deliver real-time analytics through Oracle Business Intelligence data visualizations and dashboards.

Please direct comments to: [Derrick Cameron](derrick.cameron@oracle.com) or [Charles Duncan](charles.duncan@oracle.com). 

## Objectives

- Configure GGCS extract processes for data replication to 11g Database on-premise.
- Configure OGG replicat processes for data replacation from DBCS 12c in the Cloud.
- Generate Transactions and view data movement statistics to monitor activity.

## Required Artifacts

- Access to your Oracle Cloud account (used in Lab 100 and Lab 200) and services DBCS, GGCS, and Compute.

### **STEP 1**On Prem

1.      Edit /u01/app/oracle/product/ggcc_instance/conf/agent.properties file and replace <> placeholders with student ip addresses

ggInstanceHost=<ip address of on prem vm>
ggccServiceHost=<ip address of ggcs vm>
proxy-127.0.0.1=<ip address of ggcs vm>

2.      Start GoldenGate Cloud Service agent by  opening a terminal window and running the /home/oracle/Desktop/GGCS_Workshop_Material/start_ggccagent.sh script

3.      Make sure there are no errors in the script output to terminal

4.      In GGSCi>  start jagent

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