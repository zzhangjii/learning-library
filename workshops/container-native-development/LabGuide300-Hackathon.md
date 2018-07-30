# Hackathon Objective 1: Blue/Green Deployments

![](images/300/header.png)

## About the Hackathon

In this lab, you will pick up from the end of lab 200, with a completed Wercker workflow deploying the Twitter Feed microservice to your Kubernetes cluster, as well as a manually-deployed Product Catalog application. In this lab, you will use your creativity to perform a simple Blue/Green deployment of the Twitter Feed microservice. There are multiple ways to accomplish this task, and you can decide which one makes the most sense to you.

To get you started, the following sections will give you some background information on the core concepts you'll need to understand before you begin.

### Naming and Metadata Conventions in Kubernetes Deployments

### Built-in and User-defined Variables in Wercker

## Objectives

**Run two versions of your application in Kubernetes and control traffic flow**

`Estimated Time: ~1 hour`

- Outline:
  - Modify application name in Kubernetes config
  - Wercker builds and deploys new app version
  - Modify Service definition to switch traffic to new version
    - Alternate: alter service definition in Kubernetes config so traffic switches immediately
- Extension: pseudo-Canary deployment
  - Adjust number of pods to achieve desired ratio of traffic to each version
