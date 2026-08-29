---
title: "Activiti Cloud RC1 released!"
date: 2019-01-30 16:40:02 +0000
permalink: /2019/01/30/activiti-cloud-rc1-released/
description: "I am really happy to announce that Activiti Core and Activiti Cloud RC1 are now released and ready to be used by all our community members."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "distributed"
  - "docker"
  - "kubernetes"
  - "microservices"
  - "services"
original_url: https://www.salaboy.com/2019/01/30/activiti-cloud-rc1-released/
---

I am really happy to announce that Activiti Core and Activiti Cloud RC1 are now released and ready to be used by all our community members.

![Activiti sticker](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/01/activiti_sticker.png)

In this release we included pretty big changes and refinements. We are now running with JDK 11 and we included the next iteration for our GraphQL based notification service. We did refine a lot of APIs in our Runtime Bundle and Query services to support more scenarios. We are going to go fast to GA and we will concentrate on refine and test the core features. We encourage community members to test the released artifacts and report back any issues that you might find to [here](https://github.com/Activiti/Activiti/issues).  
You can find the full list of  [issues and features included in RC1 here](https://github.com/Activiti/Activiti/milestone/11?closed=1)  
Main Features and fixed issues:

- Activiti Core & Activiti Cloud moved to JDK 11
- Activiti Cloud: GraphQL notification service implementation
- Activiti Core & Activiti Cloud: default JSON serialization for process variables
- Activiti Core new Connector Functional Interface added
- Activiti Cloud acceptance tests splitted into separate clusters
- Activiti Cloud new Admin APIs in Runtime Bundle and Query
- New conformance tests for BPMN scenarios
- Improved HELM Charts configurations

You can find the published RC1 artifacts in [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.0.0.RC1/pom) and the tagged [Docker Images in Docker Hub](https://hub.docker.com/u/activiti/).

You can now update your BOM dependencies to:

&lt;dependencyManagement&gt;      
  &lt;dependencies&gt;  
    &lt;dependency&gt;  
      &lt;groupId&gt;org.activiti.dependencies&lt;/groupId&gt;           
      &lt;artifactId&gt;activiti-dependencies&lt;/artifactId&gt;           
      &lt;version&gt;7.0.0.RC1&lt;/version&gt;          
      &lt;scope&gt;import&lt;/scope&gt;          
      &lt;type&gt;pom&lt;/type&gt;        
    &lt;/dependency&gt;      
  &lt;/dependencies&gt;    
&lt;/dependencyManagement&gt;

Also our HELM charts [activiti-cloud-full-example version 0.7.0](https://github.com/Activiti/activiti-cloud-charts/tree/master/activiti-cloud-full-example) were upgraded to use RC1 Docker Images.

If you find any issues with RC1 please create an [issue here](https://github.com/activiti/activiti/issues). Or get in touch [via Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link).

We will be aiming for a GA Release by mid February [track progress here](https://github.com/Activiti/Activiti/milestone/18)).  
This is a great time to get involved to help us with the testing process, integrating with your favourite Open Source projects and learning about the technology stack that we are using to build these amazing tools.
