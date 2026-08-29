---
title: "Knative OSS Diaries - week #22"
date: 2021-12-04 09:41:42 +0000
permalink: /2021/12/04/knative-oss-diaries-week-22/
description: "Another week went by and I feel that significant progress has been made. func and the PoC of integrating with Tekton for OnCluster builds is evolving."
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "cdevents"
  - "ci/cd"
  - "knative"
  - "tekton"
original_url: https://www.salaboy.com/2021/12/04/knative-oss-diaries-week-22/
---

Another week went by and I feel that significant progress has been made. `func` and the PoC of integrating with [Tekton](http://tekton.dev) for [OnCluster builds](https://github.com/salaboy/func-oncluster-build-experiments) is evolving. New use cases for the CLI are popping up and we need to evaluate how the CLI can be used in different contexts. If you are interested you can take a look at the [proposal document](https://docs.google.com/document/d/1iQFVtfsrYb4pp616h3B_IXQB1Cck1oxt7ypZyU8ChzE/edit?usp=sharing) that is growing and I am excited to see different integration approach and that the discussion has move to not only [Tekton](http://tekton.dev), but other pipeline engines as well.

I do only see benefits to pursuing an Event-Driven approach using [CD Events from the CDF](https://github.com/cdfoundation/sig-events) as I've tried to explain the previous [proposal document](https://docs.google.com/document/d/1iQFVtfsrYb4pp616h3B_IXQB1Cck1oxt7ypZyU8ChzE/edit?usp=sharing):

[![Using Events to trigger remote Builds and/or Deploys](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/12/screenshot-2021-12-04-at-09.02.37.png)](/content/images/2021/12/screenshot-2021-12-04-at-09.02.37.png)

*Using Events to trigger remote Builds and/or Deploys*

This might not be the initial implementation, but going closer to that approach makes complete sense to me.

This past week I had the pleasure to join [Viktor Farcic in a DevOps Toolkit AMA session](https://www.youtube.com/c/devopstoolkit) titled [Kubernetes for Developers](https://www.youtube.com/watch?v=sUnSSIM-rxw). You can watch the session below:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/sUnSSIM-rxw" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

During the session I covered a bit about my upcoming book: [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) and we tried to answer as many questions as possible about Kubernetes.

And with that, I was planning to call it a year and go on holidays, but life keeps itself interesting and for that reason on Monday I am joining [Salman Iqbal](https://www.youtube.com/c/SoulmanIqbal) on [Twitter Spaces](https://twitter.com/SoulmanIqbal/status/1465762775301558280?s=20) to talk about [Knative](http://knative.dev) and why you should be taking a look at the project. If you are interested in the project you can join us [Monday 6 Dec at 8:00pm UK Time](https://twitter.com/SoulmanIqbal/status/1465762775301558280?s=20).

[![Screenshot 2021 12 04 at 09.26.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/12/screenshot-2021-12-04-at-09.26.37.png)](https://twitter.com/SoulmanIqbal/status/1465762775301558280?s=20)

And with that, I am closing the year. I am taking some [time off to write](http://mng.bz/jjKP), make some [progress on the book examples](http://github.com/salaboy/from-monolith-to-k8s) and visit family and friends. For that reason ***Knative OSS Diaries*** will be on pause until the first week of January when I be back full time on the project. I hope everyone out there have a great and safe end of the year and as always feel free to reach out via Twitter [@Salaboy as my DM are open](http://twitter.com/salaboy).
