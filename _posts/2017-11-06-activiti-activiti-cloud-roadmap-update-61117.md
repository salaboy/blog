---
title: "Activiti & Activiti Cloud Roadmap Update 6/11/17"
date: 2017-11-06 12:00:17 +0000
permalink: /2017/11/06/activiti-activiti-cloud-roadmap-update-61117/
description: "After almost 4 months of heavy work (and 3 Early Access releases) we are moving forward our basic Cloud Native Runtime building blocks (Runtime Bundle…"
tags:
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
  - "progress"
  - "roadmap"
  - "update"
original_url: https://www.salaboy.com/2017/11/06/activiti-activiti-cloud-roadmap-update-61117/
---

After almost 4 months of heavy work [(and 3 Early Access releases)](/2017/11/03/activiti-activiti-cloud-7-ea201710-are-out/) we are moving forward our basic Cloud Native Runtime building blocks (Runtime Bundle, Connectors, Query & Audit) forward and we are reaching a point were we can start building up more advanced services. Because of these progress we can clearly define what are our main objectives for November, December and January.

Our focus is on:

- Create RFCs for new Cloud Native components and services
- Provide a clear specification (APIs) about our Services (REST/Message Based/Configurations). Make sure that these APIs have well defined responsibilities, single focused and can evolve over time without causing consumers any headaches.
- Make sure that we use standard tools, patterns and development techniques widely adopted by other Open Source Projects/Communities. Spring, Spring Boot, Spring Cloud, Docker, Kubernetes falls into this category, and we are making sure that we provide the right integration with these frameworks/tools. We are not just using them to say that we *"support"* Docker or Kubernetes. Activiti Cloud is designed from the ground up to work with such technologies.
- Engage and mentor community members that wants to participate
- Doing it in an Open Source way (Transparency / Meritocracy are a must)

### Milestone #3 - October 2017 - Ended -

- Refactor Activiti Cloud Service
  - Process Def & Instance Security model
- Activiti Cloud Connectors
  - Process Runtime refactoring to avoid JavaDelegates and classpath extensions
  - Kubernetes Services ready
- Process Model Service (Design and Initial Implementation)
- Notification Service (Design and initial implementation)
- Form Runtime Service (Initial discussions and planning)

This milestone was released to [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cactiviti%20cloud) and Docker Images were tagged in Docker Hub. You can find more about these [Early Access Release here](/2017/11/03/activiti-activiti-cloud-7-ea201710-are-out/).

### Milestone #4 - November 2017 - In Progress-

- Runtime Bundle & Services Hardening
  - Process Def & Instance Security model
  - Contracts and Rest Docs
  - Feign Clients Examples and tutorials
  - Improved Swagger APIs
  - Tracing Integration
- Activiti Cloud Connectors Examples
- JHipster Integration and Examples
- Application Context Service - (Design and Initial Implementation)
  - Publish/Deploy/Group Runtime Bundle Service
  - Case Management Constructs (Design and PoC)
- Notification Service - Initial Implementation
- Process Model Service - Initial Implementation
- Form Runtime Service + Cloud Starter
- Kubernetes & AWS deployments improvements

Milestone #4 is all about hardening our Runtime Bundle and Runtime Services. We need to make sure that these services are production ready, can be tested and consumed in a straight forward way, relaying in standard tools and practices. As part of this hardening we need to improve our Kubernetes Deployments, Docker Images and we need to start testing against a Native AWS setup. While we work on improving these services, we are starting to design more high level components that will provide services not only during runtime, but also during authoring. As part of these services we are designing and creating RFC documents for the following new components:

- Process Model Service
- Form Model Service
- Form Runtime Service(Runtime)
- Notification Service (Runtime)

Finally, we started the design on our initial implementation for adding some case management constructs into the platform. For us it is extremely important to keep these separated from the Process Runtime, but at the same time to make it in a way that it is transparent for the user consuming the services. Case Management is all about aggregation, content integration and allowing people to group and manage resources (process instances, documents, tasks) together under a case instance.

### Milestone #5 - December 2017 -

- Application Context Service
- Case Management Scenarios
- Form Model Service - Initial Implementation-
- Decision Model Service - Initial Implementation
- New Decision Runtime (Design and Initial Implementation)
- Back to Basics Examples

### Milestone #6 - January 2018 -

- Polyglot MicroProcessEngine PoC
- Deployment Service & Pipeline (Design and initial implementation)
- Process Engine Clean ups and refactorings
  - Activiti Interfaces Module
  - BPMN2 Extensions
  - History Service
  - Job Executor
  - Timers
  - Emails Service

As always, if you want to participate on the development process of some of these components get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementations.

If you are looking into getting started with the Early Access Release we recommend to check our Getting Started Guide in Gitbook: [[Getting Started · Activiti 7 & Activiti Cloud Developers Guide]](https://activiti.gitbooks.io/activiti-7-developers-guide/content/setting-up-the-environment.html)You can always find us in the Gitter channel: [[Activiti/Activiti7 - Gitter]](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
