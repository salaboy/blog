---
title: "Activiti Core & Activiti Cloud Beta4 released"
date: 2018-12-12 09:20:09 +0000
permalink: /2018/12/12/activiti-core-activiti-cloud-beta4-released/
description: "I am happy to announce that Activiti Core and Activiti Cloud Beta4 has been released. You can find the released artifacts in Maven Central, Docker Hub and…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "open source"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "containers"
  - "distributed"
  - "docker"
  - "microservices"
  - "process"
original_url: https://www.salaboy.com/2018/12/12/activiti-core-activiti-cloud-beta4-released/
---

I am happy to announce that Activiti Core and Activiti Cloud Beta4 has been released.

You can find the released artifacts in [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.0.0.Beta4/pom), [Docker Hub](https://hub.docker.com/u/activiti/dashboard/) and in our GitHub repository for [HELM Charts](https://github.com/activiti/activiti-cloud-charts).

The focus of the Beta4 release was to improve data consistency between the different services and maturity of the new APIs. We improved the way of handling data inside the Query Service (now it also contains Process Definitions and Variables are kept in different scopes for improved performance on query) which lead us to improved coverage on different scenarios. We are looking forward to leverage these changes with the GraphQL extensions that are still experimental, but we are planning to add soon into our release process. As mentioned before, the APIs are getting better and better and as part of our commitment to support a wide range of cloud deployments we included the first iteration of our [Conformance Tests](https://github.com/Activiti/Activiti/tree/develop/activiti-spring-conformance-tests) and [Cloud Conformance Tests](https://github.com/Activiti/activiti-cloud-conformance-scenarios) suites. These test suites are designed to enable implementors to extend the basic sets to cover their use cases. We believe that this is a ***“must”*** if you are planning to leverage a CI/CD approach.

Also a big part of this release was the upgrade to Spring Boot 2.1 and Spring Cloud Greenwich.M3 which we want to keep in sync with our release train.

The fastest way to get started with Activiti Cloud is to use our HELM charts that allow you to deploy all the services to a Kubernetes Cluster by following some simple steps. You can use any tooling that you already use to deploy HELM charts to Kubernetes or you can try Jenkins X. You can take a look at our Getting Started guides:

- [Activiti Core Getting Started](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-core)
- [Activiti Cloud Getting Started](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud)

You can find the full [release notes here](https://activiti.gitbook.io/activiti-7-developers-guide/releases/7.0.0.beta4).

If you are interested in getting started with Activiti Core you can check our examples repository which highlight how the new Runtimes API is used in the context of Spring Boot 2 applications:

- [Activiti Core Examples](https://github.com/activiti/activiti-examples)

If you are interested in getting involved get in [touch via Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
