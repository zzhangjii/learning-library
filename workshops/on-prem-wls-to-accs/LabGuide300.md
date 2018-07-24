![](images/300/Picture-lab.png)  
Updated: Date

## Introduction

Introductory Text

**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Move on premise WLS to Oracle JCS.

## Required Artifacts

- List of Prerequisites

# Main Heading 1

## Sub Heading 1

### **STEP 1**: Create Database Instance in Cloud

- Sign in to Oracle Cloud My Services.
- Click  Dashboard menu near the upper left corner of the page, and select
  
- Click on create instance

 ![](images/300/DB/1.png)

- Fill out the details and remember the region.

  ![](images/300/DB/2.png)

- Fill out the details and upload the ssh key if you don't have one then create new key.

  ![](images/300/DB/3.png)

  ![](images/300/DB/3-1.png)

- Click on create and in few minutes new database instance will be running.

  ![](images/300/DB/4.png)

### **STEP 2**: Create JCS instance

- In JCS home page click on create instance

  ![](images/300/DB/JCS_instance/1.png)

- Click on Java

  ![](images/300/DB/JCS_instance/2.png)

- Make sure to have same region as of Database

  ![](images/300/DB/JCS_instance/3.png)

- Create new SSH key or upload the existing public key and select the DB created earlier.

  ![](images/300/DB/JCS_instance/4.png)

- If everything goes right, confirmation page will load up. Download the payload.

  ![](images/300/DB/JCS_instance/5.png)

- Click Create.

  ![](images/300/DB/JCS_instance/6.png)

### **STEP 3**: Upload project in JCS

- From the menu that's displayed, select Open WebLogic Server Console. 
The sign-in page of the WebLogic Server Administration Console is displayed. 
If you see the untrusted security certificate warning, add the certificate to your browser, as an exception, and continue. The text of this warning and the steps to proceed depend on your browser. In Firefox, for example, you can proceed by clicking Advanced and then Add Exception.
- Enter your administrator credentials. 
Note: These are the credentials that you had specified while creating the instance. In the case of a quickstart instance, you can find the credentials in the credentials zip bundle that you downloaded while creating the instance. 
The WebLogic Server Administration Console is displayed.
![](images/300/DB/Upload_to_JCS/1.png)

- Click Lock & Edit.

  ![](images/300/DB/Upload_to_JCS/2.png)

- Under Domain Structure, click Deployments.

  ![](images/300/DB/Upload_to_JCS/3.png)

- On the Deployments page, click Install.

  ![](images/300/DB/Upload_to_JCS/5.png)

- On the Install page, click upload your file(s).

  ![](images/300/DB/Upload_to_JCS/6.png)

- On the Install Application Assistant page, click Browse near the Deployment Archive field, and select the alphaOffice.war application that you downloaded earlier.

  ![](images/300/DB/Upload_to_JCS/7.png)

- The name of the selected deployment archive file appears next to the Browse button. Click Next.


  ![](images/300/DB/Upload_to_JCS/8.png)

- Make sure that the deployment archive file is selected, near the bottom of the page, and then click Next.

  ![](images/300/DB/Upload_to_JCS/9.png)

- You can install the deployment as either an application or a library. For this tutorial, we'll install it as an application. Click Next

  ![](images/300/DB/Upload_to_JCS/10.png)

- Select the servers or clusters to which you want to deploy the application. For this tutorial, we'll deploy the application to all the servers in the cluster. So click All servers in the cluster, and then click Next. 
Note that the the cluster name (wls003jc_cluster in this example) would be the first eight characters of your service instance's name followed by _cluster.

  ![](images/300/DB/Upload_to_JCS/11.png)

- On the Optional Settings page, click Next. The default settings are adequate for this tutoria

  ![](images/300/DB/Upload_to_JCS/12.png)

- Review the configuration settings. You can choose to fine-tune your configuration; but for this tutorial, select No, I will review the configuration later, and then click Finish.

  ![](images/300/DB/Upload_to_JCS/13.png)

- A message is displayed that the application was deployed successfully.

  ![](images/300/DB/Upload_to_JCS/14.png)

- In the Change Center, click Activate Changes.

  ![](images/300/DB/Upload_to_JCS/15.png)

- The application is in the Prepared state and ready to be started.

  ![](images/300/DB/Upload_to_JCS/16.png)

- In the WebLogic Server Administration Console, on the Summary of Deployments page, go to the Control tab.


  ![](images/300/DB/Upload_to_JCS/17.png)

- In the Deployments table, select the check box near the application that you just deployed.



  ![](images/300/DB/Upload_to_JCS/18.png)

- Click Start, and then select Servicing all requests.


  ![](images/300/DB/Upload_to_JCS/19.png)

- Click Yes to confirm the deployment.

  ![](images/300/DB/Upload_to_JCS/20.png)

- The application is now in the Active state and is ready to accept requests.

  ![](images/300/DB/Upload_to_JCS/21.png)
