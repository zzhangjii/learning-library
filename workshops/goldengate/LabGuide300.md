![](images/300/lab300.png)

Update May 2, 2017

## Introduction

- This is the third of five GoldenGate Cloud Service labs, and covers the second use case: Replication of data from a DBCS 12c multi-tenant Pluggable Database back to an on-premise 11g Database

	![](images/100/i3.png)

This workshop will walk you through replacation of data from a DBCS 12c Pluggable database back to an 11g On-premise Database.  Note that the 11g Database used in this Workshop is running on compute and does not require a VPN (or dedicated) network, but in practice you would need a VPN (or Corente or other) network connection to replicate data from the cloud to a customer database.

Please direct comments to: [Derrick Cameron] (derrick.cameron@oracle.com) or [Charles Duncan] (charles.duncan@oracle.com). 

## Objectives

- Configure GGCS extract processes for data replication to 11g Database on-premise.
- Configure OGG replicat processes for data replacation from DBCS 12c in the Cloud.
- Generate Transactions and view data movement statistics to monitor activity.

## Required Artifacts

- Access to your Oracle Cloud account (used in Lab 100 and Lab 200) and services DBCS, GGCS, and Compute.

### **STEP 1**: Configure GoldenGate Cloud Service (GGCS)

- Open a terminal window on the OGG Compute image and ssh to GGCS:
	- **SSH to GGCS:** `ssh -i /home/oracle/Desktop/GGCS_Workshop_Material/keys/ggcs_key opc@129.156.125.56`
	- **Switch to user oracle:** `sudo su - oracle`
    - **Switch to GGHOME:** `cd $GGHOME`
	- **Start a gg command shell:** `ggsci`

	    ![](images/300/i1.png)

- Review amer extract configuration:
    - **Enter the following:** `view param dirprm/ADD_AMER_EXTRACT.oby`  Read comments

	![](images/300/i2.png)

- Add amer extract:
    - **Enter the following:** `obey dirprm/ADD_AMER_EXTRACT.oby`

	![](images/300/i3.png)

- Review the processes:
	- **Enter the following:** `info all`

	![](images/300/i4.png)

- Note in the screen shot above we have added EXTRACT processes.  There is currently a REPLICAT (RAMER) running.  That is from the previous lab, and was used to apply updates to DBCS.  We will stop that process.
	- **Enter the following:** `stop RAMER`
	- **Wait a few seconds and then enter:** `info all`

	![](images/300/i5.png)

- Edit pump parameters and update the target IP address.  Also note/read other highlighted parameters.  **Note the use of linux 'vi' editor to update, which requires specific keys to navigate:**
	- **Enter the following:** `edit params dirprm/PAMER.prm`
	- **Note navigation keys (case sensitive):** `j - down, k - up, h - left, l - right`
	- **To set insert mode:** `i to insert (above keys no longer navigate), esc to get out of insert mode`
	- **To delete characters:** `x`
	- **To save and exit:** `first :, then x`

	![](images/300/i6.png)

- Start new extract process and confirm process are running.  Stop RAMER (from last Lab).
	- **Enter the following:** `start *`  This starts all processes
	- **Enter the following:** `info all` note you may need to wait a few seconds
	- **Stop Replicat:** `stop RAMER`
	- **Confirm status:** `info all`
	- **! will repeat last command**

	![](images/300/i7.png)

### **STEP 2**: Configure Oracle GoldenGate (OGG) On-Premise (11g Database)

- Exit out of the current terminal window.  Enter exit at least twice to ensure you are NOT still in GGCS.  Open a NEW terminal window:
	- **Enter the following:** `cd $GGHOME`
	- **Start a new GG Command shell:** `./ggsci`

	![](images/300/i8.png)

- View pre-configured REPLICAT:
	- **Enter the following:** `view param dirprm/ADD_EURO_REPLICAT.oby`  Read comments.

	![](images/300/i9.png)

- Add new REPLICAT:
	- **Enter the following:** `obey ./dirprm/ADD_EURO_REPLICAT.oby`

	![](images/300/i10.png)

- Review processes, start manager, and start replicat, and confirm processes are running:
	- **Enter the following:** `info all`
	- **IF the manager is not running enter the following:** `start mgr`
	- **Stop Extract EEURO (from Lab 200):** `stop EEURO`
	- **Stop Pump PEURO (from Lab 200):** `stop PEURO`
	- **Start new Replicat REURO:** `start REURO`
	- **Confirm Lab 300 services are running:** `info all`

	![](images/300/i11.png)

### **STEP 3**: Generate Transactions and Review Results

- Open SQLDeveloper and open the sql file gentrans.sql using the amer connection:





- On ggcs: ggsci> `stats * total`
- On prem: ggsci> `stats reuro total`
= ggsci> lag reuro  (we will have to redo screenshot when/if we fix timezone issue otherwise we drop this). Once “at EOF” all records have been replicated
    - ggsci> !will repeat ;last command
- SQLDeveloper:  run get_count.sql and show that counts match
- use GUI to see that currency table and currency admin user do not exist in amer or euro
- run ddl.sql againt AMER
- use GUI to see that currency table and currency admin user now exist in amer and euro
- On prem: ggsci> stats reuro to show ddl count
- ggsci> view report reuro to show DDL report
