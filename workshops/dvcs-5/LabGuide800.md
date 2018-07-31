#Lab 8 – Predicting Subscriptions - Machine Learning

##What is Machine Learning?
Machine learning at its most basic is the practice of using algorithms to parse data, learn from it, and then make a determination or prediction about something in the world. Data Visualization Desktop uses Machine Learning to make predictions using your existing data. Data Visualization also provides scripts to train data models that you then add to other sets of data to predict trends and patterns in data.

![](images/info.png) - Please refer to the excel files in the ML Folder to successfully complete Lab 8.

##8a Create new project and add the Koolkart Orders dataset

**1) Create a new project by dragging the Koolkart Orders Excel file onto the home page.**

PIC

PIC

**2) Formatting data types.**

After uploading the dataset, change **Order ID** and **Customer ID** to attributes. 
Change the **Order Amount** number format from Auto to Currency. Hit OK. 
Once uploaded, click on the file on the home page to open the project.

PIC

##8b Create Visualizations for Sales Analysis

**1) Create Visualizations Order Amount by Date and Category.**
Steps required:
Go to the **Visualize** tab.
Select **Order Amount** and **Order Date** and select **Create Best Visualization**.
Double click the **Category** attribute to add it to your visualization.
Switch the chart from a line chart to an area chart.
Select Order Date dropdown in Data Elements section. Select Month and drag to Category (X-Axis) to replace Order Date.

PIC

**2) Create Visualization for Order Amount by Category and Sub Category.**
Steps required:
Select **Category**, **ub Category**, and **Order Amount**. Right click attributes while selected then select **Tree Map**.

PIC

Select **Order Amount** and **Order Date**. Right click attributes while selected then select **Create best visualization**.
Right Click the visualization and select Add Trend Line. 
Right Click the visualization and select Add Forecast.

Refer to the visualization settings in Project Components Menu and select the () Analytics option. Select the Forecast dropdown and enter 6 in the Period textbox to change the Model to Arima ().
 
##8c Create Visualization for Customer Analysis

**1) Add another dataset and format data.**

Select the (+) next to Data Elements and select Add Data Set...
Select (Create Data Set) and add the KoolKart Customers Excel File. Another way to create the data set is to drag and drop the KoolKart Customers Excel file to the data flow.

**Drag** the file onto the file icon.
Change Customer ID data type from a measure to attribute.

PIC

Select Data Diagram and select Add Another Match.

PIC

**2) Create a visualization of Order Amount by Customer Age Group.**

Steps required:
Click on Visualize
Create a new Canvas
Expand the new Koolkart Customers dataset
Select **Order Amount** from Koolkart Orders and **Customer Age Group** from Koolkart Customers. While having the attributes selected, right click and select **Create best visualization**.
Change chart type to a Donut chart and move **Customer Age Group** to **Color**.

PIC

Select **Order Amount** and **Customer Country**. While having the attributes selected, right click and select **Pick Visualization**.
Choose the **Map Chart**.

PIC

Select **Order Amount** and **Customer Gender**. While having the attributes selected, right click and select Pick Visualization.
Choose the **Pie Chart**.
Right-click the **Pie Chart** and select Color > Manage Assignments. Choose the color pink for F and the color royal blue for M.
Move pie chart under the donut chart.

PIC

Name the canvas “Customers” and save the project.

##8d Creating a Data Flow for Koolkart Orders and Customers

**1) Create a Data Flow and add Dataset**
Steps required:

Click on the Home button in the top right corner.
Select Create > Data Flow and then add the Koolkart Orders Dataset.


**2) Add a Dataset to Data Flow**

Steps required:

Double click on Add Data (+ Add Data) and add the KoolKart Customers dataset.

PIC

**3) Add Filter a to Data Flow**
Steps required:
Select Filter and drag between KoolKart Orders and Join.

PIC

Select (+ Click here or drag data to add a filter) and select Category in the Available Data. 
Double click on Movies & Music
Refer to the Selections, click the hamburger option (Hamburger Menu), and select Exclude Selections.

PIC
PIC

**4) Add Select Columns to the Data flow and exclude duplicated Customer ID**

Steps required:
Select (Select Colums) and drag it to (+) on in front of Join.
PIC
Select Customer_ID1 and click Remove Selected.


**5) Group data into Sales Regions in data flow**
Steps required:
Select (+)) next to **Select Columns** and then select **Group**.
Set the group name to **Sales Region**.
Name the first group **NA** and add **Canada** and **USA** to the group.
Select (+ Group) to add a second group and name it **EMEA**. Add the following countries to the group: **France**, **United Kingdom**, and **Germany**.

Select (+ Group) to add a third group and name it APAC. Add Japan to the group.

PIC

Your Data Flow should look this after you’ve successfully completed the steps.

PIC

Save the Data Flow and name it ML Dataflow.

##8f Creating a Dataflow and Predicting Subscriptions

![](images/UserStory.png - When customers purchase from Koolkart website they are offered the opportunity to subscribe to the KoolKart mailing list.

Some customers have purchased some products through a partner and in the shipping confirmation email KoolKart would like to include an incentive to subscribe to KoolKart mailing list, in the form of a discount coupon.

The marketing department just doesn’t know how big the incentive should be. They would like to predict the likeliness of new customers to subscribe and directly correlate the amount of the coupon to how much they are likely to subscribe anyway.

They want to take advantage of existing data gathered by looking at subscription patterns on Koolkart website and develop a model that looks at past subscription data to determine the influence of Customer Age Group, Customer Gender, Customer Country and purchased Product Category into the likeliness to subscribe.

**1) Create a Data Flow and add Dataset**
Steps required:

Click on Home.
Select Create and Data Flow, add the KoolKart Subscription dataset. Select Train Binary Classifier and select Naïve Bayes for Classification.


**2) Add a Binary Classifier to the Data Flow**
Steps required:
Select (Train Multi Classifier) and drag it to the (+) in front of the KoolKart Subscription.
When the “Select Train Two-Classification Model Script” window loads there will be multiple scripts that you can choose from.
Select the Naïve Bayes for Classification script.
Set a target by clicking (Select a column) and select Subscribed.

PIC

Save the Data Flow as Subscribed Predictions 
Click Execute Data Flow

**3) Create a Scenario that will predict subscription confidence.**
Steps required below:

Open the Machine Learning project and create a new canvas named “Subscription Prediction”. Click the (+) next to the Date Elements, select the Add Data Set option. Select the Create Data
Set (Create Data Set) option and add the KoolKart Partner Sales Excel file by dragging and dropping the file onto the file icon

PIC

Turn OrderID into an attibute.
Click the  (+) next to the Data Elements again and select the create scenario option.
Once the Create Scenario – Select Model window loads, select the Subscribed Prediction Model.

PIC

Once the Create Scenario – Map Your Data window loads, select the KoolKart Partner Sales for the Data Set. Click on the Select Data next to the Order ID and click Order ID. When you are done select OK.

PIC

Select **Customer Name** and **PredictionConfidence**. While having the attributes selected, right click, select **Pick Visualization**, and select **Pivot Table**.

Drag the **Subscribed Prediction** to the Color. Right click the color and the select Manage Assignments. Choose the color Royal Blue for No and the color Green for Yes.


If you have successfully completed the steps you will see the visualization below. From looking at the chart we can predict which customers are more likely to get a subscription.

PIC

Congratulations! You have completed the workshop.

In today’s workshop, we were able to quickly assess the effectiveness of your social media campaigns on sales and how sales trends correspond to social media tone/sentiment. We were also able to explore some ERP data to look at spend as well as HCM data to look at attrition, vacancies and reasons why people are leaving.

This concludes our Oracle Analytics Cloud Data Visualization workshop.

For further information about Oracle Analytics Cloud Service or any of the Oracle BI products, contact your Oracle Business Intelligence Sales Rep.



