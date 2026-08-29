---
title: "Activiti 7: Last week Dev Logs #18"
date: 2017-11-06 08:26:23 +0000
permalink: /2017/11/06/activiti-7-last-week-dev-logs-18/
description: "Last week (30/10/17 - 5/11/17) we focused on releasing 7-201710-EA. You can read more about it here…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "process"
  - "rfc"
  - "roadmap"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "community"
  - "microservices"
  - "open source"
  - "progress"
  - "spring cloud"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/11/06/activiti-7-last-week-dev-logs-18/
---

Last week **(30/10/17 - 5/11/17)** we focused on releasing [7-201710-EA](http://search.maven.org/#search%7Cga%7C1%7Cactiviti%20cloud). You can read more about it here: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/releases/7-EA201710.html>

This release included the initial version of our Activiti Cloud Connectors starter for Spring Boot 2.x plus a lot of refinements for our Runtime Bundles and basic services.

[@willkzhou](https://github.com/willkzhou) ElasticSeach work for Query Module.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) working on [DB-based identity service](https://github.com/Activiti/Activiti/issues/1261) that uses old tables for Activiti 6 compatibility.

[@igdianov](https://github.com/igdianov) implemented GraphQL Subscription PoC with WebSockets endpoint using Stomp Relay to RabbitMQ message broker. Ready to discuss

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) exposed rest repository resource for a stub entity ProcessModel and created some basic contracts for these end-points for producer side

[@lucianoprea](https://github.com/lucianoprea) implemented Spring Rest Docs for all rest-api’s from the Activiti Cloud Services Runtime Bundle

[@balsarori](https://github.com/balsarori) working on form runtime modules and form-runtime spring integration

[@ryandawsonuk](https://github.com/ryandawsonuk) focused on testing and bug fixing before proving of the updated release process that handles the new repository structure and uses jgitflow

[@erdemedeiros](https://github.com/erdemedeiros) mainly worked with some bug fixes and release of version 7-201710-EA.

[@salaboy](http://twitter.com/salaboy) was away in NY and Washington DC visiting community members and customers using Activiti. I worked on release notes and tested our released artefacts.

This week is all about planning and making sure that we solve high priority issues that were discovered in our workshops. This month we are looking to make progress on the following RFCs, so feel free to get involved:

- [Runtime Bundle Security Policies](https://docs.google.com/document/d/1nug2pt60Mfcf1mvhzWIdTeXK-s8KgUV3OUBCUKfwpAI/edit#heading=h.1p1l8pm1pipf)
- [Process Model Service](https://docs.google.com/document/d/1lFjusnLjQkK13Z43L1CLa33tnsUQd1mI6xgBYrldkQs/edit#heading=h.xqvx4a2y7bl7)

Later today (or early tomorrow) there will be a Roadmap update blog post after our planning meeting.

Ping us in Gitter if you want to contribute: <https://gitter.im/Activiti/Activiti7>
