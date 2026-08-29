---
title: "Knative OSS diaries – week #7"
date: 2021-08-28 07:57:25 +0000
permalink: /2021/08/28/knative-oss-diaries-week-7/
description: "Hey folks! Another pretty busy week in the Knative Community, but the highlight of the week came today in the form of a tweet…"
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "eventing"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "serving"
  - "spring cloud"
  - "cloudnative"
  - "k8s"
  - "knative"
  - "oss"
original_url: https://www.salaboy.com/2021/08/28/knative-oss-diaries-week-7/
---

Hey folks! Another pretty busy week in the [Knative Community](http://knative.dev), but the highlight of the week came today in the form of a tweet:

https://twitter.com/kelseyhightower/status/1430991382550745088?s=20

Great tweet from Kelsey, and definitely a big motivation to push forward for the 1.0 release of the project.

On my side, I've been pushing forward the conformance for Knative Eventing and for my surprise it was well accepted in the Eventing Working Group.

I've basically created the following repository trying to define a test plan for the resources defined in the Knative Eventing Spec: <https://github.com/salaboy/knative-conformance-experiment/tree/main/eventing>

An example of how the manual steps would work can be found here in the Control Plane Broker Lifecycle Section:

<https://github.com/salaboy/knative-conformance-experiment/blob/main/eventing/broker-lifecycle-conformance.md>

Another example from the Data Plane on Event Acknowledgement and Delivery Retry can be found here: <https://github.com/salaboy/knative-conformance-experiment/blob/main/eventing/event-ack-and-retry.md>

Next week, before moving to a different section I will be defining how the outputs for these tests should look like and trying to formalise that in the provided examples. Any opinions on how to generate outputs for these tests? Have you seen something similar? Do you have any experience with conformance reports? Get in touch, I would love to get external feedback.

The idea here, is to define the resources, the manual steps and the output required to validate conformance for Knative Eventing. This might seem trivial, but interpreting the specs, defining the prerequisites, defining the resources and the expected output is quite a challenging job. Based on this test plan, then we can automate using different tools and frameworks the expected behaviours defined in the spec text.

As part of thinking about testing and writing some manual scenarios, I've found an issue regarding the spec and I've reported it here: <https://github.com/knative/eventing/issues/5663> and I got assigned to it. Luckily for me, this is a community project so another community member (<http://github.com/matzew>) already started working on the fix, so I will be taking a look at his proposed solution, writing some tests and submitting a PR: <https://github.com/matzew/eventing/commit/1d245e894cb3a9a3952c471a7a594ec584f071a5>

I did manage to look deeper into Knative Controllers and I've managed to expand a bit more [the document that I am working on to describe the advantages](https://github.com/salaboy/opensource/blob/master/knative-controllers.md) of using the Knative Style controller. I've also started reviewing the [sample-controller inside the Knative-sandbox](https://github.com/knative-sandbox/sample-controller) org, which provides a couple of very useful examples to get you started. More on this to come soon!

[Spring One](https://springone.io) is coming next week (have you registered already?) and I am looking forward to see some of the sessions there, unfortunately this year I will not be presenting, but I am looking forward to the C4P next year, I do have the feeling that I will have a lot of interesting things to share.

See you all next week!
