---
title: "Activiti & Activiti Cloud Repositories Update"
date: 2017-10-18 15:15:42 +0000
permalink: /2017/10/18/activiti-activiti-cloud-repositories-update/
description: "Over the last weekend we refactored out our repositories structure to make sure that we can evolve each of the services and cloud starters separately."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "community"
  - "open source"
  - "update"
original_url: https://www.salaboy.com/2017/10/18/activiti-activiti-cloud-repositories-update/
---

Over the last weekend we refactored out our repositories structure to make sure that we can evolve each of the services and cloud starters separately. This was a natural step forward to make sure that our projects are aligned with the frameworks that they are depending on.

We have moved out the activiti-services that were originally created inside activiti/activiti repository to make sure that repositories for services are independent from each other. Activiti Cloud Services are the lowest level link between Activiti and Spring Cloud and for that reason now all the ***org.activiti.*services** (Java) packages has been renamed to ***org.activiti.cloud.services***. The same refactoring applies for maven artifacts which involved services which are now under the ***org.activiti.cloud*** GroupId.

The following diagram shows our current repository structure that might expand into the future, but the basic structure is going to probably remain unchanged.

![new-repositories](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/10/new-repositories.png)

## Main (Maven) Artifacts

In the previous diagram there are 4 dashed boxes which contain several repositories each **Activiti**, **Activiti Cloud**, **Activiti Cloud Reference** and **Activiti Cloud Examples**. The first layer is **Activiti** which includes the Build projects, Process Engine Runtime and examples. At this level we just depend on Java JDK 8. Inside the Activiti repository we have [**activiti-spring**](https://github.com/Activiti/Activiti/tree/develop/activiti-spring) which serves as the basic integration against Spring 5 [(version which is defined inside the Build parent project)](https://github.com/Activiti/activiti-build/blob/develop/pom.xml#L27). Activiti relies on [activiti-parent for 3rd party libraries dependency management](https://github.com/Activiti/activiti-build/blob/develop/pom.xml#L148). We are making sure that we deal with 3rd party dependencies and their versions in our parent poms, so it is completely forbidden to add version definitions in submodules.

Inside the Activiti Build repository we are also providing the BOM [(Bill of Materials - activiti-dependencies)](https://github.com/Activiti/activiti-build/blob/develop/activiti-dependencies/pom.xml) that you can import into your projects for maven to handle all the dependencies version for you.  This will enable us to refactor Activiti’s internal modules without affecting applications depending on specific modules, so we recommend to use these activiti-dependencies whenever possible.

```xml
<dependencyManagement>
 <dependencies>
   <dependency>
     <groupId>org.activiti</groupId>
     <artifactId>activiti-dependencies</artifactId>
     <version>${activiti.version}</version>
     <type>pom</type>
     <scope>import</scope>
   </dependency>
 </dependencies>
</dependencyManagement>
```

Moving down in the hierarchy we find Activiti Cloud which represent our Spring Cloud enabled services. These services were designed to run in a Cloud Native way and for that reason they will use abstraction layers provided by Spring Cloud. All the services are independent from each other and we will try to keep base dependencies as decoupled as possible, but they do share the same parent which specifies the spring boot and spring cloud versions that they all use.

We also have our BOM for Activiti Cloud that you can include in your projects to deal with dependencies of several starters and services in a centralised way:

```xml
<dependencymanagement>
<dependencies>
<dependency>
<groupid>org.activiti.cloud</groupid>
<artifactid>activiti-cloud-dependencies</artifactid>
<version>${activiti.cloud.version}</version>
<type>pom</type>
<scope>import</scope>
</dependency>
</dependencies>
</dependencymanagement>
```

There are also some cross-cutting concerns that also need to be added to each of our individual services such as security and utilities for testing. For that reason we have created a repository called [activiti-cloud-service-common](https://github.com/Activiti/activiti-cloud-service-common), which contains these shared cross-cutting features that are likely to be adopted by most of our services.

If you take a look at the following repositories (this list is likely to grow quite a lot):

- [Activiti Cloud Runtime Bundle Service](https://github.com/Activiti/activiti-cloud-runtime-bundle-service)
- [Activiti Cloud Audit Service](https://github.com/Activiti/activiti-cloud-audit-service)
- [Activiti Cloud Query Service](https://github.com/Activiti/activiti-cloud-query-service)

You will find that in all of them we include two types of projects:

- Base (Core) Services
- Spring Starters

The base core services provides the business logic for each of these modules and Spring Starters allows you to add a simple dependency to your spring boot application to enable the functionality provided by the base core services to your spring boot app. We usually also provide some autoconfigurations and annotations to make sure that our base core services are easy to bootstrap.

We recommend our community members to build Services & Starters at this level. If you, for example, want to tap into events emited by the process engine, writing a service that consume those messages and execute some business logic should be trivial using Spring Cloud.

Until this point (everything inside) Activiti and Activiti Cloud will be released and available in Maven Central as maven artifacts. We will release Early Access builds every month until we have enough meat for a Beta release. We did our first EA release for the first time at the end of August 17, and we will do a our next one by the end of October.

## Reference Docker Images & Examples

If you go down another level in the previous diagram, you will see a set of repositories which are being built by [hub.docker.com](https://hub.docker.com/u/activiti/dashboard/) using the automated build configuration. These repositories contain reference implementations using our spring boot starters of each of our services. By using these images you can get a basic working setup of all the services.

These docker images are being tagged every month when we go through our release process, in our examples we always point to the latest build (which happens after every commit to these repositories).

These Docker Images are used to provide examples about how to deploy all these services using Docker Compose, Kubernetes, and Kubernetes HELM charts. You can find these examples inside the [activiti-cloud-examples](https://github.com/activiti/activiti-cloud-examples) repository.

You, as a user, are encouraged to generate your own Docker images with your required customizations. We have tried to keep these images as simple as possible.

## Deprecated Repositories

We will be deleting for good a repository called [activiti-cloud-starters](https://github.com/Activiti/activiti-cloud-starters) which we created to initial host all our starter projects. If you are working against this repository please move your changes to the appropriate *-service repository.

## Activiti adopts Git Flow

As the team is growing fast, we have adopted Git Flow as our standard flow for working on new features. We are going to use the jgitflow maven plugin to drive the flow.

This means that we are not going to work on the master branch any more, master will be used for releasing and it will always contain a stable state of the project. In other words, master will be updated every month with our monthly release process. All the work now will be based on the develop branch, that you will find in all our repositories.

You can find more information about this plugin here: [Atlassian JGITFLOW](https://bitbucket.org/atlassian/jgit-flow/wiki/goals.wiki#!goals-overview) and [workflow](https://www.atlassian.com/git/tutorials/comparing-workflows#gitflow-workflow) provides a very good and clear explanation about how the workflow works.

In order to contribute and send Pull Request to any of our repositories you will need to use the following maven goal making sure that you have an up to date ***develop*** branch:

- [jgitflow:feature-start](https://bitbucket.org/atlassian/jgit-flow/wiki/goals/feature-start) Starts a feature branch

This will create a feature branch for you to work, push your commits and then send a pull request. These maven plugin will ask you to provide a name for your feature branch and that should follow the following format ***&lt;github username&gt;-&lt;issue number&gt;-&lt;short desc&gt;***. We will then review your PR and use [jgitflow:feature-finish](https://bitbucket.org/atlassian/jgit-flow/wiki/goals/feature-finish) to merge that pull request.

If you have questions about these changes, procedures for contributions drop us a line in our Gitter Channel: <https://gitter.im/Activiti/Activiti7>
