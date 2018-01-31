# Continuous Deployment of Database Microservices

![](images/300/PictureLab.png)  
Update: Dec 7, 2017

## Introduction

This is the third of several labs that are part of the **Oracle Cloud DevOps and Cloud Native Microservices workshop.** This workshop will walk you through the Software Development Lifecycle (SDLC) for a Cloud Native project that will create and use several Microservices.

In the first lab (100), the Project Manager created a new project in the Developer Cloud Service and also created and assigned tasks to the developers of this application. In the second lab (200), the java developer created a new microservice to retrieve and filter twitter data. In this lab you will assume the persona of the full stack developer, who will be tasked with creating a microservices that will supply JSON data from a product database.

**To log issues**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Access Developer Cloud Service
- Import Code from external Git Repository
- Build project using Developer Cloud Service

## Required Artifacts

- The following lab requires an Oracle Public Cloud account that will be supplied by your instructor.

# Create REST Microservice

## Explore Developer Cloud Service

### **STEP 1**: Review Agile Board

- This Lab assumes that you just completed Lab 200 and are still connected to the Oracle Cloud, that you're still in the Developer cloud Service Dashboard, and you're viewing the "Alpha Office Product Catalog Project." If for some reason that is not the case, follow the first several Steps of Lab 100 to once again view the Developer Cloud Service Console.

- Although you will remain connected to the Oracle Cloud using the user account you were provided, you will take on the Persona of ***Roland Dubois*** as you perform the following steps.

    ![](images/Roland.png)  

- Within the **Alpha Office Product Catalog Project**, click on **Agile** found on the left hand navigation.

    ![](images/300/Picture11.png)  

### **STEP 2**: Display the Active Sprint

- On the **Microservices** Board, click **Active Sprints**

    ![](images/300/Picture13.png)  

## Create Initial Git Repository

### **STEP 3**: Create Initial Git Repository

To begin development on our Catalog REST microservices, we could start coding from scratch. However, prior to the formal kickoff of this project, you (as Roland Dubois) have already started doing some proof-of-concept development outside of the Developer Cloud Service in order to assess the feasibility of your assignment. You want to bring that existing code into the Developer Cloud Service as a starting point for your microservices. You will do that by cloning your external GIT repository into the Developer Cloud Service. Your first step will be to accept your task using the agile board.

- Drag and drop **Feature 3 - Create Microservice to allow access to Product Catalog data** into the **In Progress** swim-lane.  

    ![](images/300/Picture14.1.png)  

- Leave the defaults, and Click **OK**.

    ![](images/300/Picture14.2.png)  

- Your Sprint progress will appear as shown below.

    ![](images/300/Picture16.2.png)  

- In the left hand navigation panel, click **Project**

- Click **New Repository**. In the New Repository wizard enter the following information and click **Create**.

    **Name:** `AlphaOfficeREST`

    **Description:** `AlphaOffice REST`

    **Initial content:** `Import existing repository`

    **Enter the URL:** `https://github.com/pcdavies/AlphaOfficeREST.git`

    ![](images/300/Picture18.3.png)  

- You have now created a new GIT repository stored within the Developer Cloud Services that is based on an existing repository.

    ![](images/300/Picture19.2.png)  

## Create Default Build Process

### **STEP 4**: Create Default Build Process

Now that we have the source code in our managed GIT repository, we need to create a build process that will be triggered whenever a commit is made to the master branch.  We will use NPM package manager to set up a Node.js build process in this section.

- On the left side navigation panel click **Build** to access the build page.

- Click **New Job**.

- In the New Job popup enter `Alpha REST Build` for the Job Name, and then click **Save**.

    ![](images/300/Picture21.3.png)  

- You are now placed into the job configuration screen.

    ![](images/300/Picture22.3.png)  

- Click the **Source Control** tab. Click **Git** and select the **AlphaOfficeREST.git** from the drop down.

    ![](images/300/Picture24.3.png)  

- Click the **Triggers** tab.

  **Select**: `Based on SCM polling schedule`

    ![](images/300/Picture25.3.png)

- Click the **Build Steps** tab. Click **Add Build Step**, and select **Execute shell**.

    ![](images/300/Picture26.png)

- For **Command** enter: `npm install`

  **NOTE:** **npm** can manage packages that are local dependencies of a particular project, as well as globally-installed JavaScript tools. When used as a dependency manager for a local project, npm can install, in one command, all the dependencies of a project through the package.json file.

    ![](images/300/Picture27.3.png)  

- Click the **Post Build** tab and complete the following:
  - Check **Archive the artifacts**.
  - Enter `**/target/*` for **Files to Archive**.  
  - Verify **GZIP** in the Compression Type.

    ![](images/300/Picture28.3.png)  

- Click **Save** to complete the configuration.

- Click the **Build Now** button to start the build immediately. Wait, as it may take 30 seconds to a few minutes for the queued job to execute, but when it does, the status will change to the following:

    ![](images/300/Picture28_5.png)  

- Wait, as it may take 30 seconds to a few minutes for the queued job to execute, but when it does, the status will change to the following:

    ![](images/300/Picture29.png)  

  **NOTE:** Once the build begins, it should take about approximately 1 to 2 minutes for the build to complete. Once complete, you will be able to see the number of successful test runs in the Test Result Trend section. ***Wait for the build to complete before continuing to the next step***, as we need the build artifact to complete the deployment in the next step.

- After the build begins, you can also click on the **Console Icon** ![](images/300/Picture29.1.png) to monitor the build log details.

    ![](images/300/Picture30.png)

- From the **Build overview page**, once your build is complete, click the job title **Alpha REST Build** to view the details.

    ![](images/300/image120.png)

- From the build details page, in the **Artifacts of Last Successful Build** region, click the triangle next to the **target** link to expand the artifacts. Then click the **msdbw-microservice.zip** link to download the built microservice.

    ![](images/300/image121.png)

- Now we are ready to use the **Application Container Cloud Service** to deploy the application.

## Deploy the Microservice

### **STEP 5**: Deploy to Application Container Cloud Service

- Return to the tab where your **Main Cloud Dashboard** window is loaded. If your dashboard Window is not available, simply open a tab and go to cloud.oracle.com, and re-login as previously instructed. **Note:** for those using a Trial account, this is will be your Standard Identity Cloud Service based account/dashboard.

- Once the Oracle Public Cloud **Dashboard** is displayed, click on the  <img src="images/200/PictureHamburger.png" class="infra"> menu in the lower left corner of the **Application Container** service card. Right-click **Open Service Console** and click **Open Link in New Tab**.

  ![](images/300/image127.png)  

**NOTE**: If the **Application Container** card is not displayed, you can add it to your dashboard by clicking **Customize Dashboard**, scrolling to **Application Container**, and clicking **Show**. Then open the service console by following the previous instruction.

  ![](images/300/image128.png)

- From the service console, click **Create Application**.

    ![](images/200/image142.png)

- From the application platform list, click **Node**.

    ![](images/300/image122.png)

- In the **name** field, type `AlphaOfficeREST`.

    ![](images/300/image123.png)

- Next to the **Upload Archive** radio button, click **Choose File**. Choose the `msdbw-microservice.zip` file that you downloaded in the previous step and click **open**.

    ![](images/300/image124.png)

- In the **Instances** and **Memory (GB)** fields, click the down arrow to reduce both values to **1**. Then click **Create**.

    ![](images/300/image125.png)

- The zip archive will be uploaded to the service, expanded into a Docker container, and started up using the commands outlined by our build process. The process will take a couple of minutes. After the process is finished, you will see the URL of your running microservice displayed on the console. You may need to refresh the page to see the updated status.

    ![](images/300/image126.png)


## Verify REST Microservice deployment

### **STEP 6**: Test REST services

- To launch the application after the deployment is complete, click the **URL** listed in the AlphaOfficeREST application details.

    ![](images/300/image126.png)  

- A new tab in the browser should open with application running.

    ![](images/300/Picture42.png)  

- Now lets test out the **products** REST call.  Append **/products** to the end of the URL and hit **enter**.  All of the Alpha Office products should be returned in a JSON payload.

    ![](images/300/Picture43.3.png)

### **STEP 7**: Complete Task

We have now automated the build process of the REST microservice. To finish up this lab, we will mark the Issue as completed in the Sprint.

- Back in the Developer Cloud Service window, click **Agile**, followed by clicking **Active Sprints**.

- Drag and drop **Feature 3** from **In Progress** to **Completed**.

    ![](images/300/Picture46.2.png)  


- In the Change Progress popup click **Next**.

    ![](images/300/Picture47.png)  

- In the **Add Time Spent** popup, set the **Time Spent** to `1` and click **OK**.

    ![](images/200/Picture47.5.png)  

- Your Sprint should now look like the following:

    ![](images/300/Picture48.2.png)  

- You can also click on the **Reports** button and view your progress in the **Burndown Chart** and **Sprint Report**.

    ![](images/300/Picture49.png)  


- **You are now done with this lab.**
