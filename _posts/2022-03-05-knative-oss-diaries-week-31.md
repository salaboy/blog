---
title: "Knative OSS Diaries – week #31"
date: 2022-03-05 10:36:39 +0000
permalink: /2022/03/05/knative-oss-diaries-week-31/
description: "This week was wild too, but I think the highlight was to visit the VMware London offices and meet the RabbitMQ folks."
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "event"
  - "func"
  - "go"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "cdevents"
  - "eventing"
  - "knative"
  - "kubecon"
original_url: https://www.salaboy.com/2022/03/05/knative-oss-diaries-week-31/
---

This week was wild too, but I think the highlight was to visit the [VMware London offices](https://www.vmware.com/uk.html) and meet the [RabbitMQ](https://www.rabbitmq.com/) folks. I managed to spend some time looking into the guts of the [Knative Eventing RabbitMQ Broker implementation](https://github.com/knative-sandbox/eventing-rabbitmq) and while I still consider myself a newbie, I think that I am getting to understand the current state of the broker implementation.

A very early draft of a diagram that I managed to draw while looking at the code with some team members:

[![Rabbitmq knative eventing](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/03/rabbitmq-knative-eventing-1.png)](/content/images/2022/03/rabbitmq-knative-eventing-1.png)

It was great to see that [Gabriel from the Knative Eventing RabbitMQ](https://twitter.com/Gabilloillo) broker implementation was also working on getting the internal documentation to onboard new team members in the future. So expect more diagrams with more details. I find it amazing when looking at diagrams like this how easy it becomes to discuss Pull Requests or new issues when they pop up. This team is working hard on getting the first MVP for production-ready usage, [and you can find the project board with the missing bits here](https://github.com/knative-sandbox/eventing-rabbitmq/projects/1).

Are you passionate about message brokers? have you worked with [RabbitMQ](https://www.rabbitmq.com/) in the past? We are actively looking for new team members who want to join the Knative Community and help us to improve and maintain this Broker and the Knative Eventing specifications.

### Events, but the real ones, not the virtual ones

I am quite hyped about the fact that [KubeCon's collocated](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/) events are being organized. [KnativeCon](https://events.linuxfoundation.org/knativecon-europe/) seems to be going well underway and [CDEventsCon](https://github.com/cdfoundation/sig-events/issues/115) from the [CDFoundation](http://cd.foundation) is also moving forward! If you are using Knative or if you are interested in [CDEvents](https://github.com/cdevents) I would encourage you to submit proposals for both. I am trying to not submit, to leave space for community members and users to present but I know myself and at least a lightning talk I will end up submitting.

Have you booked your tickets already?

### Spring-Native 0.11.3 and Spring-Cloud 2021.0.1 are out

These are major updates from Spring Native and Spring Cloud, hence I've ended up [sending a PR for `func` spring boot templates](https://github.com/knative-sandbox/kn-plugin-func/pull/838) to update these new versions and also tried to simplify the templates in favour of having an external repository with more complex examples that you can find here: <https://github.com/salaboy/func-templates>

If you are looking to use Spring Native with Spring Cloud Functions, I believe these templates are a great starting point, and if you are looking to deploy your functions into a Kubernetes Cluster you should definitely be looking at [Knative `func`](https://github.com/knative-sandbox/kn-plugin-func/).
