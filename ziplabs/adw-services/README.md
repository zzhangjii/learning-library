---
layout: ziplab
description: Examine Database Services and work with Sample Data Sets.
tags: Oracle Cloud, Autonomous Data Warehouse, ADW, Oracle Cloud Infrastructure, OCI
permalink: /ziplabs/adw-services/index.html
---
# Working with Database Services and Sample Data Sets #

## Before You Begin ##
In this 10-minute lab, you will explore the provided sample data sets and experiment with the choices of database services that come with your ADWC instance.

### Background ###
Autonomous Data Warehouse Cloud provides three database services that you can choose when connecting to your database. These are named as HIGH, MEDIUM, and LOW services and provide different levels of performance and concurrency. 

* The HIGH database service provides the maximum amount of resources for a query, this also means the number of concurrent queries you can run in this service will not be as much as the other services. 
* The MEDIUM database service provides multiple compute and IO resources for a query. This service also provides more concurrency compared to the HIGH database service. 
* The LOW database service provides the least amount of resources for a query, this also means the number of concurrent queries you can run in this service will be higher than the other services. 

As a user you need to pick the database service based on your performance and concurrency requirements.

This lab uses the LOW and HIGH database services to understand the performance differences between them. The lab will run queries on sample data set provided out of the box with ADWC. ADWC provides the Oracle Sales History sample schema and the Star Schema Benchmark (SSB) data set, these data sets are in the SH and SSB schemas respectively. 


### What Do You Need? ###
* Access to an instance of Oracle Autonomous Data Warehouse Cloud
* [Oracle SQL Developer 18.2](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html)  (already installed)
* [Oracle's Java Development Kit 8 (JDK 8)](http://www.oracle.com/technetwork/java/javase/downloads/index.html) (already installed)
* [Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files](https://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html) (already installed)
* You must have completed the previous lab **Provisioning Autonomous Data Warehouse Cloud and Getting Started**.


## Connect and Query with the LOW Database Service ##
1. Open SQL Developer. 
2. Expand the list of connections and double click the **admin_low** connection to connect to the database.

    ![](img/connections.jpg)

    [Description of the illustration connections.jpg](files/connections.txt)

3. Copy and paste this code into the SQL Developer worksheet:

   ````SQL
   select /* low */ c_city,c_region,count(*)
   from ssb.customer c_low
   group by c_region, c_city
   order by count(*);
   ````

4. Click **Run Script** in SQL Developer so that all the rows are displayed on the screen.
5. Note the response time.
    
    ![](img/responseTime.jpg)

    [Description of the illustration responseTime.jpg](files/responseTime.txt)


## Connect and Query with the HIGH Database Service ##
1. Double click the **admin_high** connection to connect to the database.
2. Copy and paste this code into the SQL Developer worksheet:

   ````SQL
   select /* high */ c_city,c_region,count(*) 
   from ssb.customer c_high
   group by c_region, c_city
   order by count(*);
   ````

3. Click **Run Script** in SQL Developer so that all the rows are displayed on the screen.
4. Note the response time.

A query running in the HIGH database service can use more resources and run faster compared to a query running in the LOW database service. As you scale up the compute capacity of your ADWC service, you'll realize the queries get faster in the HIGH database service.


## Explore the Query Results Caching ##
ADWC will caches the results of a query. If you run the same queries again, you'll see they run much faster.

1. Click **Run Script** again for `admin_high` so that all the rows are displayed on the screen.
2. Note the improved response time!


## Want to Learn More? ##
* [Autonomous Cloud Platform Courses](https://learn.oracle.com/pls/web_prod-plq-dad/dl4_pages.getpage?page=dl4homepage&get_params=offering:35573#filtersGroup1=&filtersGroup2=.f667&filtersGroup3=&filtersGroup4=&filtersGroup5=&filtersSearch=) from Oracle University 
* [Autonomous Data Warehouse Cloud Certification](https://education.oracle.com/es/data-management/autonomous-data-warehouse-cloud/product_807?certPage=true) from Oracle University
* [ADWC Test Drive Workshop](https://oracle.github.io/learning-library/workshops/journey4-adwc/?page=README.md)


