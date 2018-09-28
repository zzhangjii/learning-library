## Lab 5 – Predicting Subscriptions - Machine Learning

Key takeaways from this lab:
- Learning how to create data flows
- Using the **Machine Learning** abilities of OAC

### What is Machine Learning?
Machine learning, at its most basic, is the usage of algorithms to parse data, learn from it, and then make a determination or prediction about something. The Machine Learning abilities of OAC5 allow you to make predictions based on your data set. Data Visualization also provides scripts to train data models that you can add to other data sets to predict trends and patterns in data.

### Scenario

When customers purchase products through a partner, KoolKart would like to include a discount coupon in the shipping confirmation email as an incentive for users to subscribe to the KoolKart mailing list. Now, Isla Stuart, who is a Digital Marketing Specialist, has to understand the customer demographics and figure out how big the incentive should be. 

To do this, Isla  has already obtained 4 different data sets: Orders, Customers, Subscriptions and Partner Sales. She wants to look at subscription patterns on the KoolKart website and develop a model that looks at past subscription data to determine how Customer Age Group, Customer Gender, Customer Country and  purchased Product Category influence the likeliness to subscribe. 

Isla knows that she needs to use KoolKart Orders and KoolKart Customers data sets together. Most importantly, she decides to utilize the Data Flow functionality of OAC that allows her to create a data set tailored to her needs. Let's start!

### 5a) Creating a Data Flow for KoolKart Orders and Customers

1. Create a Data Flow and add a data set

    Select the hamburger menu button and click on the Home button.

    ![](images/500/img_5a_1_1.png)

    Select **Create** and then **Data Flow**. 

    ![](images/500/img_5a_1_2.png)

    Add the **KoolKart Orders** data set.

    ![](images/500/img_5a_1_3.png)

2. Once the **Data Flow Editor** opens up, click the **Add Data** icon in the **Data Flow Steps** and drag it to the editor. 

    ![](images/500/img_5a_2_1.png)
    
    Add the **KoolKart Customers** data set by selecting **KoolKart Customers** and selecting **Add**.

    ![](images/500/img_5a_2_2.png)

    Click on **Join** and add it to the data flow. 

    ![](images/500/img_5a_2_3.png)

    Ideally, OAC should detect the joining logic, but in case it doesn't, you will see an Incomplete join message. Click on the circle to complete the join. 

    ![](images/500/img_5a_2_4.png)

    If you've successfully made the join, the dataflow will reflect the image below. 

    ![](images/500/img_5a_2_5.png)

3. The **Movies & Music** category is not required for the analysis. So, we add a filter to the **Data Flow**.
    
    Select **Filter** and drag between **KoolKart Orders** and **Join**.

    ![](images/500/img_5a_3_1.png)

    Select the **+** and select the category attribute. 

    ![](images/500/img_5a_3_2.png)

    Select **Movies & Music** to move it to the **Selections**. Click on the hamburger option, and select **Exclude Selections**.

    ![](images/500/img_5a_3_3.png)

4. Add **Select Columns** to the Data flow and exclude the duplicated **Customer ID**.
    
    Select **Select Columns** and drag it to **+** on in front of Join.
    
    ![](images/500/img_5a_4_1.png)

    Select **Customer_ID1** and click on **Remove Selected**.

    ![](images/500/img_5a_4_2.png)

5. Group Sales data into Regions. 

    Select **+** next to **Select Columns** and then select **Group**.

    ![](images/500/img_5a_5_1.png)

    Set the group name to **Sales Region**.
    Name the first group **NA** and add **Canada** and **USA** to the group.

    ![](images/500/img_5a_5_2.png)
    
    Select **+ Group** to add a second group and name it **EMEA**. Add the following countries to the group: **France**, **United Kingdom**, and **Germany**.

    Select **+ Group** to add a third group and name it **APAC**. Add **Japan** to the group.

    ![](images/500/img_5a_5_3.png)

    Now, drag **Save Data Set** into the editor. Save the data set as **KoolKarts Orders & Customers**. Set **Order ID** and **Customer ID** to attributes.

    ![](images/500/img_5a_5_3_2.png)
    
    ![](images/500/img_5a_5_3_3.png)

    Save the **Data Flow** by clicking the Save button in the top corner. 

    ![](images/500/img_5a_5_4.png)
    
    Name the data flow **KoolKart Dataflow**.

    ![](images/500/img_5a_5_5.png)
    
    Click **Run Data Flow** to execute the data flow.
    
    ![](images/500/img_5e_2_8.png)
    
    ![](images/500/img_5a_5_7.png)

### 5b) Using KoolKart Dataflow for Sales Analysis

1. Create a new project by double clicking on the the **KoolKart Orders & Customers** data set on the home page or clicking on the ellipses menu and selecting **Create Project**.

     ![](images/500/img_8a_2_1.png)
     
     ![](images/500/img_5a_6_1.png)
    
2. Go to the **Prepare** tab and select the **Customer Country** column.  

    ![](images/300/img_3d_1_1.png)

    ![](images/500/img_5b_2_2.png)
    
    Select the recommendation **Enrich Customer Country with continent**.
    
    ![](images/500/img_5b_2_3.png)
    
    Notice, how the recommendation allows us to group the countries into sales regions with just 1 click and do so much more. Since, we have already grouped our data, let's return to visualizing. Click on **Visualize**.
    
     ![](images/300/img_3c_1_1.png)
    
2. Create Visualizations Order Amount by Date and Category.
    
    Select **Order Amount** and **Order Date** and select **Pick Visualization**. 
    
    ![](images/500/img_5a_6_2.png)
    
    After you selecting **Pick Visualization**, select the **Line** chart. 

    ![](images/500/img_5a_6_3.png)
    
    Double click the **Category** attribute to add it to your visualization. Switch the chart from a **Line** chart to an **Area** chart.
    
    ![](images/500/img_5b_1_1.png)

    Select **Order Date** dropdown in **Data Elements** section. Select **Month** and drag it to **Category (X-Axis)** to replace **Order Date**.

    ![](images/500/img_5b_1_2.png)
    
    ![](images/500/img_5b_1_3.png)

3. Create Visualization for Order Amount by Category and Sub Category.
   
    Select **Category**, **Sub Category**, and **Order Amount**. Right click attributes while selected then select **Tree Map**.

    ![](images/500/img_8b_2_2.png)

    ![](images/500/img_8b_2_3.png)

4. Create Visualization for Order Amount by Order Date.
    
    Select **Order Amount** and **Order Date**. Right click attributes while selected then select **Create best visualization**.

    ![](images/500/img_5b_3_1.png)

    Right Click the visualization and select **Add Trend Line**. 

    ![](images/500/img_5b_3_2.png)

    Right Click the visualization and select **Add Forecast**.
    
    ![](images/500/img_5b_3_3.png)

    Refer to the visualization settings in **Project Components Menu** and select the **Analytics** option. Select the **Forecast** dropdown and enter 6 in the **Periods** textbox.

    ![](images/500/img_5b_3_4.png)

    Change the **Model** to **ARIMA**.

    ![](images/500/img_5b_3_5.png)

    You're canvas should reflect the picture below. 

    ![](images/500/img_5b_3_6.png)

    Hover over the **Canvas 1** tab with your cursor and select the downward arrow.

    ![](images/500/img_5b_3_7.png)

    Rename the canvas to "Sales". 

    ![](images/500/img_5b_3_8.png)

    Save the project and name it "Machine Learning".

    ![](images/500/img_5b_3_9.png)

    ![](images/500/img_5b_3_10.png)
 
### 5c) Creating Visualization for Customer Analysis

1. Create a visualization of Order Amount by Customer Age Group.

    Create a new Canvas.
    
    ![](images/500/img_5c_2_1.png)

    Select **Order Amount** from KoolKart Orders and **Customer Age Group** from KoolKart Customers. While having the attributes selected, right click and select **Create best visualization**.
    
    ![](images/500/img_5c_2_2.png)

    Change chart type to a **Donut** chart. 

    ![](images/500/img_5c_2_3.png)
    
    Move **Customer Age Group** to **Color**.

    ![](images/500/img_5c_2_4.png)

    Select **Order Amount** and **Customer Country**. While having the attributes selected, right click and select **Pick Visualization**.

    ![](images/500/img_5c_2_5.png)

    Choose the **Map Chart**.

    ![](images/500/img_5c_2_6.png)

    Navigate to settings section and select the data layers section. We've recently added a new feature which enables you to create new data layers. Within this section you can also adjust the map layers, the layer type, and transparency of the map. 

    ![](images/500/img_5c_2_6.1.png)

    Your canvas should reflect the picture below

   ![](images/500/img_5c_2_7.png)

    Select **Order Amount** and **Customer Gender**. While having the attributes selected, right click and select Pick Visualization.

   ![](images/500/img_5c_2_8.png)

    Choose the **Pie Chart**.

   ![](images/500/img_5c_2_9.png)

    Right-click the **Pie Chart** and select **Color** then **Manage Assignments((. 
    
   ![](images/500/img_5c_2_10.png)

    Choose the color pink for F and the color royal blue for M.

   ![](images/500/img_5c_2_11.png)
    
    Move pie chart under the donut chart.

   ![](images/500/img_5c_2_13.png)
    
    Name the canvas “Customers” and save the project.
   ![](images/500/img_5c_2_14.png)

### 5d) Using the Explain feature to create a visualization
    
Let's take a few moments to learn more about the **Explain** feature. The **Explain** feature allows you to uncover insights and patterns about a particular column within a data set. 
    
1. Right-click the **Category** attribute and selected **Explain Category**. 
   
   ![](images/500/img_5d_1_1.png)

2. Look at **Explain Category** window and observe some the basic insights. 
   
   ![](images/500/img_5d_2_1.png)
  
  The **Explain** feature parses the data set and presents different insights about the **Category** column. Listed below is a description of what **Basic Facts**, **Key Drivers**, **Segments** and **Anomalies entail**:

    **Basic Facts** - Shows the basic distribution of the data element (attribute or measure) values across the data set and its breakdown against each one of the measures in the data set.
    
    **Key Drivers** - Shows data elements (attributes or measures) that are more highly correlated to the outcome for the selected data. You will see charts showing the distribution of the selected attribute value across each of the correlated attributes values.

    **Segments that Explain** - Shows the segments or group in the data set, after examining all the records that can predict the value of the selected data element. You can select a particular segment or group and then continue to analyze it.

    **Anomalies** - Shows the group of anomalies or unusual values in the data set that you can relate to the selected data element (attribute or measure). You can review and select particular group of anomalies.

3. Add a visualization to the the canvas using the explain feature.

    Select the check on the right corner of the visual and click **Add Selected**.
    
    ![](images/500/img_5d_3_1.png)

    If you've successfully added the visualization, your canvas should reflect the image below. 

    ![](images/500/img_5d_3_2.png)

    Delete the **Explain Category** Canvas by right clicking the tab and selecting **Delete Canvas**. 

    ![](images/500/img_5d_3_3.png)


### 5e) Creating a Dataflow and Predicting Subscriptions

Isla now wants to predict the likeliness of new customers to subscribe and to directly correlate the amount of the coupon to how much they are likely to subscribe anyway.

She wants to take advantage of existing data gathered by looking at subscription patterns on KoolKart website and to develop a model that looks at past subscription data to determine the influence of Customer Age Group, Customer Gender, Customer Country and purchased Product Category into the likeliness to subscribe.

1. Use Data Flow Editor to Create Model

    Click the hamburger button and select **Home**.

    ![](images/500/img_5e_1_1.png)

    Open the **Data Flow Editor** by clicking on **Create** and then **Data Flow**.  
    
    ![](images/500/img_5e_1_2.png)
    
    Select **Create Data Set**.

    ![](images/500/img_5e_1_3.png)

    Select **Drop data file here or click to browse** and choose the **KoolKart Subscription** data set. 

    ![](images/500/img_5e_1_4.png)

    Select **Add** to add the **KoolKart Subscription** data set. 

    ![](images/500/img_5e_2_1.png)

2. Add a Binary Classifier to the Data Flow
    
    Select **Train Binary Classifier** and drag it to the **+** in front of the **KoolKart Subscription** data set.

    ![](images/500/img_5e_2_2.png)

    Select the **Naïve Bayes for Classification** script from the menu that opens up.
    
    ![](images/500/img_5e_2_3.png)

    Your data flow should look something like this: 

    ![](images/500/img_5e_2_4.png)

    Set a prediction target by clicking on **Select a column** and select **Subscribed**.

    ![](images/500/img_5e_2_5.png)

    Click Save Model and name the model **Subscribed Prediction Model**. 

    ![](images/500/img_5e_2_6.png)

    Save the Data Flow and name it **Subscribed Predictions** and select OK.
    
    ![](images/500/img_5e_2_7.png)

    Click **Run Data Flow** to execute the data flow. 

    ![](images/500/img_5e_2_8.png)

3. Create a Scenario that will predict subscription confidence.
    
    Open the Machine Learning project and create a new canvas

    ![](images/500/img_5e_3_1.png)
    
     Rename the canvas you created to **Subscription Prediction**. 

    ![](images/500/img_5e_3_2.png)
    
    Click the **+** next to the **Data Elements**, select the **Add Data Set** option.
    
    ![](images/500/img_5e_3_3.png)

    Select the **Create Data Set** option. 
    
    ![](images/500/img_5e_3_4.png)

    Select the **Drop data here or click to browse** and navigate to the **KoolKart Partner Sales** file or drag and drop the file onto the file icon. 

    ![](images/500/img_5e_3_5.png)

    Turn **OrderID** into an attribute.

    ![](images/500/img_5e_3_6.png)

    Click the **+** next to the **Data Elements** again and select the **Create Scenario** option.

    ![](images/500/img_5e_3_7.png)
    
    Once the **Create Scenario – Select Model** menu shows up, select the **Subscribed Prediction Model**.

    ![](images/500/img_5e_3_8.png)

    Once the **Create Scenario – Map Your Data** menu loads, select the **KoolKart Partner Sales** data set. Select **Done**. 

    ![](images/500/img_5e_3_9.png)

    Select **Customer Name** and **PredictionConfidence**. With the attributes selected, right click, and select **Pick Visualization**. 
    
    ![](images/500/img_5e_3_10.png)

    Select **Pivot Table**.

    ![](images/500/img_5e_3_11.png)

    Drag **Subscribed Prediction** to the Color. 
    
    ![](images/500/img_5e_3_12.png)

    Right click the color and the select **Manage Assignments**. 

    ![](images/500/img_5e_3_13.png)
    
    Choose the color Royal Blue for No and the color Green for Yes.

    ![](images/500/img_5e_3_14.png)

    If you have successfully completed the steps you will see the visualization below. From looking at the chart, we can predict which customers are more likely to get a subscription.

    ![](images/500/img_5e_3_15.png)

Congratulations! You have completed the workshop.

In this workshop, we were able to quickly assess the effectiveness of your social media campaigns on sales and how sales trends correspond to social media tone/sentiment. We also used OAC5's machine learning abilities to predict the likelihood of customer's subscribing to KoolKart's mailing list.

This concludes our Oracle Analytics Cloud 5 Data Visualization workshop.