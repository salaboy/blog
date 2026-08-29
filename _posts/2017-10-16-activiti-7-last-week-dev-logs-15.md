---
title: "Activiti 7: Last week Dev Logs #15"
date: 2017-10-16 07:09:08 +0000
permalink: /2017/10/16/activiti-7-last-week-dev-logs-15/
description: "Last week the team spend some time working around system to system integrations. You can find more about our Activiti Cloud Connectors Strategy here."
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "case management"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "devlogs"
  - "docker"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2017/10/16/activiti-7-last-week-dev-logs-15/
---

Last week the team spend some time working around system to system integrations. You can find more about our [Activiti Cloud Connectors Strategy here](/2017/10/12/rfc-activiti-cloud-connectors/). This new strategy uses some abstraction layers to make sure that when we run inside a Kubernetes enabled environment our connectors can leverage Kubernetes Services. [The JHipster integration is also moving forward](https://github.com/Activiti/generator-jhipster-activiti), we now have clear plans of how that should look like and how our users will benefit from it (a blog post is coming about this as well). We are also very excited to see the team expanding with some experienced members from the Activiti 5 and 6 community (@balsarori , @lucianoprea and @constantin-ciobotaru ). We held some planning sessions to make sure that we can build all the new generation services in an autonomous way.

[@willkzhou](https://github.com/willkzhou) was looking at the ElasticSearch integration provided by [@gmalanga](https://github.com/gmalanga) to polish it and merge it into master.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) created [spring boot application for Audit Service with MongoDB](https://github.com/Activiti/activiti-cloud-audit-mongodb/pull/1) and [activiti-cloud-examples for Audit Service with MongoDB](https://github.com/Activiti/activiti-cloud-examples/pull/19). And, he refactored Audit Service with MongoDB to [remove Controller by using Spring Data REST.](https://github.com/Activiti/Activiti/pull/1500)

[@igdianov](https://github.com/igdianov) completed the graphql PoC for query module and started investigating using it to provide a notification mechanism.

[@ryandawsonuk](https://github.com/ryandawsonuk) created an example Activiti project using the [JHipster generator](https://github.com/Activiti/generator-jhipster-activiti) and added an Activiti Cloud example that uses the Spring Cloud Config Server.

[@erdemedeiros](https://github.com/erdemedeiros) worked on message queue implementation for service tasks. All the necessary information to retrigger the execution is now stored in the engine core database. The executionId  is no longer sent to the connector, only the correlation id.

[@salaboy](http://twitter.com/salaboy) worked on finishing the connectors blog post and example in github. We also had very interesting meetings with new/old members of the activiti community which will be joining us on daily basis: @balsarori , @lucianoprea and @constantin-ciobotaru.

This week we will be finishing another big repository refactoring to make sure that each of our services and starters are independent from each other and we as a team along with community members doesn’t block each other. If you experience issues around these, or if you were working against an existing repo that will not be longer be supported get in touch with us via Gitter and we will guide you to the new structure. A blog post will follow with the new structure as soon as it is ready.
