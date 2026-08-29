---
title: "🇪🇸 DevBCN / KCD Barcelona 2024"
date: 2024-06-17 06:15:38 +0000
permalink: /2024/06/17/devbcn-kcd-barcelona-2024/
description: "Another DevBCN conference done! This year was special because the first KCD Barcelona happened."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1732.jpeg
tags:
  - "barcelona"
  - "conference"
  - "dapr"
  - "cloudnative"
  - "kcd"
  - "kcdbarcelona"
  - "kcdspain"
  - "event"
  - "kubernetes"
  - "community"
  - "days"
  - "2024"
  - "spain"
  - "devbcn"
  - "crossplane"
  - "knative"
  - "openfunction"
original_url: https://www.salaboy.com/2024/06/17/devbcn-kcd-barcelona-2024/
---

Another DevBCN conference done! This year was special because the first KCD Barcelona happened. I started the KCD Track on Thursday with a session about Serverless Platforms on top of Kubernetes.

![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1728.JPG)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1729.JPG)

I covered a set of projects associated with Serverless in the Kubernetes space.

I used the [Openfunction](https://openfunction.dev) project, which nobody in the room knew about, to show common tools that are glued together to build a serverless experience. I also discussed the trade-offs and challenges you will face when adopting complex tools like this.

Check the repository that I've created with a simple example using Openfunction:

**[GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s](https://github.com/salaboy/kcd-spain-2024/)**  
Examples used for KCD Spain 2024 - Serverless Platforms on K8s - salaboy/kcd-spain-2024

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/3a1997db72194724bd2c1b021a43540a" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="KCDSpain / DevBCN 2024: Serverless Platforms on Kubernetes"></iframe></div>

After covering the basics of Openfunction, I dug into the tools used behind the covers for platform engineers to get an idea of how these tools can be combined depending on their custom use cases.

To talk about these tools, I used the Example Voting App that you can run on your cluster here: <https://github.com/salaboy/example-voting-app>

In this example, I used [Knative](https://knative.dev) to deploy and autoscale the application services. I especially used the concept of "from Container to URL" to run the services and access them from a public URL.

Then, I discussed how the [Dapr](https://dapr.io) project can help developers access complex infrastructure so that their applications don't get tied to the environment where they are running.

Finally, I touch on [Crossplane](https://crossplane.io), to provision environments, infrastructure, and configurations to simplify not only the provisioning of complex setups but also to speed up teams with very well-defined use cases that just need higher-level abstractions to perform their day-to-day tasks.

It was great to see other presentations about [OpenTelemetry](https://opentelemetry.io/), [Crossplane](https://www.crossplane.io/), [ArgoCD](https://argo-cd.readthedocs.io/en/stable/), [Dapr](https://dapr.io), API Management tools, and security.

I did a dry run of the presentation before the conference, check it out and drop me a message if you have any questions about these projects or if you want to know more about something specific.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" loading="lazy" referrerpolicy="strict-origin-when-cross-origin" src="https://www.youtube.com/embed/OHIkBvVUkKE?feature=oembed" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="KCD Spain 2024 - Serverless Platforms on Kubernetes Demo Dry run"></iframe></div>

I also enjoyed chatting with [Marc Klefter](https://www.linkedin.com/in/marcklefter/) about Dapr and the CQRS pattern, which would be quite good to support and document using Dapr.

![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1734.jpeg)![Marc talk](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/marc-talk-1.png)

If you can attend DevBCN next year, I strongly recommend doing so. This conference promotes a wide range of topics and brings people from different roles together to discuss where the industry is going.

![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1710.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1720.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1721.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1726.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1739.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1737.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1731.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1730.jpeg)![<div class="kg-bookmark-title">GitHub - salaboy/kcd-spain-2024: Examples used for KCD Spain 2024 - Serverless Platforms on K8s</div>](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/06/IMG_1740.jpeg)

As always, I want to share my appreciation to [Jona](https://www.linkedin.com/in/jonathanvila/), [Nacho](https://www.linkedin.com/in/icougil/), [Anyul](https://www.linkedin.com/in/anyulled/) and all the organizers, volunteers and sponsors that made this conference possible one more year!
