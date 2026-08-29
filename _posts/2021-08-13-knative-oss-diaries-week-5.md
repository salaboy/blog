---
title: "Knative OSS diaries – week #5"
date: 2021-08-13 17:35:32 +0000
permalink: /2021/08/13/knative-oss-diaries-week-5/
description: "Last week I didn’t post anything because I’ve spent my week off visiting my parents in the lovely city of Barcelona. Sunny and hot Barcelona!"
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "cloudnative"
  - "knative"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2021/08/13/knative-oss-diaries-week-5/
---

Last week I didn’t post anything because I’ve spent my week off visiting my parents in the lovely city of Barcelona.

[![Sunny and hot Barcelona!](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/08/img_4619.jpg)](/content/images/2021/08/img_4619.jpg)

*Sunny and hot Barcelona!*

This week I’ve managed to get back into conformance testing on the Knative Serving side and I’ve started looking into the Eventing side as well.

My experiments around Knative Serving conformance tests are going slow, mostly because troubleshooting CloudRun is quite hard. I am not complaining about CloudRun, but I am kinda new on using their APIs and also troubleshooting inside Knative tests. Luckily, with the help of some Googlers and more experienced Knative members, I’ve managed to go deeper into how the tests are written and how the interactions against the remote APIs are happening.

I am happy to see that there is a [Conformance TaskForce](https://docs.google.com/document/d/1-tfAalboi1e3Am8pxsFVVk5rmsW69oQEmLZMmJgwpsQ/edit) now meeting regularly and the efforts to make 1.0 out are looking really promising.

I am trying to follow the progress of different teams working on aligning the tests with the specs and a few issues where created this and last week regarding some mismatches:

- <https://github.com/knative/serving/issues/11710>
- <https://github.com/knative/serving/issues/11797>
- <https://github.com/knative/serving/issues/11801>

At the same time, yesterday, I got back to look into the [“reconciler-test”](https://github.com/knative-sandbox/reconciler-test) framework which some bits are pushed to upstream Kubernetes to standardise how conformance tests are written for Kubernetes controllers. Remember here that the approach is quite different from an End to End test (e2e) because conformance tests are focused on testing if the specs are followed. These specs, on purpose define features using different level of requirements, from MUST, SHOULD, MUST NOT, SHOULD NOT and OPTIONAL features. When writing tests for such specs we, as users, should be able to specify which levels do we want to target and get detailed results about if the specs are being met or not, and why.

While the Knative Serving Conformance tests are not written using the “reconciler-test” framework, I need to find out if someone else in the community is porting the existing tests or if that is something that is going to be done in the future.

I want to gain experience in writing these tests and get deeper into the “reconciler-test” framework next week, so I am hoping by next Friday to have more details to share about my learning on that path. [@n3wscott](http://twitter.com/n3wscott) shared a lot of interesting insights around how the “reconciler-test” framework is using: <https://github.com/knative/pkg/tree/main/injection> and how the Rabbit MQ conformance tests for eventing had been written here: <https://github.com/knative/eventing/tree/main/test/rekt> and here: <https://github.com/knative-sandbox/eventing-rabbitmq/tree/main/test/conformance>

Some links that I will be using to do this research are:

- Eventing Test Specification used to create the tests (WIP):<https://github.com/knative/specs/pull/38>
- Knative Specs Repository: <https://github.com/knative/specs/tree/main/specs>

Next week besides going deeper into conformance testing I will be presenting at the following meetups/conferences:

- **Keptn Meetup:** I will be talking about CI/CD tooling interoperability and showing a demo using the CDF SIG Events vocabulary in conjunction with Keptn, Tekton and Knative Eventing: <https://twitter.com/keptnProject/status/1422549563429244938>
- **Jump! Conference (Spanish)** I am delighted to be participating in a technology conference from my home country Argentina. I will be presenting an introduction about Cloud, Kubernetes and Knative. This is happening next Friday, and if you are a Spanish speaker you can join for free here: <https://www.vamosalajump.com> and <https://twitter.com/GoogleOSS/status/1426196857701781504?s=20>

As usual, if you want to get involved with Knative, feel free to reach out with a comment here or via twitter (my DMs are open)

See you all next week!
