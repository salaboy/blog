---
title: "Activiti Core & Activiti Cloud Beta5 released"
date: 2019-01-07 09:14:09 +0000
permalink: /2019/01/07/activiti-core-activiti-cloud-beta5-released/
description: "I am happy to announce that Activiti Core and Activiti Cloud Beta5 has been released. You can find the released artifacts in Maven Central, Docker Hub and…"
tags:
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "ci/cd"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "distributed"
  - "docker"
  - "kubernetes"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2019/01/07/activiti-core-activiti-cloud-beta5-released/
---

I am happy to announce that Activiti Core and Activiti Cloud Beta5 has been released.

You can find the released artifacts in [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.0.0.Beta5/pom), [Docker Hub](https://hub.docker.com/u/activiti/dashboard/) and in our GitHub repository for [HELM Charts](https://github.com/activiti/activiti-cloud-charts).

The focus of the Beta5 release was to add more Conformance and Acceptance tests. We are now working with fully automated Kubernetes Aware Pipelines in Jenkins X that runs our distributed acceptance tests after every change to guarantee consistency across all the services.  The API coverage it's getting better and exposing new features is becoming easier.

The full CI/CD approach is allowing us to go faster and the overall release time has been shortened to around 3 hours. We are still testing internally our new automated HELM Charts, but we hope to be able to publish them soon for community consumption.

The fastest way to get started with Activiti Cloud is to use our HELM charts that allow you to deploy all the services to a Kubernetes Cluster by following some simple steps. You can use any tooling that you already use to deploy HELM charts to Kubernetes or you can try Jenkins X. You can take a look at our Getting Started guides:

- [Activiti Core Getting Started](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-core)
- [Activiti Cloud Getting Started](https://activiti.gitbook.io/activiti-7-developers-guide/getting-started/getting-started-activiti-cloud)

You can find the full [release notes here](https://activiti.gitbook.io/activiti-7-developers-guide/releases/7.0.0.beta5).

If you are interested in getting started with Activiti Core you can check our examples repository which highlight how the new Runtimes API is used in the context of Spring Boot 2 applications:

- [Activiti Core Examples](https://github.com/activiti/activiti-examples)

If you are interested in getting involved get in [touch via Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
