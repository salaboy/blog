---
title: "Activiti: Last week Dev Logs #87"
date: 2019-03-19 10:33:20 +0000
permalink: /2019/03/19/activiti-last-week-dev-logs-87/
description: "Last week week we presented at the at London DevOps our experience with Jenkins X to automate, release and manage 40+ repositories, which includes Java…"
tags:
  - "Java"
original_url: https://www.salaboy.com/2019/03/19/activiti-last-week-dev-logs-87/
---

Last week week we presented at the [at London DevOps](https://www.meetup.com/London-DevOps/events/259388318/) our experience with [Jenkins X](http://jenkinsx.io) to automate, release and manage 40+ repositories, which includes Java Libraries, Docker Images, HELM charts and deployments to environments which execute Acceptance tests against them. We are working quite hard to refine how the Activiti Cloud APIs from different components are consumed and also we are working hard to enable new BPMN elements. We will double down our efforts to provide a framework for testing these services in a distributed environment to make sure that we have enough coverage from each BPMN element when running in a distributed approach.

[@miguelruizdev](https://github.com/miguelruizdev) worked on the reusability of modelling acceptance test steps.

[@almerico](https://github.com/almerico) Fix https://github.com/Activiti/Activiti/issues/2581

[@ryandawsonuk](https://github.com/ryandawsonuk) Created PRs to add [jenkins-x quickstarts docs to the developer guide](https://github.com/Activiti/activiti-7-developers-guide/pull/39) and resolve an [issue with build pod naming](https://github.com/Activiti/Activiti/issues/2620). Presented with Mauricio on our use of Jenkins-X [at London DevOps](https://www.meetup.com/London-DevOps/events/259388318/)

[@erdemedeiros](https://github.com/erdemedeiros) worked on fix for Swagger specification (<https://github.com/Activiti/Activiti/issues/2588> - work in progress).

[@salaboy](http://twitter.com/salaboy) presented with [@ryandawsonuk](https://github.com/ryandawsonuk) [at London DevOps](https://www.meetup.com/London-DevOps/events/259388318/) and worked on triaging issues for 7.1.0.M1 while we had some interesting discussions about Decision Tables.

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
