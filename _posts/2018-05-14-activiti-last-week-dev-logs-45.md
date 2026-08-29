---
title: "Activiti: Last week Dev Logs #45"
date: 2018-05-14 11:28:50 +0000
permalink: /2018/05/14/activiti-last-week-dev-logs-45/
description: "Last week we kept pushing to get our initial version of the Applications Service into our Activiti Cloud Example."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "CD"
  - "cloud native"
  - "conference"
  - "docker"
  - "jenkinsx"
  - "microservices"
original_url: https://www.salaboy.com/2018/05/14/activiti-last-week-dev-logs-45/
---

Last week we kept pushing to get our initial version of the Applications Service into our Activiti Cloud Example. We currently have a [new repository containing the core logic for this service](https://github.com/activiti/activiti-cloud-app-service) and we are looking forward to test the initial version along with the other components this week.

We are also making progress on the [Process & Task Runtime API side](https://github.com/Activiti/incubator/tree/develop/activiti-process-runtime-api) and now we are going through the exercise of updating our services to use this new API layer. This will improve maintenance and enable a future backward compatibility path.

We have also migrated the Blueprint Scenario (Trending Topics Campaign) to use [Jenkins X](http://jenkinsx.io) so it can be deployed to public clouds such as AWS, AKS and GCE. A blog post is coming soon after this weekly update. And presented our lessons learned in [GeeCon 18' Krakow, Poland](/2018/05/11/geecon-18-lessons-learned-spring-cloud-in-activiti-oss/).

[@MiguelRuizDev](https://github.com/MiguelRuizDev) Worked on the display of pageable elements by the UI Angular app.

[@igdianov](https://github.com/igdianov) finished polishing up the Graphql Subscriptions PoC and now [@ryandawsonuk](https://github.com/ryandawsonuk) is working on merge those changes in our Develop branch.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) is working on making [acceptance-tests](https://github.com/Activiti/activiti-cloud-acceptance-tests) for Signal Throw Event Cloud Behavior.

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) working for adding controllers to organization service with support for both hal and alfresco output, also replaced rest template with feign client in organization service to not force aps to import rest template dependency, worked for modeling rest design in aps.

[@lucianoprea](https://github.com/lucianoprea) did some investigation on [#1893](https://github.com/Activiti/Activiti/issues/1893)

[@pancudaniel7](https://github.com/pancudaniel7) Readed basics of Keycloak, deployed Keycloak in Kubernetes.

[@ryandawsonuk](https://github.com/ryandawsonuk) Updated the activiti app service to use kubernetes metadata and reconcile this with an apps descriptor in a ConfigMap. Also attended London AWS Summit.

[@erdemedeiros](https://github.com/erdemedeiros) started using the new Java APIs inside the runtime bundle: this will help us to evaluate what is missing there. Attended AWS summit.

[@salaboy](http://twitter.com/salaboy) presented at GeeCon 2018 in Krakow, Poland. You can find the slides and some pictures here: </2018/05/11/geecon-18-lessons-learned-spring-cloud-in-activiti-oss/>

We keep getting community users messages that wants to try out our new infrastructure and services. We totally recommend to check out our Activiti Cloud Examples Github repository: <https://github.com/activiti/activiti-cloud-examples>  and our Gitbook’s Quickstart & Overview section: <https://activiti.gitbooks.io/activiti-7-developers-guide/content/getting-started/quickstart.html>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
