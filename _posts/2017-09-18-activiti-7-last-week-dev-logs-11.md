---
title: "Activiti 7: Last week Dev Logs #11"
date: 2017-09-18 07:41:16 +0000
permalink: /2017/09/18/activiti-7-last-week-dev-logs-11/
description: "Last week (11/9/17 - 17/9/17) we (@ryandawsonuk and myself) made huge progress validating our new cloud architecture with our partners from Pivotal."
tags:
  - "activiti7"
  - "basic"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "event"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "spring cloud"
  - "workflow"
  - "workshop"
original_url: https://www.salaboy.com/2017/09/18/activiti-7-last-week-dev-logs-11/
---

Last week (**11/9/17 - 17/9/17**) we ([@ryandawsonuk](https://github.com/ryandawsonuk) and myself) made huge progress validating our new cloud architecture with our partners from Pivotal. We attended Pivotal Partner’s day and discussed with their engineers our plans to run Activiti Cloud on top of Kubernetes and leverage their APIs and integrations. As result, we will start testing [with Kubo, their flavour for Kubernetes which provides integration with their existing CloudFoundry infrastructure](https://pivotal.io/partners/kubo). This open the doors to a myriad of possible integrations with existing apps and their entire marketplace. You will see more about this soon. [In the meantime you can give it a try to our Kubernetes Example here.](/2017/09/11/activiti-cloud-meets-kubernetes-and-they-like-each-other/)

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) reviewed his PR for Mongo DB and [@gmalanga](https://github.com/gmalanga) is updating his PR based on [@erdemedeiros](https://github.com/erdemedeiros) feedback.

At the same time, [@igdianov](https://github.com/igdianov) is working in finishing our first approach to [GraphQL](http://graphql.org) so we are looking forward to his PR this week.

We are working hard to get our release process sorted out to make sure that you can consume all of our artifacts from Maven Central. This require us a huge effort in setting up several builds and CI pipelines to coordinate all the new repositories and artifacts, you should expect a blog post about this during the week as soon as we finalize some extra details.

[We are also structuring our GitBook to make sure that we cover the most important topics about Activiti and Activiti Cloud.](https://www.gitbook.com/book/activiti/activiti-7-developers-guide/details) We will appreciate your feedback, comments, and suggestions about which topics should be covered in such book.
