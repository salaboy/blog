---
title: "Activiti @ London uServices Meetup 7/3/18"
date: 2018-03-12 08:03:16 +0000
permalink: /2018/03/12/activiti-london-uservices-meetup-7-3-18/
description: "Last week (Wednesday), the Activiti team presented at the London Microservices Meetup. We did 3 sessions: 2 lighting talks and one full session."
tags:
  - "activiti cloud"
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "community"
  - "community training"
  - "engine"
  - "English"
  - "Java"
  - "kubernetes"
  - "process"
  - "workflow"
  - "cloud native"
  - "docker"
  - "k8s"
  - "meetup"
  - "microservices"
  - "open source"
  - "spring cloud"
original_url: https://www.salaboy.com/2018/03/12/activiti-london-uservices-meetup-7-3-18/
---

Last week (Wednesday), the Activiti team presented at the [London Microservices Meetup](https://skillsmatter.com/skillscasts/11625-cloud-native-java-for-kubernetes). We did 3 sessions: 2 lighting talks and one full session. All the content was all about our Journey from being a simple Java Framework to a set of Cloud Native building blocks. This big change in architecture and technology stack pushed us to learn and deal with new challenges which are proving to be focal points if you want to provide solutions which targets "Planet Scale" (sic. from <http://kubernetes.io>).

As part of our work as Open Source enthusiasts and Activiti project members, our duty is to share with the wider community our path to the cloud and our solutions to the most common problems that you will face if you decide to take the same road.

@RyanDawson started with a quick intro about Kubernetes for Java Developers, you can find the article that he published in Dzone about this, if you are interested in getting a simple example up and running in 5 minutes: <https://dzone.com/articles/minions-in-minikube-a-kubernetes-intro-for-java-de>

You can find the recording of the session here: <https://skillsmatter.com/skillscasts/11623-kubernetes-for-java-developers>

I followed up with an introduction to the Spring Cloud Kubernetes project, where we are participating with contributions and PRs. We believe that this project is the glue between the Spring Cloud and Kubernetes communities.

You can find the session recordings here:

<https://skillsmatter.com/skillscasts/11624-spring-cloud-kubernetes-incubator#video>

and the slides here:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/90013545" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

I've extended Ryan's minions example to use the Spring Cloud Kubernetes Discovery service and Feign in order to consume those services without knowing where those services are living inside the Kubernetes cluster.

You can find the code of my example here:

<https://github.com/Salaboy/minions/tree/spring-cloud-k8s>

Then we jumped into the main session titled Lessons Learned: Spring Cloud -> Docker -> Kubernetes in the context of an OSS Project

Here you can find the slides:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/90030804" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

And the recording of the main session here:

<https://skillsmatter.com/skillscasts/11672-spring-cloud-kubernetes-incubator>

As we mention at the end of our presentations, if you are interested in these topics, get in touch (<https://gitter.im/Activiti/Activiti7>), we want to hear your journey to the cloud and see if we can collaborate to solve common challenges that we might have.

We are also looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
