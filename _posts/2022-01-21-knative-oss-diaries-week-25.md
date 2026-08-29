---
title: "Knative OSS Diaries - week #25"
date: 2022-01-21 23:00:58 +0000
permalink: /2022/01/21/knative-oss-diaries-week-25/
description: "Week 25th is here and what a week! There is still a lot of planning going on, but I've been a bit busy coding and thinking about some upcoming examples."
tags:
  - "CD"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "community"
  - "docker"
  - "English"
  - "event"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "sig-events"
  - "tekton"
  - "book"
  - "CDF"
  - "cloudevents"
  - "eventing"
  - "k8s"
  - "knative"
original_url: https://www.salaboy.com/2022/01/21/knative-oss-diaries-week-25/
---

Week 25th is here and what a week! There is still a lot of planning going on, but I've been a bit busy coding and thinking about some upcoming examples. There are a bunch of initiatives happening that require a dedicated blog post, but here are some of the projects that are ongoing, being done in the open and that if you are interested you can help to learn more about the projects and the cloud-native ecosystem:

- Building Event-Driven application on top of Kubernetes and relying on the right abstractions
- Event-based system integrations and interoperability wtih CD Events from the CD Foundation and Knative
- CloudEvents Reminders PoC

### Building Event-Driven applications on top of Kubernetes relying on the right abstractions

This week I managed to get an example using [Knative Eventing](http://knative.dev) abstractions and actually swapping the underlying implementations, from the In-Memory Broker which I used to develop the application to production-grade tools like [RabbitMQ](https://knative.dev/docs/eventing/broker/rabbitmq-broker/) and [Kafka](https://knative.dev/docs/eventing/broker/kafka-broker/). I've tried documenting all the changes required on the application space to move from one implementation to the other, and there are actually no bigger changes needed.

If you are interested in trying this on your own Kubernetes Cluster you can follow the step by step tutorial here: <https://github.com/salaboy/from-monolith-to-k8s/blob/master/knative/knative-eventing-example.md>

Are you interested in contributing? Do you wanna try out the [Google Pub/Sub implementation](https://github.com/google/knative-gcp) and check what is needed for the same application to work?

### Event-based system integrations with CD Events from the CD Foundation and Knative

Ok so, how do you make all the [CNCF](http://cncf.io) projects interoperate? For solving real-life problems you will need to pick and choose your weapons from a [massive landscape](https://landscape.cncf.io/). But if these tools don't work or understand each other you will need to spend your business time in making sure they play nice with each other. That's exactly where the [Continuous Delivery Foundation](http://cd.foundation) [SIG(Special Interest Group) Events](http://github.com/cdfoundation/sig-events) comes into play. The SIG Events from the CD Foundation is focused on creating a [vocabulary](https://github.com/cdfoundation/sig-events/tree/main/vocabulary-draft) of [CloudEvents](http://cloudevents.io) related to software delivery, this includes dealing with source code all the way to running the services and maintaining them. For this reason, this week I've created an issue into the SIG to integrate Knative and find the right events that Knative Serving can emit and consume to interoperate with other tools. The issue covers basic use cases to prove that producing and consuming these events can help with real-life integrations, and why relying on events can help both producers and consumers of these events to have thinner and more decoupled clients.

Thanks to `ishankhare07` we have the first incarnation of a controller which listen and emit CloudEvents based on Knative Serving resources. We will be iterating this code (that you can find here: <https://github.com/salaboy/knative-serving-events-controller/commits/serving-controller>) until we have enough to create a proposal to the [Knative Sandbox](http://github.com/knative-sandbox) organization in Github.

I really hope to see the vocabulary created by the SIG-Events grows in 2022, if you are interested in this project please feel free to reach out to me or join the CD Foundation Slack organization.

### CloudEvents Reminder PoC

This is a much hipster project, as I found myself writing about Event-Driven architectures for my [CD for Kubernetes Book](http://mng.bz/jjKP) and I needed a simple service to emit CloudEvents based on a Cron Schedule. And if you know me, and you know Knative there is already something pretty similar called [Ping Source](https://knative.dev/docs/eventing/sources/ping-source/). This project, which is included with [Knative Eventing](http://knative.dev) allows you to create a Kubernetes resource that looks like this:

apiVersion: sources.knative.dev/v1 kind: PingSource metadata: name: &lt;pingsource-name&gt; namespace: &lt;namespace&gt; spec: schedule: "&lt;cron-schedule&gt;" contentType: "&lt;content-type&gt;" data: '&lt;data&gt;' sink: ref: apiVersion: v1 kind: &lt;sink-kind&gt; name: &lt;sink-name&gt;

As you can see, it allows you to set up a `cron-schedule`, exactly what I needed, plus a CloudEvent type and the data/payload for the CloudEvent that will be generated. Next, it allows you to specify a reference for the sink, this is very handy to validate that the Ping Source service, when generating a new event will emit it to a service that actually exists and it will not end up at `/dev/null`. Ping Source has been very valuable to test and troubleshoot event systems and the Knative Eventing infrastructure, and it overlaps 90% with what I needed, so you might wonder, why rewrite this marvellous piece of software?

Ping Source is a Kubernetes Controller, and Kubernetes controllers are cool, but they require special permissions to run and to interact with the Kubernetes Control Plane, and that's something that I don't want my CloudEvents Reminders service to do. The big difference between what I need and Ping Source is that I need something that is closer to the applications that I am building (for my [Continuous Delivery for Kubernetes book examples](http://github.com/salaboy/from-monolith-to-k8s)). The service that I am building is going to be pretty simple and instead of using Kubernetes resources will expose a simple API to create and manage reminders.  The input data will probably remain the same `cron-schedule`, `content-type` and `data`. I am still considering if it is really necessary to be able to specify the sink, as this component will not have access to the Kubernetes APIs, I will not be able to do fancy checks about if the target service exists or not. Because you can use Knative Eventing to route events and subscribe to different types, it should be easier to wire and route events in a declarative way than setting a different sink per reminder.

So let me ask you, do you think that this can be useful for your specific application or scenario? I am writing this small project in Go to improve my skills, learn about different libraries and also make sure that I keep this component generic enough to be used at the applications level. If you want to join forces and hack this little project, here is the repo: <https://github.com/salaboy/fmtok8s-reminders> , feel free to get in touch if you want to help out.

That's all for this week, next week, I promise there will be much more about `func`!
