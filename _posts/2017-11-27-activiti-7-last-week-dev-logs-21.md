---
title: "Activiti 7: Last week Dev Logs #21"
date: 2017-11-27 08:35:52 +0000
permalink: /2017/11/27/activiti-7-last-week-dev-logs-21/
description: "We are getting close to the end of the month so we are trying to close the some pending issues for this milestone (11-2017)."
tags:
  - "activiti7"
  - "basic"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "event"
  - "Java"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "Trips"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "BPM"
  - "community"
  - "example"
  - "microservices"
  - "open source"
  - "progress"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/11/27/activiti-7-last-week-dev-logs-21/
---

We are getting close to the end of the month so we are trying to close the some pending issues for this milestone (11-2017). Last week ***(20/11/17 - 26/11/17)*** we manage to make great progress into the monitoring aspect of our platform and each of our services is getting more and more robust. We are growing and having more people looking into our coding practices and how we build our software is getting and better and better every month.

[@willkzhou](https://github.com/willkzhou) preparing to test query with Elasticsearch and implementing docker image to test with.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on [adding ability](https://github.com/Activiti/Activiti/issues/1534) to activiti-cloud-runtime-bundle-service to start a process instance by process definition key

[@igdianov](https://github.com/igdianov) working on the notification service using GraphQL subscriptions.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) working for adding versions to process models

[@lucianoprea](https://github.com/lucianoprea) continued working on the [Activiti Cloud Service Organization](https://github.com/Activiti/activiti-cloud-org-service/pull/1)

[@balsarori](https://github.com/balsarori) reviewing and updating form runtime service [document](https://docs.google.com/document/d/1OX1viNruy50sbRF_xyKDOnK5tHwSVYuTuSO5dwClKUI). Checking the possibility of using [JSON schema validation](http://json-schema.org/) to do form validation.

[@ffazzini](http://github.com/ffazzini) introduced tracing in common module, managed to get zipkin running in Minikube and the services sending traces to it. ( <https://github.com/Activiti/Activiti/issues/1546> )

[@mteodori](https://github.com/mteodori) dev environment configured on new macbook with example on docker and minikube running as in the dev guide, a PR on broken links merged plus [one on adding git info to audit service](https://github.com/Activiti/activiti-cloud-audit/pull/13)

[@ryandawsonuk](https://github.com/ryandawsonuk) helped with making actuator available in the services and made common supporting classes available to later be able to apply security restrictions to process definitions in a runtime bundle ( <https://github.com/Activiti/Activiti/issues/1493> )

[@erdemedeiros](https://github.com/erdemedeiros) added audit events for connector integrations ( <https://github.com/Activiti/Activiti/issues/1545> ).

[@salaboy](http://twitter.com/salaboy) worked on our Twitter Cloud Connector Demo. Now the demo works with Docker Compose and we are quite close to get it up and running in a public AWS instance. PR: <https://github.com/Activiti/activiti-cloud-examples/pull/28>

This week we will be merging Pull Requests, refining the examples and our GitBook to make sure that the latest changes are reflected for the release date. We aim to be releasing by the end of this week so stay tuned!

[@salaboy](http://twitter.com/salaboy) will be in [Rome, Italy for the Makers Faire](http://www.makerfairerome.eu/en/), so if you are around feel free to get in touch via twitter and we can do some hacking together.

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>

If you want to get started with Activiti Cloud visit our Gitbook: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/>
