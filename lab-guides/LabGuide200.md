
# Monolithic to Microservice Cloud Native Development -  Building, Containerizing Java REST Services

  ![](images/200/Title.png)

## Introduction
In this lab you will create ssh key pairs, login into your Trial, create a VCN (Virtual Compute Network), create a new compute instance and install docker / git into the instance.

***To log issues***, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Create the baseline infrastructure to support a Compute instance
- Create a SSH key pair
- SSH into the instance: Install Docker and GIT
- Create a baseline Docker image and then deploy a java REST application
- Customize the container to connect to your ATP DB and save a new image
- Run a Docker container based off of your new image

# Log into  your Trial Account and Create Infrastructure

You will create all required infrastructure components within your Trail account.

## Your Trial Account

### **STEP 1**: Your Oracle Cloud Trial Account

- You have already applied for and received you're Oracle Cloud Trial Account.


### **STEP 2**: Log in to your OCI dashboard

- If your not logged into your trail account, re-login by going to:

    [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in)

- Enter your **Cloud Account Name** in the input field and click the **My Services** button.

  ![](images/200/1.png)

- Enter your **Username** and **Password** in the input fields and click **Sign In**.

  ![](images/200/2.png)

- In the top left corner of the dashboard, click the **hamburger menu**

  ![](images/200/3.png)

- Click to expand the **Services** submenu, then click **Compute**

  ![](images/200/4.png)

### **STEP 3**: Create a Virtual Compute Network

We need a default VCN to define our networking within the `monoTOmicro` compartment (_Or the name you used for your compartment_). This is where Subnets and Security Lists, to name a couple get defined for each Availablity Domains in your Tenancy. Oracle Cloud Infrastructure is hosted in regions and availability domains. A region is a localized geographic area, and an availability domain is one or more data centers located within a region. A region is composed of several availability domains. Availability domains are isolated from each other, fault tolerant, and very unlikely to fail simultaneously. Because availability domains do not share infrastructure such as power or cooling, or the internal availability domain network, a failure at one availability domain is unlikely to impact the availability of the others.

All the availability domains in a region are connected to each other by a low latency, high bandwidth network, which makes it possible for you to provide high-availability connectivity to the Internet and customer premises, and to build replicated systems in multiple availability domains for both high-availability and disaster recovery.

- Click the **hamburger icon** in the upper left corner to open the navigation menu. Under the **Networking** section of the menu, click **Virtual Cloud Networks**

    ![](images/200/10.PNG)

- Select your compartment:

    ![](images/200/10a.png)

- Click **Create Virtual Cloud Network**.

    ![](images/200/11.PNG)

- Fill in the follow values as highlighted below:

    ![](images/200/12.PNG)

    ![](images/200/13.PNG)

- Click **Create Virtual Cloud Network**

- Click **Close** on the details page:

    ![](images/200/14.PNG)

- You will see:

    ![](images/200/15.PNG)

### **STEP 4**: Add a Security List entry

A security list provides a virtual firewall for an instance, with ingress and egress rules that specify the types of traffic allowed in and out. Each security list is enforced at the instance level. However, you configure your security lists at the subnet level, which means that all instances in a given subnet are subject to the same set of rules. The security lists apply to a given instance whether it's talking with another instance in the VCN or a host outside the VCN.

- Click on the **DockerVCN** link and then select **Security Lists**:

    ![](images/200/16.PNG)

    ![](images/200/17.PNG)

- Click on **Default Security List for DockerVCN**:

    ![](images/200/18.PNG)

  **NOTE:** For the purposes of the upcoming Docker application deployment we need to add an Ingress Rule that allows access from the Internet to port 8080.

- Click **Edit All Rules** and then select **+ Another Ingress Rule**:

  **`NOTE: DO NOT EDIT AN ALREADY EXISTING RULE, ADD A NEW ONE`**

    ![](images/200/19.PNG)

    ![](images/200/19-2.PNG)

- **Enter the following:**

  **NOTE:** Leave all other values at default.

  ```
  Source CIDR: 0.0.0.0/0
  Destination Port Range: 8080
  ```

  ![](images/200/19-4.PNG)

- Click the **Save Security List Rules** button:

    ![](images/200/22.PNG)

- Your Ingress Rules should look like:

    ![](images/200/20.PNG)

### **STEP 5**: Create SSH Key Pair

Before we create the Compute instance that will contain Docker and application deployments we need to create a ssh key pair so we'll be able to securely connect to the instance and do the Docker installation, etc. **We'll use the VNC Client to do this**.

- In your VNC client open up a Terminal window and **Type** the following: (**You don't have to worry about any passphrases unless you want to enter one**)

```
ssh-keygen -b 2048 -t rsa -f dockerkey
```

- Your key pair is now in the current directory:

    ![](images/200/24.PNG)

- **NOTE:** Open up the pubic key file in an editor (vi). Select and copy the entire contents. This will be used in the Compute instance creation in the next Step.   

    ![](images/200/25-4.PNG)

### **STEP 6**: Create a Compute Instance

- Go back to your OCI console and from the hamburger menu in the upper left hand corner select **Compute-->Instances**.

  ![](images/200/26.PNG)

- Click **Create Instance**.

 ![](images/200/27.PNG)

- **You will (Leave Default) or Type** the following in the `Create Compute Instance` section of the dialog:

  ```
  Name: Docker
  Availability Domain: AD 1 (Use default AD 1)
  Boot Volume: Oracle-Provided OS Image
  Image Operating System: Oracle Linux 7.6 (Default)
  Shape Type: Virtual Machine (Default)
  Shape: VM.Standard2.1 (Default)
  SSH Keys: Choose SSH Key Files
  ```

- After entering the _Docker_ instance name.

   ![](images/200/27-2.PNG)

- Scroll down furthur on the page to insert your PUBLIC SSH Key
**NOTE:** You will paste the public key you copied in Step 5 into the SSH KEY field by selecting the **Paste SSH Keys** radio button. `The public key should all be on ONE LINE`

   ![](images/200/28.PNG)

- In the Configure networking section you will take ALL of the defaults as shown:

   ![](images/200/29.PNG)

- Click **Create**

  After a few minutes you should see a running instance with a Public IP Address:

- `Make a note of the IP Address as we will be using this in the next step.`

   ![](images/200/30.PNG)


### **STEP 7**: SSH into the Instance and install Docker

- **NOTE:** Make sure the dockerkey file has the permissions of **600** (chmod 600 dockerkey) and ssh into the compute instance `substituting your IP address`.

  Example:

  ```
  cd <directory of your key pair>
  chmod 600 dockerkey
  ssh -i ./dockerkey opc@129.213.119.105
  ```

  ![](images/200/37.PNG)

### **STEP 8**: Install and configure Docker and GIT

Docker and GIT are required for the subsuquent labs. You will install the Docker engine, enable it to start on re-boot, grant docker privledges to the `opc` user and finally install GIT.

- **Type** the following:

  ```
  sudo -s
  yum install docker-engine
  usermod -aG docker opc
  systemctl enable docker
  systemctl start docker
  ```

- **NOTE:** During the `yum install docker-engine` command press `Y` when asked if installation is ok.

- Screenshot at the end of the Docker installation:

   ![](images/200/38.PNG)

   ![](images/200/39.PNG)

- **Type** the following:

  ```
  yum install git
  ```

- Screenshot at the end of the GIT installation:

   ![](images/200/40.PNG)

- **Type** the following to verify good installations:

  ```
  su - opc
  docker version
  docker images 
  git --version
  ```

   ![](images/200/41.PNG)

### **STEP 9**: Edit /etc/sysconfig/selinux

Set the server to Permissive mode and also ensure that permissive mode survives re-boots by editing `/etc/sysconfig/selinux`

- Using vi, change the SELINUX line to **permissive**. **Type** the following: (**NOTE**: You need to be the root user to edit this file)

  ```
  sudo -s
  vi /etc/sysconfig/selinux
  ```

- **NOTE:** If new to vi, press the letter `i` to edit text. To save press Escape, the type `:wq!`.

   ![](images/200/42.PNG)

- Save the file and exit out of vi

- Now, **Type** the following:

  ```
  setenforce 0
  sestatus
  ```

- Verify that your server is in permissive mode.

   ![](images/200/43.PNG)

- **Type** the following to exit out of `root` and go back and verify that you're now the `opc` user:

  ```
  exit
  whoami
  ```

  ![](images/200/44.PNG)


# Deploy the AlphaOffice Application using Docker

In this section you will again clone the github repository as you did in Lab 100. It contains a Java REST Application that queries the database. Then, you will modify the configuration to point to your ATP database. After successfull testing you will create a new Docker image.

## Deploy AlphaOffice Product Catalog Application

### **Step 1**: Clone the git repository and copy the wallet file

- Clone the git repository to your newly created OCI VM. This repo contains support files and the baseline AlphaOffice application that you will modify to connect to your ATP database.

- **Type OR Copy and Paste**:

  ```
  git clone https://github.com/derekoneil/monolithic-to-microservice.git
  ```

  ![](images/200/45.PNG)

- From the directory you just cloned the repository into **Type**: (Command assumes your in the $HOME directory /home/opc)

  ```
  cd monolithic-to-microservice/lab-resources/docker
  ```

- Here you will find the baseline `AlphaProductsRestService.war` file, `dbconfig.properties`, `sqlnet.ora` and a `Dockerfile`:

  ![](images/200/46.PNG)

- **FROM YOUR VNC CLIENT**: Open up another Terminal session, CD to where your dockerkey file is and then copy the database wallet file you downloaded in Lab 100  (Recall that the file is in `/home/opc/Downloads`). You will scp this wallet file into the `/home/opc/monolithic-to-microservice/lab-resources/docker` directory within your OCI VM. 

  **NOTE:** If your wallet file is a different name than **Wallet_orcl.zip** then substitute your name as appropriate. This example uses `Wallet-mattoATP`:

  ```
  cd <into the location where your dockerkey file is>
  scp -i ./dockerkey /home/opc/Downloads/Wallet-mattoATP.zip opc@<YOUR-PUBLIC-IP>:/home/opc/monolithic-to-microservice/lab-resources/docker
  ```

  ![](images/200/46-1.1.PNG)

- **BACK IN YOUR SSH session**: The wallet file should now be in the `/home/opc/monolithic-to-microservice/lab-resources/docker` directory on the OCI VM:

  ![](images/200/46-1.3.PNG)

### **Step 2**: Edit your ATP instance specific information

In this step you are going to edit the `dbconfig.properties` file to add a DB instance connection name.

- Using **vi** edit the **dbconfig.properties** file and add your connection property. We will be using an ATP DB instance called `mattoATP` for the following examples:

- The DB Connection information can be found in the OCI Console under your ATP database instance link:

  ![](images/200/46-1.4.PNG)

  ![](images/200/46-1.5.PNG)


  We will be using the MEDIUM connection name in the application.

- For this example the modifed `dbconfig.properties` looks like:

  ![](images/200/46-1.6.PNG)

- **If your NOT using the default wallet name of `Wallet_orcl.zip` then you will also need to edit the `Dockerfile`** to point to your instance specific wallet, otherwise, you can skip ahead to Step 3.

- If applicable, **edit** the following two locations within the `Dockerfile`:

  ![](images/200/46-1.7.PNG)

### **Step 3**: Build the Docker image

The docker build will take a baseline java ready docker image from Docker Hub, add the Glassfish 4.1.1 application server along with your ATP DB instance wallet file and then extract the `AlphaProductsRestService.war` inside the container. The application server will be running on port 8080. If you recall you opened port 8080 in the Networking Security List earlier in this lab so access from the internet can occur.

- **Type:**

  ```
  docker build -t alphaoffice .
  ```

  The build will take a few minutes and should be successfull:

  ![](images/200/47.PNG)

    ...

  ![](images/200/48.PNG)

- Typing **docker images** reveals the new image:

  ![](images/200/49.PNG)

- Start a container based on the alphaoffice image mapping port 8080 to the same port on the HOST naming the container alphaoffice:

  ```
  docker run -d --name alphaoffice -p=8080:8080 alphaoffice
  ```

- **docker ps** shows the running container. You'll note the asadmin command we stipulated in the CMD of the Dockerfile build is executed and running (This starts up the Glassfish app server):

  ![](images/200/50.PNG)

### **Step 4**: Copy the the database properties file into the container

In this step you will copy the `dbconfig.properties` file modifed in a previous step into the running container. Then you will go into the container and verify all the copied and modied files look good and are in their proper locations.

**NOTE:** All of this could be executed automatically at build time but we want you to get a feel for docker commands and what's going on inside the newly executed container.

- **Type OR Copy and Paste** the following:

  ```
  docker cp dbconfig.properties alphaoffice:/usr/local/alpha/WEB-INF/classes/com/oracle/db/
  ```  

  ![](images/200/53.PNG)

### **Step 5**: Verify files inside the container and deploy the AlphaProductsRestService application

- **Type OR Copy and Paste:**

  ```
  docker exec --env COLUMNS=`tput cols` -it alphaoffice bash
  ```

   You'll notice you're now inside the docker container:

    ![](images/200/54.PNG)

- We need to verify our `dbconfig.properties` and `sqlnet.ora` files made it into the environment. **Type OR Copy and Paste** the following commands:

  ```
  cat /usr/local/wallet_DB/sqlnet.ora
  cat /usr/local/alpha/WEB-INF/classes/com/oracle/db/dbconfig.properties
  ```

- You should see your specific changes reflected in the output:

  The $TNS_ADMIN environment variable was set on the image during the docker build:

  ...
  ENV         TNS_ADMIN         /usr/local/wallet_DB/
  ...  

  ![](images/200/55.PNG)

- Bundle up a new .war file by running the following commands:

  ```
  cd /usr/local/alpha
  jar -cvf AlphaProductsRestService.war *
  ```  

- Copy the .war file to the Glassfish application server directory for auto deployment. **Type OR Copy and Paste:**

  ```
  cp AlphaProductsRestService.war /usr/local/glassfish4/glassfish/domains/domain1/autodeploy/AlphaProductsRestService.war
  ```

- Confirm the application was deployed by typing the following:

  ```
  cd /usr/local/glassfish4/bin
  ./asadmin

  (Once inside the Glassfish admin tool type:)
    list-applications
  ```

  - The application should show as deployed:

    ![](images/200/57.PNG)

- **Type: `exit` twice** to get out of the admin tool and the container.

- In a browser, test the application by using the Public IP Address of the VM instance.

  **NOTE:** If you have a JSON format add-on in your browser the data will be easier to read... however, if you don't it will still show up as a text stream. (**Include the trailing slash!**)

  ```
  http://<YOUR-PUBLIC-IP>:8080/AlphaProductsRestService/webresources/restCall/
  ```
  Example:
  `http://129.213.109.189:8080/AlphaProductsRestService/webresources/restCall/`

  **Another NOTE: Be patient**, the first time you test. It may take several seconds before you see data returned...

  ![](images/200/58.PNG)

- You can test querying one product by adding the Product ID to the REST call:

  ```
   http://<YOUR-PUBLIC-IP>:8080/AlphaProductsRestService/webresources/restCall/1050
  ```

  Example:
  `http://129.213.109.189:8080/AlphaProductsRestService/webresources/restCall/1050`

  ![](images/200/59.PNG)

- If you get a timeout or receive an error you can check the container logs by typing:

  ```
  docker logs alphaoffice
  ```

- If everything looks OK then commit a new docker image with the completed application deployment. **Type:**

  ```
  docker commit alphaoffice alphaoffice-rest
  ```
- Typing **docker images** will show the new image is created:

  ![](images/200/60.PNG)

 - Stop and remove the original container by executing the following:

   ```
   docker stop alphaoffice
   docker rm alphaoffice
   ```

- Fire up a container using the new `alphaoffice-rest` image:

  ```
  docker run -d --name alphaoffice -p=8080:8080 alphaoffice-rest
  ```

- You should now be able to go directly to the REST URL and see data returned from your ATP database.

  ```
  http://<YOUR-PUBLIC-IP>:8080/AlphaProductsRestService/webresources/restCall/
  ```

- This new docker image will be used in Lab 300...

**This completes the Lab!**

**You are ready to proceed to [Lab 300](LabGuide300.md)**
