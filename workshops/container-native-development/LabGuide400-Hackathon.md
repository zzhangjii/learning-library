# Hackathon Objective 1: Deployment from a Feature Branch

![](images/400/header.png)

## About the Hackathon

In this lab, you will pick up from the end of lab 200, with a completed Wercker workflow deploying the Twitter Feed microservice to your Kubernetes cluster, as well as a manually-deployed Product Catalog application. In this lab, you will use your creativity to perform a simple Blue/Green deployment of the Twitter Feed microservice. There are multiple ways to accomplish this task, and you can decide which one makes the most sense to you.

To get you started, the following sections will give you some background information on the core concepts you'll need to understand before you begin.

### Naming and Metadata Conventions in Kubernetes Deployments

### Built-in and User-defined Variables in Wercker

## Objectives

**Automate deployment to Kubernetes from alternate branches**

`Estimated Time: ~2 hours`

- Outline:
  - Create feature branch in GitHub
  - Configure new Wercker workflow to watch feature branch and deploy to Kubernetes
  - Use metadata labels to distinguish feature version from main version
  - Display branch name in application
    - (We will provide a web service in application that feeds metadata from mounted volume to service endpoint)
  - Modify service definition to route traffic to feature branch version
- Hints provided/introductory topics:
  - How Wercker pipelines are applied to branches
  - Volume mounting and downward API in Kubernetes
  - Metadata web service documentation
