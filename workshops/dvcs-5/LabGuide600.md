
![](images/100/Picture100-lab.png)  
Updated: February 10, 2017

#Lab 6 – Advanced Data Visualizations (Box Plots, Clusters, Plugins)

Thus far you have learned how to manage data sources, create visualizations and convert your results into useful insights. In this next lab we will expand upon what you have learned with more advanced techniques to show even more powerful analytics capabilities and the platform’s flexibility.

- ![](images/Yield.png) - You must have completed all of Lab 4 or Lab 5a to complete this Lab. It would also help to have completed the rest of Lab 5 for context purposes around the data but it is not required.

##6a – Create a Box Plot and Scatter Plot Visualization in a New Project

**1) Create a Box Plot visualization of monthly variances across the organization.**

Steps:
    Create a new DVD Project.
    Use EITHER the **General Ledger Data – COMBINED** data source or **General Ledger Data Merged** data source.
    Select **Month**, **Business Lines**, and **Variance**. Select **Pick Visualization** and select **Box Plot**.
    Move **Month** to the **Item (Detail)** attribute. Move **Business Lines** to the **Category (X-Axis)**.
    
    To better understand what you are seeing, also create another visualization analyzing variances.
Steps:
    Select **Month** and **Variance**. Select **Pick Visualization** and **Bar** chart.
    Select the new visualization. Select **Business Lines** and add it to the **Filter** attribute (hint: make sure you add the filter only to the visualization and not the whole canvas).
    Select **Technical Services**.

**Save** your project (e.g. **Advanced Spend Analysis**).


PIC 

On the **Variance by Month** visualization you should see two large negatives. The one in **August** and the one in **November**. If you look at the **Variance by Business Lines** you should see those two data points appearing as dots for **Technical Services**.

You should also see a large positive in **June** on the right hand side which corresponds to the highest dot on the left.

Basically, a box plot is a way to visualize data using a statistical distribution of values (e.g. minimum, maximum, median, quartiles). By doing so we can see that even though **Technical Services** had the second largest overspend of any **Business Line** in the past year (in **August**),that was an anomaly and **Technical Services** is actually second most reliable in terms of adhering to budgets. And when the variance does get high it is usually within a comfortable range (more so than for 4 other Business Lines).

While excessive spend should be addressed it is important when analyzing data to evaluate trends as well and not just isolated incidents.

PIC

##6b – Create a Box Plot and Scatter Plot Visualization in a New Project

- ![](images/Yield.png) - You must have completed all of Lab 1c to complete this Lab.


**1) Create a Scatter Plot visualization of variances by month.**

**Capital Equipment** seems to have some issues in terms of exceeding budgets so let’s take a closer look at the data to see if we can identify any kind of trends.

Steps:
    Create a new **Canvas**.
    Select **Month** and **Variance**. Select **Pick Visualization** and select **Scatter (Cat.)**. 
    Add **Business Lines** to the **Filter**. Select **Capital Equipment**.

    PIC

    Using the naked eye it may be hard to discern any kind of pattern here given the wide range of data. Fortunately, DVD has tooling to help.


**2) Add a trend line with confidence level, a forecast, and outliers.**
Let’s first add a trend line:
    - Right-click in the chart and select **Trend Line** to see if the system can identify a pattern.
    PIC
    - You should now see a line indicating the trend along with a grey area indicating possible ranges for the trend. You should also along with a menu for more options. As you can see you can update how the trend is derived (i.e. the **Method**) as well as the **Confidence Interval** (i.e. the statistical certainty with which that trend has been determined). Given the range of data, let’s reduce the confidence.
    - Click on **95%** and select **90%** to thin out the range.
    PIC
    - Let’s also ask the system to identify the true **Outliers** (values outside a statistical range which is typically based upon standard deviations from the median). **Outliers** are **NOT** values outside the trend line range but rather extremes in the data.
    - Select **Outliers** in the Project Components Menu (make sure to first select the Analytics icon). Drag it into **Color**.
    PIC
    - You will now see certain data points highlighted as **Outliers**. The variances in **February** and **August** seem to be anomalous based on these findings.
    PIC
    - Let’s also quickly add a **Forecast** to see if this (worrying) trend of actuals outpacing budgets should be a cause for major concern.
    - Right click in the chart and select **Forecast** (you could also drag and drop from the **Analytics** menu we just used).
    PIC
    - Based on the result set you could say that according to existing data with 90% confidence, actuals could exceed budget by as much as almost $175,000 within 3 months. That’s something certainly worth addressing!
    PIC
Now what happens if you want to evaluate your data in a format that is not provided? Fortunately, DVD can still help!

##6c – Upload and Use a Custom Visualization
**1) Search for and download a DVD plugin.**
    Navigate to the following URL in your browser

    https://www.oracle.com/solutions/business-analytics/data-visualization/library.html

    This is the **Oracle Analytics Library** where you can find plugins, sample projects, and map layers.

    PIC

    In our example, we are going to download and use **Dial Gauges Sample Plugin** (you can scroll through the list or use the search functionality). Select **Download**.

    PIC

    You will be prompted to accept a license agreement and you may need to sign in to your free **Oracle Technology Network (OTN)** account (if you downloaded and installed the tool itself in Lab 1 it’s the same account).

    PIC

    PIC
    Download the file to your machine.

    PIC
    PIC 
**2) Install the plugin.**
    Navigate to the **Console** menu.
    PIC
    In the **Custom Plugins** section, click on **Upload Custom Plugin**.
    PIC
    You will be prompted to upload the file we downloaded in the last step. Navigate to where you saved the file, select it, and select **Open**.
    PIC
    You should also see the new plugin in the menu.
    PIC
    You will see the following message. 
    PIC 
    Close DVD to allow the plugin to be registered. 
    PIC 
**3) Create a visualization using the plugin.**
    Open DVD (you should have closed it in the last step). Then open the **Project** you were using in the prior sections of this Lab (e.g. **Advanced Spend Analysis**).
    PIC
    Create a new **Canvas** using the menu at the bottom of the screeen. 
    PIC 
    Create a calculation to show actauls as a percent of budget. 
    PIC
    PIC
    Select **Business Lines** and **Actuals as % of Budget**. **Right click** and select **Pick Visualization**.
    PIC
    Select **DialGaugeViz Plugin**.
    PIC 
    Move **Business Lines** to **Trellis Columns**.
    PIC 
    Let’s tweak the format so it’s easier to view and since some groups may exceed 100%. **Right click** the visualization and select **Properties**.
    PIC 
    Enter **110** for the **Gauge Max Value**. Select **Alta** next to **Gauge Style** and select **Antique**. Click outside the menu to exit it.
    PIC
    We now have a nice new visualization using a plugin! It is also worth noting the platform includes a Software Development Kit (SDK) for developers to create new plugins so there is no limit to what you can create!
    PIC
    **Save** your project.
    There is certainly a lot more you can achieve in terms of customization and analytics but hopefully thiS lab has given you an idea of the capabilities in the platform.


You will take on 3 Personas during the workshop. The **Project Manager Persona** will create the projects, add tasks and features to be worked on, and assign tasks to developers.  The Project Manager will then start the initial sprint. The Java Developer persona will develop a new twitter feed service that will allow for retrieval and filtering of twitter data. The **JavaScript Developer** persona will develop a new Twitter Marketing UI that will display the twitter data to allow for analysis.  During the workshop, you will get exposure to Oracle Developer Cloud Service and Oracle Application Container Cloud Service.

**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives
- Create Initial Project
    - Add Users to Project
- Create Product Issues
    - Create Issues for Twitter Feed Microservice
    - Create Issues for Twitter Feed Marketing UI
- Create Agile Board and initial Sprint
- Add Issues to Sprint

## Required Artifacts
- The following lab requires an Oracle Public Cloud account that will be supplied by your instructor.


# Create Twitter Feed Marketing Project

## Create Developer Cloud Service Project

### **STEP 1**: Login to your Oracle Cloud Account
- From any browser, go to the URL:
    `https://cloud.oracle.com`

- click **Sign In** in the upper right hand corner of the browser

    ![](images/100/Picture100-1.png)

- **IMPORTANT** - Under my services, select from the drop down list the correct data center and click on **My Services**. If you are unsure of the data center you should select, and this is an in-person training event, ***ask your instructor*** which **Region** to select from the drop down list. If you received your account through an Oracle Trial, your Trial confirmation email should provide a URL that will pre-select the region for you.

    ![](images/100/Picture100-2.png)

- Enter your identity domain and click **Go**.

    **NOTE:** The **Identity Domain, User Name** and **Password** values will be given to you by the instructor or Trial confirmation email.

    ![](images/100/Picture100-3.png)

- Once your Identity Domain is set, enter your User Name and Password and click **Sign In**

  **NOTE:** For this lab you will assume the role of Project Manager ***Lisa Jones***. Although you are assuming the identify of Lisa Jones, you will log into the account using the **username** provided to you by your instructor, given to you by your corporation, or supplied to you as part of an Oracle Trial. As you progress through the workshop, you will remain logged in as a single user, but you will make “logical” changes from Lisa Jones the Project Manager to other personas.

    ![](images/lisa.png)

    ![](images/100/Picture100-3.5.png)

- You will be presented with a Dashboard displaying the various cloud services available to this account.

    ![](images/100/Picture100-4.png)

- If all your services are not visible, **click** on the **Customize Dashboard**, you can add services to the dashboard by clicking **Show.** For this workshop, you will want to ensure that you are showing at least the **Application Container, Developer and Storage** cloud services. If you do not want to see a specific service, click **Hide**

    ![](images/100/Picture100-5.png)

### **STEP 2**: Check/Set Storage Replication Policy

Depending on the state of your Cloud Account, you may need to set the replication policy, if it has not been previously set. In this step you will got to the Storage Cloud Service to check on the status of the Replicaton Policy. 

- Click on the **Storage** Cloud Service

    ![](images/100/Picture-01.png)

- If you see a message requesting that you **Set Replication Policy** as is shown below, click on the message. If the message is not displayed, your replicatin policy has already been set and you can continue to the next step by clicking on the **Dashboard** icon in the top right corner of the page.

    ![](images/100/Picture-02.png)

- Care must be taking when setting your replication policy, because it cannot be changed. With Trial accounts, the first option available will generatlly set the replication policy sufficient for this workshop, so we will take the Default, and click on the **Set** button. 

    ![](images/100/Picture-03.png)

- Click on the **Dashboard** button

    ![](images/100/Picture-04.png)

### **STEP 3**: Login to Developer Cloud Service

Oracle Developer Cloud Service provides a complete development platform that streamlines team development processes and automates software delivery. The integrated platform includes an issue tracking system, agile development dashboards, code versioning and review platform, continuous integration and delivery automation, as well as team collaboration features such as wikis and live activity stream. With a rich web based dashboard and integration with popular development tools, Oracle Developer Cloud Service helps deliver better applications faster.

- From the Cloud UI dashboard click on the **Developer** service. In our example, the Developer Cloud Service is named **developer99019**.

    ![](images/100/Picture100-6.png)

- The Service Details page gives you a quick glance of the service status overview.

    ![](images/100/Picture100-7.png)

- Click **Open Service Console** for the Oracle Developer Cloud Service. The Service Console will then list all projects for which you are currently a member.

    ![](images/100/Picture100-7.5.png)

### **STEP 4**: Create Developer Cloud Service Project

- Click **New Project** to start the project create wizard.

    ![](images/100/Picture100-8.png)

- On Details screen enter the following data and click on **Next**.

    **Name:** `Twitter Feed Marketing Project`

    **Description:** `Project to gather and analyze twitter data`

    **Note:** A Private project will only be seen by you. A Shared project will be seen by all Developer Cloud users. In either case, users need to be added to a project in order to interact with the project.

    ![](images/100/Picture100-9.png)

- Leave default template set to **Empty Project** and click **Next**

    ![](images/100/Picture100-10.png)

- Select your **Wiki Markup** preference to **MARKDOWN** and click **Finish**.

    ![](images/100/Picture100-11.png)

- The Project Creation will take about 1 minute.

    ![](images/100/Picture100-12.png)

- You now have a new project, in which you can manage your software development.

    ![](images/100/Picture100-13.png)



# Create Product Issues

## Create Issues for Twitter Feed Microservice

### **STEP 5**: Create Issue for the initial GIT Repository Creation

In this step you are still assuming the identity of the Project Manager, ***Lisa Jones***.

![](images/lisa.png)

- Click **Issues** on left hand navigation panel to display the Track Issues page.

    ![](images/100/Picture100-16.png)

- Click **New Issue**. Enter the following data in the New Issue page and click **Create Issue**.

    **Note:** Throughout the lab you will assign your own account as the “physical” owner of the issue, but for the sake of this workshop, **Bala Gupta** will be the “logical” owner of the following issues.

    ![](images/bala.png)

    **Summary:**
    `Create Initial GIT Repository for Twitter Feed Service`

    **Description:**
    `Create Initial GIT Repository for Twitter Feed Service`

    **Type:** `Task`

    **Owner:** `Select your account provided in the dropdown [Logical Owner: Bala Gupta]`

    **Story Points:** `1`

    Note: Story point is an arbitrary measure used by Scrum teams. They are used to measure the effort required to implement a story. This [Site](https://agilefaq.wordpress.com/2007/11/13/what-is-a-story-point/) will provide more information. 

    ![](images/100/Picture100-17.png)

### **STEP 6**: Create Issue for Update Twitter Credentials

- Click **New Issue**. Enter the following data in the New Issue page and click **Create Issue**.

    ![](images/bala.png)

    **Summary:** `Create Filter on Twitter Feed`

    **Description:** `Create Filter to allow user to supply text to reduce the amount of data returned by the Twitter feed`

    **Type:** `Feature`

    **Owner:** `Select your account provided in the dropdown [Logical Owner: Bala Gupta]`

    **Story Points:** `2`

    ![](images/100/Picture100-18.png)

### **STEP 7**: Create Issue for initial GIT Repository creation

- Click **New Issue**. Enter the following data in the New Issue page and click **Create Issue**. Note: The next two issues will logically be owned by John Dunbar.

    ![](images/john.png)

    **Summary:** `Create Initial GIT Repository for Twitter Feed Marketing UI`

    **Description:** `Create Initial GIT Repository for Twitter Feed Marketing UI`

    **Type:** `Task`

    **Owner:** `Select your account provided in the dropdown [Logical Owner: John Dunbar]`

    **Story Points:** `1`

    ![](images/100/Picture100-19.png)

### **STEP 8**: Create Issue for Displaying Twitter Feed

- Click **New Issue**. Enter the following data in the New Issue page and click **Create Issue**.

    ![](images/john.png)

    **Summary:** `Display Twitter Feed in Table Format`

    **Description:** `Display Twitter Feed in Table Format`

    **Type:** `Feature`

    **Owner:** `Select account provided in the dropdown [Logical Owner: John Dunbar]`

    **Story Points:** `2`

    ![](images/100/Picture100-20.png)

- Click the back arrow ![](images/100/Picture100-21.png) on the **left side** of the window, or click on the **Issues** menu option to view all newly created issues.

    ![](images/100/Picture100-22.png)


