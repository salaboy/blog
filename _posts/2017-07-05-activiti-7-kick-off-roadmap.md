---
title: "Activiti 7 Kick Off Roadmap"
date: 2017-07-05 07:39:58 +0000
permalink: /2017/07/05/activiti-7-kick-off-roadmap/
description: "UPDATE 4/9/17: https://salaboy.com/2017/09/04/activity-7-roadmap-update-10917/ UPDATE 1/8/17…"
tags:
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "microservices"
  - "open source"
  - "roadmap"
original_url: https://www.salaboy.com/2017/07/05/activiti-7-kick-off-roadmap/
---

**UPDATE 4/9/17:**

**</2017/09/04/activity-7-roadmap-update-10917/>**

**UPDATE 1/8/17: [https://salaboy.com/2017/08/01/activiti-7-roadmap-update-1817/](/2017/08/01/activiti-7-roadmap-update-1817/)**

If you were looking at the [Activiti/Activiti](https://github.com/activiti/activiti) repository, you might have noticed that we are restructuring the project. Activiti is taking a new direction towards Microservices architectures and we are planning to make big design upgrades.

This new direction will give users the flexibility to open up the architecture, replace components as needed and to scale the engine and your applications independently. In combination with containerization (Docker), Microservice architectures with event-driven endpoints provide a cloud native approach to deploy and interact with the engine in a distributed fashion.

However, we are well aware that users are currently embedding Activiti 5.x and 6.x in their applications. As we move toward the final release of the next major version of Activiti, we will provide a set of compatibility and migration tools. Embedding of the Activiti engine will continue to be an important feature for the project. You won’t need to re-architect your application to use this version of Activiti. However, new Microservice architectures implementations will be able to take advantage of this new approach.

We understand that not everyone is using microservices yet but for those that are (and those that are going to) we need to make a real upgrade of the technology behind the engine and how the internal components integrates with each other. The Activiti Process Engine was designed several years ago, this means that there are some components, extension points and mechanisms that have a high impedance with modern architectures and environments.

We recognise that most Open Source process engines out there claim that they are following Microservices practices, but we haven’t seen the major refactoring in how the process engine works or how it integrates with cloud providers and other Microservices that would be required to be a truly Microservice architecture. Most of these other projects treat other Microservices as REST endpoints that you can interact with. By doing so, you neglect the infrastructure that you are using and we want to leverage that. We also recognise the need for playing nicely with Containers and other technology stacks. For that reason we need to upgrade how the engine and other services deal with versioning and immutability. With Microservice architectures, if you want to integrate nicely in fast evolving environments you need to make sure that other technology stacks integrate well with your APIs and data types. For that reason, we are designing our new APIs to provide consistent data types and HAL (Hypertext Applications Language) APIs to help you to build modern applications with cutting edge technologies.

We have created a short term roadmap for this initial refactoring, which will provide the stepping stones for more advanced services that will come towards the end of the year such as:

- Distributed Process Execution and Coordination
- Contextual Event Driven Case Management
- Decision Management and Inference Service
- Blockchain integrated Audit Logs
- Polyglot Process & Decision Runtime targeting IoT and mobile platforms

In the short term we want to focus into the process engine APIs and data types as well as our deployment model using containers and orchestrators such as Docker and Kubernetes.

**Key points that we are going to cover in the short term:**

- Code Quality, Coding Standards, Code Maturity and Code Modularity
- Infrastructural changes and tools that we are going to use to maintain the project healthy
- New Rest HAL APIs, new Messaging endpoints with JSON payloads, new Event Listeners with JSON payloads
- We will decouple all the components that are not part of the core process engine into new repositories and well focused services
- We will provide alignment with the Spring Community (Spring Boot 2 / Spring Cloud), targeting AWS + Kubernetes + Docker as our main deployment strategy
- We will reuse as much of Spring Cloud as possible to make sure that the Process Engine doesn’t overlaps with services provided by the infrastructure

By covering all these key points we plan to provide a set of services that you will be able to use as building blocks for your implementations, making sure that the process engine is only responsible for automating your business processes, and the impedance mismatch with your infrastructure is minimal. The following is the proposed roadmap for the next three months. We aim to test our release process by the end of July 2017, so the first one might be delayed a little bit.

### **Milestone #0 - 31 July 2017**

- **Clean up Activity**
  - Repository cleanup & restructuring
  - Dependency upgrades/Alignment with Spring 5 & Spring Boot 2
  - Infrastructure 
    - GIT / Travis / Bamboo / Maven Central
    - Daily Snapshots
  - Test Coverage review
  - Testing frameworks review
  - Logging Frameworks review
- **Domain API + HAL API + Runtime Bundle** 
  - Process Definitions
  - Process Runtime
  - Task Runtime
  - Source/Producer of Audit Events

- **Event Store for Audit Information** - Initial Implementation
  - We should be able to query for all the events generated by multiple process engines
- **Identity Management and SSO** ([KeyCloak](http://www.keycloak.org) research in progress) - initial integration
- **First Release Process**

### Milestone #1 - 28th August 2017

- **Domain API + HAL API + Runtime Bundle**
  - Source/Producer of Integration Events
  - (Source/Producer of Async Job Executions)
- **Event Store for Runtime Information** - initial implementation
- **Gateway** ([Zuul](https://github.com/Netflix/zuul) research in progress) - Initial configuration and infrastructure
- **Application & Service Registry** ([Eureka](https://github.com/Netflix/eureka) research in progress) - Initial configuration and infrastructure
- **Tracer** ([Zipkin](http://zipkin.io) research in progress) - Initial configuration and infrastructure
- **[AWS](https://aws.amazon.com/free/?sc_channel=PS&sc_campaign=acquisition_UK&sc_publisher=google&sc_medium=cloud_computing_hv_b&sc_content=aws_core_e&sc_detail=aws&sc_category=cloud_computing&sc_segment=188877744888&sc_matchtype=e&sc_country=UK&s_kwcid=AL!4422!3!188877744888!e!!g!!aws&ef_id=WVyXFgAABAwlGyVs:20170705073654:s) example demonstrating all these services in action**

### Milestone #2 - 29th September 2017

- **Event Store for Runtime Information** - initial version
  - Decoupled query module based on events sourcing and rolling snapshots
  - We should be able to query the current state of processes and tasks without talking with the engine
- **Application Service** / **Case Management Features** - initial version
  - Provide basic case management constructs
  - Provide coordination between different process runtime bundles
  - Deal with versioning, upgrades and case management like behaviours

We encourage to all users to start trying our milestones as soon as possible so you can get a gist about how these services are going to fit in your implementations.

We are looking forward for comments, questions, concerns and collaborations. We will be working in a truly open source way, meaning that we want you to participate in the development of this and future roadmaps. We are looking for contributors from all levels, so if you feel attached to one of these topics, you want to learn new things or to participate in the conversation please get in touch.

We are using a Gitter channel here to discuss the roadmap, plan and collaborate everyday, feel free to join:

<https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link>

We also have set up the following public services that you might find of interest:

Travis CI for continuous integration: <https://travis-ci.org/Activiti/Activiti/branches>

Codecov for code coverage reports: <https://codecov.io/gh/Activiti/Activiti/branch/master>

Codacy for code style, security, duplication, complexity and coverage:

<https://www.codacy.com/app/Activiti/Activiti/dashboard>

These services will keep track of our code quality progress and release cycle.

There will be more announcements and blog posts about the topics mentioned here. We will be sharing progress and engaging community members regularly, stay tuned!
