
![](images/100/header.png)
Updated: January 14, 2019

## Introduction

This tutorial is based on the official [Oracle WebLogic Kubernetes Operator](https://github.com/oracle/weblogic-kubernetes-operator/blob/master/site/installation.md) installation guide.

To run the operator in a Kubernetes cluster, you need to build the Docker image and then deploy it to your cluster. The operator sources can be found on github.com and is built using Apache Maven. In this tutorial you can build WebLogic Kubernetes Operator and upload to Container Registry (OCIR) for later deployment:


**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Setup Environment
- Using Oracle Pipelines (Wercker) which requires only an internet browser.

## Required Artifacts

- [Oracle Cloud Infrastructure](https://cloud.oracle.com/en_US/cloud-infrastructure) enabled account.
- [Github](sign.up.github.md) account.
- [Oracle Container Pipelines (former Wercker)](sign.up.wercker.md) account.
- [Docker](sign.up.docker.md) account.

# Build the Docker image for the operator and push to Oracle Cloud Infrastructure Registry (OCIR)

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
 
- On the user details page select **Auth Tokens** in the left menu. Click **Generate Token**.
  
  ![](images/100/auth_keys.png) 
  
-  Enter a friendly description for the auth token and click **Generate Token**.

  ![](images/100/ocir_token.png)

- The new auth token is displayed. **Copy** the auth token immediately to a secure location from where you can retrieve it later, because you won't see the auth token again in the Console. **Close** the Generate Token dialog.

 ![](images/100/ocir_token_save.png)

  
- From the OCI Console navigation menu, select **Developer Services->Registry (OCIR)**.
  ![](images/100/ocir.png)
### **STEP 3**: Accept Licence Agreement to use Oracle WebLogic Server image from Docker Store

If you have not used the base image [`Oracle WebLogic Serve`](https://hub.docker.com/_/oracle-weblogic-server-12c) before, you will need to visit the [Docker Store web interface](https://hub.docker.com/_/oracle-weblogic-server-12c) and accept the license agreement before the Docker Store will give you permission to pull that image.

Open [https://hub.docker.com/_/oracle-weblogic-server-12c](https://hub.docker.com/_/oracle-weblogic-server-12c) in a new browser and click **Log In**.

![](images/100/01.docker.store.login.png)

Enter your account details and click **Login**.

![](images/100/02.docker.store.login.png)

Click **Proceed to Checkout**.

![](images/100/03.docker.store.login.png)

Complete your contact information and accept agreements. Click **Get Content**.

![](images/100/04.docker.store.login.png)

Now you are ready to pull the  image on docker enabled host after authenticating yourself in Docker Hub using your Docker Hub credentials.

![](images/100/05.docker.store.login.png)

### **STEP 2**: Pull Docker images for the operator and push to Oracle Cloud Infrastructure Registry (OCIR)

- Open Terminal (Linux/Mac users) or Command Line (Windows users) and use your docker credentials to access your docker account.
        ```
        docker login
        ```
 ![](images/100/docker_login.png) 

- Run the following commands
        ```
        docker pull oracle/weblogic-kubernetes-operator:1.0
        ```
 ![](images/100/docker_pull_operator.png) 
        ```
        docker pull store/oracle/weblogic:12.2.1.3
        ```
 ![](images/100/weblogic_pull.png) 
        ```
        docker pull traefik:1.4.5
        ```
  ![](images/100/docker_traefik_pull.png) 
    
- Log in to the OCIR Docker registry by entering this command:
        ```
        docker login iad.ocir.io
        ```
- When prompted for your username, enter your OCI tenancy name/oci username and auth token.
    
- Push Docker images into OCIR:
        ```
        docker push iad.ocir.io/wark2018/weblogic-kubernetes-operator:latest
        docker push iad.ocir.io/wark2018/weblogic:12.2.1.3
        docker push iad.ocir.io/wark2018/traefik:1.4.5
        ```
![](images/100/docker_operator_push.png) 
![](images/100/docker_push.png) 
![](images/100/docker_push_traefik.png) 

- From the OCI Console navigation menu, select **Developer Services->Registry (OCIR)**.
  ![](images/100/ocir.png)

- Click Registry tab and you can see pushed docker images.
  
    ![](images/100/ocir_registry.png)

### **STEP 2**: Get Authentication Token to use Oracle Cloud Infrastructure Registry (OCIR)

Oracle Cloud Infrastructure Registry is an Oracle-managed registry that enables you to simplify your development to production workflow. You can use Oracle Cloud Infrastructure Registry as a public or private Docker registry, pushing and pulling Docker images to and from the Registry using the Docker V2 API and the standard Docker command line interface (CLI).

Using the Console, create an empty repository in Oracle Cloud Infrastructure Registry and give it a name. Any images you subsequently push to the registry that include the repository in the image name are grouped into that repository. Creating an empty repository can be a convenient placeholder, but it is not strictly necessary. If you push an image that includes a repository in the image name and the repository doesn't already exist (for example, `iad.ocir.io/acme-dev/project02/acme-web-app:7.5.2`), a new repository is created automatically. And if you push an image that doesn't include a repository in the image name (for example, `iad.ocir.io/acme-dev/acme-web-app:7.5.2`), the image's name (`acme-web-app`) is used as the name of the repository.

Oracle Cloud Infrastructure Registry (OCIR) has native support for Docker Registry v2 token authentication. Before you can push and pull Docker images to and from Oracle Cloud Infrastructure Registry, you must already have an Oracle Cloud Infrastructure username and an auth token. In the next step you will generate your token.

Open the Oracle Cloud Infrastructure (OCI) console. If necessary first [sign in](https://cloud.oracle.com/en_US/sign-in) to your cloud account. Once you logged in click your name on top-rigth corner and select **User Settings**. On the user details page select **Auth Tokens** in the left menu. Click **Generate Token**.

![alt text](images/build.operator/25.oci.user.auth.token.png)

Enter a friendly description for the auth token and click **Generate Token**.

![alt text](images/build.operator/26.oci.user.auth.token.generate.png)

The new auth token is displayed. **Copy** the auth token immediately to a secure location from where you can retrieve it later, because you won't see the auth token again in the Console. **Close** the Generate Token dialog.

![alt text](images/build.operator/27.oci.user.auth.token.generate.png)

##  Build the Docker image for the operator using Oracle Pipelines (Wercker)

### **STEP 1**: Fork the WebLogic Kubernetes Operator sources

Visit the official [Oracle WebLogic Kubernetes Operator](https://github.com/oracle/weblogic-kubernetes-operator) site and click **Fork** to get your copy. If you are not signed in then first you need to log in to github using your account.

![](images/build.operator/10.operator.git.repo.png)

When the fork is done you can see your new WebLogic Kubernetes Operator forked repository under your Github account.

![](images/build.operator/11.operator.fork.repo.png)

### **STEP 2**: Create Oracle Pipelines Application to build the WebLogic Kubernetes Operator

If you dont't have Oracle Pipelines (Wercker) account then [sign up](sign.up.wercker.md) before you move forward.

Having the account open a browser or tab and navigate to [https://app.wercker.com]() and create a new application. Click **Create your first application** if you have fresh new account or find the plus sign on the top left corner and click. Select **Add application**.

![](images/build.operator/12.create.wercker.application.png)

Select the owner of the application. By default it is your Oracle Pipelines username, but it can be any organization where you belong to. Make sure the selected SCM is *GitHub*. Click **Next**.

![](images/build.operator/13.application.user.repo.png)

Select *WebLogic Kubernetes Operator* repository what you forked previously. Click **Next**.

![](images/build.operator/14.application.repo.png)

Leave the default repository access without SSH key. Click **Next**.

![](images/build.operator/15.application.repo.access.png)

If you want you can make your application public if you want to share the application's status otherwise leave the default private settings. Click **Create**.

![](images/build.operator/16.application.access.png)

The repository already contains a necessary `wercker.yml` but before the execution provide the following key/value pairs:

| Key | Value | OCIR Sample |
| --- | --- | --- |
| `DOCKER_USERNAME` | Username for the Docker store for pulling server JRE image | <YOUR_DOCKER_USERNAME> |
| `DOCKER_PASSWORD` | Password for the Docker store | <YOUR_DOCKER_PASSWORD> |
| `REPO_REGISTRY`| Registry address | `https://phx.ocir.io/v2`  |
| `REPO_REPOSITORY` | Repository value | `phx.ocir.io/<YOUR_TENANCY>/weblogic-kubernetes-operator` |
| `REPO_USERNAME` | Username for registry | `<YOUR_TENANCY>/<YOUR_USERNAME>` |
| `REPO_PASSWORD` | Password for registry | `Use generated Auth Token password` |
| `IMAGE_TAG_OPERATOR` | Image tag, such as `version1.0` or `latest` |  |

To define these variables click **<>Environment** tab and enter keys and values. Remember that these values will be visible to anyone to whom you give access to the Wercker application, therefore, select **Protected** for any values that should remain hidden, including all passwords.

![](images/build.operator/30.pipeline.variables.png)

Select the **Runs** tab. Scroll to the bottom and click **Trigger your first build now**.

![](images/build.operator/31.pipeline.run.png)

When the run completes successfully, the Docker image for the operator will be built and published to your OCIR repository.


![](images/build.operator/32.pipeline.complete.png)

Check the WebLogic Kubernetes Operator image in your repository. Open the OCI console click the menu icon ![](images/menu.icon.small.png) on the top-left corner and select **Registry** in the *Containers* section.

![](images/build.operator/33.select.registry.png)

Select the `weblogic-kubernetes-operator` repository and click the *tag* what you defined for your image.

![](images/build.operator/34.check.image.png)
