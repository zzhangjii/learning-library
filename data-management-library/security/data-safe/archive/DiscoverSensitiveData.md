# Discover Sensitive Data

- First, let's look at the Library of Sensitive Types and Sensitive Data Models.  Click Library then expand Data Discovery.

    ![](images/2019-08-13%2014_58_50-Oracle%20Data%20Safe%20_%20Library.png)

- Click on Sensitive Types and view the types provided by Oracle Data Safe out-of-the-box

- Click Bank Routing Number to show the details

    ![](images/2019-08-14%2010_14_36-Oracle%20Data%20Safe%20_%20Sensitive%20Types.png)

- Here you can see how Oracle Data Safe identifies sensitive data using regular expression match of Column Name, Column Comments, and Data Patterns.  

![](images/2019-08-14%2010_14_54-Oracle%20Data%20Safe%20_%20Sensitive%20Types.png)

> Notice this Sensitive Type doesn't have a Data Pattern. This is because bank account numbers use different formats. 

- To see the details of a Sensitive Type that includes Data Pattern, scroll down and click Canada Social Insurance Number (SIN) 

    ![](images/2019-08-14%2010_25_38-Oracle%20Data%20Safe%20_%20Sensitive%20Types.png)

- Expand the Canada SIN Sensitive Type and you will see Data Pattern.  We can use this Data Pattern because Canada SINs follow the same format.

    ![](images/2019-08-14%2010_26_46-Oracle%20Data%20Safe%20_%20Sensitive%20Types.png)

- Close this window and return to the Oracle Data Safe dashboard by clicking Home

- Next we will run a Sensitive Data Discovery job to create a Sensitive Data Modem (SDM) based on the Sensitive Types we just explored. 

- From the Oracle Data Safe Dashboard, click on the Data Discovery link

    ![](images/2019-08-13%2014_57_50-Oracle%20Data%20Safe%20_%20Home.png)


- 


### Previous Steps

* [View Data in SQL Developer Web](SQLDevWeb.md)
* [View Data Safe Dashboard](DataSafeDashboard.md)
* [Provision Auditing and Alerting](ProvisionAuditAlerting.md)
* [Execute Security Assessment and View Results](SecurityAssessment.md)
* [Execute User Assessment and View Results](UserAssessment.md)
* [Discover Sensitive Data](DiscoverSensitiveData.md)

### Next Steps

* [Mask Sensitive Data](MaskSensitiveData.md)
* [View Masked Data in SQL Developer Web](ViewMaskedDataSQLDev.md)


