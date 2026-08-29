---
title: "Activity 7 Roadmap Update (1/09/17)"
date: 2017-09-04 08:01:23 +0000
permalink: /2017/09/04/activity-7-roadmap-update-10917/
description: "After finishing almost two months of work we wanted to update our Roadmap and announce a new Milestone for November."
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "microservices"
  - "spring cloud"
  - "workflow"
  - "community"
  - "open source"
  - "roadmap"
  - "spring"
  - "spring boot"
  - "update"
original_url: https://www.salaboy.com/2017/09/04/activity-7-roadmap-update-10917/
---

After finishing almost two months of work we wanted to update our Roadmap and announce a new Milestone for November. We have made huge progress on Docker, Security and the Kubernetes deployments are almost done. In the next following weeks we will do our first release to maven central (you can consume our monthly snapshots already from Alfresco Nexus repository). We are already releasing snapshots to Docker Hub as well, but we will start tagging these snapshots shortly.

[Our previous August update (1/08/17)](/2017/08/01/activiti-7-roadmap-update-1817/)

Here is a review of our [original Milestones](/2017/07/05/activiti-7-kick-off-roadmap/)

### Milestone #0 - July 2017 - Ended

- Clean up Activiti
- Domain API + HAL API + Runtime Bundle
  - process definitions
  - process instances
  - tasks
  - XML/JSON/SVG for process definitions
- Audit Service: Event Store for Audit Information
- Identity Management and SSO (KeyCloak implementation)
- First Release Process

### Milestone #1 - August 2017 - Ended

- Domain API + HAL API + Runtime Bundle
  - Improvements, refinements and additions
- Query Service: Event Store for Runtime Information
  - Security Enabled
  - JPA - Reference Implementation
- Infrastructure Enabled Services
  - Gateway (Zuul)
  - Application Registry (Eureka)
  - SSO & IDM (Keycloak default implementation)
  - All Services are Docker Enabled
  - All Services can be deployed into Kubernetes
- Cloud Examples

August was all about enabling the Process Engine and other services to work in a cloud setup in collaboration with some infrastructural services. We created our Activiti Cloud Starters to make sure that working in these environments is easy and intuitive.

We also got our initial implementation of the Query Service, that will allow you to consume data about process executions without hitting (and affecting) any process engine runtime. You can find out some examples about how to filter data inside the [(Chrome) Postman collection.](https://github.com/Activiti/activiti-cloud-examples/blob/master/Activiti%20v7%20REST%20API.postman_collection.json)

You can play with all these services by looking into our [activiti-cloud-examples](https://github.com/Activiti/activiti-cloud-examples) repository, where you will find a set of descriptors to start all our services using Docker Compose and Kubernetes plus a JavaScript application that demonstrate how you can interact with all the services provided. This simple example shows how the security layer (SSO)  kicks in when you want to interact with our services.

### Milestone #2 - September 2017 - In Progress

- Domain API + HAL API + Runtime Bundle
  - Integration Events & Cloud Connectors
- Release to Maven Central
- Distributed Notification Service (Design and Initial Implementation)
- Infrastructure Enabled Services
  - Tracer (Zipkin)
  - ELK Stack support (optional)
- Activiti Cloud Documentation
- Validation Examples
  - AWS
  - CloudFoundry

September will be all about refining our current services to run in harmony to make sure that we use the right tool for the right infrastructure. The more environments we support (AWS, CloudFoundry, Kubernetes) the more pieces we need to replace and integrate with. We are looking into replacing Eureka when running on Kubernetes, based on the fact that Kubernetes already provide a service registry.

High priority this month will be the initial implementation of Integration Events producers and consumer (Cloud Connectors) which will enable us to remove the need for classpath extensions and improves the interoperability of our services.

We will aim to have a very simple implementation of our notification service  by the end of the month, to be able to demonstrate how our infrastructure allows you to build reactive and contextual applications.

Support for Zipkin  will be provided to monitor and troubleshoot service to service interactions.

### Milestone #3 - October 2017

- Application Context Service - initial version
  - Provide basic case management constructs
  - Publish/Deploy Runtime Bundle Service
- Distributed Model Repository Service (Design and Initial Implementation)

### Milestone #4 - November 2017

- New Decision Runtime Design and Initial Implementation
- Process Engine Clean-ups and refactoring
  - BPMN2 Extensions
  - History Service
  - Job Executor
  - Timers
  - Emails Service

As always, if you want to participate on the development process of some of these components get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.

We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementations.

[You can always find the more up to date Roadmap in our Github Wik](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap)i.

[Remember, we are 24/7 in our Gitter Channel, feel free to join us there.](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

Stay tuned!
