---
title: "Activiti Cloud Overview & BluePrint"
date: 2018-02-27 09:50:10 +0000
permalink: /2018/02/27/activiti-cloud-overview-blueprint/
description: "While we are working hard in getting our first Beta Release at the end of March (beginning of April) we wanted to share a couple of introductory videos…"
tags:
  - "activiti cloud"
  - "activiti7"
  - "bpmn2"
  - "cloud"
  - "engine"
  - "English"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "rfc"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "BPM"
  - "bpmn"
  - "cloud native"
  - "community"
  - "docker"
  - "microservices"
  - "open source"
original_url: https://www.salaboy.com/2018/02/27/activiti-cloud-overview-blueprint/
---

While we are working hard in getting our first Beta Release at the end of March (beginning of April) we wanted to share a couple of introductory videos about our work so far.

We have introduced some new concepts to align BPM concepts to the Cloud Native era and for that reason we wanted to share some examples of these concepts in action.

The first video go over some of the changes in paradigm that we adopted while creating Activiti Cloud and the technology choices that we made in order to provide solutions that can scale up to support global scenarios. Then it covers the main building blocks in Activiti Cloud covering our Infrastructural Services such as Identity Management, SSO, Services Registry, Configuration Server, Data Stores and Message Brokers and our Core Building Blocks such as Runtime Bundle, Query Service, Notification Service, Audit Service and Cloud Connectors.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/Yn2l0OK2Wa8" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

If you are interested in learning more about these concepts we recommend you to check our GitBook [Activiti & Activiti Cloud Developers Guide](https://activiti.gitbooks.io/activiti-7-developers-guide/content/)

While all these concepts are important to understand see them in action is way more valuable.

The second video covers our BluePrint: Trending Topic Campaigns Scenario ([Source Code](https://github.com/Activiti/blueprint-trending-topic-campaigns/tree/develop/) and [GitBook Section](https://activiti.gitbooks.io/activiti-7-developers-guide/content/blueprints/trending-topic-campaigns/TrendingTopicCampaigns.html)) where we aim to share a running example that shows most of our building blocks solving a real life situation that requires great amount of flexibility and dynamic scale. We will use these BluePrints to test our releases and to iteratively improve each of the building blocks. One key aspect of this BluePrint is that is designed with Kubernetes in mind as the main target deployment platform. This is an important aspect that highlight the intention of this fictional scenario. We are not building BluePrints as just cool demos, we want to make sure that these scenarios represent generic scenarios that you as implementor will face when using our building blocks. We use these scenarios to recognise pain points so we can fix them and improve the overall experience of using these Cloud Native services. As you will see in the video, the BluePrint app can be started as a set of Spring Boot apps, using Docker Compose or straight into Kubernetes where the first two are only recommended for development purposes, but if you are really thinking into going into production running in Kubernetes is a must. The BluePrint scenario is a great place to experiment performance, load and how, with different configurations, the topology of the services can behave differently to cover different scenarios.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/AVzSC_-ar2o" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

It is also important to notice that even if this BluePrint was built using Activiti Cloud you can use it to learn about Cloud and distributed architectures mainly because each Building Block is autonomous and packaged as a container, you can kill Runtime Bundles (campaigns), create replicas (to support more load) or even add new Campaigns dynamically and the whole system should adapt and the cluster will do its magic to make sure that each service has enough resources to operate correctly.

You can find the slide decks here

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/89060174" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

And if you have questions/feedback/comments please get in touch via our Gitter Channel: [Activiti - Gitter Channel](https://gitter.im/Activiti/Activiti7)
