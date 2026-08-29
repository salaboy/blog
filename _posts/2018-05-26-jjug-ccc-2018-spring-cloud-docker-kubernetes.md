---
title: "JJUG CCC 2018: Spring Cloud -> Docker -> Kubernetes"
date: 2018-05-26 08:00:05 +0000
permalink: /2018/05/26/jjug-ccc-2018-spring-cloud-docker-kubernetes/
description: "We (@daisuke_yoshimo and myself) presented our lessons learned about Spring Cloud, Docker and Kubernetes while designing, implementing and testing…"
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "engine"
  - "English"
  - "event"
  - "Java"
  - "knowledge engineering"
  - "kubernetes"
  - "open source"
  - "process"
  - "spring cloud"
  - "workflow"
  - "activiti cloud"
  - "cloud native"
  - "conference"
  - "containers"
  - "docker"
  - "jenkinsx"
  - "microservices"
original_url: https://www.salaboy.com/2018/05/26/jjug-ccc-2018-spring-cloud-docker-kubernetes/
---

We ([@daisuke_yoshimo](https://twitter.com/daisuke_yoshimo) and [myself](http://twitter.com/salaboy)) presented our lessons learned about Spring Cloud, Docker and Kubernetes while designing, implementing and testing [Activiti Cloud](http://activiti.org).

[gallery ids="4320,4321,4322,4323,4324,4325" type="rectangular" orderby="rand"]

&lt;pictures coming soon&gt;

Here are the slides and the source code repositories to run the demo that we showed during the presentation which included [Jenkins X](http://jenkinsx.io) and [Spring Cloud Kubernetes](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes).

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/98864259" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

## Github Projects

These simple projects demonstrate the core technology that we are using inside [Activiti Cloud](http://activiti.org) to make it Cloud Native.

- Minion: <https://github.com/Salaboy/spring-cloud-k8s-minion>
- Boss: <https://github.com/Salaboy/spring-cloud-k8s-boss>
- Gateway: [https://github.com/Salaboy/spring-cloud-k8s-gateway](https://github.com/Salaboy/spring-cloud-k8s-gatewayhttps://github.com/Salaboy/spring-cloud-k8s-gateway)

In the following blog post you can find instructions about how to get these services running in your cluster: </2018/05/24/spring-cloud-kubernetes-example/>

Also if you are interested in [Jenkins X](http://jenkinsx.io) you can also find some instructions to get your cluster up and running here: </2018/05/15/activiti-cloud-jenkins-x-blueprint-in-aws-and-gce/>
