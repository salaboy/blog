---
title: "Knative OSS Weekly #43"
date: 2022-06-11 20:27:35 +0000
permalink: /2022/06/11/knative-oss-weekly-43/
description: "What a week!!!! Flying to Austin, Texas, for CDCon 2022 has been personally and professionally rewarding beyond my wild expectations."
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloudevents"
  - "community"
  - "crossplane"
  - "docker"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "platform"
  - "serving"
  - "sig-events"
  - "tekton"
  - "cdevents"
  - "cloud native"
  - "conference"
  - "functions"
  - "knative"
  - "Salaboy"
original_url: https://www.salaboy.com/2022/06/11/knative-oss-weekly-43/
---

What a week!!!! Flying to [Austin, Texas, for CDCon 2022](https://events.linuxfoundation.org/cdcon/) has been personally and professionally rewarding beyond my wild expectations. I've met a lot of great and crazy folks over here and I am pretty excited about the future of [CDEvents](https://cdevents.dev/), [Knative Eventing](https://knative.dev) and Continuous Delivery in general.

- Knative Functions and Knative Eventing at CDCon
- The Four Keys project
- Award, quotes and mentions

### Knative Functions and Knative Eventing at CDCon

If you have met me before in real life or read any of my blog posts or articles related to my book, you might already know that I believe that Knative is a fundamental tool to speed up your software delivery teams. ([Chapter 5, Release strategies](http://mng.bz/jjKP), goes into describing how you can use Knative Serving traffic splitting mechanisms to have more than one version of the service running at the same time). At CDCon, I was happy to represent the project and show with a live demo how you can leverage Knative Eventing to integrate different CI/CD tools in the CNCF and CDF ecosystems. I also highlighted the use of [CDEvents](https://cdevents.dev), which promotes having a common vocabulary that different tools can use to interact with each other.

Here you can find the slides for the talk, I will share the video as soon as it is online:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/251953521" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

[![Screenshot 2022 06 09 at 15.17.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-09-at-15.17.02.png)](/content/images/2022/06/screenshot-2022-06-09-at-15.17.02.png)

The scenario that I was highlighting in the demo was very related to platform engineering and how teams need tools to glue a bunch of Cloud-Native technologies together to enable developers with the environments that they need to work. Using CDEvents for such scenarios will give us a coherent view of what each tool is doing across multiple clusters.

After all the provisioning is done, we want to ensure that our developers don't need to waste time installing or even configuring their Kubernetes Clusters. For this reason, the demo went beyond creating cloud resources to configuring tools for the developers to use in this newly created environment.

Once the environment is ready, developers can use tools like Knative Functions to go from source to URL without worrying about writing Dockerfiles or YAML files.

[![Screenshot 2022 06 11 at 17.02.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-11-at-17.02.03.png)](/content/images/2022/06/screenshot-2022-06-11-at-17.02.03.png)

By using CloudEvents and CDEvents we can notify the Platform cluster about the activity happening in the environments using an event-driven approach.

Unfortunately, [Ishan Khare](https://twitter.com/ishankhare07) from [Loft.sh](https://Loft.sh) couldn't make it to the conference, but all the kudos for writing most of the demo code and all the controllers.

I did feel that I've learnt a lot, and after all the [CDEvents](https://cdevents.dev) workshop, I have a clear strategy to refactor this demo to be (K8s) Controller-less and completely based on functions.

[![Screenshot 2022 06 11 at 17.08.13 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-11-at-17.08.13-edited.png)](/content/images/2022/06/screenshot-2022-06-11-at-17.08.13.png)

But I want to take it a couple of steps further, and here is where I need to introduce the [Four Keys project](https://github.com/GoogleCloudPlatform/fourkeys), which got me super hyped this week.

### Four Keys Project

I remember when I started writing the book that I basically started implementing this, but I've given up because of way too much work and also because I've joined the SIG-Events at the CDF. All the work that I did around this topic ended up being the incarnation of the CDEvents Go SDK.

But you might be wondering, what is this guy talking about?

The [Four Keys project](https://github.com/GoogleCloudPlatform/fourkeys) refers back to the DORA metrics, which are:

- **Deployment Frequency**
- **Lead Time for Changes**
- **Time to Restore Services**
- **Change Failure Rate**

![Dora chart](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/GoogleCloudPlatform/fourkeys/raw/main/images/dora-chart.png)

The Four Keys project provides a Google Cloud based implementation of these metrics so you can monitor and improve these metrics to improve your software delivery practices. If this resonates with you, I invite you to check their GitHub repo and watch their presentation: <https://github.com/GoogleCloudPlatform/fourkeys>

That on its own is impressive but guess what.. we can make it better! Wouldn't it be great if we had the Four Keys for Kubernetes? When you look at the Four Keys project architecture, it is pretty clear to me that we can use [Knative Serving](https://knative.dev) for all the Cloud Run functions and Knative Eventing to abstract Pub/Sub and the event sources.

![Fourkeys design](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/GoogleCloudPlatform/fourkeys/raw/main/images/fourkeys-design.png)

I haven't figured out yet how to abstract Big Query, but by just making the execution environment Kubernetes-based, we will be enabling teams to improve their delivery practices. If we make sure that all events are CloudEvents and if we build the metrics using CDevents abstractions, then we are talking! These things get me so hyped that I just want to make it happen. I will be probably chasing [David Stanke](https://twitter.com/davidstanke) (which I need to thank a lot for the project introduction) and the Four Keys Project members to see how we can move things forward in the Kubernetes direction. It feels like almost all the pieces are there. If you are interested in helping, please do get in touch.

### Award, quotes and mentions

This week was crazy because I got the [CD Foundation](https://cd.foundation) **Most Valuable Contributor** award for the CDEvents project:

[![Img 1767 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1767-edited.png)](/content/images/2022/06/img_1767.png)

Receiving this award was such an honour and a big motivation to keep pushing forward.

It was also fun to do  a short interview with the folks from JFrog (THANKS [@lorilorusso](https://twitter.com/lorilorusso) for the encouragement!) about CDEvents:

[![Screenshot 2022 06 11 at 17.53.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-11-at-17.53.48.png)](https://twitter.com/i/status/1534272861413818370)

This week, I've also realized that I've reached 3K Twitter followers, which besides the large number, it means that I've met a lot of wonderful people interested in the same topics over the years. I had the luck to meet [David @rawkode](https://twitter.com/rawkode) once again and talk about all things [Pulumi](https://pulumi.com) and platform engineering. David, I hope you get better soon!

[![Screenshot 2022 06 11 at 18.01.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-11-at-18.01.55.png)](https://twitter.com/salaboy/status/1534249021308649472)

This blog ([https://salaboy.com](/__trashed/)) got mentioned in an InfoQ article about Open Source and how to grow your career by my buddy [@porcelli](https://twitter.com/porcelli)

<https://www.infoq.com/articles/staff-plus-open-source-engagement/>

[![Screenshot 2022 06 09 at 15.12.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-09-at-15.12.12.png)](/content/images/2022/06/screenshot-2022-06-09-at-15.12.12.png)

I also got two mentions at TechTarget. Thanks a lot to [Beth Pariseau](https://twitter.com/PariseauTT) for writing great articles/interviews about the conference.

[![Screenshot 2022 06 11 at 17.58.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-11-at-17.58.49.png)](/content/images/2022/06/screenshot-2022-06-11-at-17.58.49.png)

<https://www.techtarget.com/searchitoperations/news/252521264/New-CD-Foundation-GM-fights-CI-CD-pipeline-fragmentation>

[![Screenshot 2022 06 09 at 15.14.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-09-at-15.14.49.png)](https://www.techtarget.com/searchitoperations/news/252521264/New-CD-Foundation-GM-fights-CI-CD-pipeline-fragmentation)

<https://www.techtarget.com/searchitoperations/news/252521316/OpenTelemetry-inspires-CDFs-event-driven-architecture-plan>

[![Screenshot 2022 06 09 at 17.27.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/screenshot-2022-06-09-at-17.27.40.png)](https://www.techtarget.com/searchitoperations/news/252521316/OpenTelemetry-inspires-CDFs-event-driven-architecture-plan)

To close this very long blog post, let me add some pictures and a shoutout to all the CDF members who made this conference possible, in particular to [Fatih](https://twitter.com/fdegir), the new CD Foundation General Manager, [Tracy Regan](https://twitter.com/TracyRagan) from DeployHub and [Tracy Miranda](https://twitter.com/tracymiranda) from Chainguard, I am always learning from them.

![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0860.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0862.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0864.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0868.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0901.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0904.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0905.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0906.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0909.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0911.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0913.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0914.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0917.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0918.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0920.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_0921.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1732.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1734-1.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1735-1.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1737.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1739.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1741.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1742.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1752.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1754.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1767-1.png)![Knative OSS Weekly #43](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/img_1770.png)
