---
title: "Knative OSS Weekly #33"
date: 2022-04-02 08:40:36 +0000
permalink: /2022/04/02/knative-oss-weekly-33/
description: "I am finally back and this first week felt like 3 months already :). With KubeCon, KnativeCon and Devoxx UK approaching fast I've started meeting with my…"
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "community"
  - "English"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "sig-events"
  - "Trips"
  - "book"
  - "cloudevents"
  - "eventing"
  - "knative"
  - "kubecon"
original_url: https://www.salaboy.com/2022/04/02/knative-oss-weekly-33/
---

I am finally back and this first week felt like 3 months already :). With [KubeCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/?utm_source=Google&utm_medium=Search&utm_campaign=KC+EU+2022&utm_id=KC+EU+2022&gclid=Cj0KCQjw6J-SBhCrARIsAH0yMZg4zjYQ1-nGnOaAzzXCIeGaWMWMwMF19VHPACjwd2tQewtBd1ioKm8aAlhjEALw_wcB), [KnativeCon](https://knativeconeu22.sched.com) and [Devoxx UK](https://www.devoxx.co.uk/) approaching fast I've started meeting with my co-speakers to prepare. But I also received some great and exciting news about [Spring I/O Barcelona](https://2022.springio.net/) and [CDEventsCon (collocated with KubeCon)](https://events.linuxfoundation.org/cdeventscon/). This practically means that if you are coming to London or going to Valencia or to Barcelona in May we will cross paths. Feel free to [drop me a message](http://twitter.com/salaboy) if you want to catch up or if you want to get involved in any of these Open Source projects.

Ok, but what is going on in the projects?

### Func

A strong push for defining what is going to be included in 1.0 is happening, and I am more than happy to see how the [scoping document is evolving](https://docs.google.com/document/d/1o-oC9jvMJTYQHa6vm6NzpH9M-dTMoDr7oPMv84JYlKk/edit?usp=sharing). This initiative has also kickstarted the push for the creation of a specialized Functions Working Group which will have its own initiative leaders and bring the project closer to moving out of the Knative sandbox Github organization to become a project into the Knative Github org.

At the same time, a new bi-weekly meeting has been set to triage the issues in the backlog, you are all invited to participate and engage with this vibrant community. [Check the project calendar for more information here](https://knative.dev/docs/community/about/#community-calendar).

### Knative RabbitMQ Eventing Broker and Source

The [Knative RabbitMQ Eventing Broker and Source](https://github.com/knative-sandbox/eventing-rabbitmq) provide an MQ based implementation of the Knative Eventing Spec. This means that you use the RabbitMQ Broker and Source behind the covers to route events between your different application services or functions. The project is currently in the [Knative Sandbox](https://github.com/knative-sandbox/eventing-rabbitmq) Github org, but the work that is being done to improve its maturity is quite amazing. We are already seeing a [huge increment in performance](https://github.com/knative-sandbox/eventing-rabbitmq/tree/main/test/performance/broker-rmq) and the number of messages that this implementation can process. As I mentioned in my blog post [My Story with Knative](/2021/11/30/my-story-with-knative/), if you are working with MQ systems already this becomes a natural choice when moving to Kubernetes, as you can reuse the expertise of the teams managing the infrastructure associated with running the RabbitMQ implementation. If you have already a RabbitMQ Cluster and you want to consume messages from a Kubernetes Cluster reusing Knative Eventing constructs like Brokers and Triggers you can use the RabbitMQ Source to bring messages that don't conform to the [CloudEvents](http://cloudevents.io) specification into the Knative world.

### Demos

As you might expect for KnativeCon, CDEventsCon and KubeCon maintainers track there will be a lot of Knative. We want to make sure that developers understand the benefits of using Knative (both Serving and Eventing) when running workloads in a Kubernetes Cluster. Using a function-based programming model brings a lot of simplifications and reduces the cognitive load from developers to build complex distributed applications that can leverage eventing channels to perform asynchronous interactions which might be quite challenging to implement only with HTTP sync interactions. We will be aiming to show these tools in action for people to understand the entire lifecycle that tools like Knative Serving and Eventing enable. Keep an eye on this blog for more details about these Demos and examples, as these projects will be done in the open you will be able to play with them before the conferences.

### Upcoming

I am super hyped, next week  (7th April 3:30 pm UK Time) I am doing an [Enlighting Session about Knative Eventing with Whitney Lee](https://www.twitch.tv/wiggitywhitney). I've been writing a bit about the developer journey from HTTP sync interactions for distributed applications to how Knative Eventing can improve your services interactions by offering an Event-Driven approach, I hope to be able to publish a short/medium blog post soon.

On the same day (7th April) I am meeting with my friends for Syntasso to talk about [Kratix OSS](https://github.com/syntasso/kratix) and a topic that I love, which is building platforms as products or as services. We will be presenting also at [Devoxx UK](https://www.devoxx.co.uk/speaker-details/?id=4648) about how tools like [Kratix](https://github.com/syntasso/kratix) and [Cartographer](https://cartographer.sh/) are a must when you want to enable internal or external teams to have their environments ready to be productive.

I am also looking forward to joining the [CloudEvents CNCF Working Group weekly meetings](https://www.cncf.io/community/calendar/) to assist and collaborate with the specification and SDKs work as a VMware representative.

There is also some really cool news about the [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) book in the works so stay tuned!
