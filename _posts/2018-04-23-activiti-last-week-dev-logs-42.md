---
title: "Activiti: Last week Dev Logs #42"
date: 2018-04-23 09:24:58 +0000
permalink: /2018/04/23/activiti-last-week-dev-logs-42/
description: "Last week we worked hard to move forward Application Services, new Runtime APIs and aligning our services and configurations to map these changes."
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "rfc"
  - "roadmap"
  - "workflow"
  - "activiti"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "docker"
  - "microservices"
  - "spring cloud"
original_url: https://www.salaboy.com/2018/04/23/activiti-last-week-dev-logs-42/
---

Last week we worked hard to move forward Application Services, new Runtime APIs and aligning our services and configurations to map these changes. This week we will push forward to make sure that we start having examples using these new services and APis.

Feel free to join our RFC documents and add comments/feedback.

</2018/04/18/rfc-java-process-task-runtime-apis/>

</2018/04/11/rfc-activiti-cloud-application-service/>

[@igdianov](https://github.com/igdianov) submitted Pull Requests related to Notifications and WS integration at the Gateway level for GraphQL endpoints.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) created the first implementation about Signal Throw Event Cloud Behavior that broadcasts signals to all Runtime Bundles by using Spring Cloud Stream. Pull requests: <https://github.com/Activiti/Activiti/pull/1783> <https://github.com/Activiti/activiti-cloud-runtime-bundle-service/pull/38> <https://github.com/Activiti/activiti-cloud-build/pull/41>

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) did rebase and resolved conflicts for “delete task” [#1812](https://github.com/Activiti/Activiti/issues/1812) and “delete process instance” [#1809](https://github.com/Activiti/Activiti/issues/1809) related PRs

[@ryandawsonuk](https://github.com/ryandawsonuk) created PRs to publish application metadata (which reflects which application a service belongs to) to eureka and to allow the stream names used between runtime bundles and connectors to be overridden. Started work on adding the application metadata to events

[@erdemedeiros](https://github.com/erdemedeiros) worked on the new Process Runtime Java APIs. Added first iteration for event listeners. Started thinking about connectors.

[@salaboy](http://twitter.com/salaboy) worked on RFC document for new APIs and some refinements in the Application Service located in our incubator repositories.

We keep getting community users messages that wants to try out our new infrastructure and services. We totally recommend to check out our Activiti Cloud Examples Github repository: <https://github.com/activiti/activiti-cloud-examples>  and our Gitbook’s Quickstart & Overview section: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/quickstart.html>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
