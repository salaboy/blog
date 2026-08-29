---
title: "Activiti & Activiti Cloud (7-201802-EA) are out!"
date: 2018-03-21 10:59:59 +0000
permalink: /2018/03/21/activiti-activiti-cloud-7-201802-ea-are-out/
description: "I’m happy to announce that Activiti & Activiti Cloud 7-201802-EA artifacts are out. We encourage our community members to try them out and provide…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "event"
  - "Java"
  - "kubernetes"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "cloud native"
  - "docker"
  - "microservices"
  - "open source"
  - "release"
original_url: https://www.salaboy.com/2018/03/21/activiti-activiti-cloud-7-201802-ea-are-out/
---

I’m happy to announce that ***Activiti & Activiti Cloud 7-201802-EA*** artifacts are out. We encourage our community members to try them out and provide feedback.

This release was focused on refining our services endpoints and how we deal with dependencies across all our repositories. You can take a look at the issues that were closed during this period [here](https://github.com/Activiti/Activiti/milestone/8?closed=1&page=1).

As usual, refactoring POM files and how we deal with dependencies is painful, but after our third iteration, projects are maturing in the right direction. Now most of our projects are aligned following the same practices as Spring Boot and Spring Cloud projects and our [activiti-scripts](https://github.com/activiti/activiti-scripts) repository is being populated with the tools that will make our life easier.

As part of this release we aligned our artifacts with [Spring Boot 2.0.0.RELEASE](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.0-Release-Notes) and [Spring Cloud Finchley.M8](https://github.com/spring-projects/spring-cloud/wiki/Spring-Cloud-Finchley-Release-Notes). We included [Synk](https://snyk.io/test/github/Activiti/Activiti) and [Meterian](https://www.meterian.com/projects.html?pid=e581f404-dfa2-49ff-ab45-458eed3f748e) vulnerabilities check in our repositories and we improved our maven enforcer plugin usage across all the repositories that are released.

There were three main initiatives covered in this release:

- **Activiti Cloud Query Process Definition Restricted Views:** the activiti cloud query module should be able to recieve configuration for different users and groups to see data that is related to them. This configuration can be provided as properties values, which can be then centralized in a configuration service. The mechanism used in our Query Services matches the one used in our Runtime Bundles for easy configuration and management.
- **Services Alignment with the Alfresco DBP initiative:** we wanted to make sure that we follow the Alfresco REST API guidelines for our REST endpoints at the same time that we provide HAL Enabled REST Resources. We achieved this by introducing a new module: [activiti-cloud-services-dbp-rest](https://github.com/Activiti/activiti-cloud-service-common/tree/develop/activiti-cloud-services-dbp-rest)
- **Acceptance Tests Suite to validate our environments:** we have improved our acceptance tests to cover a very basic scenario that interact with all the services going through the gateway component. It also validates that authentication happens against Keycloak (SSO and IDM). Acceptance Tests hasn't been released just yet, but they will be included in our Bete release. You can find the source code which include tests for our Runtime Building Blocks and our Modeling Backend Services [here](https://github.com/Activiti/activiti-cloud-acceptance-tests).

As part of all this work we have cleaned up our [activiti-cloud-examples](https://github.com/Activiti/activiti-cloud-examples/tree/develop) repository to only contain deployment scripts for Docker & Kubernetes. We have moved out our blueprint **Trending Topic Campaigns** to a separate repository: [blueprint-trending-topic-campaigns](https://github.com/Activiti/blueprint-trending-topic-campaigns). This BluePrint project can be deployed using Spring Boot, Docker Compose and Kubernetes deployment Descriptors and Helm Charts. We encourage our users to check this BluePrint project to understand more about new features and to help us to polish some rough edges.

We introduced also a new repository that contains a simple Angular/ADF NPM application which consumes the new set of APIs. We are calling this initiative Demo UI and it is the perfect place for community users to get involved: [activiti-cloud-demo-ui](https://github.com/Activiti/activiti-cloud-demo-ui)

You might also find useful a couple of presentations that were done while we were working in this release:

- Lessons Learned Cloud Native Apps @ London uServices Meetup: [/2018/03/12/activiti-london-uservices-meetup-7-3-18/](/2018/03/12/activiti-london-uservices-meetup-7-3-18/https://salaboy.com/2018/03/12/activiti-london-uservices-meetup-7-3-18/)
- Activiti Cloud Overview @Mintelnews: [/2018/03/19/activiti-cloud-introduction-at-mintelnews/](/2018/03/19/activiti-cloud-introduction-at-mintelnews/https://salaboy.com/2018/03/19/activiti-cloud-introduction-at-mintelnews/)

You can find our published artifacts in [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cactiviti-cloud)and our Docker Images have been tagged so you can use the **7-201802-EA** tag for each of our images. You can find more details on [Activiti in Docker Hub](https://hub.docker.com/u/activiti/)

## Next Steps

Because we spent extra time on the 201802 Early Access release, we will concentrate into getting the first Beta1 out by the **end of April**. We would like to include the following main points, which will be reflected in our updated [Roadmap wiki page](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap):

- New Java Process Runtime APIs
- Cloud Native Async BPMN Signal/Messages
- Application Service
- Several refinements at service level
  - Unified REST resources, paths and operations
  - Unified Messaging/REST content bodies, error handling
  - Mongo/JPA Audit implementation refinements and alignment with restriction policies.

Most of these topics will come with an RFC blog post, we encourage community people to review those Request For Comments articles and get in touch if you want to get involved in the conversations.

**Coming soon (probably tomorrow) a new update to our Roadmap Wiki.**

Ping us in Gitter if you want to contribute, give feedack, or if you need help reporting an issue: <https://gitter.im/Activiti/Activiti7>
