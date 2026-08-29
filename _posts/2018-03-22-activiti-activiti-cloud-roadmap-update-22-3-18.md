---
title: "Activiti & Activiti Cloud Roadmap Update 22/3/18"
date: 2018-03-22 10:19:41 +0000
permalink: /2018/03/22/activiti-activiti-cloud-roadmap-update-22-3-18/
description: "Another Early Access Release (201802-EA) was pushed to Maven Central and our Docker Containers were tagged accordingly."
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "open source"
  - "process"
  - "rfc"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
  - "release"
  - "roadmap"
  - "update"
original_url: https://www.salaboy.com/2018/03/22/activiti-activiti-cloud-roadmap-update-22-3-18/
---

Another [Early Access Release (201802-EA)](/2018/03/21/activiti-activiti-cloud-7-201802-ea-are-out/) was pushed to Maven Central and our Docker Containers were tagged accordingly. You are encouraged to use these new Early Release artifacts to test inside your services, provide feedback and report issues.

We are now heavily relying on our Acceptance Tests suite to make sure that each of our released building blocks deployed in Kubernetes (and local docker-compose) are behaving correctly. We haven't released these acceptance tests, but it is in our roadmap to provide these tests as part of our artifacts that you can use to build your scenarios.

We are now switching to **Beta mode**, this means that we will work in refining the components that we have to make sure that they can be consumed to create real life implementations. There are a couple of RFCs coming, about Application Service and a new and cleaner Process Runtime Java API. We want to make sure that our **Beta1** release provides the basic set of functionality required to build scalable, microservices oriented applications.

Most of the refining work that needs to happen is around REST endpoints, Data types and consistency between different alternatives from our building blocks. This is still a great time to get involved with the project, we want to hear about your distributed architectures and what would you expect from components like the ones that are being provided by Activiti Cloud.

Check our current milestone for more details: <https://github.com/Activiti/Activiti/milestone/9>. We also created a new label for community contributors who want to get started with simple tasks called “community contributions”: <https://github.com/Activiti/Activiti/labels/community-contribution>

**Our focus remains the same, but now we will concentrate on consistency across our services:**

- Create RFCs for new Cloud Native components and services
  - New App Definition And Lifecycle Management Service RFC coming
  - New Java Process Runtime APIs RFC coming
- Provide a clear specification (APIs) about our Services (REST/Message Based/Configurations). Make sure that these APIs have well defined responsibilities, single focused and can evolve over time without causing consumers any headaches.
  - We iterate each component to make it simpler, faster and better
- Make sure that we use standard tools, patterns and development techniques widely adopted by other Open Source Projects/Communities. Spring, Spring Boot, Spring Cloud, Docker, Kubernetes falls into this category, and we are making sure that we provide the right integration with these frameworks/tools. Activiti Cloud is designed from the ground up to work with such technologies.
- Create Industry Specific BluePrints to demonstrate common scenarios and use cases that represent what different industries requirements.
- Engage and mentor partners and community members that wants to participate.
- Doing it in the Open Source way (Transparency & Meritocracy are a must).

### [Milestone #7](https://github.com/Activiti/Activiti/milestone/8) - February 2018 - Ended -

- Digital Business Platform API Alignment (new module introduced)
- Process Modelling Services next iteration
  - Process Modelling Validation Endpoint for BPMN models
- Process Definition based security alignment in Runtime Bundle and Query
- Kubernetes Service Registry, Kubernetes Discovery Client and ConfigMaps
- Large POM refactorings required to improve project maintenance and dependency management
- Activiti Scripts for speeding up the release process
- Cloud Native BPMN Signal and Message Behaviours (initial draft/still under develop)
- Web Socket for GraphQL subscriptions and integration with Gateway and Keycloak (still under develop)
- Hardened our Acceptance Tests for Runtime and Modeling Services
- Introduced a draft for our Performance Tests suite
- Introduced Angular/ADF Demo UI Draft

As you can see we did a lot around making sure that our development process can be improved over time. The more repositories and services that we have inside our projects the more difficult is to go through release them and to keep them as consistent as possible. We also spend a substantial amount of time interacting with the Spring Cloud community around Spring Cloud Kubernetes[1] and we participated in the London Microservices Meetup[2] to make sure that we validate our path to the Cloud :)

[1]: Spring Boot 2 and Sprint Cloud K8s: <https://github.com/spring-cloud-incubator/spring-cloud-kubernetes/commit/1e71319f9f7baa73a378f16da37ad1ee5d976754>

[2]: Videos and Slides:  </2018/03/19/activiti-cloud-introduction-at-mintelnews/>and </2018/03/12/activiti-london-uservices-meetup-7-3-18/>

### Beta1 - March/April 2018

- Process Definition based security alignment in Audit
- Cloud Native BPMN Signal and Message Behaviours
- New Process Runtime Java APIs
- Application Service (proposal and initial draft)
  - Definition
- Kubernetes Service Brokers/Catalogs review
- BluePrint improvements to use query & audit
- Keycloak upgrade  <https://github.com/keycloak/keycloak/pull/4976#issuecomment-375210355>

If you take a look at our Beta1 milestone you will find that most of the development is focused around consistency and making sure that our services provide the basic set of functionality to be used in a real life scenario. Even though we are focused on improving our existing components there are to main initiatives that will see the light on Beta1:

- **New Process Runtime Java APIs:** java level APIs oriented to Process Runtimes, following the use cases that we are supporting in Cloud Native deployments. We want to make sure that this interfaces are completely decoupled from the Activiti Engine implementation and that they define a clear evolution process. This also allows consumers (of the API) to have clear guidelines for updating to new versions when we release them. These APIs will demarcate a line between what is going to be actively maintained and what might get deprecated in the future.
- **Application Service:** having a set of building blocks is not enough if you want a consistent view of how your applications are working. The application service provides this high level glue to consume a set of microservices as a logical Application.

A small note about: Kubernetes Service Brokers/Catalogs which we consider an important piece on how we provision services to support our building blocks. We want to make sure that we review how the Kubernetes Service Catalog might affect our infrastructure and our services to make sure that we do not overlap with it.

We consider these two initiatives required to make a public Beta1 release and we will be working hard with community members that are interested in such initiatives.

### Beta2 - May 2018

- Application Service (second iteration)
- [Istio.io](http://istio.io/) Research and initial integration
- Refinements and consistency improvements
- JHipster Microservices Infrastructure Integration

### Final - June/July 2018

- BluePrint Trending Topics Campaigns User Interface and Dashboards
- Security & SSO review (review Apache Shiro Wildcard Permissions)
- Polyglot MicroProcessRuntime PoC Draft

After that **Party time!**

We have a huge list of other things that are coming after our first final release for the Activiti Cloud initiative, but it is important for us to first release the basic set of building block and then think about what will come next. We will appreciate if you send us your ideas, so they can be included in our future plans. For now our commitment to these time frames is important to make sure that our community cadence is appropriate for our users needs.

As always, if you want to participate on the development process of some of these components or examples get in touch. We are willing to collaborate with the open community and mentor people that want to learn about the project.

We look forward all community involvement, from comments, concerns, help with documentation, tests and component implementations. If you are looking into getting started with the Early Access Release we recommend to check our Getting Started Guide in Gitbook: [[Getting Started · Activiti 7 & Activiti Cloud Developers Guide]](https://activiti.gitbooks.io/activiti-7-developers-guide/content/setting-up-the-environment.html)

You can always find us in the Gitter channel: [[Activiti/Activiti7 – Gitter]](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

Because we are a world wide community you can always find someone online to chat with, no matter your timezone 🙂
