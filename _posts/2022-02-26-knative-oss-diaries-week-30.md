---
title: "Knative OSS Diaries – week #30"
date: 2022-02-26 09:26:55 +0000
permalink: /2022/02/26/knative-oss-diaries-week-30/
description: "For 30 weeks I had the pleasure to work inside the Knative community and I got the luck to observe some very big milestones."
tags:
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "event"
  - "eventing"
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
  - "tutorial"
  - "book"
  - "CD"
  - "cloudnative"
  - "events"
  - "knative"
original_url: https://www.salaboy.com/2022/02/26/knative-oss-diaries-week-30/
---

For 30 weeks I had the pleasure to work inside the Knative community and I got the luck to observe some very big milestones. I had a blast helping with the 1.0 release, I got really excited with the CNCF incubation proposal, now the project is being accepted after receiving all the votes required to officially start the incubation process, but the biggest win so far, at least for me, is the people working in this community. I will not name names, because you all know who you are, highly talented and passionate engineers all working for different companies but wearing the open-source hat and defending the best interests of the project. I am really looking forward to keeping learning from you all and helping the project to move forward in what feels like a new journey in the CNCF.

### My first twitch stream

Yesterday night I did my first [Twitch.tv](http://twitch.tv) appearance for the ManningPublications channel. I did a recap of the chapters that are currently included in the MEAP program and I took the time to create an [MD file with this recap and all the links to the step-by-step tutorials](https://github.com/salaboy/from-monolith-to-k8s/blob/master/book.md). You can watch the stream here:

[twitchtv url="https://www.twitch.tv/manningpublications/v/1407738401"]

I am now looking forward to my next Twitch appearance with [@Wiggitywhitney](https://twitter.com/wiggitywhitney)  where we will be talking about Knative Eventing! More news about this soon.

### My first changelog Ship It! podcast

This week my appearance on the [ShiptIt podcast](https://changelog.com/shipit/41) went live and oh boy.. it really looks and sounds amazing. I don't think that I can write a good introduction for the podcast, besides saying we talk about a bunch of tools and approaches to deliver software on top of Kubernetes, from development tools, to pipeline engines and the challenges that you will normally face when having loads of services to deliver and maintain. I would appreciate feedback about the content and I am really looking forward to a follow-up maybe when the book is printed! You can hear the episode by clicking on the following image:

[![Screenshot 2022 02 26 at 08.50.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/02/screenshot-2022-02-26-at-08.50.18.png)](https://changelog.com/shipit/41)

### Knative Func is maturing!

Things are moving forward in the `func` project, I am super excited to see this developing and being part of the working group that is pushing for this to provide an amazing developer experience for developers.

I've been working on an example around glueing functions together and making sure that a `func` project also provides a routing mechanism to host multiple functions.

You can check this very [draft example, creating two functions and chaining them together by creating a broker and some triggers](https://github.com/salaboy/from-monolith-to-k8s/blob/master/knative/func-getting-started-with-examples.md).

Most recently, I've been working on [a proposal to refactor the format of the `func.yaml`](https://github.com/knative-sandbox/kn-plugin-func/issues/817) file that is used to configure the project, how it is built and all the runtime properties for the function project. I can see this becoming important in the near future if we want to implement controllers inside the cluster to understand function projects.

I've been also trying to understand different language templates and [I started a new repo with some function examples](https://github.com/salaboy/func-templates) to start building some context about how projects defining tons of function projects in different languages can optimize their developer's experience by providing out-of-the-box functions that they [can change instead of starting with an empty template. You can find the](https://github.com/knative-sandbox/kn-plugin-func/issues/839) Go template discussion here and the [spring boot template proposal here](https://github.com/knative-sandbox/kn-plugin-func/issues/832) too. If you are interested in these topics and want to contribute feel free to reach out, there is a lot of work to do and external opinions are more than welcome!

Finally, I wanted to close this weekly update with some big news, it feels like the **`func` project is ready to go 1.0**, hence I am expecting in the following weeks to start having discussions about what the working group wants to include in this big milestone.
