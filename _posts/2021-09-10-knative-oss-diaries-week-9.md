---
title: "Knative OSS diaries – week #9"
date: 2021-09-10 17:51:26 +0000
permalink: /2021/09/10/knative-oss-diaries-week-9/
description: "Hey everyone in the community! This was a wild week in the Knative Community and KubeCon is approaching fast!"
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "eventing"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "cloudnative"
  - "go"
  - "knative"
original_url: https://www.salaboy.com/2021/09/10/knative-oss-diaries-week-9/
---

Hey everyone in the community! This was a wild week in the [Knative Community](http://knative.dev) and [KubeCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/?utm_source=Google&utm_medium=Search&utm_campaign=KubeConNA2021&gclid=Cj0KCQjwpreJBhDvARIsAF1_BU3DLStCBn2D8cPWXRdC521YzPaeG_ZOsxbyt4E6HEgcqyGELr2tsi0aAnjQEALw_wcB) is approaching fast!

This week I've presented for [Cloud Native Islamabad](https://community.cncf.io/events/details/cncf-islamabad-presents-closer-to-continuous-delivery-with-knative/), a presentation titled ***Closer to Continuous Delivery with Knative*** (slides at the end of this blog post). It was quite a short presentation and I will create a separate post about it when the video is available. For those interested in playing around with Knative in your own clusters you can follow this tutorial, to get an application (more complex than a simple hello world) up and running with Knative: <https://github.com/salaboy/from-monolith-to-k8s/tree/master/knative> , if you like the tutorial please help me with a Star and if you find issues or you have comments please create an issue in the repo and I will try to fix it.

On the project side: Conformance, Conformance and Conformance! A few updates on my side:

- **Knative Specs:** it seems that we are moving ahead with *Conformance Test Plans* to be added to the Knative Specs repository, so I will be probably refactoring this PR <https://github.com/knative/specs/pull/58> to fit the right directory structure.
- **Knative Serving:** It was an interesting week as I got a couple of PRs created for testing basic resources on the Knative APIs, what I've found so far is that the tests were not structured following the organisation of the spec, and I will be trying to align that while I am adding new tests:
  - **Knative Service GET + LIST + DELETE**: <https://github.com/knative/serving/issues/11924> (Closed / PR Merged)
  - **Knative Revision GET + LIST**: <https://github.com/knative/serving/issues/11947>
  - **Knative Routes GET + LIST**: <https://github.com/knative/serving/pull/11972>
  - As Result from auditing the spec I am creating the [following spreadsheet](https://docs.google.com/spreadsheets/d/1jSZuM_kOCEW1ZKEAsirOulmutQnWhFJhLKyn7k4bzKs/edit?usp=sharing) where I mark what is being covered by tests and what is missing with references to the previous issues. If you want to help me out or to pair program to get some of this work done, feel free to reach out.
- **Knative Eventing:**
  - More PRs are piling up with Manual Test Plans and I am hoping that we can start automating these tests soon
  - **Control Plane Error Signalling**: <https://github.com/knative/specs/pull/64>
  - **Content Based Routing**: <https://github.com/knative/specs/pull/56>
  - **Broker Lifecycle**: <https://github.com/knative/specs/pull/58>
  - We need to automate these manual test plans, we want to hear different options on how to do that, what I've heard so far is:
    - We can use BDD with [Ginkgo](https://github.com/onsi/ginkgo) https://github.com/onsi/ginkgo
    - We can go with simple fixed Go Tests, trying to reduce the complexity of how we do the checks
    - We can follow the approach implemented in [rekt](https://github.com/knative/eventing/tree/main/test/rekt): https://github.com/knative/eventing/tree/main/test/rekt

Next week, it feels like I will be going offline to prepare for **KubeCon**, I will be creating a recording just in case that I cannot make it to LA :(

### Slides from Cloud Native Islamabad Presentation

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/250161442" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>
