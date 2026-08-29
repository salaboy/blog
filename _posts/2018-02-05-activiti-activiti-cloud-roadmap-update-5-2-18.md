---
title: "Activiti & Activiti Cloud Roadmap Update 5/2/18"
date: 2018-02-05 08:44:21 +0000
permalink: /2018/02/05/activiti-activiti-cloud-roadmap-update-5-2-18/
description: "Almost 8 months of heavy work (and 6 Early Access Releases) we are happy to see that our building blocks are maturing to support more complex use cases."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "rfc"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "cloud native"
  - "community"
  - "microservices"
  - "roadmap"
  - "services"
original_url: https://www.salaboy.com/2018/02/05/activiti-activiti-cloud-roadmap-update-5-2-18/
---

Almost 8 months of heavy work (and 6 Early Access Releases) we are happy to see that our building blocks are maturing to support more complex use cases. We are committed to improve each service iteratively and for that reason we are planning to have a live demo environments where we can push new versions our services in a continuous deployment fashion. [[View official and updated Activiti & Activiti Cloud Roadmap here]](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap)

We are now working hard in our BluePrint example where you will be able to find a practical example about how to implement a real life scenario with Activiti Cloud.

We are keeping a close eye to issues reported to GitHub, to make sure that all of them are triaged and assigned to a milestone where someone from the team or our community contributors can take care of them in an ordered fashion. Check our current milestone for more details: <https://github.com/Activiti/Activiti/milestone/8>. We also created a new label for community contributors who want to get started with simple tasks called "community contributions": <https://github.com/Activiti/Activiti/labels/community-contribution>

**Our focus remains:**

- Create RFCs for new Cloud Native components and services
  - New App Definition And Lifecycle Management Service RFC coming
  - New BluePrint RFC coming
- Provide a clear specification (APIs) about our Services (REST/Message Based/Configurations). Make sure that these APIs have well defined responsibilities, single focused and can evolve over time without causing consumers any headaches.
  - We iterate each component to make it simpler, faster and better
- Make sure that we use standard tools, patterns and development techniques widely adopted by other Open Source Projects/Communities. Spring, Spring Boot, Spring Cloud, Docker, Kubernetes falls into this category, and we are making sure that we provide the right integration with these frameworks/tools. Activiti Cloud is designed from the ground up to work with such technologies.
- Create Industry Specific BluePrints to demonstrate common scenarios and use cases that represent what different industries requirements.
- Engage and mentor partners and community members that wants to participate.
- Doing it in the Open Source way (Transparency & Meritocracy are a must).

### [Milestone #6](https://github.com/Activiti/Activiti/milestone/7) - January 2018 - Ended -

- Process Runtime Service APIs (review and proposal)
- Notification Service initial implementation for release
  - Query Module now use GraphQL to provide faster and better options for data retrieval
- Improved Activiti Cloud Connectors Starter
  - Connectors now use dynamic binding to improve traceability
- Kubernetes ConfigMaps Research
- Improved Deployment Descriptors for Kubernetes
  - Tests in AWS environments using our Helm Charts
  - Tests in PKS Pivotal Early Access Environment
  - Shared Helm Charts with the Alfresco Platform Services for core infrastructure

January was all about testing our infrastructure in real environments. The team also presented at DevCon (Alfresco Community Conference) where our Trending Topic Campaigns BluePrint initial version was demoed. We will be writing more about our BluePrint soon, and we look to hear from you what would you expect from it.

For now you can look at our slide decks and feel free to ask in gitter for more details

#### Activiti & Activiti Cloud Overview

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/86282838" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

#### Activiti Cloud Deep Dive

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/86287790" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

### [Milestone #7](https://github.com/Activiti/Activiti/milestone/8) - February 2018 - In Progress -

- Process Runtime APIs (proposal and initial draft )
  - Process Engine Clean ups and refactoring
  - Cloud BPMN Throw/Catch Signals
- Application Service (proposal and initial draft)
  - Definition
  - Lifecycle Management
- Process Modelling Services next iteration
- Itsio.io Research and initial integration
- New Application Gateway research (support Eureka, Spring Cloud, WebSockets)
- Kubernetes Service Registry and Service Brokers/Catalogs review

February will be all about APIs and a high level concept of an Application. The main purpose of these new services and APIs is to ensure that we have a coherent set of functionalities that can we can maintain consistent with future releases. The definition of what an application is going to define how our building blocks are configured to solve a set of business requirements. This definition will also define how this application will be maintained and upgraded in time.

### [Milestone #8](https://github.com/Activiti/Activiti/milestone/9) - March 2018

- Security & SSO review (review Apache Shiro Wildcard Permissions)
- Application Service (Add Case Management Constructs)
- Deployment Service & Pipeline (Design and initial implementation)
- JHipster Microservices Infrastructure Integration

**Note: Activiti & Activiti Cloud Beta Release Prep Work**

### Milestone #9 - April 2018

- BluePrint Trending Topics Campaigns User Interface and Dashboards
- Polyglot MicroProcessRuntime PoC
- JHipster Microservices Infrastructure Integration (based on Spring Boot 2)

### Milestone #10 - May 2018

- Decision Service initial draft implementation
- Forms integrations
- Pipelines Support for deployments

### Milestone #11 - May 2018

**Note: Activiti & Activiti Cloud Final Release Prep Work**

As always, if you want to participate on the development process of some of these components or examples get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.

We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementations. If you are looking into getting started with the Early Access Release we recommend to check our Getting Started Guide in Gitbook: [[Getting Started · Activiti 7 & Activiti Cloud Developers Guide]](https://activiti.gitbooks.io/activiti-7-developers-guide/content/setting-up-the-environment.html)

You can always find us in the Gitter channel: [[Activiti/Activiti7 - Gitter]](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

Because we are a world wide community you can always find someone online to chat with, no matter your timezone :)
