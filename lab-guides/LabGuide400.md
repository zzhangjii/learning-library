# Monolithic to Microservice Cloud Native Development - Low Code, Microservice Mobile Development

![](images/400/Title.png)  

## Introduction

In this lab you will use Oracle Visual Builder which is a cloud-based software development Platform as a Service (PaaS) and a hosted environment for your application development infrastructure. It provides an open-source standards-based solution to develop, collaborate on, and deploy applications within Oracle Cloud.

**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Create a Mobile Application
- Access the REST services you deployed in Lab 300 on OKE
- Deploy the mobile application to your phone (Android based)

## Required Artifacts

- Lab 300 needs to be completed with the AlphaOffice REST application deployed

# Login in and Create the Application

## Verify the VBCS Instance

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard **click the hamburger menu** in the Visual Builder Cloud Service pane, **right-click on Open Service Console** and select **Open link in new tab**.

  ![](images/400/5.png)

- From the Instances tab you should see the monoTOmicro instance you created in Lab 050. Drilling down in the **Instance Create and Delete History** should show a successfull creatation status:

  ![](images/400/6.PNG)

  ![](images/400/7.PNG)

- **Click the hamburger menu** of the instance and select **Open Visual Builder Home Page**.

  ![](images/400/8.png)

- On the Welcome page click **+ New Applcation**.

  ![](images/400/9.PNG)

- In the Create Application dialog enter:

  ```
  Product Catalog
  ```

  ... and click **Finish**.

  ![](images/400/10.PNG)

- An initial page will show. Now you will begin to create the components used in the application.

  ![](images/400/11.PNG)

### **STEP 2**: Create Service Connections

Service Connections are REST endpoints pointing to various services. In this step you will reference REST endpoints from the application deployment you created in Lab 300. We will create endpoints for GET, GET/{id}, POST, PUT and DELETE/{id}.

- If not already opened click on the **Navigator icon** near the upper left hand side of the web page. This will expand the pane. You can click the **X** on the Welcome tab to close it. Finally, click on the **Service Connections** icon.

  ![](images/400/12.PNG)

- Click **+ Service Connection** and then click **Define by Endpoint**. 

  ![](images/400/13.png)

  ![](images/400/14.PNG)

- Leave the Method to **GET**. From Lab 300 **Copy and Paste the URL** used to test the REST endpoint that retrieved all of the AlphaOffice Product Catalog records. (In this example:  `http://129.213.109.189:8080/AlphaProductsRestService/webresources/restCall`) into the URL field. Leave the Action Hint at **Get Many**:

  ![](images/400/15.PNG)

- Click **Next**.

- Select the **Test** tab and click **Send**. The request should return all of the records (shown in the Response). If successful, click the **Copy to Reponse Body** button.

  ![](images/400/16.PNG)

- Click **Create**.

  ![](images/400/17.PNG)

- Click the **Endpoints** tab to see the created GET. Click **+ Endpoint** to add another.

  ![](images/400/18.PNG)

- Create another **GET** method with the PATH having a **suffix** of **restCall/{id}**. Set the Action Hint dropdown to **Get One**.

  ![](images/400/19.PNG)

- Click the **Test** tab. For the URL Parameter enter **1027**. Click **Send**. One record is returned with the PRODUCT_ID of `1027`. If successfull, Click the **Copy to Reponse Body** button.

  ![](images/400/20.PNG)

- Click **Add**.

  ![](images/400/21.PNG)

- Click the **Endpoints** tab to see the created methods thus far.

- This time we will be creating a POST method which inserts a record into the database. Create a **POST** method with the PATH having a **suffix** of **restCall**. Set the Action Hint dropdown to **Create**.

  ![](images/400/22.PNG)

- Click the **Test** tab. **Copy and Paste** the following payload into the **Request Body** section:

  ```
  {
    "LIST_PRICE": 11.99,
    "PRODUCT_ID": null,
    "PRODUCT_NAME": "Dry Erase Test Markers"
  }
  ```

  ![](images/400/23.PNG)

- Click the **Copy to Request Body** button.

- Click **Send**. If successfull you should see a return message `"Successfully Saved."`. From the Reponse tab click **Copy to Response Body**. The PRODUCT_ID is null because a database trigger will automatically create an ID. 

- Since the returned payload is plain text we will set the Response body as such. Click the **Response** tab. Click the **Pencil icon** and the Plus Sign in the Media Type drop down and add:

  ```
  plain/text
  ```

 ![](images/400/24.PNG)

- Click **Done** and then click **Add** to complete the POST definition.
 
  ![](images/400/21.PNG)

- Using the GET methods that returns all the records we will confirm that the POST inserted a record and we will obtain the PRODUCT_ID of that new record.

- Click the **GET (Get Many) method**:

  ![](images/400/25.PNG)

- Click the **Test** tab and click **Send**. Scroll down to the bottom of the Response and should see the record for `Dry Erase Test Markers`. **Note the PRODUCT_ID** as we will be using this in subsequent PUT and DELETE calls. In this example the PRODUCT_ID is `232`:

  ![](images/400/26.PNG)

- Next, create a **PUT** method with the PATH having a **suffix** of **restCall**. Set the Action Hint dropdown to **Update**.

  ![](images/400/27.PNG)

- Click the **Test** tab. **Copy and Paste** the following payload into the **Request Body** section:

  **NOTE:** We are using the PRODUCT_ID obtained above (You will substitute your specific PRODUCT_ID). In this example `232`. The LIST_PRICE has been bumped to `18`.

  ```
  {
    "LIST_PRICE": 18,
    "PRODUCT_ID": 232,
    "PRODUCT_NAME": "Dry Erase Test Markers"
  }
  ```

  ![](images/400/28.PNG)

- Click the **Copy to Request Body** button.

- Click **Send**. If successfull you should see a return message `"Successfully Updated."`. From the Response tab click **Copy to Response Body**. 

- Since the returned payload is plain text we will set the Response body as such. Click the **Response** tab. Click the **Pencil icon** and the Plus Sign in the Media Type drop down and add:

  ```
  plain/text
  ```

 ![](images/400/29.PNG)

- Click **Done** and then click **Add** to complete the PUT definition.
 
  ![](images/400/21.PNG)

- OPTIONAL - Verify the update to the database occur by using the GET (Get Many) method. Scroll to the bottom to find the record and verify that the LIST_PRICE is now `18`:

  ![](images/400/30.PNG)

- The final method you will create is a **DELETE** with the PATH having a **suffix** of **restCall{id}**. Set the Action Hint dropdown to **Delete**.

  ![](images/400/31.PNG)

- Click the **Test** tab and then **URL Parameters**. (You will substitute your specific PRODUCT_ID). For our example we enter ID `232`. Click **Send**.

  ![](images/400/32.PNG)

- Click the **Copy to Request Body** button.

- Click **Send**. If successfull you should see a return message `"Successfully Deleted."`. From the Response tab click **Copy to Response Body**. 

  ![](images/400/33.PNG)

- Since the returned payload is plain text we will set the Response body as such. Click the **Response** tab. Click the **Pencil icon** and the Plus Sign in the Media Type drop down and add:

  ```
  plain/text
  ```

 ![](images/400/34.PNG)

- Click **Done** and then click **Add** to complete the DELETE definition.

  ![](images/400/21.PNG)

- All of the endpoints have now been created and tested.

  ![](images/400/35.PNG)

## Create the Mobile Application

### **STEP 1**: Create a Mobile Application

- Select the **Mobile Applications** icon on the left on side of the web page and then click **+ Mobile Application**.

  ![](images/400/36.PNG)

  ![](images/400/37.PNG)

- Name the application...

  ```
  AlphaOffice
  ```

- ... and select the **None** Navigation Style.

  ![](images/400/38.PNG)

- Click the **Arrow icon**.

  ![](images/400/39.PNG)

- Select the **No Content** layout and click **Finish**.

  ![](images/400/40.PNG)

- Now you have access to (left to right) components, page structure, display canvas and properties. We will be hitting a little of everthing going forward. In the components section find the **Image** component and drag and drop that right below the `Mobile Page Template` in the **Page Structure**.

- Now drag and drop a **Heading** component right below the image field. Your screen should look like:

  ![](images/400/42.png)

- Your application should be in Design Mode:

  ![](images/400/43.PNG)

- Time to set some Properties. You can select the specific component who wish to set property values for by ether select from the Page Structure OR the display canvas. In some cases it will be easier to use one or the other...

- Name the **Mobile Page Template**
  
  ```
  Catalog
  ```

- ... by selecting it under the **General** properties area on the right.

- You'll notice the change does not take affect until you tab out of the Page Title field.

- Click on the **Heading** field and set the text to:

  ```
  Products
  ```

- ... leaving the Heading size to **H1**. You screen looks like:

  ![](images/400/44.PNG)

- Download a static image from [AlphaOffice Image](https://github.com/derekoneil/monolithic-to-microservice/blob/master/lab-resources/vbcs/AlphaOfficeSupply.png) by clicking on it and saving locally.

- Now, click on the **Image** component in the canvas and click the **Data** tab in the Properties section. 

  ![](images/400/45.PNG)

- Click on the **Drop an image here...** box and upload the static image; **AlphaOfficeSupply.PNG** you just downloaded:

  ![](images/400/46.PNG)

- The image is uploaded. If it doesn't display right away on the canvas click the **Refresh icon**.

  ![](images/400/47.PNG)

  - Your screen should now look like:

  ![](images/400/48.PNG)

- From the Components section drag and drop a **List View** onto the canvas Flex Container below the Products item:

  ![](images/400/49.PNG)

- The canvas is populated with a default layout and the **List View** item should be highlighted). If it's not, select it in the Page Structure section. In the Properties area if you don't see the `Add Data` option then select the icon all the way over on the right. Then Click **Add Data**. We will associate this List View with data from one of our REST endpoints.

  ![](images/400/50.PNG)

- In step 1 of the Add Data section only relevant endpoints that would populate the List View are available. **Expand** the available endpoints and select **GET** (Many). Click **Next**.

  ![](images/400/51.PNG)

- In step 2 choose the following layout and click **Next**.

  ![](images/400/52.PNG)

- In the Bind Data step select the following 4 columns **IN THIS ORDER**:

  ```
  PRODUCT_NAME
  EXTERNAL_URL
  PRODUCT_ID
  LIST_PRICE
  ```

- Set the `PRODUCT_ID` and `LIST_PRICE` to an **Input Number** type.

- Set the `EXTERNAL_URL` to an **Image** type.

- Set the `Primary Key` to **PRODUCT_ID**.

- Before pressing on make sure your screen looks like:

  ![](images/400/53.PNG)

- Click **Next** and **Finish**.

- The Endpoint is called and the canvas refreshed with the Product Catalog data:

  ![](images/400/55.png)

- Now we'll tydy up some item properties. Delete the Labels for **PRODUCT_NAME** and **EXTERNAL_URL**. 

  **NOTE: We're deleting just the labels, not the data items...**

- Select each of the above mentioned Labels and hit the delete key. The Label will disappear.

  ![](images/400/54.PNG)

- Select the **Paragraph item for PRODUCT_NAME**. Notice that selecting it highlights the item in the canvas and brings up the Properties values:

  ![](images/400/56.PNG)

- Select the **ALL** property tab and expand the **General Attributes**:

  ![](images/400/57.PNG)

- Scroll down the General Attributes until you find the **Style** field. This is where CSS type commands can be entered. We want to enlarge the displayed text for this item. **Type OR Copy and Paste** the following:

  ```
  font-size: large;
  ```

  ![](images/400/58.PNG)

- Upon tabbing out of the field the change will happen.

- Select the **Label** item for **PRODUCT_ID** and under the **General** tab change the title to:

  ```
  Product ID
  ```

 - Under the **ALL** tab --> **General Attributes** enter:
 
   ```
   font-size: large;
   ```
  
  - ... into the **Style** field.

- Select the **Input Number** item for **PRODUCT_ID**. Under the **General** properties tab **de-select the Thousands Separator** checkbox.

 ![](images/400/59.PNG)

- Upon tabbing out of the field the change will happen.

- Select the **Label** item for **LIST_PRICE** and under the **General** tab change the title to:

  ```
  List Price
  ```

 - Under the **ALL** tab --> **General Attributes** enter:
 
   ```
   font-size: large;
   ```
  
  - ... into the **Style** field.

- Select the **Input Number** item for **LIST_PRICE**. Under the **General** properties tab change the **Converter** attribute to a dollar sign `$`. Also, in the **Currency Code** attribute enter:

  ```
  USD
  ```

  ![](images/400/61.PNG)

- Finally, select the **Image** Item under **Page Structure** (or the canvas). Under the **General** properties tab change image Height and Width to **80**.

  ![](images/400/62.PNG)

- Your finalized version of the main page will look like:

 ![](images/400/60.PNG)














### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  
### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
  
  ### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)

### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)