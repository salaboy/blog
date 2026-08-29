---
title: "Activiti Cloud 7.1.0.M1 released!"
date: 2019-05-17 11:23:27 +0000
permalink: /2019/05/17/activiti-cloud-7-1-0-m1-released/
description: "I am happy to announce the first milestone of Activiti Cloud 7.1.0 release train. For 7.1.0 we are focused on adding more support for BPMN elements and…"
tags:
  - "activiti7"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
original_url: https://www.salaboy.com/2019/05/17/activiti-cloud-7-1-0-m1-released/
---

I am happy to announce the first milestone of Activiti Cloud 7.1.0 release train. For [7.1.0 we are focused on adding more support for BPMN elements and maturing each component to provide more features.](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap) We want to make sure that people creating applications with Activiti Cloud can test these applications in distributed environments in an intuitive way, as well as troubleshoot when things go wrong. For this reason we are putting a lot of effort in CI/CD integrations and we keep delivering fixed versions every time that a change happens in our services. We plan to release to Maven Central once a month and you can follow our [milestones in Github issues](https://github.com/activiti/activiti/milestones?direction=asc&sort=due_date&state=open).

You can consume all the Activiti Cloud artifacts for this release from [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.1.0.M1/pom):

```
<dependencyManagement>
   <dependencies>
     <dependency>
       <groupId>org.activiti.cloud.dependencies</groupId>
       <artifactId>activiti-cloud-dependencies</artifactId>
       <version>7.1.0.M1</version>
       <scope>import</scope>
       <type>pom</type>
     </dependency>
   </dependencies>
 </dependencyManagement>
```

In the 7.1.0.M1 release you will find the following [[main fixes & features](https://github.com/Activiti/Activiti/milestone/12?closed=1)]:

- HELM Chart improvements and hardening
- Updated Getting Started Guides and Quickstarts for Jenkins X
- Swagger File generation per starter at compilation time \(validated service clients\)
- Modeling App:
  - Improved Import/Export from Modeling app
  - Improved model validations
- BPMN Process Models are now available from Query Service
- Improved Process Extensions mechanism
- Process Instance Id is now linked with Task information in Query Service
- Cloud Native BPMN Signal Events Support
  - Intermediate Catch/Throw
  - Start Event
  - Boundary Event
- Support for Query and Audit event handler
- Improved REST Error Handlers for all services, now handled at service-common level

You can also deploy our Example HELM charts in your favourite cloud providers or On-Premise Kubernetes installation by following our [[Getting Started Guide](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud)]

HELM Charts for Full Example has being updated to consume GA artifacts in ****version 1.1.15****

This HELM chart version consumes the [Docker images hosted in Docker HUB](https://hub.docker.com/u/activiti) with the 7.1.0.M1 tags.

You can take a look at the [full release notes here](https://activiti.gitbook.io/activiti-7-developers-guide/releases/7.1.0.m1), with the main changes if you want to upgrade from 7.0.x.
