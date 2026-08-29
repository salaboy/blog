---
title: "The Road to Activiti Core & Activiti Cloud Beta2"
date: 2018-10-31 11:17:12 +0000
permalink: /2018/10/31/the-road-to-activiti-core-activiti-cloud-beta2/
description: "This is a brief overview of the work we have been doing for the past 68 weeks (from July 2017 to October 2018)."
tags:
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "microservices"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "business"
  - "cloud native"
  - "docker"
  - "kubernetes"
  - "process"
  - "spring"
  - "spring boot"
original_url: https://www.salaboy.com/2018/10/31/the-road-to-activiti-core-activiti-cloud-beta2/
---

This is a brief overview of the work we have been doing for the past 68 weeks (from July 2017 to October 2018). It is important to understand that in this timeframe we have architected, designed, implemented, tested and documented the basic building blocks needed for a Cloud Native version of a BPM Platform. We have also presented and validated our platform at numerous Java conferences and within the BPM industry.

Since the very beginning we designed for Kubernetes as our target platform and abstraction layer to different cloud providers. Because of this clear deployment approach we relied on frameworks and tools such as Spring Boot, Spring Cloud and Docker. All these tools and frameworks validated our conceptual designs and subsequent implementation, but not everything was as straightforward as it sounds.

During this journey we discovered flaws, gaps and tools that are required to work in a Kubernetes environment that at the beginning were completely unknown to us. Examples of these tools that we spent time working with(and engaging with their communities) include Docker Compose, Minikube, Keycloak SSO, Spring Cloud Kubernetes, HELM and Jenkins X (and its update bot).

We faced the day to day complexity of working with and maintaining multiple repositories **(38 and counting)** and the challenges of dealing with not only releasing java artifacts to Maven Central but also tagging repositories related to Docker Images and providing HELM charts for releases.  During this journey we knew that CI/CD was important but we realized quite late in the process, just how important it was. Since then, a big effort has been made to ensure that we follow convention-based practices that can accelerate our release cycles and improve the quality of our code.

## Executive Summary

This is a very short summary of the main three phases that the project has gone through these last 68 weeks:

- **Architecture, minimum viable product (MVP) and initial  proof of concept (PoC) of core components (Aug ‘17 - Jan ‘18)**: we defined what Activiti Cloud would be, the main pieces that we needed and tested this by coding some Proof of Concepts for each component. We validated these with customers, existing Activiti users, BPM enthusiasts, customers and partners. Even though some of them were not ready for the big change to Cloud Native, they all mentioned their intention to go to the Cloud.
- **Refinements, APIs, Infrastructure, Conformance and evolution to Cloud Native (Feb ‘18 to May ‘18): we scoped the first MVP for Beta1 which included very broad topics such as new Java Runtime APIs, conformance with Alfresco API guidelines, tracing and monitoring, and message based endpoints for Asynchronous interactions. The Product team was created and we began designing the solution. Due the amount of features, source code and generated artifacts it was clear by the end of May that the only way to get this out of the door was by automating everything.**

- Maturity and CI/CD core practices for faster release cycles (June ‘18 - October ‘18): we started our journey to CI/CD with our internal releases. We reshaped our source code to follow industry standard practices that enabled a fast and reliable release cycle. We included the modeling Front End as part of the Beta2 release to demonstrate the flow from Modeling to Runtime in our distributed infrastructure.

For the next phase (from Beta2 towards a GA release) the planned work is about improving the maturity of the components, improving automation to reduce release cycles and increasing confidence in the software that we are delivering. As mentioned in this document now the coverage must include Docker Images, HELM Charts and acceptance tests running on Kubernetes Clusters.

The following sections cover each of the above phases in more detail. At  the end of the document you can find a reference section which includes the weekly devlogs and the team’s GitHub accounts.

## Architecture, MVP and initial PoC of core components

From August ’17 to Jan ’18 we created the first iteration of our PoCs which we validated with the Java Community, the Microservices Community, the Alfresco Community and with customers and key partners in the US.

- **August ’17**: Initial PoC for Runtime Bundle and draft for Audit and Query. Initial Identity refactoring and learning about Keycloak, initial docker compose for bootstrapping the first example with all new service. First incarnation of Spring Boot Starters for Runtime Bundle, Audit and Query. Initial version of our Bills Of Materials (BoMs)
- **September ’17** [**(EA-201709)**](https://search.maven.org/artifact/org.activiti/activiti-root/7-201709-EA/pom): initial tests with [Minikube](https://kubernetes.io/docs/setup/minikube/), learning about the differences between Docker Compose and Minikube and the complexities involved with deploying to Minikube. We created our first set of Kubernetes enabled building blocks. We validated the architecture with Pivotal engineers (Seattle), and found out that PKS was started by Pivotal as their Kubernetes Distribution so we started collaborating.
- **October ’17** [**(EA-201710)**](https://search.maven.org/artifact/org.activiti/activiti-root/7-201710-EA/pom)**:** we created our first Early Access release artifacts. There wasn’t a release procedure that we could use so we created our pipelines and released Activiti Core and Activiti Cloud artifacts to Maven Central for the first time. Right after that we created Activiti Cloud Connectors using Spring Cloud Streams and started looking at GraphQL for our Query Service and notifications.
- **November ’17** [**(EA-201711)**](https://search.maven.org/artifact/org.activiti/activiti-root/7-201711-EA/pom)**:** we validated our architecture with partners in the US and defined the MVP for what the first GA version of Activiti Cloud should be. We started to have some conversations with the [JHipster community](https://www.jhipster.tech/) due to our similarities with technology stacks and target audiences. We created the first version of our [GitBook describing the architecture](https://activiti.gitbook.io/activiti-7-developers-guide/) and some of the concepts that were introduced in our cloud approach.
- **December ’17** [**(EA-201712)**](https://search.maven.org/artifact/org.activiti/activiti-root/7-201712-EA/pom)**:** community contributions around ElasticSearch, MongoDB and GraphQL were provided by our community contributors and we included those in our monthly Early Access Release.  We started working on our BluePrint Example to demonstrate our building blocks with a real life scenario.
- **Jan ’18** [**(EA-201801)**](https://search.maven.org/artifact/org.activiti/activiti-root/7-201801-EA/pom)**:** the Activiti Team presented the initial draft for the BluePrint Example and architecture already running in MiniKube at [DevCon](https://www.slideshare.net/salaboy/activiti-activiti-cloud-devcon). Initial draft for security policies and improvements on Activiti Cloud Connectors.  We used the ELK stack and ZIPKIN to monitor and trace our applications using Spring Cloud Sleuth. We had face to face meetings with key contributors that had backgrounds in BPM and Activiti.

By the end of January ’18 we had a clear vision and direction on where the project should go. All these feedback and input from both the Java and BPM community provide us the right input for the next phase.

## Refinements, APIs, Infrastructure, Conformance and evolution to Cloud Native

From Feb ‘18 to May ‘18, while we scoped the work that was needed for a Beta1 release we worked on the Alfresco API guidelines conformance. We interacted with other Alfresco architects to create the initial incarnation of the Alfresco DBP which consumed key components that Activiti Cloud was already using such as Keycloak and a Gateway which became part of the DBP infrastructure. March, April, May were all about the new APIs and using [HELM](https://helm.sh/) as our deployment mechanism to real life clusters (no more minikube/docker compose).

- **Feb ’18** [**(EA-201802)**](https://search.maven.org/artifact/org.activiti/activiti-root/7-201802-EA/pom)**:** we started analysing how to support the Alfresco API Guidelines for our REST endpoints and provided support for RestDocs, as well as introduced acceptance tests. We started some work around the Modeling Backend Services. We aligned to Spring Boot 2 and Spring Cloud Finchley Milestone releases and started collaborating with the Spring Cloud community to refine our services. Wereated a small Angular app to demonstrate an end to end interaction with the backend services. [Activiti Cloud Overview from Feb 18](https://www.slideshare.net/salaboy/activiti-cloud-overview-blueprint-trending-topic-campaigns).
- **March ’18:** we scoped the ‘must haves’ for a Beta Release which included new Java APIs to support compatibility moving forward, well-defined REST APIs and Message Driven Endpoints with stable DataTypes and Application Service RFC to monitor applications. We started our first round of structuring the project in a way that would enable us to move faster. We undertook work on the Alfresco API guidelines which increased the surface that need to be tested.
- **April ’18:** we moved away from Netflix OSS libraries (Gateway, Eureka), due the fact that we don’t need them inside Kubernetes. We started testing with AWS and Kops for our deployments. We provided the very first draft of the Java APIs which needed heavy testing and we included a RFC document describing the scope for the MVP (Beta1). [The Activiti team presented at the London Microservices Meetup](https://www.slideshare.net/salaboy/lessons-learned-spring-cloud-docker-kubernetes).
- **May ’18:** new APIs were propagated to all the services and we discovered that HELM charts and Jenkins X aligned perfectly with the technology stack that we were targeting. They also provided out of the box support for CI/CD pipelines using Docker, Kubernetes Descriptors and HELM in a unified environment.  We started collaborating heavily with the Spring Cloud Kubernetes project due to our dependencies when running on Kubernetes. The Activiti Team was accepted to present in [GeeCon Krakow](https://www.slideshare.net/salaboy/lessons-learned-from-java-ee-to-spring-cloud-in-the-context-of-activiti-oss) and in [JCCC Tokyo](https://www.slideshare.net/salaboy/jjug-ccc-2018-lessons-learned-spring-cloud-docker-kubernetes) (Java Conferences)

During this period we didn’t create any releases, due the need for stabilisation changes and the amount of new artifacts that needed to be released. The releases now included tagging 30+ repositories, building different artifacts (Maven Artifacts deployed to Maven central, Docker Images published and tagged to Docker Hub and [HELM charts](https://helm.sh/)). This made us realize that for a small team to deal with all of these tasks we needed to automate **everything**. So we started our journey towards CI/CD/CD (Continuous Integration/Continuous Deployment/Continuous Delivery).

## Maturity and CI/CD core practices for faster release cycles

The more we looked at what the Kubernetes community was doing in terms of releasing huge sets of services, the more we understood the power of going full speed on CI/CD. We also realized that all our early release scripts were blocking us from progressing due to a lack of modularity and the fact the they were not written with a CI/CD practice in mind.

- **June ’18:** by using Jenkins X the team got a deeper understanding on how these technologies were used by the industry and why HELM was a must. Our Acceptance tests became extremely important in order to cover more complex scenarios in Kubernetes. New APIs become more stable and were used across all the services. We did community workshops ([JBCN Java Conference](https://www.slideshare.net/salaboy/cloud-native-java-in-kubernetes)) to validate our practices, tools and how other companies where using these projects. We got valuable feedback on what the most painful steps for the Java community were when working with these tools.
- **July ’18:**  [HELM Charts enabled us to deploy our examples more easily](https://github.com/activiti/activiti-cloud-charts) and became the default way of installing our services. The Blueprint scenario was updated to support new conventions and to reduce the maintenance cost.
- **August ’18** [**(Beta1)**](https://search.maven.org/artifact/org.activiti/activiti-root/7.0.0.Beta1/pom)**:**  we released Beta1 as the first stable set of building blocks for running processes in a distributed environment. This release didn’t include any modelling Front End capability. The release covered two angles: [Activiti Core](/2018/08/13/getting-started-with-activiti-core-7-0-0-beta1/) and [Activiti Cloud](/2018/08/13/getting-started-with-activiti-cloud-beta1/).
- **September ’18:** we started working on refining the Modeling backend services and started collaborating with the Front End team to provide an initial Modeling and Runtime experience. We worked on our CI/CD pipelines which provided fixed version releases, reducing the release cycle down to, potentially, a week for our core Spring Boot Starters and Java libraries. The Activiti Team was accepted to present at [SpringOnePlaform](http://springoneplatform.io/) along with the [Spring Cloud team leader Spencer Gibbs about Spring Cloud Kubernetes](https://www.slideshare.net/salaboy/s1p-spring-cloud-on-pks) a key piece in our distributed design.
- **October ’18** [**(Beta2)**](https://search.maven.org/artifact/org.activiti/activiti-root/7.0.0.Beta2/pom)**:** modeling refinements for the first MVP with Modeling and Runtime Services all working together. Started the automation of Cloud Environments for Acceptance Tests integrated to our Spring Boot Starters pipelines and release cycles.

While the focus until now was to demonstrate that we can reduce the release cycle internally, we know for sure that these practices will be propagated into the framework, libraries and services of the BPM platform. Constant change, generating new versions and doing A/B testing is intrinsic to the BPM discipline and we want to make sure that we help people adopting Activiti Cloud to get the best out of the CI/CD approach.

## From Beta2 to GA

Moving forward we will focus on making sure that the features provided in Beta2 can be tested. he following points needs will need to be covered:

- Automation of integration tests for basic stable set of features
  - We have integration tests at the starter level that we need to move out  or refactor because the current way of testing is blocking us (maven docker plugin is not reliable)
- Automation for tagging/releasing 
  - Docker Images
  - Helm Charts
- Acceptance Tests refactoring/modularization and release for basic stable set of features
  - Make sure that acceptance tests are released for other projects to consume
  - Different runtime bundles per scenario
  - Clear realm and configurations
- Contract Testing for basic stable set of features and DBP conformance
  - Rest endpoints needs to be covered
  - Message Driven endpoints needs to be covered
- Admin APIs review for basic stable set of features: 
  - Expand the use cases that we are covering
- Application Service polishing and improved acceptance tests
- Bugs/Fixes for basic stable set of features

Some features that we are expecting to get in before GA (which should be covered end to end: from Modeling to Runtime in our acceptance tests) are:

- Process Variables & Mappings support
- Connectors Definitions & Mappings (Functions)
- Application Metadata support and integration

## References

Activiti Core and Activiti Cloud GitBook

<https://activiti.gitbook.io/activiti-7-developers-guide/>

### Request For Comments: RFC

- General Building Blocks Design: <https://www.slideshare.net/salaboy/activiti-activiti-cloud-devcon>
- Java Runtime Process & Task API </2018/04/18/rfc-java-process-task-runtime-apis/>
- Activiti Cloud Connectors</2017/10/12/rfc-activiti-cloud-connectors/>
- Activiti Cloud Application Service</2018/04/11/rfc-activiti-cloud-application-service/>

### Weekly DevLogs and Roadmap updated

You can find the 68 weeks Devlogs and Roadmap updated in [http://salaboy.com](/__trashed/) with the date of publications.

Conferences meetup and events slides can be found here: <https://www.slideshare.net/salaboy>

### Getting Started

</2018/08/13/getting-started-with-activiti-core-7-0-0-beta1/>

</2018/08/13/getting-started-with-activiti-cloud-beta1/>

#### Github users and commit history

Core Team

<http://github.com/salaboy>

<http://github.com/ryandawsonuk>

<http://github.com/erdemedeiros>

<http://github.com/miguelruizdev>

Core Community members/advisors

<http://github.com/igdianov>

<http://github.com/daisukeyoshimoto>

Key contributors from APS team

<http://github.com/constantin-ciobotaru>

<http://github.com/lucianoprea>

<http://github.com/balsarori>

<http://github.com/ffazzini>

<http://github.com/mteodori>
