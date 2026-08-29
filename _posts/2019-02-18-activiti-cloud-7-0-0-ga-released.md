---
title: "Activiti Cloud 7.0.0.GA Released"
date: 2019-02-18 09:04:03 +0000
permalink: /2019/02/18/activiti-cloud-7-0-0-ga-released/
description: "I am happy to announce that Activiti Cloud 7.0.0.GA has been released! After a hard year of work we are closing this first iteration providing building…"
tags:
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "k8s"
  - "microservices"
  - "spring cloud"
original_url: https://www.salaboy.com/2019/02/18/activiti-cloud-7-0-0-ga-released/
---

I am happy to announce that **Activiti Cloud 7.0.0.GA** has been released! After a hard year of work we are closing this first iteration providing building blocks to create Business Automation applications in a Cloud Native approach.

Activiti Cloud 7.0.0.GA is providing a **Business Automation layer for Kubernetes**, building on top of Spring Boot (2.x), Spring Cloud Greenwich (RELEASE) and Docker containers.

![Kube](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/02/kube.png)

We are quite excited to see how the community pick up these components to build all sorts of business applications. We are very keen to help community members to get started and see which Open Source project integrations make sense for the future.

You can consume all the Activiti Cloud artifacts from Maven Central:

&lt;dependencyManagement&gt;  
  &lt;dependencies&gt;  
    &lt;dependency&gt;  
      &lt;groupId&gt;org.activiti.cloud.dependencies&lt;/groupId&gt;  
      &lt;artifactId&gt;activiti-cloud-dependencies&lt;/artifactId&gt;  
      &lt;version&gt;7.0.0.GA&lt;/version&gt;  
      &lt;scope&gt;import&lt;/scope&gt;  
      &lt;type&gt;pom&lt;/type&gt;  
    &lt;/dependency&gt;  
  &lt;/dependencies&gt;  
&lt;/dependencyManagement&gt;

![Screenshot 2019 02 15 at 13.05.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/02/screenshot-2019-02-15-at-13.05.42.png)

In this GA release you will find the following Spring Boot Starters to create your own domain specific services using our Cloud Native Building Blocks:

- **Runtime Bundle Spring Boot Starter** (internal release 7.0.128)
  - Contains Activiti Core 7.0.0.GA (internal release 7.0.127)
- **Cloud Connectors Spring Boot Starter** (internal release 7.0.74)
- **Query Service Spring Boot Starter** (internal release 7.0.106)
- **Audit Service Spring Boot Starter** (internal release 7.0.81)
- **Modeling Backend Spring Boot Starter** (internal release 7.0.99)
- **Application Service** **Spring Boot Starter**  - Beta (internal release 7.0.64)
- **Notification Service Spring Boot Starter -** Beta (internal release 7.0.16)
  - GraphQL endpoint and Subscriptions

All these Spring Boot Starters are based on Spring Boot 2.1.2 and Spring Cloud Greenwich RELEASE and all the artifacts are compiled to work with JDK11.

As part of this release we are also providing the first iteration of our new ***Activiti Modeler Application*** where you can model your business processes and export them in Projects.

![Screenshot 2019 02 15 at 08.50.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/02/screenshot-2019-02-15-at-08.50.45.png)

You can also deploy our Example HELM charts in your favourite cloud providers or On-Premise Kubernetes installation by following our Getting Started Guide:

<https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud>

Or follow our 5 steps deployment:

[![Activiti Cloud 7.0.0.GA Released](https://asciinema.org/a/227940.svg)](https://asciinema.org/a/227940)

1. helm install stable/nginx-ingress --version 1.1.2
2. kubectl get services (Look for the Ingress Service EXTERNAL IP, it might take a minute)
3. helm repo add activiti-cloud-charts <http://activiti.github.io/activiti-cloud-charts>
4. helm repo update
5. helm install —name awesome  activiti-cloud-charts/activiti-cloud-full-example —set global.gateway.domain=&lt;ingress external ip&gt;.nip.io —namespace=salaboy

We are also providing some [Jenkins X](https://jenkins-x.io/) quickstarts that you can use to leverage CI/CD from day one, we believe that as part of our Cloud Native transformation, CI/CD becomes a fundamental practice for our day to day operations.

![Jenkins x](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/05/jenkins-x.png)

<https://github.com/Activiti?utf8=%E2%9C%93&q=quickstart>

A blog post is coming to demonstrate how to leverage these quickstart if you are using Jenkins X.

Moving forward, a [new roadmap](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap) blog post is being create to share what the focus will be for Activiti Cloud 7.1.x release train.

If you are interested in the future of the project you can take a look at our presentation at DevCon:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/129990329" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>
