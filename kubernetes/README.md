# Microservices on Kubernetes Demo Lab

## Introduction
_Time to Complete: 20 minutes_

  In this demo lab, you will begin your container-native development journey by diving in to a Kubernetes sandbox environment with a microservice application partially running in it. You will learn about the components that make up an application in Kubernetes, such as Deployments, Services, Replica Sets, and Pods.

  Next, you will complete the deployment of this application yourself using a pre-written deployment descriptor and learn about how the two microservices discover and interact with each other. Finally, you will scale out one of the services to learn about handling peak traffic. 

  If you would like to learn how to build a highly available Kubernetes cluster on your own hardware or in the cloud, as well as set up a CI/CD pipeline from scratch, check out the last section of this guide for information about our container native workshop.

## Objectives

- Get hands-on with microservices on Kubernetes
- Explore Deployments, Services, Replica Sets, Pods, and more Kubernetes concepts
- Deploy a microservice using the Kubernetes dashboard
- Perform a managed scale out of a running application
- Learn where to go from here

## Instructions

### Start Your Demo Lab Instance

- Qloudable site
  - Launch Demo Lab
  - View overview video while machine is starting up

### Investigate Product Catalog Microservice

- Deployment
- Replica Set
- Pods
- Service
- Lack of Twitter Feed functionality

### Deploy Twitter Feed Microservice

- Copy deployment descriptor from GitHub
- Examine descriptor:
  - Service selectors
  - Custom metadata
  - Volumes
  - Downward API
- Exec inside Twitter Feed pod to view mounted volume contents in /tmp/labels

### Revisit Product Catalog Microservice

- Refresh to see additional pod metadata surfaced by Twitter Feed microservice
- Verify Twitter Feed functionality
- View Product Catalog code snippet to understand how the application functions correctly without code change to Product Catalog (kube-dns)

### Scale Out Product Catalog Microservice

- Examine deployment descriptor to identify current desired scale
- Use Kubernetes scale feature to increase number of pods
- Understand pod autoscaling feature

### Next Steps

- We worked with pre-built docker containers and a pre-installed Kubernetes cluster today. To learn how to start from bare VMs and source code, join us for a virtual, in-person, or self-service workshop where we explore container native development in depth.
