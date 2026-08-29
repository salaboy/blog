---
title: "Activiti Cloud SR1 Released!"
date: 2019-03-08 12:26:15 +0000
permalink: /2019/03/08/activiti-cloud-sr1-released/
description: "I am happy to announce the first Service Release for Activiti Cloud and Activiti Core artefacts."
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
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "k8s"
  - "microservices"
original_url: https://www.salaboy.com/2019/03/08/activiti-cloud-sr1-released/
---

I am happy to announce the first ***Service Release*** for Activiti Cloud and Activiti Core artefacts. After getting a lot of community feedback from our first GA iteration we are now releasing **7.0.0.SR1** improving mostly on compatibility with Spring Boot 2.0.x and JDK 8 support in addition to JDK11.

You can consume all the Activiti Cloud artifacts from [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.0.0.SR1/pom):

&lt;dependencyManagement&gt;     
  &lt;dependencies&gt;       
    &lt;dependency&gt;            
      **&lt;groupId&gt;org.activiti.cloud.dependencies&lt;/groupId&gt;**   
 **&lt;artifactId&gt;activiti-cloud-dependencies&lt;/artifactId&gt;**   
 **&lt;version&gt;7.0.0.SR1&lt;/version&gt;**         
      &lt;scope&gt;import&lt;/scope&gt;         
      &lt;type&gt;pom&lt;/type&gt;       
    &lt;/dependency&gt;     
  &lt;/dependencies&gt;   
&lt;/dependencyManagement&gt;

In this SR1 release you will find the following [[main fixes](https://github.com/Activiti/Activiti/milestone/20)]:

- Task Variable Endpoints for Admin and Users update
- JDK 8 support for our artifacts
- Process Definition XML accessible in Query Service
- Sync between query and runtime bundle for standalone tasks
- Swagger file generation from RB endpoints fix

All these Spring Boot Starters are based on Spring Boot 2.1.2 and Spring Cloud Greenwich RELEASE and all the artifacts are compiled to work with JDK11 (and now JDK8 support as well).

You can also deploy our Example HELM charts in your favourite cloud providers or On-Premise Kubernetes installation by following our [[Getting Started Guide](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud)]

HELM Charts for Full Example has being updated to consume GA artifacts in ****version 1.1.9****

If you are interested in the future of the project you can take a look at our [[presentation at DevCon](https://www.slideshare.net/salaboy/the-future-of-activiti-cloud-devcon-2019)]
