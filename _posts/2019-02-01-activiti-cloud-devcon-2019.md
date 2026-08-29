---
title: "Activiti Cloud @ DevCon 2019"
date: 2019-02-01 09:38:48 +0000
permalink: /2019/02/01/activiti-cloud-devcon-2019/
description: "https://devcon.alfresco.com We had an amazing time here in Edinburgh, Scotland with the Alfresco community."
tags:
  - "Java"
original_url: https://www.salaboy.com/2019/02/01/activiti-cloud-devcon-2019/
---

https://devcon.alfresco.com We had an amazing time here in Edinburgh, Scotland with the [Alfresco community](https://devcon.alfresco.com). We (Elias de Medeiros and myself) presented what we are planning to do in 2019 and we announced live in the stage [Activiti Cloud RC1](/2019/01/30/activiti-cloud-rc1-released/). Ryan Dawson presented a quick tour around the main features in Activiti Cloud and the path to the Cloud from Activiti Core. It really felt great to come full circle, after presenting our ideas of [Activiti Cloud a year ago in Lisbon](/2018/01/17/lisbon-alfresco-devcon-2018/), we proved that we are going in the right direction and that we can deliver a major version in a year time. We have learnt a lot on this journey and 2019 will be all about solidifying these learnings in actual code/services being released every month.

![Activiti Cloud @ DevCon 2019](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/01/img_2052.jpg)![Activiti Cloud @ DevCon 2019](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/01/img_2053-1.jpg)![Activiti Cloud @ DevCon 2019](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/01/img_2055.png)![Activiti Cloud @ DevCon 2019](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/01/img_2051.png)![Activiti Cloud @ DevCon 2019](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/02/img_1162.jpg)

### Slides

**The future of Activiti Cloud OSS (Elias De Medeiros/Salaboy)**

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/129990329" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

As part of the presentation I've introduced a new (draft) Activiti Cloud Applications Operator with a set of (Kubernetes) Custom Resource Definition that you can find here: <https://github.com/salaboy/activiti-cloud-apps-operator>

**A whirlwind tour of Activiti 7 (Ryan Dawson)**

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/130012184" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

### Hackathon GraphQL notifications

During the hackathon the awesome work of Ryan Dawson and Igor Dianov to integrate GraphQL into our Trending Topics Campaigns example. The following video show how our Trending Topics Campaign Example is now also using graphQL subscriptions to be notified about Runtime Bundle events. You can see in the GraphIQL UI a subscription looking for all the PROCESS_COMPLETED events, which are pushed from the service side.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/bEO4EDSRQIc" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

We will be working hard on our GA release so please feel free to get in touch with feedback in [Gitter](https://gitter.im/Activiti/Activiti7?utm_source=share-link&utm_medium=link&utm_campaign=share-link) and test our latest RC1 release.
