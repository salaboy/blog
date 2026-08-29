---
title: "Activiti Core & Activiti Cloud Beta2 released!"
date: 2018-10-30 14:07:00 +0000
permalink: /2018/10/30/activiti-core-activiti-cloud-beta2-released/
description: "I am happy to announce the release of Activiti Core and Activiti Cloud Beta2. This release includes the first iteration of the Activiti Modeller which is…"
tags:
  - "activiti7"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knative"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
original_url: https://www.salaboy.com/2018/10/30/activiti-core-activiti-cloud-beta2-released/
---

I am happy to announce the release of [Activiti Core and Activiti Cloud Beta2](http://activiti.org). This release includes the first iteration of the Activiti Modeller which is based on the amazing Open Source BPMN.io project. The Activiti Modeller is built on top of the ADF framework (Alfresco [Application Development Framework](https://alfresco.github.io/adf-component-catalog/), which is based on Angular)  and is integrated with [Keycloak](https://www.keycloak.org/) for Single Sign On out of the box. Using this Front End application allows you to create BPMN process models and package them into an “Application Bundle” which can then be used to automate the process execution using Activiti Cloud Building Blocks (Runtime Bundle, Audit, Query, Cloud Connectors).

You can find the released artifacts in the following locations:

- [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.0.0.Beta2/pom)
- [Docker Hub (Beta2 tag)](https://hub.docker.com/u/activiti/)
- [GitHub repository for HELM Charts](http://github.com/activiti/activiti-cloud-charts)

The scope for this release is to provide the base set of features that we want to build upon. In other words, we include the absolute minimum to make sure that the core building blocks mature and become more stable. Stability and maturity are extremely important when building distributed systems and will only come with fast iteration cycles. One of the main differences between Beta1 and Beta2 is the CI/CD approach that we embraced to build, test and release each component.  We truly believe that the practice that we are using internally for building our components will permeate out to our Community and Enterprise users. For more information about our journey to Beta2 and beyond keep an eye out for a more detailed blog post coming soon.

The fastest way to get started with Activiti Cloud is to use our [Full Example HELM chart](https://github.com/Activiti/activiti-cloud-charts/tree/master/activiti-cloud-full-example) that allows you to deploy all the services to a Kubernetes Cluster by following some simple steps. You can use any tooling that you want to deploy HELM charts to Kubernetes or you can try [Jenkins X](https://jenkins-x.io/) (you will see that I use this on the demo to simplify all the steps required for creating, building, releasing and deploying these services).

Without further introduction check out this short demo that shows a very simple process for creating and reviewing articles. This process uses an Activiti Cloud Connector (think about it as a Function, as in FaaS) which provides a very basic [Slack integration using JBot](https://github.com/rampatra/jbot) and allows users to start a Business Process from Slack and also enables the process to send out notifications to different channels. You can find the [Slack Cloud Connector here](https://github.com/salaboy/activiti-cloud-connector-slack). And the [example Runtime Bundle here.](https://github.com/salaboy/activiti-cloud-rb-create-article)

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/xUXXdJLzpbs" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

If you are interested in the Jenkins X quickstarts you can find them here:

- [Activiti Cloud Runtime Bundle Quickstart](https://github.com/activiti/activiti-cloud-runtime-bundle-quickstart)
- [Activiti Cloud Connector Quickstart](https://github.com/activiti/activiti-cloud-connector-quickstart)

If you are interested in getting involved [get in touch via Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link).
