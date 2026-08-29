---
title: "Knative OSS Weekly #39"
date: 2022-05-14 08:43:14 +0000
permalink: /2022/05/14/knative-oss-weekly-39/
description: "This week is more like a conference and community update than a Working Group update, but I still believe that is useful to share with you all."
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "crossplane"
  - "docker"
  - "engine"
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
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "tekton"
  - "Trips"
  - "book"
  - "conference"
  - "functions"
  - "knative"
  - "platform"
  - "serving"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2022/05/14/knative-oss-weekly-39/
---

This week is more like a conference and community update than a Working Group update, but I still believe that is useful to share with you all.

In the next sections I am sharing some links and highlights from Devoxx and the links to my sessions at KubeCon and collocated events:

- Bringing back the `func` to Devoxx
- Platform Building, Golden Paths, Kubernetes and APIs
- New friends, Old Friends and awesome talks

### Bringing back the `func` to Devoxx

This week I was thrilled to present for the first time at DevoxxUK London. I've shared the stage with two amazing co-speakers to talk about different but related topics. On Wednesday `we brought back the func` to the Devoxx Gallery Hall with [Thomas Vitale](https://twitter.com/vitalethomas). He played some funky grooves live while we were running our demos, it can't get better than that. We focused our presentation on Knative Functions with a heavy emphasis on the programming model and the tools that you can use to make your developer's life easier. There was a bit of Go and a bit more of Spring Cloud Functions and considering that we're all live demos everything worked as expected! We will be sharing more links and resources about the presentation, as there is still work to be done on the demo and its resources. Our intention is to make sure that you can run the demo in your own environment, so you can extend it and use it as a learning exercise. In the meantime, you can find some pointers here: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/game>

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/251781396" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

Check the slides as they contain discount codes for both books: [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) and [Spring Cloud Native in Action](https://www.manning.com/books/cloud-native-spring-in-action).

Regarding the books raffle, we haven't forgotten, but I wanted to write a function to process the scores and I haven't had the time to do that yet! But that is coming, so we will be contacting the winners with some codes to get your copies of the books!

### Platform Building, Golden Paths, Kubernetes and APIs

To finish with a very very high note, yesterday I did a presentation with [Paula Kennedy](https://twitter.com/PaulaLKennedy) from Synstasso about paving the golden path to production using Open Source tools. I did need to wear hats for this presentation and even changed them in real-time while creating GKE clusters with Knative Serving installed in them, so I was way out of my comfort zone, but as expected all worked out!

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/251781399" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

Same as with the previous demo, I am aiming to include these topics as part of my [Continuous Delivery for Kubernetes](http://mng.bz/jjKP) Book, hence there are a lot of refinements to do but you can find some initial pointers here: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/platform>

For this presentation, we used [Kratix](https://github.com/syntasso/kratix/) to glue [Crossplane](http://crossplane.io), GKE and Knative together and expose a concise API that App Development teams can use to provision entire environments with all their tools ready to be used. A super big shout out to [Chris](https://twitter.com/cghsystems) (all the effort behind the demo) and [Colin](https://twitter.com/hatofmonkeys) (great feedback and for having one of the best Twitter handles out there) from Synstasso!

### New friends, Old Friends and awesome talks

The conference was great, but as usual, what matters is the people. Here is just a brief list of my personal favourites:

- [James Rawlings's](https://twitter.com/jdrawlings) presentation about [Cartographer](http://cartographer.sh) made me understand a bit better the Supply Chain problem space and I think that we will be doing some hacking soon to get Knative Eventing and Cartographer closer together for multi-cloud setups.
- [Whitney Lee](https://twitter.com/wiggitywhitney) did a great session on Knative Serving, explaining the basic and not so basic concepts of how Knative Serving provides autoscaling, simplified YAML files definitions, traffic splitting, and rollbacks using some very creative scenarios.
- [Form3's](https://twitter.com/Form3Tech) (Payments/Financial in a multi-cloud setup) presentation about multi-cloud communications across cloud providers made me think a lot about the need to review and improve the [Knative Eventing NATS](https://github.com/knative-sandbox/eventing-natss) support, as they were heavily relying on NATS for intercluster communications. The use of Cockroach DB was also a pretty big thing, as they used that to provide SQL compatible support across cloud providers. I got very interested in their use of Cellium to connect distributed clusters in a secure way, hence this is a big wake up call for me to look into more details about the project. They haven't looked into Knative yet, but I have the feeling that they might look into it soon. They were also using Terraform (maybe Terraform Cloud) for their provisioning and deployment of Jurisdictions (A way to create tenants in multiple cloud providers).
- I had a very interesting chat with some folks (<https://twitter.com/Odyssiphos>) from [Zitadel.ch](http://zitadel.ch) (from Switzerland) who are building a distributed multi-region Identity Management solution as a SaaS on top of Kubernetes and using Knative. They are facing some very interesting challenges so I am hoping to learn more about their use cases to see if we can bring some of that expertise back to the Knative community. (for example Knative Eventing Pub/Sub implementations)
- Julien's (Microsoft/JHipster) presentation about innovation via accessibility was quite awesome and full of resources. All of these are great tools  `func` even if some of the resources were directly related to websites, I think we can apply the same principles for the `func cli`. On a more personal note, I had a chat about Dapr and Azure and I do feel the need to go deeper there too, as the Knative and Dapr communities had been always been compared, I do feel the need to get a bit more hands-on with these tools to have a better perspective. The excuses are lining up on the workflow side hence, this is coming my way.
- I've met with some old friends like Geoffrey DeSmet, [Jonathan Vila](https://twitter.com/vilojona), [Sanne Grinovero](https://twitter.com/sannegrinovero)  who are always fun to meet and see what they are up to.

To close this amazing week here are some pictures

[![Image from ios](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/image-from-ios-8.jpg)](/content/images/2022/05/image-from-ios-8.jpg)[![Image from ios](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/image-from-ios-7.jpg)](/content/images/2022/05/image-from-ios-7.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1433.jpg)](/content/images/2022/05/img_1433.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1430.jpg)](/content/images/2022/05/img_1430.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1437.jpg)](/content/images/2022/05/img_1437.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1417.jpg)](/content/images/2022/05/img_1417.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1678.jpg)](/content/images/2022/05/img_1678.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_4325.jpg)](/content/images/2022/05/img_4325.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1681.jpg)](/content/images/2022/05/img_1681.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1674.jpg)](/content/images/2022/05/img_1674.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_4326.jpg)](/content/images/2022/05/img_4326.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_4327.jpg)](/content/images/2022/05/img_4327.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1675.jpg)](/content/images/2022/05/img_1675.jpg)[![Knative OSS Weekly #39](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1671.jpg)](/content/images/2022/05/img_1671.jpg)

Next week KnativeCon, CDEventsCon and Kubecon EU! See you all next Saturday probably with more pictures. Now it's time to board my flight to Barcelona and get some slides ready!!
