---
title: "Knative OSS Weekly #52"
date: 2022-08-13 11:16:52 +0000
permalink: /2022/08/13/knative-oss-weekly-52/
description: "52 weeks == 1 YEAR! But we definitely need a new way to measure time in Open Source communities because it feels like 5 years already!"
tags:
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "English"
  - "func"
  - "Java"
  - "kubernetes"
  - "open source"
  - "oss"
  - "serving"
  - "cloudnative"
  - "knative"
  - "Salaboy"
  - "weekly"
original_url: https://www.salaboy.com/2022/08/13/knative-oss-weekly-52/
---

**52 weeks == 1 YEAR!** But we definitely need a new way to measure time in Open Source communities because it feels like 5 years already! The amount of stuff that happened in this first year is crazy! I am eager to see what comes next in my second year of involvement with the project. A year ago, I couldn't have guessed all the amazing opportunities and people that have come my way.

Seeing the Knative project doing well is always fantastic, but we need you! This chart shows the CNCF project velocity based on the number of commits and authors per project; we are doing good there (top right corner brown blob), but we can always do better, and there is a lot of work to do.

[![Cncf velocity](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/08/cncf-velocity.jpg)](https://twitter.com/cra/status/1555172320657948672?s=27&t=fY1lvYqhZs62zucmVpZLOQ)

So before jumping into the main topics of this week, here are two `good-first-issues` if you are interested in contributing to Knative Functions:

- Improving docs on Kn and Func integration: <https://github.com/knative-sandbox/kn-plugin-func/issues/903>
- If you have Github actions knowledge or if you want to learn about them, check this issue: <https://github.com/knative-sandbox/kn-plugin-func/issues/982>

As always, if you are interested but you don't know how to make your first steps, get in touch, join the Knative Slack or drop me a DM via [Twitter @salaboy](https://twitter.com/salaboy), I will be more than happy to guide you.

Let's jump to the weekly news!

### RabbitMQ Knative Eventing Broker GA announcement

Congratulations to the RabbitMQ Knative Eventing Broker team for their GA release of this component. Coming from the Java and Spring Boot community, this is a significant milestone, as Spring Boot users who are already using RabbitMQ to implement driven architectures can now leverage Knative to remove the need for their services to embed the RabbitMQ clients. Knative Eventing is also a good choice if you evaluate using CloudEvents, as all the routing and filtering are based on CloudEvents.

You can read more about the details of this release on the official Knative Blog: <https://knative.dev/blog/articles/eventing-rabbitmq-announcement/>

This is another reminder to publish a blog post I've been writing for too long about why you should evaluate Knative Eventing if you use tools like Kafka, RabbitMQ, NATS, or other providers. This blog post is going to see the light soon. Fingers crossed.

### ToC meeting for Knative Functions

This week the Knative Functions Working Group had a presentation to update the Technical Oversight Committee about the progress of the project and the Roadmap to 1.0.0.

You can check the slides that were presented here:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/252535834" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

### MicroK8s and Knative

This might be another way to contribute if you are more interested in Kubernetes and how to install components to different Kubernetes distributions. MicroK8s has gained a lot of momentum lately, and it will be great to make sure that Knative Serving & Eventing can work out of the box with it. The way to do this is to create one MicroK8s add-on for Knative Serving and one for Knative Eventing.

You can find a tutorial on how to build your own MicroK8s add-ons here: <https://microk8s.io/docs/howto-addons>

As usual, the legend Carlos Santana is 5 steps ahead, and he already has a tutorial on [how to run Knative on MicroK8s](https://github.com/csantanapr/knative-microk8s). Hence it is all about packaging some of those steps as a MicroK8s add-on to make sure that the MicroK8s community can consume it quickly.

If you want to work on this, I am happy to pair up and get this done and published into the MicroK8s add-ons repository.

Let's start a new year of these weekly updates! See you all next week with more news!
