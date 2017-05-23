![](images/400/lab400.png)

Update May 2, 2017

## Introduction

This is the fourth of five GoldenGate Cloud Service labs, and covers the third use case: Replication and transformation of data from a DBCS 12c pluggable database to a DBCS 12c reporting data warehouse.

![](images/100/i4.png)

This workshop will walk you through replacation of data from a DBCS 12c Pluggable database to another DBCS 12c Pluggable database.  This lab will introduce data transformations as part of the replication process.

To log issues and view the lab guide source, go to the [github oracle](https://github.com/pcdavies/GoldenGateCloudService/issues) repository.

## Objectives

- Configure GGCS extract and replicat processes for data replication between DBCS 12c Pluggable Databases.
- Process data transformations as part of the data replication process.
- Review auditing support for before/after image (record) capture.

## Required Artifacts

- Access to your Oracle Cloud account and services DBCS, GGCS, Compute, and BI Cloud Service (BICS).

### **STEP 1**: Configure GoldenGate Cloud Service (GGCS)

- Open a terminal window on the OGG Compute image and ssh to GGCS:
	- **SSH to GGCS:** `ssh -i /home/oracle/Desktop/GGCS_Workshop_Material/keys/ggcs_key opc@<your ggcs IP address>` Field ***GG1***
	- **Switch to user oracle:** `sudo su - oracle`
    - **Switch to GGHOME:** `cd $GGHOME`
	- **Start a gg command shell:** `ggsci`

    ![](images/400/i1.png)

- View extract and replicat configuration.  Note we are configuring both extract (source) and replicat (target) in on oby file.  Note the use of two different credentials.
    - **Enter the following:** `view param dirprm/ADD_DW_ALL.oby`  Read comments

    ![](images/400/i2.png)

- Create/add extract and replicat processes.
    - **Enter the following:** `obey dirprm/ADD_DW_ALL.oby`

    ![](images/400/i3.png)

- Review processes.
    - **Enter the following:** `info all`

    ![](images/400/i4.png)

- Stop Lab 300 processes and start new DW (Lab 400) processes.
    - **Stop EAMER:** `stop EAMER`
    - **Stop PAMER:** `stop PAMER`
    - **Start DW Processes:** `start *DW`
    - **Review results:** `info all`

    ![](images/400/i5.png)

### **STEP 2**: Generate Insert Transactions and Review Data on Source and Target

- Start SQLDeveloper and run script `generate_dw_data.sql` to generate insert transactions.  Open the script.
 
    ![](images/400/i6.png)

- Run `generate_dw_data.sql` against Amer

    ![](images/400/i7.png)

- Review results.  Scroll up and down to see all stats.
    - **Enter the following in ggsci:** `stats *DW total`

    ![](images/400/i8.png)

- Review results.  Run `get_dw_count.sql` and show that counts match.  Open the script.

    ![](images/400/i9.png)

- Run `get_dw_count.sql` against amer.

    ![](images/400/i10.png)

- Browse the following tables in SQLDeveloper to compare AMER and DW tables to see that the following transformations occurred.  **NO DETAILED SCREEN SHOTS**.
- **CUSTOMERS:** `CUSTOMERS_FIRSTNAME` and `CUSTOMERS_LASTNAME` concatenated into `CUSTOMERS_NAME` column.
- **CUSTOMERS:** mail address stripped out and only domain mapped into `CUSTOMER_EMAIL_DOMAIN` column.
- **ORDERS:** split into `CREDIT_ORDERS` and `NON_CREDIT_ORDERS` tables based on content of  `PAYMENT_METHOD` column.
- **ORDERS:** `ORDERS_STATUS_DESC` column filled in by SQL lookup of value from `ORDERS_STATUS_LOOKUP` table.
- **ORDERS_PRODUCTS:** `FINAL_PRICE` column calculated via stored procedure (they can look at the stored procedure `DW.SP_TOTAL` via GUI if desired)
- **PRODUCTS:**  `PRODUCTS_TAX_CLASS_DESC` column filled in by using case statement
- **PRODUCTS_HISTORY** auditing table populated by inserting all records (note additional columns).

    ![](images/400/i11.png)

### **STEP 3**: Review Audit Support

- We need to generate some transactions for the audit proess.  Open gentrans.sql.

    ![](images/400/i12.png)

- Execute with the AMER connection.

    ![](images/400/i13.png)

- Review `PRODUCTS_HISTORY` in `DW` auditing table to see that updates include the BEFORE and AFTER images of updates.

    ![](images/400/i14.png)
