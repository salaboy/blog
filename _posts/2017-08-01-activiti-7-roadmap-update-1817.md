---
title: "Activiti 7: Roadmap Update (1/8/17)"
date: 2017-08-01 14:21:36 +0000
permalink: /2017/08/01/activiti-7-roadmap-update-1817/
description: "After finishing the first 4 weeks of work (week 1, week 2, week 3, week 4) we wanted to update the Roadmap that we publish almost a month ago with a new…"
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "Java"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "tutorial"
  - "workflow"
  - "bpmn"
  - "engine"
  - "microservices"
  - "process"
  - "services"
  - "spring"
original_url: https://www.salaboy.com/2017/08/01/activiti-7-roadmap-update-1817/
---

After finishing the first 4 weeks of work ([week 1](/2017/07/10/activiti-7-last-week-dev-logs-1/), [week 2](/2017/07/17/activity-7-last-week-dev-logs-2/), [week 3](/2017/07/24/activiti-7-last-week-dev-logs-3/), [week 4](/2017/07/31/activiti-7-last-week-dev-logs-4/)) we wanted to update the [Roadmap that we publish almost a month ago](/2017/07/05/activiti-7-kick-off-roadmap/) with a new Milestone for October. We wanted to share what we have learned so far and we wanted to announce a couple of new components that we are considering as part of our short term roadmap. We are very interested in demonstrating transparency in the development, planning and delivery process and we encourage all the Activiti users to get in touch to provide feedback about our future plans and to get involved.

## Milestone #0 - July 2017 - Ended

- Clean up Activiti
- Domain API + HAL API + Runtime Bundle
  - XML/JSON/SVG for process definitions
- Audit Service: Event Store for Audit Information
- Identity Management and SSO (KeyCloak implementation)
- First Release Process

We finished **Milestone #0** but there are some high level Epics that will remain open because there is a lot of work to do in those areas. We managed to go over our first release test, making sure that 90% of the tasks are automated, so we can release monthly snapshots without any delays. Notice that we have switched to use the **<7-201707-EA-SNAPSHOT>** version format and we will update that every month (EA stands for Early Access). You can start using these nightly builds by pointing to Alfresco’s Nexus Repository. As part of this first milestone we refactored heavily our Spring Boot Starter that can be now located in the master branch:

This Starter is now in charge of wiring up the engine and exposing the new HAL APIs and Command Based endpoints for clients to interact with. You will find now an activiti-services parent module containing all the new helpers and services. All our services are now Security-Enabled, currently delegating SSO and Identity Management. Our first version of the new Audit Service is under review here [[Initial audit JPA by erdemedeiros · Pull Request #1301 · Activiti/Activiti · GitHub]](https://github.com/Activiti/Activiti/pull/1301).

At this early stage we recognised the need of having a Notification Service that will be in charge of notifying interested parties about what is happening inside different instances of the process engine and other services. We are starting the discussions about how this component might be implemented to support message based interactions as well as WebSockets. There are a lot of clean ups to be done, some more long term such as the Job Executor and History Services, but we will tackle them down as we made some progress on the new services.

## Milestone #1 - August 2017

**Milestone #1** is all about providing alternative ways for a process engine to interact with the outside world. While we will keep improving the proposed APIs (Rest & Command Based endpoints) we will enable the process engine to emit integration events. The main purpose of this work is to avoid classpath extensions as much as possible. We’re passionate about avoiding classpath extensions going forward to better adhere to the single responsibility principle, increase stability of the process engine, decrease the security attack surface, enable the  engine runtime to be decoupled from system connectors, and even non-java libraries/services will be easier to integrate following a micro service approach. In order to deal with all these components we will need to have an Application registry so all the pieces can be discovered at Runtime. Tracing capabilities are a must at this stage. On the Query & Audit Service front we will provide reference implementations using Spring Data JPA to demonstrate how to consume and aggregate data from different process engine instances in a message based fashion.

These components will provide the specification for other implementations using NoSQL data stores. In summary, during August we will be focused on the following points:

- Domain API + HAL API + Runtime Bundle
  - Source/Producer of Integration Events
- Query Service: Event Store for Runtime Information
  - Security Enabled
  - JPA Reference Implementation
- Infrastructure Enablement Services
  - Gateway (Zuul)
  - Application Registry (Eureka)
  - Tracer (Zipkin)
- Cloud Documentation
  - Docker Images
  - Docker Compose for Development
- Validation Examples
  - AWS
  - CloudFoundry

## Milestone #2 - September 2017

- Distributed Notification Service (Design and Initial Implementation)
- Application Service - initial version
  - Provide basic case management constructs
  - Provide coordination between different process runtime bundles
  - Deal with versioning, upgrades and case management like behaviours

## Milestone #3 - October 2017

- Application Service - second iteration
- New Decision Runtime Design and Initial Implementation
- Distributed Model Repository Service (Design and Initial Implementation)

## Get in touch, Get Involved

As always, if you want to participate on the development process of some of these components get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementaitons. You can always find us in the Gitter channel: [[Activiti/Activiti7 - Gitter]](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
