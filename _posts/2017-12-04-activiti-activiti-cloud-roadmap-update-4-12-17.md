---
title: "Activiti & Activiti Cloud Roadmap Update 4/12/17"
date: 2017-12-04 15:19:16 +0000
permalink: /2017/12/04/activiti-activiti-cloud-roadmap-update-4-12-17/
description: "Almost 5 months of heavy work (and 4 Early Access Releases) we are happy to see that our building blocks are maturing to support more complex use cases."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "rfc"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "roadmap"
  - "update"
original_url: https://www.salaboy.com/2017/12/04/activiti-activiti-cloud-roadmap-update-4-12-17/
---

Almost 5 months of heavy work (and 4 Early Access Releases) we are happy to see that our building blocks are maturing to support more complex use cases. We are committed to improve each service iteratively and for that reason we are planning to have a live demo environments where we can push new versions our services in a continuous deployment fashion. [[View official and updated Activiti & Activiti Cloud Roadmap here]](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap)

We are getting more strict with planning and coordination of different teams and collaborators working on different areas, this pushes us to be more diligent with GitHub Issues, Milestones and Pull Requests.  If you want to report an issue, please do, but also we recommend to get in touch via Gitter to make sure that we can have a conversation about the specifics of the issue so we can size it and plan accordingly.

**Our focus remains the same:**

- Create RFCs for new Cloud Native components and services.
- Provide a clear specification (APIs) about our Services (REST/Message Based/Configurations). Make sure that these APIs have well defined responsibilities, single focused and can evolve over time without causing consumers any headaches.
- Make sure that we use standard tools, patterns and development techniques widely adopted by other Open Source Projects/Communities. Spring, Spring Boot, Spring Cloud, Docker, Kubernetes falls into this category, and we are making sure that we provide the right integration with these frameworks/tools. We are not just using them to say that we "support" Docker or Kubernetes. Activiti Cloud is designed from the ground up to work with such technologies.
- Engage and mentor partners and community members that wants to participate.
- Doing it in the Open Source way (Transparency & Meritocracy are a must).

### Milestone #4 - November 2017 - Ended -

- Runtime Bundle & Services Hardening
  - Process Def & Instance Security Policies model
- Tracing & Monitoring integrations common to all our services
- Activiti Cloud Connectors Examples
- JHipster Integration and Examples
- Process Model Service - Initial Draft
- Kubernetes & AWS deployments improvements

Milestone #4 was all about improving our building blocks to have Tracing & Monitoring capabilities out of the box. We also added our first iteration of the Runtime Bundle Security Policies mechanism which provides and out of the box granular configuration to do endpoint and content based filtering to enforce security restrictions on top of Process Definitions and Instances. We also released our second iteration of the Activiti Cloud Connectors, which are now the default integration point for Service Tasks when you are running Activiti Cloud (aka Runtime Bundles). We are paying a lot of attention to the JHipster community, due the fact that we share a lot of the infrastructural components and technology stack (Angular Front End). For that reason, we will keep pushing the integration with their components forward. As part of this Milestone we aligned with **Spring Boot M6** and **Spring Cloud Finchley M4** which were released, less than a month ago.

### Milestone #5 - December 2017 - In Progress -

- Extended Tests for distributed deployments to a live environment (24/7)
- Process Model Service - Initial Implementation to release
- Project & Groups Service - Initial Implementation to release
- Elastic Search Query Service - Initial implementation to release
- Notification Service PoC
- Distributed Logging, Monitoring and Tracing
  - ELK Stack (or similar)
- Process Runtime & Connectors Registry
- Automated Release Tests - Initial approach

December Milestone is going to be a short milestone focused on adding 2 new services related to the Authoring tools (Groups & Projects + Process Model Service) for the platform. Until now, we have been focused on Runtime Services only. We want to make sure that our services are stable and for that reason we will spend time setting up an example that we can run 24/7 in an AWS/Kubernetes (Pivotal PKS is in our plans as well, we will appreciate Red Hat Openshift contributions) environment  where we can upgrade each of the blocks individually and go through the same process that you will face when implementing Activiti Cloud in your environments.

By having this example live (and publicly  available) we expect to self-document the process of using Activiti Cloud for all our users.

Distributed Logging is being added, and we expect to include this in our Activiti Cloud Examples for the next release. We also need to get better at our release process, meaning that automated tests for our released artefacts should be in place if we want to make sure that our releases go smoothly. We expect also to release the Elastic Search integration/implementation for the Query Module as well as having an initial PoC for the Notification service using GraphQL Subscription Mechanisms.

### Milestone #6 - January 2018

- Process Runtime APIs (Definition & Refactoring)
- Process Runtime Service APIs (review and refactoring)
- Notification Service initial implementation for release
- Process Engine Clean ups and refactoring
  - BPMN2 Extensions
  - History Service
  - Job Executor
  - Timers
  - Emails Service

On January we have [Alfresco DevCon 18 in Lisbon](http://devcon.alfresco.com) but our main focus will be clean ups at the framework level. We need to build and set up a set of APIs that will be versioned with clear @Deprecation Strategies to make sure that compatibility is tracked across different releases. By the end of January the Notification Service initial implementation should be added to our basic set of building blocks.

### Milestone #7 - February 2018

- Application Service (Case Management Constructs)
- Itsio.io Research and initial integration
- Kubernetes Service Registry and Service Brokers review
- Security & SSO review
- JHipster Microservices Infrastructure Integration

February main focus will be around Application Composition and Coordination, this is where the Service Registry & Distributed Configuration Server becomes really important. Security policies and isolation between applications will require review on our mechanisms to make sure that we are aligned to what the industry is expecting.

Tools like Itsio will be analyzed and adopted to improve how we Release and maintain Activiti Cloud Applications. If JHipster migrates to Spring Boot 2, we will add our building blocks to their infrastructure and integrate with their services.

### Milestone #8 - March 2018

- Decision Service initial draft implementation
- Polyglot MicroProcessRuntime PoC
- Deployment Service & Pipeline (Design and initial implementation)

As always, if you want to participate on the development process of some of these components or examples get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.

We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementations. If you are looking into getting started with the Early Access Release we recommend to check our Getting Started Guide in Gitbook: [[Getting Started · Activiti 7 & Activiti Cloud Developers Guide]](https://activiti.gitbooks.io/activiti-7-developers-guide/content/setting-up-the-environment.html)

You can always find us in the Gitter channel: [[Activiti/Activiti7 - Gitter]](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

Because we are a world wide community you can always find someone online to chat with, no matter your timezone :)
