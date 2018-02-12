---
layout: ziplab
description: Learn how to deploy a Java EE application on Oracle Application Container Cloud Service.
tags: Oracle Cloud, Application Container Cloud Service
permalink: /ziplabs/java-ee-acces/index.html
---
# Deploy a Dropwizard Application to Oracle Cloud #

## Before You Begin ##

    This 15-minute tutorial shows you how to deploy a web service to Oracle Application Container Cloud Service using the Dropwizard framework. 

### Background ###

    Dropwizard is an open source Java framework that you can use to quickly create RESTful web services. Dropwizard integrates several components and Java frameworks that can help you build more robust applications.

    In this tutorial, you create a web service for an employee directory application and then deploy it to Oracle Application Container Cloud Service. Data for the application is stored in an in-memory database. You test the REST service by using an HTML5 JavaScript client.

### What Do You Need? ###
* Access to an instance of Oracle Application Container Cloud Service
* [NetBeans](https://netbeans.org/) or another code editor
* [Oracle's Java Development Kit 8 (JDK 8)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Apache Maven 3.0+](http://maven.apache.org/download.cgi)
* The HTML5 JavaScript client files: [employees-client.zip](files/employees-client.zip)
* The Dropwizard Maven project: [employee-service-dropwizard.zip](files/employee-service-dropwizard.zip)

## Create the Java Project with Maven ##

1. Open a terminal window (Linux or Mac) or the command prompt (Windows), in the folder you want to create the project in, type the following command:

    <pre><code>mvn archetype:generate -DgroupId=com.dropwizard.employee.service -DartifactId=employee-service-dropwizard -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false</code></pre>

2. Using a text editor, open the `pom.xml` file.
3. To add the project dependencies [copy this code](files/dependencies.xml.txt) snippet and paste it into the `<dependencies>` tag.
4. Add the following Maven compile properties under the root element.

    ````
    <properties>
       <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>
    ````

5. To add the Maven Shade Plugin by copy this code snippet under the root element of the pom.xml file.

## Create the Web Service

1. In the source directory of your maven project, create the EmployeeApplication.java file in the com.dropwizard.employee.service package and copy and paste this code snippet into the file.

2. Create the `EmployeeResource.java` file in your Maven project and copy this code snippet into your file.

3. Create the employee.yaml file in the root of your Maven project. This is the same directory that contains your POM.xml file. Add the following content to the `employee.yaml` file:

    ````
    server:    
        applicationConnectors:
        -   type: http
            port:  ${PORT}
        
    # Logging settings.
    logging:
        level: INFO
    ````

4. Add the following support classes to your project from the `source` directory of the solution file. Copy the files to the `src/main/java/com/dropwizard/employee/service` directory of your maven project. 
    <table><thead><tr>
    <th>Class File Name</th><th>Description</th>
    </tr></thead>
    <tbody>
    <tr><td>Employee.java</td><td>Defines the structure of the data used in the employee directory.</td></tr>
    <tr><td>CrossOriginEmployeeFilter.java</td><td>Defines the cross origin HTTP headers for your application.</td></tr>
    <tr><td>EmployeeConfiguration.java</td><td>Defines any Dropwizard configuration options, if needed.</td></tr>
    <tr><td>EmployeeDAO.java</td><td>Defines database operations for Employee.</td></tr>
    <tr><td>EmployeeListDAO.java</td><td><code>ArrayList</code> data store for <code>Employee</code> objects.</td></tr>
    <tr><td>MockEmployeeList.java</td><td>Creates mock data for use with the application.</td></tr>
    </tbody>
    </table>

## Prepare the Application for Deployment ##
1. Create the manifest.json file in the root directory and add the following content.
    ````json
    {
    "runtime": {
        "majorVersion": "8"
    },
    "command": "java -jar employee-service-dropwizard-1.0-SNAPSHOT.jar server employee.yaml"
    } 
    ````
    <b>Note</b>: To run a Dropwizard application you must specify the `server` command which requires the YAML configuration file. 

2. Create the `assembly` directory into the `src` folder.
3. Create the `distribution.xml` file in the `assembly` folder.
4. Copy this [code snippet](files/distribution.xml.txt) and paste it into the `distribution.xml` file.
5. Using a text editor, open the `pom.xml` file and [copy this code](files/assembly-plugin.xml.txt) snippet and paste it inside the `<plugins>` tags at the end of the plugin list. Save the file.

6. In the command line window, build your application by typing the maven command:

    <pre><code>mvn clean package</code></pre>

7. In the `target` directory locate the `employee-service-dropwizard-1.0-SNAPSHOT.zip` file which will be used to deploy your application to Oracle Application Contianer Cloud Service.
## Deploy the Application ##
1. In a web browser, go to [https://cloud.oracle.com/home](https://cloud.oracle.com/home) and click **Sign In**.
2. From the **Cloud Account** drop-down menu, select **Cloud Account with Identity Cloud Service**.
3. Enter your Cloud Account Name and click **My Services**.
4. Enter your cloud account credentials and click **Sign In**.
7. In the **Application Container** tile, click **Action** and select **Open Service Console**.
8. In the **Applications** list view, click **Create Application** and then select **Java SE**.
9. On the **Create Application** page, enter `DropwizardSample` for the name. On **Application**, be sure **Upload Archive** is selected and click **Browse**.
10. On the **File Upload** page, select your application archive `employee-service-dropwizard-1.0-SNAPSHOT.zip`, and click **Open**.
11. Click **Create**.

## Test the Application ##
1. Extract the `employee_client.zip` file in your local system.
2. Using a text editor, open `EmployeeController.js` file.
3. Edit the `urlService` variable and put in the generated link of your application deployed in Oracle Application Container Cloud Service. 

    <pre><code>$scope.urlService = "http://<strong>your URL</strong>/employees";</code></pre>
4. In a web browser open the `index.html` file and then click **Add New**.

    ![](img/testing-01.png)

    [Description of the illustration testing-01.png](files/testing-01.txt)
5. Enter the **First Name**, **Last Name**, **Email**, **Phone**, **Birthdate**, **Title**, and **Department** values.

    ![](img/testing-02.png)

    [Description of the illustration testing-02.png](files/testing-02.txt)

6. Beside photo click **Browse...** and then select an image file located in the `photos` folder.

    ![](img/testing-03.png)

    [Description of the illustration testing-03.png](files/testing-03.txt)
7. Click **Save**.

    ![](img/testing-04.png)

    [Description of the illustration testing-04.png](files/testing-04.txt)
8. Test the delete, update, and search options.
## Want to Learn More? ##
* [Oracle Application Container Cloud Service](http://www.oracle.com/pls/topic/lookup?ctx=cloud&id=apaasgs) in the Oracle Help Center
* Dropwizard website [dropwizard.io](http://www.dropwizard.io/)

