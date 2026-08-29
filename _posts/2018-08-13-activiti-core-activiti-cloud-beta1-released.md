---
title: "Activiti Core & Activiti Cloud Beta1 released!"
date: 2018-08-13 08:01:10 +0000
permalink: /2018/08/13/activiti-core-activiti-cloud-beta1-released/
description: "I am happy to announce that after more than a year of hard work and particularly intense work over the last 4 months we are ready to release the first…"
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/08/13/activiti-core-activiti-cloud-beta1-released/
---

I am happy to announce that after more than a year of hard work and particularly intense work over the last 4 months we are ready to release the first Beta version of all the Java Artifacts. You can consume them all from [Maven Central](https://search.maven.org/search?q=g:org.activiti.cloud).

During this release, we focused on providing the first iteration of Activiti Cloud and from now on we will harden each service in an incremental way. We are happy with the foundation and now it is time to test and polish the next generation of Activiti. We are eager to get early feedback, please get in touch via [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) if you find any problem or have questions about the released artifacts.

## What is included in Activiti Core and Activiti Cloud Beta1

Beta1 is focused on providing the foundation for both our Java (embedded) and Cloud Native implementations.

This release is divided into two big categories: Activiti Core and Activiti Cloud Building Blocks.

### Activiti Core

On the Core, we have provided a new set of APIs for the Task and Process Runtime that enable a simple migration from embedded to the Cloud Approach. We believe that this is a fundamental change in order to provide long-term API support focused on Runtimes and following the [Command Pattern](https://en.wikipedia.org/wiki/Command_pattern). We also added security, identity and security policy abstractions to make sure that you can quickly integrate with different implementations when you embed the process & task runtime into your Spring Boot applications.

Activiti Core is now based on top of [Spring Boot 2](https://spring.io/projects/spring-boot). On the Core, you should expect further integrations with [Spring Boot 2](https://spring.io/projects/spring-boot). There are plans to adopt all the reactive capabilities included in [Spring 5](https://spring.io). A big part of refactoring the Core layer was about simplifying the runtimes to make sure that they don’t clash with other frameworks’ responsibilities.

The new set of Runtime APIs was conceived to promote Services that are Stateless and immutable, which allow us to write testing, verification and conformance tools to guarantee that your business processes are safe and sound to run in production environments. These Runtime APIs include new responsibilities and don’t deprecate the Activiti 6.x APIs. These new Runtime APIs are replicated at the service level (REST and Message Driven Endpoints) in the Activiti Cloud Layers.

If you want to get started with using *Activiti Core 7.0.0.Beta1* take a look at the following tutorials which highlight the ***ProcessRuntime*** and **TaskRuntime** API usage in Spring Boot 2 applications.

**[Getting Started with Activiti Core Beta1](/2018/08/13/getting-started-with-activiti-core-7-0-0-beta1)**

### Activiti Cloud Building Blocks

On the Activiti Cloud front, we are providing the initial Beta1 versions of our foundational building blocks:

- Activiti Cloud Runtime Bundle
- Activiti Cloud Query
- Activiti Cloud Audit
- Activiti Cloud Connectors

These building blocks were designed with a Cloud Native Architecture in mind and all of them are built on top of [Spring Cloud Finchley](http://projects.spring.io/spring-cloud/).  Together, these components form the foundation for a new bread of Activiti Cloud Applications which can be distributed and scaled independently.  All these building blocks can be used as independent Spring Boot applications, but for large-scale deployments, these components have been designed and tested using Docker Containers and Kubernetes as the main target platform. We have been using [Jenkins X](https://github.com/jenkins-x) to build components that need to be managed, upgraded and monitored in very dynamic environments.

All these building blocks understand the environment in which they are running, so they are enabled to work with components such SSO/IDM, Service Registry, Data Streams, Configuration Server, and Gateways. By being aware of the environment, our applications can be managed,configured and scaled independently.

It is important to understand that we have also included some experimental services in this release including:

- Application Service
- Modelling backend services
- GraphQL support for the Query Service / Notification Service
- An alternative Mongo DB implementation for Audit Service

If you want to start with the Cloud Native approach we recommend looking at the Activiti Cloud HELM charts for Kubernetes: <https://github.com/Activiti/activiti-cloud-charts/tree/master/activiti-cloud-full-example>

These example HELM Charts can be used to get all the services up and running.

Check the following blog post if you want to get started with Activiti Cloud in GKE.

**[Getting Started with Activiti Cloud Beta1](/2018/08/13/getting-started-with-activiti-cloud-beta1)**

## What is coming next?

In this release, we didn’t include any UI bits, and we focused on core services to build Cloud Native applications. In the following Beta2 and RC releases we will include new backend services to support the new Activiti BPMN2 Modeler application. This new set of modeling services and the new Activiti Modeler application is currently being designed to enable our Cloud Deployments by providing a simplified packaging mechanism for our Activiti Cloud Applications.

On future releases we will be hardening our building blocks, improving documentation and examples and adding new services to simplify implementations.  We are actively looking at tools such as [Istio](https://istio.io) and [KNative](https://cloud.google.com/knative/) to provide out of the box integration with other services and tools that rely on such technologies.

We are also contributing and collaborating with the Spring Cloud community to make sure that our components are easy to use and adopt rather than clash with any of the other Spring Cloud infrastructure components. This also involves testing our core building blocks in [Pivotal Containers Services (PKS)](https://pivotal.io/platform/pivotal-container-service) which is based on Kubernetes.

We want to provide a continuous stream of community innovation and for that reason, we will change how the Core and Cloud artefacts are versioned and their release lifecycles. We are moving to a Continuous Delivery approach for each of the libraries that we build following the practices mentioned in the [Accelerate book](https://jenkins.io/blog/2018/07/19/jenkins-x-accelerate/). We will, of course, update the structure of our projects but the services and APIs will remain the same.

You should expect some naming changes between Beta and RC artifacts. We are still polishing new service names and configurations. This will be all documented in the release notes for each release. You can always keep an eye on our public [Roadmap document (that will be updated in the following days)](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap) for the future Beta, RC and GA releases.

As always, this is a great moment to join the community and provide feedback. If you are looking into building Cloud Native applications, we are more than happy to share and get feedback from people going through the same journey. Feel free to join our daily open standups or ping us in our [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) channel.
