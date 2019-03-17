## Machine Learning on Oracle Cloud Infrastructure

## Table of Contents 

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

### H20ai Lab 

[Practice 1: Provision a GPU instance on OCI](#practice-1-provision-a-gpu-instance-on-oci)

[Practice 2: Access the GPU instance](#practice-2-access-the-gpu-instance)

[Practice 3: Access H2Oai application](#practice-3-access-h2oai-application)

[Practice 4: Loading an adult census dataset](#practice-4-loading-an-adult-census-dataset)

[Practice 5: Try Oracle Cloud Infrastructure for FREE](#practice-5-try-oracle-cloud-infrastructure-for-free)

## Overview

- **H20ai Lab:** In this lab you will experience a typical Machine Learning process which is training the model. We are going to use a partner tool, H2O.ai on top of one of our **Pascal GPU Bare Metal machines** to run this lab.

## Pre-Requisites 

- Access to a GPU instance in Oracle Cloud Infrastructure
- SSH Client

## H20.ai Lab

## Practice 1: Provision a GPU instance on OCI

1. Open your browser and navigate to the OCI Console by clicking on: [http://bit.ly/ociash](http://bit.ly/ociash)
2. Enter the following credentials:
    - **Cloud Tenancy:** hpctraininglab
    - **Username:** _Instructor will provide your username_
    - **Password:** _Instructor will provide your password_

    ![](img/login.png)

3. On the left corner click on the **Menu** then click **Compute** and **Instances**:
   
    ![](img/menu.png)

4. On the left side, choose a compartment your user has permission to work, and then click **Create Instance.**
   
    ![](img/compartment.png)
    ![](img/create_instance.png)

5. In the Create Instance dialog box enter the following information:
      - **Name:** H2Oai-demo
      - **Availability Domain:** AD3
      - **Image Source:** Click on **Change Image Source** and select **Custom Images**. Now select the **common** compartment and check mark the image **H2Oai-GPU-Image**. Click **Select Image**
  
      ![](img/select_image.png)

      - **Choose Instance Type:** Bare Metal Machine
      - **Choose Instance Shape:** Change the Shape and select BM.GPU2.2
      - **Add SSH Key:** Choose the SSH file name labkey-public.pub from your Desktop Folder.
      - **Virtual Cloud Network Compartment:** Select **common** compartment
      - **Virtual Cloud Network:** VCN-GPU-DEMO
      - **Subnet Compartment:** Select **common** compartment
      - **Subnet:** subnet-gpu (Regional)
      - Click **Create**
  
     ![](img/instance_01.png)
     ![](img/instance_02.png)

## Practice 2: Access the GPU instance

1. On Gitbash terminal use SSH command to connect to the GPU instance:

   - **Username**: *ubuntu*
   - **IP address**: *Use the Public IP address of the instance you created*


    ``# ssh -i ~/Desktop/labkey-private ubuntu@<Public_IP_Address>``

    ``Please enter your NGC APIkey to login to the NGC Registry``

    _``<<Hit enter to skip>>``_


2. Check if your H2Oai docker is running by typing:

    ``# nvidia-docker ps`` 

## Practice 3: Access H2Oai application

3. Open a browser and access:

    ``http://<Public_IP_Address>:12345``

4. Scroll at the bottom of the page and Agree with the terms:

    ![](img/h2oimage002.png)

5. Enter the following credentials and click Sign In:

    - **Username:** admin
    - **Password:** admin

    ![](img/h2oimage003.png)

    ![](img/h2oimage006.png)

## Practice 4: Loading an adult census dataset

1. Click on Add Dataset and select Amazon S3

    ![](img/h2oimage007.png)

2. Select census_income by typing: `s3://h2o-public-test-data/smalldata/census_income/`

    ![](img/h2oimage008.png)

3. Select adult_test.csv and click to import selection

    ![](img/h2oimage009.png)

4. After the data is imported, click on **Click for Actions** and select **Visualize**. 

    ![](img/h2oimage010.png)

5. Select a few of the plots to see how the data interacts. For example **Correlation Graph**

    ![](img/h2oimage011.png)

6. Now lets launch an experiment. Click on **datasets** at the top of the page, then **click for actions** but this time select **Predict**

    ![](img/h2oimage012.png)

7. If a message appears asking if you want to do a tour of H2O, just click **No**.

8. Click **Select target column** and select **Age**

    ![](img/h2oimage013.png)
    ![](img/h2oimage014.png)

9. Make sure **Enable GPU** is highlighted in yellow and then click **Launch Experiment**

    ![](img/h2oimage015.png)

10. Click on **GPU Usage** on the right side of the screen to see GPUs working. This simulation will take about 15 minutes to complete. 

    ![](img/h2oimage016.png)

11. When the model is complete, click **Interpret this Model** 

    ![](img/h2oimage017.png)
    ![](img/h2oimage018.png)

12. On the left side of the page click on **Dashboard**

    ![](img/h2oimage019.png)

13. After you finished your analysis you can terminate your instance.
     
## Practice 5: Try Oracle Cloud Infrastructure for FREE 

Sign up for the free Oracle Cloud Infrastructure trial account. 
https://cloud.oracle.com/tryit

<img width="800" alt="image001" src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/OOW-2018/EdgeLab/media/image34.png">

