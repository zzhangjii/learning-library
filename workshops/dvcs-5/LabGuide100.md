## Lab 1 - Getting Started with OACv5 DV

## Objectives

This section focuses on getting started with OACv5 DV and introducing users to the DV interface.

Key takeaways from this lab:
- Starting an Autonomous OAC instance 
- Learning and getting acclimatized to the DV interface

### 1a) Provisioning an Oracle Autonomous Analytics Cloud Instance

1. Open your browser and navigate to [cloud.oracle.com](cloud.oracle.com). Click on **Sign In**.

    ![](images/100/img_1a_1_1.png)  

2. Enter your cloud account name and click on **My Services**.
    
    ![](images/100/img_1a_2_1.png)  
    
3. Enter your username and password and click on **Sign In**.
    
    ![](images/100/img_1a_3_1.png)  

4. Once you log in you will see a page similar to the one below: -
    
    ![](images/100/img_1a_4_1.png)  

    Select **Customize Dashboard**. Ensure that **Autonomous Analytics** is not hidden.
    
    ![](images/100/img_1a_4_2.png) 
    
5. Click on the hamburger icon to reveal the menu. Select **Services**. The expanded menu will list all services available for provisioning.

    ![](images/100/img_1a_5_1.png) 

    Select **Autonomous Analytics**.
    
    ![](images/100/img_1a_5_2.png) 
    
6. On the next screen click on **Create Instance**.
    
    ![](images/100/img_1a_6_1.png) 
    
7. Next, we will configure our instance. Click on the **Feature Set** dropdown. 
    
    ![](images/100/img_1a_7_1.png)
    
    Choose **Data Visualization**.
    
    ![](images/100/img_1a_7_2.png)
    
    Now, give your instance a **Name** and choose the correct **License Type**. If you already own a license, then choose the first option else go with the second.
    
    ![](images/100/img_1a_7_3.png)
    
    After this click on the **Edition**, choose **Oracle Analytics Cloud - Standard**.
    
    ![](images/100/img_1a_7_4.png)
    
    ![](images/100/img_1a_7_5.png)
    
    Once configured, click on **Next**.
    
    ![](images/100/img_1a_7_6.png)
    
8. Review your selections and click **Create**. In case of issues, return to the previous screen and make the required changes.

    ![](images/100/img_1a_8_1.png)
    
9. Now, wait for the instance to be created.

    ![](images/100/img_1a_9_1.png)
    
    You will receive an email once the instance is ready.
    
    ![](images/100/img_1a_9_2.png)
    
10. Click on the **Ellipses** menu and select **Oracle Analytics Cloud URL**. 

    ![](images/100/img_1a_10_1.png)
    
    Doing so will take you to the OAC home page which we will be reviewing in the next section.
    
    ![](images/100/img_1a_10_2.png)
    

### 1b) Reviewing the Home page and the primary menus

On logging into OACv5, you will see the home page.

![](images/100/img_1b_1.png)  

1. Start by clicking on the hamburger menu in the top-left of the UI. This will open the drawer menu.

    ![](images/100/img_1b_1_1.png)
    
2. You can use this menu to navigate through the application.

    ![](images/100/img_1b_2_1.png)
    
    ![](images/100/img_1b_2_2.png)
    
    The application follows standard web and application interface protocols, thus supporting both left and right click interactions. In terms of general navigation, there are 4 key menus accessible at the top of the screen or via a hamburger menu in the top left (not all screens will show the top menu bar but the hamburger navigation is always available).

    - **Home**: Application start up page from where you can view existing projects, data sets, data flows or create new ones. 
    
    - **Projects**:  Collections of visualizations and the underlying data sources. **Folders** are simply means by which to organize projects.
    
    - **Data**: This page allows you to display or create **Data Sets** (instances of data such as a specific Excel file); **Connections** (connections to data sources such as a database or SaaS application to pull data files); or **Data Flows** (ability to curate data from data sources including adding calculations, merging multiple sources, and managing columns).
    
    - **Machine Learning**: This page shows all the available machine learning models ready for use in projects.
    
    - **Console**: Administrative menu for managing **Custom Plugins** (e.g. new types of analyses obtained from the Oracle Analytics Store or custom built), **Maps** layers (e.g. new backgrounds for map-based analyses) and other administrative tasks.
    
    - **Academy**: Home to important links to the OAC documentation and videos that help you accomplish common tasks in the OAC. 
   
3. At the top-right of the UI, click on the Create button.

    ![](images/100/img_1b_3_1.png)
    
    This window allows you to create a Visualization project, a data set, a connection to an external source, a data flow, a sequence...

4. Click on hamburger icon at the top right of the UI, next to Create.

    ![](images/100/img_1b_4_1.png)

5. Select the Customize option.

    ![](images/100/img_1b_5_1.png)
    
    ![](images/100/img_1b_5_2.png)
    
    This menu allows you to customize the components of your home page.

Now that you can start OAC and navigate around DV, let’s get started with some analyses!