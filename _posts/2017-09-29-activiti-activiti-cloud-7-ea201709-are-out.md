---
title: "Activiti & Activiti Cloud 7-201709-EA are out!"
date: 2017-09-29 08:54:04 +0000
permalink: /2017/09/29/activiti-activiti-cloud-7-ea201709-are-out/
description: "I'm proud to announce that we are now officially in Maven Central and Docker Hub. Our first Early Access release 7-201709-EA is out for the community to…"
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "cloud native"
  - "docker"
  - "helm"
  - "release"
original_url: https://www.salaboy.com/2017/09/29/activiti-activiti-cloud-7-ea201709-are-out/
---

I'm proud to announce that we are now officially in [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cactiviti-cloud) and [Docker Hub](https://hub.docker.com/u/activiti/). Our first Early Access release [7-201709-EA](http://search.maven.org/#artifactdetails%7Corg.activiti.cloud%7Cactiviti-cloud-dependencies%7C7-201709-EA%7Cpom) is out for the community to start experimenting. But what does this mean? Why Early Access? When is the next one coming? This blog post tries to clarify what is included in this Early Access release and when is the next release coming.

### Plan, Build and Release Fast

In order to provide short iteration cycles we are planning to publish one of these Early Release every month (we will aim to the last Thursday of each month). In a componentized world, each of the modules will evolve separately and we want to make sure that we build, test and release each of these modules every month. We are making a lot of changes to the Activiti project structure and we introduced Activiti Cloud, for this reason we want to make sure that **early adopters looking for cloud native components** can get what they are looking for.

Our release plan is directed by our Roadmap planning, what you can find here: [Activiti Roadmap](https://github.com/Activiti/Activiti/wiki/Activiti-7-Roadmap). A new update on this roadmap is coming next Monday (October Update).

We will continue to improve our release process and also our projects structures to be aligned with the architectural decisions that we are making to enable Activiti to run natively on cloud providers.

## What's included in 7-EA201709?

This release included our first iteration to improve how we handle project dependencies to make our frameworks, services and starters easy to consume. This will also allows us to improve our modularity without affecting people implementations.

The following two BOM (Bill Of Materials *-dependencies) artefacts were included in this release:

- **org.activiti:activiti-dependencies:7-EA201709**
- **org.activiti.cloud:activiti-cloud-dependencies:7-EA201709**

This allows you to include &lt;dependencyManagement&gt; tags in your projects to allow these artefacts manage the correct version for both activiti and activiti-cloud artefacts.

```xml
<dependencyManagement>
   <dependencies>
     <dependency>
       <groupId>org.activiti</groupId>
       <artifactId>activiti-dependencies</artifactId>
       <version>${version.activiti}</version>
       <type>pom</type>
       <scope>import</scope>
     </dependency>
   </dependencies>
</dependencyManagement>
```

This release also included our new set of services that provides the core set of functionality for our Cloud Starters. These services now include:

- Audit Service
- Query Service
- Events enabled endpoints and Event Emmitters
- Runtime Bundle Services (Stateless & Inmutable Process Engine)
- Identity Services and integrations

### Cloud Starters

If you are used to work with Spring Boot our Cloud Starters provides a quick way to bootstrap different components in a straight forward way. All these starters are powered with Spring Cloud integration to make sure that they can be configured to leverage the ecosystem that surround them. For example, if there is a Service Registry, these services will be automatically registered to it. If there is an API gateway, these services will be automatically exposed and routes will be created to access them via the Gateway.

You can find our Cloud Starters here: <https://github.com/Activiti/activiti-cloud-starters>

Our Cloud Starters are powered by Spring Boot and the following Spring Cloud projects:

- Spring Cloud Streams
- Spring Cloud Registry
- Spring Cloud Gateway
- Spring Cloud Config (work in progress)
- Spring Cloud Service Connectors (work in progress)
- Spring Cloud Contracts (work in progress)
- Spring Cloud Kubernetes (work in progress)

### Docker Images

Using the starters we have created a set of Docker Images that you can quickly bootstrap the whole infrastructure for you. You can use Docker Compose or Kubernetes to run all these services. Helm Charts are in the process for Kubernetes and we, as developers and as the team in charge of the project, have chosen to use MiniKube for our everyday development environment.

![Screen Shot 2017-09-29 at 09.12.52](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/09/screen-shot-2017-09-29-at-09-12-52.png)

All our Docker images can be configured using Environment Variables to allow different environments, set ups and flexibility on the deployment phase.

### Git Book

We are constantly working in our new Git Book to explain how all these projects and components work together. We understand that Cloud Environments are much more complicated than using a Java Framework and the amount of technology that we will be using in the future might sounds overwhelming. For that reason, our Git Book tries to tackle the frequently asked questions about our architectural decisions and technology choices. This Git Book is going to be a common place for several pieces of documentation related with all our frameworks, services, cloud starters and how all these pieces fits together.

You can access our Git Book here: <https://www.gitbook.com/book/activiti/activiti-7-developers-guide/details>

### Examples & Cloud Examples

We are actively working in examples for our projects that you can find here:

- Activiti Examples: [https://github.com/activiti/activiti-examples](https://github.com/activiti/activiti-exampleshttps://github.com/activiti/activiti-examples)
- Activiti Cloud Examples: <https://github.com/activiti/activiti-cloud-examples>

We will welcome community feedback and help to improve these examples, which are probably the best way to get involved to the project and learn about the new features.

### Next Steps

There will be some more repository refactoring during the next month to make sure that each project is independent from each other and we can evolve it separately. We are waiting to review and merge some pull requests before moving these projects to separate repositories. These refactorings will not affect your projects if you start using the BOMs introduced earlier.

New Cloud Starters will be created and new Docker Images will be published related to:

- Notification Service
- Application Service
- Repository Service

Stay tuned!

Questions, Feedback, Comments?? Find us in Gitter: <https://gitter.im/Activiti/Activiti7>
