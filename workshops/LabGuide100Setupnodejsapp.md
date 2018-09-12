# Lab 100: Building nodejs App with ATP

## Introduction

This lab walks you through the steps to get started using the Oracle Autonomous Transaction Processing on Oracle Infrastructure Cloud (OCI). You will build a node.js app with ATP.

To **log issues**, click [here](https://github.com/cloudsolutionhubs/autonomous-transaction-processing/issues/new) to go to the github oracle repository issue submission form.

## Objectives

- Log into ATP and download credentials
- Install and configure node.js 
- Run node.js to test connectivity to ATP

## Required Artifacts

- The following lab requires an Oracle Public Cloud account. You may use your own cloud account, a cloud account that you obtained through a trial, or a training account whose details were given to you by an Oracle instructor.
- Install node.js on your laptop
- Install Oracle instant client 12.2
- Download and unzip ATP secure connectivity file
- Install oracledb node driver 

## Steps

### STEP 1: Sign in to Oracle Cloud and Download credentials**

-   Go to [cloud.oracle.com](https://cloud.oracle.com), click **Sign In** to sign in with your Oracle Cloud account.

![](./images/100/Picture100-2.png)

-   Enter your **Cloud Account Name** and click **My Services**.

![](./images/100/Picture100-3.png)

-   Enter your Cloud **username** and **password**, and click **Sign In**.

![](./images/100/Picture100-4.png)

### STEP 2: Sign in to ATP 

-   Once you are logged in, you are taken to the cloud dashboard where you can see all the services available to you. To access Oracle Cloud Infrastructure (OCI) dashboard, click on **Customize Dashboard**.

![](./images/100/Picture100-36.JPG)

-  Find **Compute** under Infrastructure and click on **Show**

![](./images/100/Picture100-37.JPG)

-  Now you should see Compute service under your dashboard. Go ahead and click on **Compute**

![](./images/100/Picture100-38.JPG)

-  This will bring you to the service details page. Click on **Open Service Console** on top right of your screen to bring you to OCI dashboard.

![](./images/100/Picture100-39.JPG)

![](./images/100/Picture100-19.jpeg)

-  Once you are on OCI dashboard page, click on the hamburger menu icon on the top left of the screen

![](./images/100/Picture100-20.jpeg)

-  Click on **Autonomous Transaction Processing** to open service console

![](./images/100/Picture100-32.jpeg)

-  Click on the instance name to see details of it

![](./images/100/Picture100-33.jpeg)


- Click on service console and log into the service console by providing username and password

![](./images/100/Picture100-serviceconsole.jpeg)

- On the ATP admin screen navigate to admin screen

![](./images/100/Picture100-serviceconsoleadmin.jpeg)

- On the admin screen download the credentials 

![](./images/100/Picture100-downcreds.jpeg)

- Provide the passphrase to download the credentials zip file, note the passphrase it is needed to open the zip file

![](./images/100/Picture100-downloadcredsscreen.jpeg)

- Download and Install appropriate node.js on you laptop from the following [link](https://nodejs.org/en/download/)

### STEP 3: Download and Install node.js
- From Node.js website download and install mac OS package. Once the installation is complete, verify node and npm version. 

![](./images/100/Picture100-nodejsdownload.jpeg)

- Check the node and npm version 
```
node —version
```
```
npm —version
```

![](./images/100/Picture100-nodenpmversion.jpeg)

### STEP 4: Download and install Oracle Instant Client
- Download and unzip Oracle Instant Client for Mac OS from the [link](https://www.oracle.com/technetwork/topics/intel-macsoft-096467.html)

![](./images/100/Picture100-Oracleinstallclient.jpeg)

- On the download page accept license agreement and download instantclient-basic-macos.x64-12.2.0.1.0-2.zip

- Once downloaded, Unzip the instant client in folder of your choice and add it to your path variable.
```
export PATH-=$PATH:/path_to_instant_client_12.2
```

- Create soft link to libclntsh.dylib.12.1 in either /usr/local/lib or in ~/lib.

```
ls -s ~/Downloads/instantclient_12_2/ libclntsh.dylib.12.1 /usr/local/lib
```

- Now that the instant client is setup lets move on Download the credentials file from Admin console. We have pre-provisioned Oracle ATP that we are going to use for our node application.

### STEP 5: Setup environment variables for ATP connections
- Paste Downloaded Credentials zip file here

- Once the file has been downloaded, go and unzip the file in node application folder.

- Unzip the downloaded wallet to file location of where the node app will be installed
![](./images/100/Picture100-unzipclientcreds.jpeg)

- Set up TNS_ADMIN environment variable and point to the database wallet folder.

```
export TNS_ADMIN=/<path_to_unzipped_wallet_folder>
```
![](./images/100/Picture100-tnsadminexport.jpeg)


- In wallet_ATPTEJUS, you will need to update certain files. Open the wallet files in a text editor.

    * Open ojdbc.properties file and make sure DIRECTORY points to TNS_ADMIN which we set up earlier.
    * Open sqlnet.ora and set up DIRECTORY to TNS_ADMIN

    ```
    WALLET_LOCATION = (SOURCE = (METHOD = file) (METHOD_DATA = (DIRECTORY=${TNS_ADMIN})))
    SSL_SERVER_DN_MATCH=yes
    ```
![](./images/100/Picture100-updateojdbcprops.jpeg)

### STEP 6: Configure and start your Node.js App

- You can download the files from /scripts/dbconfig.js and /scripts/server.js and copy it to your node project folder.

- Server.js is the application we want to run and dbconfig.js has the database credentials.

- Open dbconfig.js in a text editor and make the following changes:
    * dbuser: admin (your ATP user)
    * dbpassword: ATP admin user password
    * connectString: your_ATP_instance_name_high

![](./images/100/Picture100-dbconfig.jpeg)

- Let us now run server.js

```
node server.js
```
![](./images/100/Picture100-nodejs.jpeg)

- You have successfully connected your node application to Oracle Autonomous Transaction Processing. 

![](./images/100/Picture100-runapp.jpeg)
