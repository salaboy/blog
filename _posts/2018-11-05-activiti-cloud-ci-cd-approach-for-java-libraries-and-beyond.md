---
title: "Activiti Cloud: CI/CD approach for Java Libraries and Beyond"
date: 2018-11-05 14:35:26 +0000
permalink: /2018/11/05/activiti-cloud-ci-cd-approach-for-java-libraries-and-beyond/
description: "This blog post describes our approach to CI/CD for our core Java Libraries. This includes the Process Engine, new APIs, and new Spring Boot Starters for…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "CD"
  - "ci/cd"
  - "cloud native"
  - "jenkinsx"
  - "microservices"
  - "spring"
  - "spring boot"
original_url: https://www.salaboy.com/2018/11/05/activiti-cloud-ci-cd-approach-for-java-libraries-and-beyond/
---

This blog post describes our approach to CI/CD for our core Java Libraries. This includes the Process Engine, new APIs, and new Spring Boot Starters for the Runtime and Modeling Services of our Cloud Native Building Blocks.

We strongly believe that these practices will enable us to scale our development process to build a stable set of libraries and services. Due the complex nature of the tools that we are building, having a stable base and a core set of practices to follow will enable us to sustain a constant pace of development and delivery.

We have separated Core Java Libraries from Spring Boot Starters due to the relationship with Spring Boot and Spring Cloud respectively. We have also separated the Runtime and Modeling Services due the nature of the changes in these projects and to make sure that they can be released independently.

The following sections describe the main conventions that we have adopted and how the flow of changes will be propagated during a normal development cycle.

## Java Core Libraries

We have worked hard to make sure that we enforce consistency across repositories, but at the same time ensure that each repository can evolve independently from the others. We are working under the premise that a PR merged to the develop branch will end up with a new release for the artefacts contained in the repository.

![activiti-core-repositories.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti-core-repositories.png)

For this reason we have switched to use fixed version releases instead of using ***SNAPSHOTS***. Every PR merged into develop will cause the patch version (SemVersion: ***Major.Minor.Patch***) to be incremented and released to our Alfresco Nexus repository.

We are also creating ***BoMs (Bill of Materials)*** in each repository and now each repository has the same relative parent. For Activiti Core related repositories that is Activiti Build.

In practice, this means that each repository will have a Parent Pom which is used parent for all the modules inside that repository and a BoM which is used to declare all the dependency management for consumers of the projects contained in the repository. Each Parent Pom is used to contain and propagate only maven plugins and to define the internal maven dependency management.

Even if the previous diagram looks simple, there are a lot of details that are important to achieve a truly CI/CD approach. Here are some of the highlights:

- ***Activiti Build [(org.activiti.build)](https://github.com/Activiti/activiti-build/)***
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-build/blob/develop/pom.xml)): this Parent Pom is used as Parent of all the Core Activiti Projects. For that reason, this Parent Pom includes all the shared Maven Plugin Configurations.
    - BoM ([activiti-parent-dependencies/pom.xml](https://github.com/Activiti/activiti-build/blob/develop/activiti-dependencies-parent/pom.xml)): this parent BoM includes the dependency management of Spring Boot which is going to be shared by all the children.

- ***Activiti API [(org.activiti.api)](https://github.com/Activiti/activiti-api)***
- - - Parent Pom ([pom.xml)](https://github.com/Activiti/activiti-api/blob/develop/pom.xml)
    - BoM ([activiti-api-dependencies/pom.xml](https://github.com/Activiti/activiti-api/blob/develop/activiti-api-dependencies/pom.xml))
  - ***Activiti Core Common*** ([org.activiti.core.common](https://github.com/Activiti/Activiti-core-common))
    - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-core-common/blob/develop/pom.xml))
    - BoM ([activiti-core-common-dependencies/pom.xml](https://github.com/Activiti/activiti-core-common/blob/develop/activiti-core-common-dependencies/pom.xml))
- ***Activiti Core ([org.activiti](https://github.com/Activiti/activiti))***
- - - Parent Pom ([pom.xml](https://github.com/Activiti/Activiti/blob/develop/pom.xml))
    - BoM ([activiti-core-dependencies/pom.xml](https://github.com/Activiti/Activiti/blob/develop/activiti-core-dependencies/pom.xml))
- ***Activiti Dependencies ([org.activiti.dependencies](https://github.com/Activiti/activiti-dependencies))***
- - - BoM ([pom.xml](https://github.com/Activiti/activiti-dependencies/blob/develop/pom.xml))
- **Activiti Examples ([org.activiti.examples](https://github.com/Activiti/activiti-examples/))**
- - Parent Pom: ([pom.xml](https://github.com/Activiti/activiti-examples/blob/develop/pom.xml)) only acts as aggregator, each children points to Spring Boot Parent for plugins and includes/import the Activiti Dependencies BoM

### Other Conventions

We use properties (maven properties) to make references to artifact versions.

Each repository will have a property associated to it and the name of this property will follow the following convention: ***<{repo-name}.version> </{repo-name}.version>***

Examples of this properties tag: ***&lt;activiti-build.version&gt;***, ***&lt;activiti-api.version&gt;***,***&lt;activiti.version&gt;*** and ***&lt;activiti-dependencies.version&gt;***. Notice that the repository names match the property text.

In each repository you will find:

- Jenkinsfile: which defines the pipeline on how to build and release the artifacts included in that repo. Example: <https://github.com/Activiti/Activiti/blob/develop/Jenkinsfile>
- .updatebot.yml file which defines which projects needs to be notified about this project new release. Examples: <https://github.com/Activiti/Activiti/blob/develop/.updatebot.yml>

## Changes propagation and Continuous Delivery approach

While working with these projects we want to ensure that we don’t block streams of work to produce milestone releases. In other words, we don’t want to freeze repositories to do releases. We want to allow the constant evolution of each repository independently of the release plans.

In order to achieve this dynamic, the following diagram describes the "***updatebot***" configurations to generate PRs for the changes in each repository.

![updatebot-changes-activiti-core.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/updatebot-changes-activiti-core.png)

This flow shows that for every change (that generates a release) in the ***Activiti Build*** repository, all the children will receive a PR with the updated version after the change is verified. Due the nature of Activiti Build (just a parent pom defining plugins and BoM definition) the rate of change at the top level will be quite low.

At this point, Activiti API will generate a new version of itself and will create a PR on Activiti Core Common, Activiti (Core) and Activiti Dependencies updating its own version and its own BoM.

For these repositories, Activiti Dependencies (which only contains a BoM) acts as a version aggregator for consumers to use. Activiti Dependencies serves as gate to control, test and decide when to release a new version set for all these projects. Based on recent findings, we can also use the Maven Enforcer plugin to enforce version convergence (thanks to @igdianov). This enforcement can be monitored by the pipeline to only merge the PRs when the version convergence is valid. Once we manage to release Activiti Dependencies, our consumers (in this case Activiti Examples) will be notified that a new version is available for consumption which can be automatically merged.

## Activiti Cloud Runtime: CI/CD approach for Spring Boot Starters

For Activiti Cloud Runtime Spring Boot Starters we have the following dependency chart

![activiti-cloud-repos](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti-cloud-repos.png)

For Activiti Cloud each repository has a single parent ***Activiti Cloud Build*** (arrows were removed from the previous image to reduce the complexity of the diagram). Following the same approach as Activiti Build, the parent only includes the relevant plugins that apply to all of its children. ***Activiti Cloud Build*** also defines a parent/master BoM which in this case defines the ***Spring Cloud*** dependency (Finchley.SR1 at the time of writing this document).

An important detail to notice here, is that Activiti Cloud Build doesn’t depend on Activiti Dependencies. The main reason for this is that not all the Activiti Cloud building blocks depend on Activiti Core libraries, for that reason the Activiti Dependency is not introduced at this level.

For Activiti Cloud we also have an aggregator project called **Activiti Cloud Dependencies** which collects all the individual repositories BoMs and it is designed to be used by consumers of our services. Activiti Cloud Dependencies is the main link between the Spring Boot Starters world provided by Activiti Cloud and services that can be packaged as Containers (Docker images).

After **Activiti Cloud Service Common** repository all the children are independent so they can evolve without being blocked by their parents. For development purposes, developers changing one service can always reference the fixed version of the service to test the changes in live environments. In other words, every change in **Activiti Cloud Service Common** or above will be propagated to all the children, but changes in the child will only promote the change to the aggregator (Activiti Cloud Dependencies BoM). This enables us to do A/B testing of new features without fully releasing a new Labeled Activiti Cloud Dependencies for external consumption.

The repositories covered by Activiti Cloud Spring Boot Starter projects are as follows:

Starting with the parent (shared) projects:

- **Activiti Cloud Build ([org.activiti.cloud.build](https://github.com/Activiti/activiti-cloud-build))**
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-build/blob/develop/pom.xml)): this Parent Pom acts as parent for all the Cloud Modules.
    - BoM ([activiti-cloud-parent-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-build/blob/develop/activiti-cloud-dependencies-parent/pom.xml)): this Parent BoM includes the Spring Cloud Version that is going to be shared by all the children.
- **Activiti Cloud API ([org.activiti.cloud.api](https://github.com/Activiti/activiti-cloud-api))**
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-api/blob/develop/pom.xml))
    - BoM ([activiti-cloud-api-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-api/tree/develop/activiti-cloud-api-dependencies))
- **Activiti Cloud Service Common ([org.activiti.cloud.service.common](https://github.com/Activiti/activiti-cloud-service-common))**
- - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-service-common/blob/develop/pom.xml))
  - BoM ([activiti-cloud-service-common-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-service-common/blob/develop/activiti-cloud-service-common-dependencies/pom.xml))

Depending on these projects are the Activiti Cloud Spring Boot Starters:

- **Activiti Cloud Query Service ([org.activiti.cloud.query](https://github.com/Activiti/activiti-cloud-query-service))**
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-query-service/blob/develop/pom.xml))
    - BoM ([activiti-cloud-query-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-query-service/blob/develop/activiti-cloud-query-dependencies/pom.xml))
- **Activiti Cloud Audit Service ([org.activiti.cloud.audit](https://github.com/Activiti/activiti-cloud-audit-service/))**
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-audit-service/blob/develop/pom.xml))
    - BoM ([activiti-cloud-audit-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-audit-service/blob/develop/activiti-cloud-audit-dependencies/pom.xml))
- **Activiti Cloud Runtime Bundle Service ([org.activiti.cloud.rb](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/))**
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/blob/develop/pom.xml))
    - BoM ([activiti-cloud-runtime-bundle-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-runtime-bundle-service/blob/develop/activiti-cloud-runtime-bundle-dependencies/pom.xml))
- **Activiti Cloud Apps Service ([org.activiti.cloud.app](https://github.com/Activiti/activiti-cloud-app-service))**
- - - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-app-service/blob/develop/pom.xml))
    - BoM ([activiti-cloud-query-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-app-service/blob/develop/activiti-cloud-app-dependencies/pom.xml))
- **Activiti Cloud Dependencies (org.activiti.cloud.dependencies)**
- - BoM ([pom.xml](https://github.com/Activiti/activiti-cloud-dependencies))

The Spring Boot Starters generated by these repositories are:

- Activiti Cloud Audit **@EnableActivitiAudit**
- Activiti Cloud Query **@EnableActivitiQuery**
- Activiti Cloud Runtime Bundle **@EnableActivitiRuntimeBundle**
- Activiti Cloud Connector **@EnableActivitiCloudConnector**
- Activiti Cloud App Service **@EnableActivitiAppService**

This means that if you add Activiti Cloud Dependencies (Master Cloud BoM) you will be able to include any of these starters in your Spring Boot Application.

## Activiti Core and Activiti Cloud dependencies

It is important to understand how things relate dependency wise to understand where changes will impact projects down the chain. The following chart represents the dependency of modules between Activiti Core and Activiti Cloud:

![activiti-core-and-activit-cloud-rel.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti-core-and-activit-cloud-rel.png)

It is important to notice that **Activiti Cloud Runtime Bundle** is the only one consuming Activiti Core Dependencies. This means that Activiti Cloud Query Service, Activiti Cloud Audit Service and Activiti Cloud Connectors will be only impacted by changes in Activiti Core Common and Activiti Cloud Service Common.

It is also important to understand that **Core Common** and **Cloud Service Common** are covering cross cutting concerns such as Security, Tracing, Identity, Alfresco DBP conformance, Rest Docs, Tests, Metadata, etc. and these cross cutting concerns modules shouldn’t change as often as the service themselves.

## Activiti Cloud Modeling: CI/CD approach

In the same way as Activiti Cloud Runtime, the Activiti Cloud Modeling repositories produce Spring Boot Starters related to the modeling backend services.

![activiti-cloud-modeling.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti-cloud-modeling.png)

- Activiti Cloud Modeling Build ([org.activiti.cloud.modeling.build](https://github.com/Activiti/activiti-cloud-modeling-build))
  - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-modeling-build/blob/develop/pom.xml))
  - BoM ([activiti-cloud-modeling-dependencies-parent/pom.xml](https://github.com/Activiti/activiti-cloud-modeling-build/blob/develop/activiti-cloud-modeling-dependencies-parent/pom.xml))
- Activiti Cloud Organization Service ([org.activiti.cloud.modeling](https://github.com/Activiti/activiti-cloud-org-service/))
  - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-org-service/blob/develop/pom.xml))
  - BoM ([activiti-cloud-org-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-org-service/blob/develop/activiti-cloud-org-dependencies/pom.xml))
- Activiti Cloud Process Model Service ([org.activiti.cloud.process.model](https://github.com/Activiti/activiti-cloud-process-model-service/))
  - Parent Pom ([pom.xml](https://github.com/Activiti/activiti-cloud-process-model-service/blob/develop/pom.xml))
  - BoM ([activiti-cloud-process-model-dependencies/pom.xml](https://github.com/Activiti/activiti-cloud-process-model-service/tree/develop/activiti-cloud-process-model-dependencies))
- Activiti Cloud Modeling Dependencies ([org.activiti.cloud.dependencies](https://github.com/Activiti/activiti-cloud-modeling-dependencies/))
  - BoM ([pom.xml](https://github.com/Activiti/activiti-cloud-modeling-dependencies/blob/develop/pom.xml))

**Spring Starters**

- Activiti Cloud Process Model Service **@EnableActivitiProcessModelService**
- Activiti Cloud Apps Service **@EnableActivitiCloudAppsService**

## Release Process, Example Docker Images and Acceptance Tests

Our release process only covers releasing Maven artifacts to Maven Central (Activiti Core and Activiti Cloud), but we do have a set of example services (which generate Docker Images) that need to be tagged and tested against the released artifacts.

The following diagram describes the repositories involved:

![activit-cloud-examples.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activit-cloud-examples.png)

As you can see, Activiti Cloud Application services, and Activiti Cloud Runtime Acceptance Tests are all consumers of Activiti Cloud Dependencies BoM. This makes them perfect examples of how you should build your applications, how to include the aggregator BoM and how to configure the Starters for your Spring Boot Applications. They also include Docker Files, Kubernetes Descriptor Files and HELM Charts definitions.

Activiti Cloud Infrastructure is just used for the examples and these services doesn’t depend on the Starters or any Activiti Cloud Dependencies. We are just bundling them together for our own consumption (Integration Testing and Example Deployments).

Repositories involved in runtime examples which are consuming Activiti Cloud Dependencies master BoM:

- [Example Runtime Bundle](https://github.com/activiti/example-runtime-bundle)
- [Example Cloud Connector](https://github.com/activiti/example-cloud-connector)
- [Activiti Cloud Audit](https://github.com/activiti/activiti-cloud-audit)
- [Activiti Cloud Query](https://github.com/activiti/activiti-cloud-query)
- [Activiti Cloud Acceptance Tests](https://github.com/activiti/activiti-cloud-acceptance-tests/)

Activiti Cloud Modeling examples follow the same approach:

![activiti-cloud-modeling-examples](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti-cloud-modeling-examples.png)

Modeling Repositories which creates docker images are:

- [Activiti Cloud Modeling (Backend)](https://github.com/activiti/activiti-cloud-modeling)
- [Activiti Modeling App (Frontend)](https://github.com/activiti/activiti-modeling-app)

## Summing up

We are planning to extend our release procedures to include all these example layer which includes creating and tagging docker images as well as publishing HELM charts. While we know that this is a considerable amount of work, we believe that these practices and convention based approach will permeate to teams building solutions with these building blocks, ultimately providing a SaaS approach to deliver solutions.

[Activiti Cloud HELM charts](https://github.com/activiti/activiti-cloud-charts) are still the recommended way to deploy our components and the Activiti Cloud Full Example HELM chart deploys all the services as described in the previous sections.

If you have question, want to contribute to the project or want to make it better please get in touch via [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) or [Github Issues](https://github.com/activiti/activiti/issues).
