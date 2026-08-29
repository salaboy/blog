---
title: "Knative OSS Diaries – week #20"
date: 2021-11-20 08:44:13 +0000
permalink: /2021/11/20/knative-oss-diaries-week-20/
description: "20 Weeks already! it is one of those things that feels like forever and at the same time it feels like I started yesterday."
tags:
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "spring cloud"
  - "book"
  - "CD"
  - "cloudnative"
  - "eventing"
  - "knative"
  - "serving"
  - "tekton"
original_url: https://www.salaboy.com/2021/11/20/knative-oss-diaries-week-20/
---

20 Weeks already! it is one of those things that feels like forever and at the same time it feels like I started yesterday. I guess that that's the feeling when you are learning everyday and there are tons of things happening and tons of things to do.

I am currently focused on writing some examples using Knative `func` and the chapters covering Knative for my [Continuous Delivery for Kubernetes book for Manning](http://mng.bz/jjKP). There are a lot of exciting things going on, the book allowed me to reach out to a lot of people to understand how they are using the tools that I am covering and also get in touch with the Open Source project maintainers for reviews and feedback.

Yesterday to close the week I participated into a Knative AMA (Ask Me Anything) with [Carlos Santana](https://twitter.com/csantanapr) from IBM and some very influential Knative people like: Matt, Evan, Dave, Ben, Omer among others and a group of around 20 listeners. It made me want to go back to do what I was doing in Clubhouse, earlier this year. The fun thing about these virtual spaces is that you always ends up learning something interesting or thinking about new topics that were not even in your radar. Carlos did ask me a very good question about Release Strategies with Event-Driven applications, and if I am covering that in my book. I wasn't planning to cover that specific scenario but now I will do some research and see if I can adapt my examples to support something that highlights Knative Serving and Eventing working together to cover this use case. Thanks [Carlos](https://twitter.com/csantanapr) for adding more work to my book! 🤓

[![Screenshot 2021 11 20 at 08.26.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/screenshot-2021-11-20-at-08.26.51.png)](https://twitter.com/salaboy/status/1461741585494913027?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1461741585494913027%7Ctwgr%5E%7Ctwcon%5Es1_c10&ref_url=https%3A%2F%2Fpublish.twitter.com%2F%3Fquery%3Dhttps3A2F2Ftwitter.com2Fsalaboy2Fstatus2F1461741585494913027widget%3DTweet)

On a completely different topic I've started researching how to create a simple Service Pipeline for `func` projects that can build a `func` project using the `func` CLI inside a [Tekton Pipeline.](http://tekton.dev) This is still Work in Progress (WIP) but I do feel that I am getting closer. <https://github.com/salaboy/func-oncluster-build-experiments> The objective here is to enable `func` users to have a remote build capability for their projects, when they have [Tekton](http://tekton.dev) installed in a Kubernetes Cluster. You can find the Proposal for this feature in the [README.md](https://github.com/salaboy/func-oncluster-build-experiments/blob/main/README.md) file inside the repo that I am using for the experiments.

I will keep this blog post short because I need to switch back and work on my [Kubernetes Community Day Guatemala](https://community.cncf.io/events/details/cncf-kcd-guatemala-presents-kcd-guatemala-profesionales/) presentation that is coming next Saturday 27th of November. The presentation will be in Spanish and I planed to talk about abstractions on top of abstractions and how the Kubernetes community is building an Open Cloud experience for developing, building, delivering and managing large scale Cloud Native application and platforms.

[![Mauricio salatino](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/mauricio-salatino.png)](https://community.cncf.io/events/details/cncf-kcd-guatemala-presents-kcd-guatemala-profesionales/)
