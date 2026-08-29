---
title: "Activiti Core & Activiti Cloud Beta3 are out!"
date: 2018-11-13 09:00:33 +0000
permalink: /2018/11/13/activiti-core-activiti-cloud-beta3-are-out/
description: "Hi everyone, I am happy to announce that Activiti Core & Activiti Cloud Beta3 artifacts had been released."
tags:
  - "activiti7"
  - "BPM"
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
  - "kubernetes"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "bpmn"
  - "cloud native"
  - "distributed"
  - "docker"
  - "microservices"
  - "release"
original_url: https://www.salaboy.com/2018/11/13/activiti-core-activiti-cloud-beta3-are-out/
---

![Activiti_Sticker](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2018/11/activiti_sticker.png)

Hi everyone, I am happy to announce that Activiti Core & Activiti Cloud Beta3 artifacts had been released. This is our first 2 weeks release sprint where we focused on closing some important issues. You can find the full list here: <https://github.com/Activiti/Activiti/milestone/15?closed=1>

These release moved us one step forward to work on tasks related to guarantee that the services are all consistent and are working as expected. As a result from Beta3 we are now ready to work on Conformance and Acceptance Tests which will provide forward compatibility when we add more building blocks (and alternative blocks) to our core services.

There are no major changes on Beta3 which require migration from Beta2 so you are safe to upgrade and everything should just work. You can find the published Beta3 artifacts in [Maven Central](https://search.maven.org/artifact/org.activiti.cloud.dependencies/activiti-cloud-dependencies/7.0.0.Beta3/pom)  and the tagged Docker Images in [Docker Hub](https://hub.docker.com/u/activiti/).

Also our HELM charts ([activiti-cloud-full-example](https://github.com/Activiti/activiti-cloud-charts/tree/master/activiti-cloud-full-example) version 0.4.0) were upgraded to use Beta3 Docker Images.

If you find any issues with Beta3 please create an [issue here](https://github.com/activiti/activiti/issues). Or get in touch [via Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link).

We will be aiming for [Beta4](https://github.com/Activiti/Activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3ABeta4) by the end of November and you can [track progress here](https://github.com/activiti/activiti/issues?q=is%3Aopen+is%3Aissue+milestone%3ABeta4).

As mentioned before we will be working on stability and automating our test suites for the Cloud approach, this includes the generation, build and publishing of Docker Images and HELM charts.

This is a great time to get involved to help us with the Beta testing process, integrating with your favourite Open Source projects and  learning about the technology stack that we are using to build these amazing tools. If you are ready for a big challenge get in touch [via Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link).

We are also hiring:

- [Senior Software Engineer](https://jobs.smartrecruiters.com/Alfresco/743999678708224-senior-software-engineer-activiti)
- [Senior Test Engineer](https://jobs.smartrecruiters.com/Alfresco/743999678644116-senior-test-engineer-activiti)
