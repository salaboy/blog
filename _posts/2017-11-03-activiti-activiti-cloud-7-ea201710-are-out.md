---
title: "Activiti & Activiti Cloud 7-201710-EA are out!"
date: 2017-11-03 20:59:51 +0000
permalink: /2017/11/03/activiti-activiti-cloud-7-ea201710-are-out/
description: "I'm happy to announce that Activiti & Activiti Cloud 7-EA201710 are out and we encourage people in the community to try and report issues if you find…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "workflow"
  - "BPM"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "release"
  - "spring boot"
  - "spring cloud"
original_url: https://www.salaboy.com/2017/11/03/activiti-activiti-cloud-7-ea201710-are-out/
---

I'm happy to announce that Activiti & Activiti Cloud 7-EA201710 are out and we encourage people in the community to try and report issues if you find them. This release was focused on improving our base building blocks to get the infrastructure working in Kubernetes and Docker based deployments.

You can find our published artifacts in [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cactiviti-cloud)and our Docker Images have been tagged so you can use the [7-201710-EA](http://search.maven.org/#artifactdetails%7Corg.activiti.cloud%7Cactiviti-cloud-dependencies%7C7-201710-EA%7Cpom) tag for each of our images. You can find more details on [Activiti in Docker Hub](https://hub.docker.com/u/activiti/)

As part of this release we also aligned with [Spring Boot 2.0.0.M5](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.0.0-M5-Release-Notes) and [Spring Cloud Finchley.M3](https://github.com/spring-projects/spring-cloud/wiki/Spring-Cloud-Finchley-Release-Notes).

Our building blocks highlights:

- Runtime Bundles:
  - By default IDs are set to UUIDs.
  - Default behaviour for Service Tasks inside runtime bundles now emit IntegrationEventRequests and consume IntegrationEventResutls, which enables Activiti Cloud Connectors to react and perform system to system integrations.
- Query Service
  - GraphQL endpoint added, now you can use the power of GraphQL to extract data from our Query JPA Service. This was provided by @igdianov
- Audit Service
  - MongoDB implementation of our Audit Service was provided by @daisuke-yoshimoto
- Cloud Connectors (Starter): and initial implementation for the Cloud Connectors was released as part of this release. You can use this starter to create a simple template of our [Activiti Cloud Connectors](https://github.com/Activiti/activiti-cloud-connectors).

We also included our first version of our [JHipster Generator](https://github.com/Activiti/generator-jhipster-activiti). As part of this release the new GroupIds and ArtifactIds has been introduced based on our Repository refactoring. From now own, if a project depends on Spring Cloud it will be under the GroupId org.activiti.cloud.

We are quite happy with the current structure and it seems that it is going to stay stable for now. Even if we change the structure of the repositories we will maintain the groupIds and you should always point to activiti-dependencies and activiti-cloud-dependencies. In other words if you want to work with Activiti Process Runtime artifacts we do recommend using:

```xml
<dependencyManagement>
  <dependencies>
    <dependency>
      <groupId>org.activiti</groupId>
      <artifactId>activiti-dependencies</artifactId>
      <version>${version.activiti}</version>
      <type>pom</type>
      <scope>import</scope>
    </dependency>
  </dependencies>
</dependencyManagement>
```

And if you are looking to use Activiti Cloud Artifacts use:

```xml
<dependencyManagement>
<dependencies>
<dependency>
<groupId>org.activiti.cloud</groupId>
<artifactId>activiti-cloud-dependencies</artifactId>
<version>${version.activiti.cloud}</version>
<type>pom</type>
<scope>import</scope>
</dependency>
</dependencies>
</dependencyManagement>
```

We still have some open RFCs that you are more than welcome to comment, we will be working on these topics for our 7-EA201711 release:

- Runtime Bundle Security Model: [https://docs.google.com/document/d/1nug2pt60Mfcf1mvhzWIdTeXK-s8KgUV3OUBCUKfwpAI/edit#](https://docs.google.com/document/d/1nug2pt60Mfcf1mvhzWIdTeXK-s8KgUV3OUBCUKfwpAI/edit#https://docs.google.com/document/d/1nug2pt60Mfcf1mvhzWIdTeXK-s8KgUV3OUBCUKfwpAI/edit#)
- Process Model Service: <https://docs.google.com/document/d/1lFjusnLjQkK13Z43L1CLa33tnsUQd1mI6xgBYrldkQs/edit>
