---
title: "Activiti & Activiti Cloud 7-201711-EA are out!"
date: 2017-12-04 12:20:55 +0000
permalink: /2017/12/04/activiti-activiti-cloud-7-201711-ea-are-out/
description: "I’m happy to announce that Activiti & Activiti Cloud 7-EA201711 artifacts are out and we encourage people in the community to try them out."
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
  - "release"
  - "update"
original_url: https://www.salaboy.com/2017/12/04/activiti-activiti-cloud-7-201711-ea-are-out/
---

I’m happy to announce that ***Activiti & Activiti Cloud 7-EA201711*** artifacts are out and we encourage people in the community to try them out.

This release was focused on expanding our base building blocks to make sure that they can perform in distributed environments (Docker & Kubernetes). We added monitoring & tracing capabilities to the platform to make sure that we have visibility when things go wrong.

As part of this release we aligned our artifacts with [[Spring Boot 2.0.0.M6](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.0.0-M6-Release-Notes)] and [[Spring Cloud Finchley.M4]](https://github.com/spring-projects/spring-cloud/wiki/Spring-Cloud-Finchley-Release-Notes).

The following frameworks are now built in in our services:

- **activiti-cloud-services-tracing**: which currently includes integration with Sleuth and Zipkin
- **activiti-cloud-services-monitoring**: which delegate to the Spring Actuator the Job to expose metrics for health checks, readyness and liveness probes.

You can find an example of tracing included in our deployment descriptors for Docker Compose & Kubernetes in our [Activiti Cloud Examples Repository](L)

We have also introduced the first iteration of our [[Runtime Bundle Security Policies. As described in our RFC document]](https://docs.google.com/document/d/1nug2pt60Mfcf1mvhzWIdTeXK-s8KgUV3OUBCUKfwpAI/edit?usp=sharing)

The second iteration of Activiti Cloud Connectors was released as well, introducing bidirectional channels by default, which allows our connectors to talk back to Process Runtimes as well as receive IntegrationRequestEvents and send back IntegrationResultsEvents. You can find the source code here: [[activiti-cloud-starter-connector]](https://github.com/activiti/activiti-cloud-connectors)

You can find our published artifacts in [[Maven Central]](http://search.maven.org/#search%7Cga%7C1%7Cactiviti-cloud)and our Docker Images have been tagged so you can use the 7-EA201711 tag for each of our images. You can find more details on [[Activiti in Docker Hub]](https://hub.docker.com/u/activiti/)

[[We updated our Roadmap and included new Milestones]](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap)

For December Milestone we want to include 2 new services (building blocks) to deal with Authoring aspects of the platform. For that reason we have two RFCs documents:

- [[RFC: Groups & Projects Service]](https://docs.google.com/document/d/1MJ37J0UYkJGQfFOEssUOLgmNGTu1ts7_WHTsTALobhI/edit?usp=sharing)
- [[RFC: Process Model Service]](https://docs.google.com/a/alfresco.com/document/d/1lFjusnLjQkK13Z43L1CLa33tnsUQd1mI6xgBYrldkQs/edit?usp=sharing)

We also have an RFC document for our Notifications Service which we plan to have a PoC by the end of the month:

- [[RFC: Notification Service using GraphQL Subscriptions]](https://docs.google.com/document/d/1CVquU7Sh7oMS-v4FHZZMff-DNCF8cv8T7tpjlyTcgVU/edit)

Ping us in Gitter if you want to contribute, give feedack, or if you need help reporting an issue: https://gitter.im/Activiti/Activiti7
