# Pull the Docker image for the WebLogic and push to Oracle Cloud Infrastructure Registry (OCIR)

![](images/100/header.png)
Updated: January 14, 2019

## Introduction

This tutorial is based on the official [Oracle WebLogic Kubernetes Operator](https://github.com/oracle/weblogic-kubernetes-operator/blob/master/site/user-guide.md) user guide.

To run the operator in a Kubernetes cluster, you need to build the Docker image and then deploy it to your cluster. The operator sources can be found on github.com and is built using Apache Maven. In this tutorial you can pull WebLogic Image and upload to Container Registry (OCIR) for later deployment:


**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Setup Environment

## Required Artifacts

- [Oracle Cloud Infrastructure](https://cloud.oracle.com/en_US/cloud-infrastructure) enabled account.
- [Github](sign.up.github.md) account.
- [Docker](sign.up.docker.md) account.

# Pull the Docker image for the WebLogic and push to Oracle Cloud Infrastructure Registry (OCIR)

## Setup Environment

### **STEP 1**: Log in to your Oracle Cloud Infrastructure (OCI)

- If you are using a Trial Account, **you must wait until you receive this email** indicating that your Cloud Account has been provisioned. _Please note that this email may arrive in your spam or promotions folder pending your email settings._

  ![](images/oraclecode/code_9.png)

- Once you receive the **Get Started with Oracle Cloud** Email, make note of your **Username, Password and Cloud Account Name**.

  ![](images/200/0.1.png)

- From any browser go to:

    [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in)

- Enter your **Cloud Account Name** in the input field and click the **My Services** button. If you have a trial account, this can be found in your welcome email. Otherwise, this will be supplied by your workshop instructor.

  ![](images/200/1.png)

- Enter your **Username** and **Password** in the input fields and click **Sign In**. If you have a trial account, these can be found in your welcome email. Otherwise, these will be supplied by your workshop instructor.

  ![](images/200/2.png)

**NOTE**: If you have used your trial account already, you may have been prompted to change the temporary password listed in the welcome email. In that case, enter the new password in the password field.

- In the top left corner of the dashboard, click the **hamburger menu**

  ![](images/200/3.png)

- Click to expand the **Services** submenu, then click **Compute**

  ![](images/200/4.png)

- On the OCI Console sign in page, enter the same **Username** as you did on the previous sign in page. If you are using a trial account and this is your first time logging into the OCI Console, enter the **temporary password** from your trial account welcome email. If you have already visited the OCI Console and changed your password, enter your **new password**. Otherwise, this password will be supplied by your workshop instructor.

  ![](images/200/5.png)

### **STEP 2**: Get Authentication Token to use Oracle Cloud Infrastructure Registry (OCIR)

- Once you logged in click your name on top-rigth corner and select **User Settings**. 

  ![](images/100/user_settings.png)

- Click Users
  
  ![](images/100/user_settings1.png)

- You may see two users in the list, one that is named with just your email address, and another that is named `oracleidentitycloudservice`/your-email-address. **Choose the one that is named just your-email-address.**
  
  ![](images/100/user_settings2.png)

- On the user details page select **Auth Tokens** in the left menu. Click **Generate Token**.
  
  ![](images/100/auth_keys.png) 
  
-  Enter a friendly description for the auth token and click **Generate Token**.

  ![](images/100/ocir_token.png)

- The new auth token is displayed. **Copy** the auth token immediately to a secure location from where you can retrieve it later, because you won't see the auth token again in the Console. **Close** the Generate Token dialog.

 ![](images/100/ocir_token_save.png)


### **STEP 3**: Accept Licence Agreement to use Oracle WebLogic Server image from Docker Store

- If you have not used the base image [`Oracle WebLogic Serve`](https://hub.docker.com/_/oracle-weblogic-server-12c) before, you will need to visit the [Docker Store web interface](https://hub.docker.com/_/oracle-weblogic-server-12c) and accept the license agreement before the Docker Store will give you permission to pull that image.

Open [https://hub.docker.com/_/oracle-weblogic-server-12c](https://hub.docker.com/_/oracle-weblogic-server-12c) in a new browser and click **Log In**.

![](images/100/01.docker.store.login.png)

Enter your account details and click **Login**.
**Note:** If you don't already have one, obtain a Docker Store account, click Create Account.
  
![](images/100/02.docker.store.login.png)

Click **Proceed to Checkout**.

![](images/100/03.docker.store.login.png)

Complete your contact information and accept agreements. Click **Get Content**.

![](images/100/04.docker.store.login.png)

Now you are ready to pull the  image on docker enabled host after authenticating yourself in Docker Hub using your Docker Hub credentials.

![](images/100/05.docker.store.login.png)

### **STEP 4**: Pull Docker images for the operator and push to Oracle Cloud Infrastructure Registry (OCIR)

- Open Terminal (Linux/Mac users) or Command Line (Windows users) and use your docker credentials to access your docker account.
  ```
  docker login
  ```
  ![](images/100/docker_login.png) 

- **Type** the following: 
  ```
  docker pull store/oracle/weblogic:12.2.1.3
  ```
  ![](images/100/weblogic_pull.png) 

- Run the following command to see your image is successfully pulled.
  ```
  docker images
  ```
  ![](images/100/weblogic_pull1.png)

- **Type** the following command with suitable replacements.
  ```
  docker tag IMAGE ID iad.ocir.io/your_tenancy/domain-home-in-image:12.2.1.3
  ```

  ![](images/100/docker_tag.png)

- Log in to the OCIR Docker registry by entering this command. When prompted for your username, **enter your OCI tenancy name/oci username and auth token.**
  ```
  docker login iad.ocir.io -u your_tenancy/your_user
  ```
  ![](images/100/docker_iad_login.png)
- **Note:** 
In the **OCI Console**, look in the top right corner for the currently selected region:

  ![](images/100/oci_console_iad.png)

  - If the region is `ashburn`, then you do not need to change anything. The URL `iad.ocir.io` is correct.

  - If the region is not `ashburn`, replace the `iad` part of the `DOCKER_REGISTRY` environment variable to match your region:

  ```
  London = lhr
  Frankfurt = fra
  Phoenix = phx
  Ashburn = iad
  ```

  - For example, if your region is `eu-frankfurt-1`, change the URL to `fra.ocir.io`.
  
    
- Push Docker images into OCIR:
  ```
  docker push iad.ocir.io/your_tenancy/your_user/domain-home-in-image:12.2.1.3
  ```
  ![](images/100/docker_push.png) 

- From the OCI Console navigation menu, select **Developer Services->Registry (OCIR)**.
  ![](images/100/ocir.png)

- Click Registry tab and you can see pushed docker images.
  
  ![](images/100/docker_registry.png)

- Click Actions dropdown button and change it to public.

  ![](images/100/docker_registry_public.png)

**You are now ready to move to the next lab: [Lab 200](LabGuide200.md)**