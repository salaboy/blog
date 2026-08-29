---
title: "Knative OSS Weekly #53"
date: 2022-08-27 08:14:40 +0000
permalink: /2022/08/27/knative-oss-weekly-53/
description: "Another week and more exciting news in the Knative Community. KnativeCon North America is happening as part of KubeCon NA and there is a new Knative…"
tags:
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "community"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "meetup"
  - "microservices"
  - "open source"
  - "oss"
  - "platform"
  - "spring cloud"
  - "spring-native"
  - "knative"
  - "kubecon"
  - "release"
  - "serving"
original_url: https://www.salaboy.com/2022/08/27/knative-oss-weekly-53/
---

Another week and more exciting news in the Knative Community. [KnativeCon North America](https://knativeconna22.sched.com) is happening as part of KubeCon NA and there is a new [Knative Functions release](https://github.com/knative-sandbox/kn-plugin-func) ready for you to try out.

This week I will try to keep it short, because it was a short week and I am starting a long weekend here.

### Knative Functions 0.26.0 is out

Yesterday (Friday 26th Aug) the `release-0.26` branch was created and the release artifacts were built by prow. We are anticipating this release to be the last release before `func` joins the Knative release train and align with its version numbers. You can check the release notes here: <https://github.com/knative-sandbox/kn-plugin-func/releases>

**Help us to test this release and please report any bugs, improvements or issues that you might find.** 🙏

This week I've created an `good-first-issue` for the Spring Boot fans out there. Check it out if you are interested to contribute back to the project: <https://github.com/knative-sandbox/kn-plugin-func/issues/1190>

### See you all at KnativeCon NA

[The schedule is live](https://knativeconna22.sched.com) and I am super excited to be presenting with my friend [Viktor Farcic from Upbound](https://twitter.com/vfarcic) about [Building Serverless Platforms with Open Source and CNCF projects](https://sched.co/1AGb2). Check the other amazing sessions here: <https://knativeconna22.sched.com>

Personally I am really happy that I will finally meet in person [Gabriel Freites](https://sched.co/1AGbf) (from the Knative Eventing RabbitMQ team) and [Sergio Mendez](https://sched.co/1AGbN) two amazing Open Source passionate developers. I am sure that there will be a lot of interesting talks between Gabriel and [Pierangelo from Red Hat](https://sched.co/1AGbi) who is also presenting about Knative Eventing.

Because I've been also involved with playing around with the [MetaController](https://metacontroller.github.io/metacontroller/guide/create.html) project I am really looking forward to see [Lance's demo](https://sched.co/1AGbH). If you are interested in MetaController, Knative Functions and Spring Boot you can check a short step-by-step tutorial that I wrote here: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/kubernetes-controllers/metacontroller/func-conference-controller>

### More about VCluster and Knative

Something that I've been very passionate recently is about using [VCluster](https://www.vcluster.com/) to share components across different Kubernetes Clusters. And my friend [Ishan](https://twitter.com/ishankhare07) from [Loft Labs](https://twitter.com/loft_sh) created the [Knative Serving](https://knative.dev) plugin for VCluster that I will be demonstrating at the [Loft London Meetup](http://bit.ly/3crCviu) up late in September. If you are interested in the internals of this plugin you can check the [Knative Meetup](https://www.youtube.com/watch?v=EY9RcZUZqBU) where this plugin was introduced. If you are interested in trying out VCluster I've created this step-by-step tutorial that you can follow here: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/platform/crossplane-vcluster>

With the Knative Serving VCluster plugin you can install Knative Serving in the Host cluster and this installation can be reused by all the VClusters, saving loads of resources to be installed in each VCluster. It is my firm belief that this pattern will become more and more common hence being able to have a Knative Serving plugin to experiment is key to discover the limitations and advantages of this approach. You can sign up for the in-person event here: [bit.ly/3crCviu](https://t.co/OowZ7ojLZ3)

https://twitter.com/loft_sh/status/1562766102035595266?s=20&t=U9mOdFfkI1wWIK1EXuAMYg
