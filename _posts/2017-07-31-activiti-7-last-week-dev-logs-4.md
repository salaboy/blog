---
title: "Activiti 7: Last week Dev Logs #4"
date: 2017-07-31 08:21:38 +0000
permalink: /2017/07/31/activiti-7-last-week-dev-logs-4/
description: "We are closing our 4th week (24/7/17 – 30/7/17) of work on the new Activiti 7.x project and we are moving fast to make sure that we provide a set of…"
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "engine"
  - "English"
  - "Java"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "bpmn"
  - "community"
  - "microservices"
  - "open source"
original_url: https://www.salaboy.com/2017/07/31/activiti-7-last-week-dev-logs-4/
---

We are closing our 4th week **(24/7/17 – 30/7/17)** of work on the new **Activiti 7.x** project and we are moving fast to make sure that we provide a set of robust services that are ready to be integrated in your existing micro services architecture. We have chosen a technology stack that relies on standard Spring mechanisms for integrations and topics such as: IDM, security, messaging and SSO.

This new month that is starting tomorrow will be all about introducing two new services called Audit Service & Query Service. These services are completely independant from any process engine instance and will be in charge of aggregating information for different users (applications) to consume. These new services will allow us to remove the responsibility from the process engine to keep track of auditing and to deal with complex queries for different types of clients.

Here is what we were up to this last week:

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) added new ProcessDiagramGenerator for new REST API that generates SVG for Process Definitions and for Process Instances. Next, he is creating new REST API that provides xml/json of Process Definitions.

[@gmalanga](https://github.com/gmalanga) was fixing some issues related to the endpoint for metadata process definition, then moved to integrate elasticsearch as repository for the query service. Still progressing with the elasticsearch integration.

[@abdotalaat](https://github.com/abdotalaat) was working in a PR related to code quality, removing dead code and making sure that our tests improve their quality.

[@fcorti](https://github.com/fcorti/) The first version of the Emergency Call Center process example has been completed at <https://github.com/Activiti/activiti-examples/tree/master/emergency-call-center>. This version of the process runs on Activiti 6 but in the next releases more support to a pure microservice architecture will be added.

[@erdemedeiros](https://github.com/erdemedeiros) worked on Audit module. The existent code was adapted based on the last changes from the master branch. Currently adding more integration tests for this module.

[@ryandawsonuk](https://github.com/ryandawsonuk) worked on the new activiti-services-query component, which will provide a way to query aggregated data consumed via an event stream. A structure has been put in place so that the default repository can be replaced with an alternative (e.g. elastic). Various approaches for providing a query DSL were evaluated and QueryDslPredicate was chosen.

[@salaboy](http://twitter.com/salaboy) was working on improving the Command Based Endpoints for interacting with the process engine as well as adding versioning to the Rest APIs controllers. With [@erdemedeiros](https://github.com/erdemedeiros) and [@ryandawsonuk](https://github.com/ryandawsonuk) started looking at the release process for maven central and some estimations on when a first version might be uploaded there. Pull requests are piling up so I spend some time reviewing and collaborating with [@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) and [@gmalanga](https://github.com/gmalanga).

We are evaluating the possibility of making another community workshop the 21st August in Central London (Near Oxford Circus Tube Station). You are all invited to come and join us while we work that day. This is a great way of getting introduced to the work that we are doing and to join the community. If you have troubles convincing your boss about how that is valuable you can get in touch and we can help you with that as well. :)

I will publish soon a new updated roadmap blog post based on the work that we did for Milestone #0.
