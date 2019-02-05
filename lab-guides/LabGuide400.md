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

- Download a static image from here: [AlphaOffice Image](https://github.com/derekoneil/monolithic-to-microservice/blob/master/lab-resources/vbcs/AlphaOfficeSupply.png). Click on this link and save the file locally.

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

- The canvas is populated with a default layout and the **List View** item should be highlighted). If it's not, select it in the Page Structure section. In the Properties area if you don't see the `Add Data` option then select the `Quick Start` icon all the way over on the right. Then click **Add Data**. We will associate this List View with data from one of our REST endpoints.

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

## Add Record Creation to the Application

### **STEP 1**: Add Create Page

- Select the **List View** item in the main-start Page Structure (or the canvas) and if you don't see the various wizard driven options, click the `Quick Start` icon on the far right of the Properties section and select **Add Create Page**. 

  ![](images/400/63.PNG)

- Expand the available endpoints and select **POST/restCall**. Click **Next**.

  ![](images/400/64.PNG)

- Choose the following columns **IN THIS ORDER**:

  ```
  PRODUCT_NAME
  LIST_PRICE
  ```

- Change the name for the `Button label` and the `Page title` to:

  ```
  Create
  ```

  ![](images/400/65.PNG)

- Click **Finish**. A `main-create-post-rest-call` page is created. The main-start page now displays a large PLUS sign at the top right of the display.

  ![](images/400/66.PNG)

  ![](images/400/67.PNG)

- From the Mobile Applications pane click the **main-create-post-rest-call** page. This will open it up on the canvas.

- As we did with the main-start page we will tidy up so properties and add the AlphaOffice image.

- **Drag and drop an Image component** into the Page Structure pane right below the Mobile Page Template item.

  ![](images/400/68.PNG)

- With the **Image** item selected click the **Data** tab in the Properties pane and then click the **Drop and image here...** section.

  ![](images/400/69.PNG)

- Upload the image we used earlier; `AlphaOfficeSupply.png`. The screen should look like:

  ![](images/400/70.PNG)

- Select the Input Text item **PRODUCT_NAME** in the Page Structure and change the **Label Hint** in the Properties pane under the **General** tab to:

  ```
  Product Name
  ```

  ![](images/400/71.PNG)

- Likewise, change the **Label Hint** for the LIST_PRICE Input Number item to:

  ```
  List Price
  ```

 - Also change the **Converter** attribute to a dollar sign `$` and type in the following for the **Currency Code** attribute:

   ```
   USD
   ```

- The canvas should now look like:  

  ![](images/400/72.PNG)

- When the `main-create-post-rest-call` page was created some supporting Actions and Events associated with that page were also created to handle navigation (For example, what to do when the Cancel and Save links are clicked). The Events are called Chains.

- Click on the **Events** icon for the `main-create-post-rest-call` page (already being displayed), click the **createPostRestCallChain** item under the saveButtonClicked Event to show its Properties and finally select the **createPostRestCallChain** link on the far right hand side of the page (Properties section). 

  ![](images/400/73.PNG)

- This opens up the chain flow where you can see various Actions defined for the cases of success or failure. In the success flow Click the **Fire Notification confirmation** Action. In the Properties section change the **Summary** atrribute to:

  ```
  Saved:
  ```

- ... and change the **Message** attribute to:

  ```
  Record Successfully Created
  ```

  ![](images/400/74.PNG)

- You can close the tab once the changes are in place.

  ![](images/400/75.PNG)

### **STEP 2**: Test Record Creation

- Select the **main-start** page and then click the **Run** application icon on the right hand side of the main menu bar.

  ![](images/400/76.PNG)

  ![](images/400/77.PNG)

- A new browser tab opens and the application is started. You can scroll up and down to see the available products in the catalog. Clicking the **PLUS sign** will take you to the Create page.

  ![](images/400/78.PNG)

- **Type OR Copy and Paste** the following into the fields:

  ```
  Product Name:   EXPO Dry Erase Kit, Assorted Colors
  List Price:     20
  ```

- Tab out of the List Price field to see the currency formatting. Click the **Save** link. If all goes well you should see the success confirmation pop up for a few seconds.

  ![](images/400/79.PNG)

  ![](images/400/80.PNG)  

- Scroll down the product catalog listing until you find your new product for `EXPO Dry Erase Kit, Assorted Colors` which was inserted into the database. In this case the assigned PRODUCT_ID is 240:

  ![](images/400/81.PNG)  

## Add Update and Delete capabilites

### **STEP 1**: Add Edit Page

In this section you will maually create a new page and add update and delete capabilites to the records in the product catalog. Events and Action Chains will be created to support the flows. This page will eventually be called from the main-start page.

- Close the browser tab with the application running. Back in Visual Builder, in the Mobile Apps pane click the **PLUS icon** next to Main flow to create a new page. 

  **NOTE: Do not create a new Flow... just a page**

  ![](images/400/82.PNG)

- In the Create Page dialog name the page:

  ```
  main-edit
  ```

- ... Choose the **Custom** content style and click **Create**.

  ![](images/400/83.PNG)

### **STEP 2**: Create Page Variables

In this step we will define the Types and Variables used within the page.

- With the newly created `main-edit` tab selected click the Variables icon:

  ![](images/400/87.PNG)

- The first thing we will do is create an object array type which will define the structure for the returned set of values from the REST endpoint GET (one). Click on the **Types** tab and then click the **+ Type** button and select **From Endpoint**.

  ![](images/400/87-5.PNG)

  ![](images/400/88.PNG)

- Expand the Service Connections and select the **GET /restCall/{id}** enpoint which will return one record based on the input parameter {id}. Click **Next**.

    ![](images/400/89.PNG)

- Select the following columns:
    - LIST_PRICE
    - PRODUCT_ID
    - PRODUCT_NAME

  ![](images/400/90.PNG)

- Click **Finish**.

- The type is created. Add a suffix **Type** to the generated name in the Properties pane so the id name becomes `getRestCallIdType`:

  ![](images/400/91.PNG)

- Type struture looks like:

  ![](images/400/92.PNG)

- Now, click the **Variables tab** and then click the **+ Variables** button to create a variable based on the new type (this variable is used for content mapping purposes). 

  ![](images/400/92-5.PNG)

  ![](images/400/93.PNG)

- Call the variable:

  ```
  getRestCallVar
  ```

- ... using the **getRestCallIdType**.

  ![](images/400/94.PNG)

- Click **Create**.

- Create a variable called:

  ```
  InputVar1
  ```

- ... using the *Number** type

  ![](images/400/95.PNG)

- Click **Create**.

- In the Properties pane for **InputVar1** under the **General** tab select the following attribute checkboxes:
    - **Input Parameter**
    - **Pass On URL**
    - **Required**

  ![](images/400/96.PNG)

  **NOTE: This variable is used as an input parameter when called from the main-start page based on a product selection** (Defined later on in this Lab).

- Create three more variables with the following types:
    - **IDVar       : Number**
    - **PriceVar    : Number**
    - **ProdNameVar : String**

- The final variables definitions should look like:

  ![](images/400/97.PNG)

### **STEP 3**: Create Page Layout

- Now, build out the look and feel of items on this page. First, drag and drop an **Image** item from the Component pane just below the `Mobile Page Template item`.

- Drag and drop a **Form Layout** item **inside** the `Flex Container` in the canvas.

- Drag and drop an **input Number** item **inside** the `Form Layout` item in the canvas.

- Drag and drop an **input Text** item just below the `Form Layout` item in the Page Structure (This ensures the item is embedded within the Form Layout)

- Drag and drop an **input Number** item just below the `Form Layout` item in the Page Structure (This ensures the item is embedded within the Form Layout)

- Drag and drop a **Button** from the Component pane over to the `Left Side` item in the Page Structure. A small arrow will be pointing at the Left Side item:

  ![](images/400/84.PNG)

- Drag and drop TWO **Button** Components over to the `Right Side` item in the Page Structure. A small arrow will be pointing at the Right Side item:

- So far you canvas looks like:

  ![](images/400/85.PNG)

### **STEP 3**: Set Item Properties

- Click the **Designer icon** to get back to the page canvas.

  ![](images/400/85-7.PNG)

- Starting from top of the canvas items to bottom. Select the **Mobile Page Template** item in the Page Structure. Under the General Properties tab set the **Page Title** attribute to:

  ```
  Edit
  ```

- Select the **Left Side Button** item in the Page Structure and in the **General** Properties tab change the **Text** attribute name to:

  ```
  Cancel
  ```

- Select the top most **Right Side Button** item in the Page Structure and in the **General** Properties tab change the **Text** attribute name to:

  ```
  Delete
  ```

- Select the bottom **Right Side Button** item in the Page Structure and in the **General** Properties tab change the **Text** attribute name to:

  ```
  Update
  ```

- Canvas so far looks like:

  ![](images/400/86.PNG)

- With the **Image** item selected click the **Data** tab in the Properties pane and then click the **Drop and image here...** section.

  ![](images/400/69.PNG)

- Upload the image we used earlier; `AlphaOfficeSupply.png`.

- Select the first Input Number item in the canvas. 

  ![](images/400/98.PNG)

- Under the **General** tab in the Properties pane set the **Label Hint** to:

  ```
  Product ID
  ```

- Scroll down the attributes and **check the Readonly checkbox**. Also, **uncheck the Thousands Separator checkbox**:

  ![](images/400/99.PNG)

- Next, select the Input Text item on the canvas. Under the **General** tab in the Properties pane set the **Label Hint** to:

  ```
  Product Name
  ```

- Finally, select the bottom Input Number item on the canvas. Under the **General** tab in the Properties pane set the **Label Hint** to:

  ```
  List Price
  ```

- Scroll down the attributes and change **Converter** to the dollar sign symbol `$` and type the following in the **Currency Code** attribute:

  ```
  USD
  ```

- Your final canvas should look like:

-  ![](images/400/100.PNG)

### **STEP 3**: Define the Events on this page

In this step we will finish up the `main-edit` page by defining 4 Events and subsequent Actions. The first event will define what happens when the page is called from the `main-start` page. The other Events will deal with the Cancel, Delete and Update buttons.

- From the `main-edit` page click the Events icon followed by clicking the **+ Event Listener** button.

  ![](images/400/101.PNG)

  ![](images/400/102.PNG)






































### **STEP 1**: Check the creation of the instance from Lab 050

- From the Dashboard 

  ![](images/400/5.PNG)
