---
title: "Activiti 7: Last week Dev Logs #2"
date: 2017-07-17 08:03:32 +0000
permalink: /2017/07/17/activity-7-last-week-dev-logs-2/
description: "Hi everyone, welcome to a new edition of the Activiti 7 Dev Logs #2 (10/07/17-16/07/17). We keep crunching code based on our short term roadmap for…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "engine"
  - "English"
  - "Java"
  - "microservices"
  - "process"
  - "spring cloud"
  - "workflow"
  - "community"
  - "open source"
  - "roadmap"
  - "update"
original_url: https://www.salaboy.com/2017/07/17/activity-7-last-week-dev-logs-2/
---

Hi everyone, welcome to a new edition of the Activiti 7 Dev Logs #2 (10/07/17-16/07/17).

We keep crunching code based on our [short term roadmap](/2017/07/05/activiti-7-kick-off-roadmap/) for Activiti 7. We started to see some light at the end of the tunnel, and there will be more blog posts about the new HAL API draft and the IDM integration with [Keycloak](http://keycloak.org) later this week. This is a short update about what we did last week.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) was adding the new REST API that generates JSON/XML/SVG for Process Definitions and SVGs for Process Instances. We are trying to provide a process diagram in a more flexible format (SVG) than a PNG/JPEG image. We wanted to analyze the complexity of providing SVG generation in the backend in contrast with client side generation, which should be possible as well. [You can track his work here](https://github.com/Activiti/Activiti/pull/1254).

[@gmalanga](https://github.com/gmalanga) (our brand new community contributor) started working on providing a new endpoint for getting meta information about Process Definitions such as required roles and users, User Tasks, Services Tasks, delegates/connectors required, etc. This will helps us to understand more about our runtime bundles for smart deployments in the future.

[@abdotalaat](https://github.com/abdotalaat) (a new community member as well) was working in a PR related to code quality, removing dead code and making sure that our tests improve their quality. [You can check his work here](https://github.com/Activiti/Activiti/pull/1247).

[@erdemedeiros](https://github.com/erdemedeiros): was adding new entry points to the REST HAL API, moving legacy REST API to [activiti-compatibility](https://github.com/activiti/activiti-compatibility) repository and now he moved to work with the initial PoC of the new History/Audit module. [With Salaboy we are working in this branch.](https://github.com/Activiti/Activiti/tree/history-refactoring)

[@ryandawsonuk](https://github.com/ryandawsonuk) was adding a sample Keycloak integration for the new REST API for authentication and capturing users for actions such as recording process initiators. The integration is almost done and now we need to figure out the structure of the different modules and how these modules will integrate into end users applications. [You can follow the work and the discussion here.](https://github.com/Activiti/Activiti/pull/1246)

[@Salaboy](http://twitter.com/salaboy):  I was working on the REST APIs refinements and overall project clean ups and structures. We are getting quite close to get our initial HAL APIs initial draft, and we will be sharing more about this soon. I finished my first take on the History/Audit and Query modules and now Elias is taking that over for pair reviewing and improvements. [Some of my work is already in master for the API and there were some more cleanups being reviewed here.](https://github.com/Activiti/Activiti/pull/1253)

As a side note we are now using GitHub Projects to track our and community contributions so feel free to get in touch if you find something there that you want to work on:

<https://github.com/Activiti/Activiti/projects/1>

As usual feel free to join us in our Gitter channel for further discussions and collaborations:

<https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link>

Stay tuned!
