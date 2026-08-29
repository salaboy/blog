---
title: "Activiti 7 Roadmap Update (3/10/17)"
date: 2017-10-02 13:57:50 +0000
permalink: /2017/10/02/activiti-7-roadmap-update-31017/
description: "Third month in and we are making huge progress. We have an initial set of services designed with a distributed approach in mind."
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "kubernetes"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "docker"
  - "helm"
  - "Java"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2017/10/02/activiti-7-roadmap-update-31017/
---

Third month in and we are making huge progress. We have an initial set of services designed with a distributed approach in mind. Powered by Spring Cloud our services will run natively in Kubernetes + Docker making sure that there is no impedance mismatch between the infrastructure and the way that the services are designed and consumed. After releasing to Maven Central and tagging our initial release in Docker Hub you can start consuming our out of the box artefacts or build your own by using our Activiti Cloud Starters.

You can always find the most up to date roadmap here: <https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap>

#### Milestone #0 - July 2017 - Ended

- Clean up Activiti
- Domain API + HAL API + Runtime Bundle
- XML/JSON/SVG for process definitions
- Audit Service: Event Store for Audit Information
- Identity Management and SSO (KeyCloak implementation)
- First Release Process

#### Milestone #1 - August 2017 - Ended

- Domain API + HAL API + Runtime Bundle
- Improvements, refinements and additions
- Query Service: Event Store for Runtime Information
  - Security Enabled
  - JPA - Reference Implementation
- Infrastructure Enabled Services
  - Gateway (Zuul)
  - Application Registry (Eureka)
  - SSO & IDM* (Keycloak default implementation)
- All Services are Docker Enabled
- All Services can be deployed into Kubernetes
- Cloud Examples

#### Milestone #2 - September 2017 - Ended

- Domain API + HAL API + Runtime Bundle
- Audit Service Mongo DB alternative
- GraphQL review in progress
- Release to Maven Central
- Infrastructure Enabled Services
  - Helm Charts
  - Cloud Documentation
- Cloud Examples Improvements
  - Validation Examples
  - AWS
  - Kubernetes / Minikube
  - Docker Compose

#### Milestone #3 - October 2017 - In Progress

October will be all about making sure that our services endpoints provides all the functionality required to create complex applications. Cloud Connectors will help to make sure that System to System integrations are handled in an asynchronous way and minimal changes (extensions) are required to run business process model. We are working in mechanisms to make sure that we reduce our Runtime Bundle classpath extension points in order to simplify upgrades and maintenance tasks.

We started planning our Repository Service that will be used to host different types of models such as Process Definitions, Forms, Data Models, Decision Models, Stencils/Extensions, etc.

In parallel with the Repository Service, we will have a new Form Service in charge of providing all the pieces and glue to render forms using ADF components.

- Refactor Activiti Cloud Services
- Process Def & Instance Security model
- Activiti Cloud Connectors
  - Process Engine refactoring to avoid JavaDelegates and classpath extensions
  - Kubernetes Service ready
- Model Repository Service (Design and Initial Implementation)
- Form Service (Initial discussions and planning)

#### Milestone #4 - November 2017

- Polyglot Connectors Examples
- Application Context Service - (Design and Initial Implementation)
  - Publish/Deploy Runtime Bundle Service
- Process Engine Clean ups and refactoring
  - BPMN2 Extensions
  - History Service
  - Job Executor
  - Timers
  - Emails Service

#### Milestone #5 - December 2017

- Deployment Service & Pipeline (design and initial implementation)
- New Decision Runtime Design and Initial Implementation
- Polyglot MicroProcessRuntime PoC

As always, if you want to participate on the development process of some of these components get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.

We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementations.

[You can always find the more up to date Roadmap in our Github Wik](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap)i.

[Remember, we are 24/7 in our Gitter Channel, feel free to join us there.](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

Stay tuned!
