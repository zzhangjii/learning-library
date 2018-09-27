
## Lab 4 – Analyzing Social Media with Sales – Visualize and Narrate

Key Take Aways from this lab:
- Learning how to use Calculations
- Using different visualizations to obtain insights from data set
- Narrating a meaningful story using Narrate

### 4a) Analyzing Sales and Social Media Data

1. Create a calculated field to use in visualizations.

        Now, we have data that spans both social media feeds and revenue figures. This will help us dig into
        their relationship.
    
        Previously, we created some visualizations, but now, we have the ability to really dive into more 
        advanced capabilities. For starters, activity on social media is subject to large spikes. To make
        it easier to evaluate, we should evaluate it on a logarithmic scale (large and varied data sets like
        those found in social media are often, best handled using a logarithmic scale, where values are 
        evaluated based upon multiplicative factors as opposed to static values).
    
    In the last exercise, we modified some of the data in the **KoolKart Sales Data** data set to ensure that it is aligned with the **DaaS Social Feeds-KoolKart** data set. Navigate to the **Visualize** tab.
    
     ![](images/300/img_3c_1_1.png)
     
     Click on the **+** icon on the top right of the **Project Components Menu**. Next, click on **Add Calculation** (make sure that the **Data Elements** icon is selected, else the **+** icon won't be visible).
     
     ![](images/400/img_4a_1_2.png)
     
    In the **Expression Editor**, type in **Activity(log scale)** as the **Name**.
    
    Then, type in the following expression into the **Expression Box** (you could also use the function list on the right and field search as demonstrated in previous exercises):

    **log(Total**
    
    ![](images/400/img_4a_1_3.png)
    
    Select **Total Number of Snippets** from the pop up.
    
        You must type this in for the auto-complete suggestions to show up.
        
    Select **Validate**. Then select **Save**, assuming it was valid.
    
    ![](images/400/img_4a_1_4.png)
    
    ![](images/400/img_4a_1_5.png)

2. Use the calculation in a visualization to analyze social media volume on a logarithmic scale.

    Clear the existing **Canvas**. Select the **Canvas Settings** option from the **Project Menu** and select **Clear Canvas**.
    
    ![](images/400/img_4a_2_1.png)

    Select **Date** (under **DaaS Social Feeds-KoolKart** within **Data Elements** in the **Project Components Menu**).
 
        You can adjust the display format of a date or a time column by specifying the format and/or level 
        of granularity. For example, you might want to change the format of a transaction data column (which 
        by default, is set to show the long date format such as November 1, 2017) to display the ISO
        date format (such as 2017-11-01), instead.
    
    Press the **Control(Windows)** or **Command(Mac)** key and also select **Activity(log scale)**. **Right click** and select **Create Best Visualization**.
    
    ![](images/400/img_4a_2_2.png)

    The system will have determined that a line chart is the best way to visualize this data. Let’s create a copy of the visualization, so that we can quickly analyze the date based information in our data set.
    
    ![](images/400/img_4a_2_3.png)
    
    **Right click** in the white space of the visualization (or use the **Visualization Properties Menu** in the top right of the visualization). Select **Copy Visual**.
    
    ![](images/400/img_4a_2_4.png)
    
    ![](images/400/img_4a_2_5.png)

    **Right click** in the white space of the visualization (or use the **Visualization Properties Menu** in the top right of the visualization). Select **Paste Visual**.
    
    ![](images/400/img_4a_2_6.png)
    
    ![](images/400/img_4a_2_7.png)

    You should now have two copies of the line chart on your canvas. 
    
    ![](images/400/img_4a_2_8.png)
    
    If needed, rearrange the images one above the other, as learnt in Lab2. 
    
    Now, go ahead and select the one at the top.
    
    ![](images/400/img_4a_2_9.png)

    Select **Revenue** under **KoolKart Sales Data** in the **Project Components Menu** (make sure nothing else is selected) and drag it directly on top of **Activity(log scale)** in the properties box under **Values (Y-axis)**.
     
    ![](images/400/img_4a_2_10.png)
    
    Doing so should have replaced **Activity(log scale)** with **Revenue**. If, instead, it added it as another Y-axis measure, just hover over the **Activity(log scale)** measure and click the **X** that appears in the right corner to remove it.
 
    ![](images/400/img_4a_2_11.png)
    
        In our earlier analysis, we were able to establish that, although, certain product categories have 
        negative revenue trends, the overall trends are positive and would appear to correlate positively 
        with our social media campaigns.
    
        In this visualization, we can see the Revenue by Date and Activity(log scale) by Date visualizations
        seem quite close in terms of trending thus helping validate the hypothesis that the social media 
        campaigns were helpful overall.
    
        However, let’s drill into the categories that were not performing well to see if we can find out
        what is going on. Specifically, let’s take a look at Clothing & Shoes and Electronics & Computers.
        
3. Include category in the visualization as a Trellis Column.
    
    Select **Category** and drag it into the **Trellis Columns** property.
    
    ![](images/400/img_4a_3_1.png)
    
    Your visualization should now look like the following:
    
    ![](images/400/img_4a_3_2.png)
    
4. Add category to the Activity(log scale) by Date visualization.

    Select the **Activity(log scale) by Date** visualization. It will appear with a blue border, once you select it. Select **Category** (make sure nothing else is selected) and drag it to the **Trellis Columns** property.
    
    ![](images/400/img_4a_4_1.png)
    
    Let’s take a look at the visualizations.
    
    ![](images/400/img_4a_4_2.png)
    
        Well, what do we see here?
        
        In looking at the Activity(log scale) by Date, Category visualization, the overall trend is 
        flat meaning there doesn’t seem to be much social media activity for the Clothing , Shoes category 
        despite our social media campaigns. The revenues for the Clothing , Shoes category also seem to be 
        rather flat.
        
        Surprisingly, there is quite a bit of social media activity for the Electronics , Computers 
        category and it is growing. But, the revenues are trending down.
        
        This is confusing! Let’s check the tonality/sentiment of the social media activities because while
        there is social media activity, it does not seem to be all positive.
        
5. Create a new visualization to evaluate the tone of social media posts.

    Select the **Activity(log scale) by Date, Category** visualization. **Right click** in any blank area and select **Copy Visual**.
    
    ![](images/400/img_4a_5_1.png)
    
    **Right click** below the **Activity(log scale) by Date, Category** visualization and select **Paste Visual**.
    
    ![](images/400/img_4a_5_2.png)
    
    Select the visualization that you have just pasted. Select **Percent Positive Tone** (make sure nothing else is selected). Press and hold **Control(Windows) or Command(Mac)** and select **Percent Neutral Tone** and **Percent Negative Tone**. Drag and drop them directly on top of **Activity(log scale)** in the under **Values (Y-axis)**.
    
    ![](images/400/img_4a_5_3.png)
    
    This should have replaced **Activity(log scale)** with the 3 new columns. Instead, if they were added as additional **Y-axis** measures, just hover over the **Activity(log scale)** measure and remove it.
    
    Change the visualization type. Select the dropdown menu next to the current visualization type (**Line**) and select **Area**.
    
    ![](images/400/img_4a_5_4.png)
    
    ![](images/400/img_4a_5_5.png)
    
    Let’s take a closer look at this visualization. Select **Maximize Visualization** in the top right of the visualization.
    
    ![](images/400/img_4a_5_6.png)
    
    ![](images/400/img_4a_5_7.png)
    
        Interesting... there seems to be a lot of negative sentiment towards Electronics , Computers, 
        starting in the 2nd week of January. Let’s analyze the Indicators to try to further understand the 
        problem.
        
6. Evaluate the tone of specific social media posts using a Tag Cloud visualization.

    Minimize the last visualization.
    
    ![](images/400/img_4a_6_1.png)
    
    Select **Indicators**. Press and hold **Control(Windows) or Command(Mac)**. Select **Total Number of Snippets**. Right click and select **Pick Visualization**.
    
    ![](images/400/img_4a_6_2.png)
    
    Select **Tag Cloud**.
    
    ![](images/400/img_4a_6_3.png)
    
    You should now see a breakdown of the most common Indicators on social media.
    
    ![](images/400/img_4a_6_4.png)
    
    Let’s narrow this down to focus in on just **Electronics , Computers** and filter the dates to after mid-January. Select **Mention Category**, drop it under the **Filters** and select **Electronics , Computers**. 
    
    ![](images/400/img_4a_6_5.png)
    
    ![](images/400/img_4a_6_6.png)
    
    ![](images/400/img_4a_6_7.png)
     
     Click outside the filter to exit the menu. Select **Date** and drag it into the **Filter** area. Don't replace the **Mentions Category** filter.
     
     ![](images/400/img_4a_6_8.png)
     
     Set the **Start Date** (using the calendar or by typing) to **January 1, 2016**. Set the **End Date** to **April 29, 2016**. Click anywhere outside the filter to exit the menu.
     
     ![](images/400/img_4a_6_9.png)
     
     Next, let’s color the **Tag Cloud** by intensity of negative sentiments. Select **Percent Negative Tone** and drag it into the **Color** property.
     
     ![](images/400/img_4a_6_10.png)
     
     We now have a visualization of **Electronics , Computers** related social media posts between January and April 2016 focused on identifying issues from negative feedback.
     
     ![](images/400/img_4a_6_11.png)
      
        In looking at the size of the tag, we can see key indicators like Defective, Delivery, and Recall 
        are frequently mentioned and by looking at the darker color, we can see Customer Service and MEDIA: 
        Viewing seem to be contributing to the bulk of negative sentiment. This needs to be followed up on.
        
        Let’s note this as another insight to share with the team.
        
        Depending on the size of your monitor and your screen resolution, your Tag Cloud could be laid out 
        slightly different, but relative size and color should be the same as above.
        
### 4b) Finalizing the Project and Insights on Sales and Social Media Data

    Data Action links are responsible for passing context values from Data Visualization as parameters to 
    external URLs or filters to other projects. When a link navigates to a project, the data context is 
    displayed in the form of canvas scope filters in the filter bar. The links data context may include 
    attributes associated with the selections or cell from which the link was initiated.

1. Accessing the Data Actions Dialog Box

    Click on **Narrate** in the **Project Tabs** in the top right of the screen.
    
    ![](images/400/img_4b_1_1.png)

    Hover over the visualization, click on the **Hamburger Icon**, and select **Add To Story**.
    
    ![](images/400/img_4b_1_2.png)

    Let’s also give the **Insight** a meaningful name. Double-click the **Title Box** and type **Social Media Sentiment**.
 
    Navigate to the **Canvas Settings** and check the **Description Box**.
    
    ![](images/400/img_4b_1_3.png)
 
    Double-click the **Description Text Box** and type in: **Seeing increased social media activity for Electronics & Computers starting mid-January. Negative sentiment seems to be around Customer Service and MEDIA: Viewing**. Click anywhere outside the box to save it.
 
    ![](images/400/img_4b_1_4.png)
 
2. Save the project.
 
    Select the **Save Button** in the **Project Menu**. Select **Save**.
    
    ![](images/400/img_4b_2_1.png)
    
3. Present the findings using Presentation Mode.

    **Presentation Mode** should be used when you are sharing your story and any insights that you have gained with others.
    
    Select the **Present** button to start **Presentation Mode** in the **Project Menu**. 
    
    ![](images/400/img_4b_3_1.png)

    This will remove all the editing sections from the interface and convert your **Insights** into a dashboard style presentation mode that you can now, share with others.
    
    ![](images/400/img_4b_3_2.png)

    Notice the 2 dots that appear at the bottom of your screen (one for each Insight you created). The **Insight** title and description appear above the dots. Click on the **2nd dot**. Notice that now, your **2nd Insight** is displayed. You can navigate back and forth between each **Insight** by clicking on the dots or the arrows.
    
    ![](images/400/img_4b_3_3.png)
    
    ![](images/400/img_4b_3_4.png)
    
    Exit **Presentation Mode** by selecting the **X** in the top right. 
    
    ![](images/400/img_4b_3_5.png)
    
    The buttons to the left of the **X** are used for hiding/showing annotations and for sharing. 
    
You are now ready to share your visualizations as a file or you can print a hard copy. You can do so, by clicking  on **Share** and choosing your desired option.

![](images/400/img_4b_1.png)

### 4c) Modifying Properties in the Data Panel.

Before we conclude this lab, let's go over the **Data Panel** for **Narrate** tab.

![](images/400/img_4c_1.png)

This section will cover the functions of each of these options.

![](images/400/img_4c_2.png)

![](images/400/img_4c_3.png)

- ![](images/400/img_4c_4.png) **General**: This section allows you to adjust logistical parts of your storyboards/canvases. You are given the option to set the base canvas as well as hide/show the entire page, the page title, and the description.

- ![](images/400/img_4c_5.png) **Adjustments**: This section allows you to make extra adjustments to the UI. You are given the option to set the layout and size orientation of your storyboards/canvases.

- ![](images/400/img_4c_6.png) **Filters**: This section helps you to manage any filters you’ve applied to your canvases in a more organized manner.

- ![](images/400/img_4c_7.png) **Notes**:  This section helps you manage any notes you’ve appended to your canvases.

- ![](images/400/img_4c_8.png) **Presentation**: This section helps you to manage the presentation of your storyboards/canvases. It includes the Story Navigator, which allows you to the style and auto hide properties of your presentation.
