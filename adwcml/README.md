# Oracle Autonomous Data Warehouse Machine Learning Demo Lab

## Introduction
_Time to Complete: 20 minutes_

  In this demo lab, you will begin your machine learning development journey by importing an Apache Zeppelin Notebook into Oracle Machine Learning and then use ADWC's Machine Learning to predict customer good credit given detailed demographic information.

## Objectives

- Get hands-on with Oracle's Autonomous Data Warehouse Machine Learning
- Explore the Apache Zeppelin notebook interface
- Create an Attribute Importance Model using the DBMS_Predictive_Analytics.Expain procedure
- Identify customer attributes that are the best predictors of good credit
- Predict credit worthiness of new customers

## Instructions

### Start Your Demo Lab Instance

- You should have reached this page by launching the Autonomous Data Warehouse Machine Learning Demo Lab for Oracle Cloud Infrastructure. If not, please visit [this link](#) to get access to your free instant sandbox environment where you can complete the rest of this lab.

### Log into Oracle Machine Learning.

The application we'll be working with today is a product catalog website that consists of two separate services. One component, **product-catalog-app**, is a Node.js server that hosts the catalog data and serves the website to customers. The second component, **twitter-feed** is a Java SE service that searches Twitter for tweets about the items in the product catalog. The product catalog microservice requests the twitter data from the twitter-feed service and returns it to the browser.

Let's explore the deployed application using the Kubernetes Dashboard.

- Open your Kubernetes Dashboard by clicking the **Kubernetes Dashboard** button on your demo lab landing page.

  ![](images/4-1.png)

