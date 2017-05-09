![](images/200/lab200.png)

Update May 2, 2017

## Introduction

This is the first 

	![](images/100/i2.png)

## Objectives

- Familiarize you 

## Required Artifacts

- The following lab 

### **STEP 1**: Configure Database Connections in SQL Developer

start..

### **STEP 2**: Review Source Data in 11g Database (On-Premise/Compute image)

Start..

### **STEP 3**: Review Target Data on DBCS 12c Pluggable Database

Start..

### **STEP 4**: Configure OGG (On-premise/Source)

Note this is:
- Using our On-premise/Compute image through VNC
- Our source data configuration for 11g Database (schema euro)
- USes OGG (not GGCS) with Classic Extract 

### **STEP 5**: Configure GGCS (Cloud/Target) 

Note this is:
- Using our GGCS Service (which also runs on Compute) paired with a DBCS for both GGCS metadata and target data
- Our target data configuration for 12c Pluggable Database (schema amer)
- USes GGCS (not on-premise OGG) with Integrated Replicat

### **STEP 6**: Start Extracts and Migrate Data with Datapump

Start..
- start eeuro
- start peuro
- expdp..
- scp..
- impdp..
- Review target data

### **STEP 7**: Generate Transactions and Review Data Movement/Results

Start..
- generate transactions
- review source and target data
- start ramer
- review source and target data
- OGG: stats eeuro total
- GGCS: stats ramer total