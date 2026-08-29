---
title: "🇺🇸 KubeCon NA 2024 recap"
date: 2024-11-18 14:01:30 +0000
permalink: /2024/11/18/kubecon-na-2024-recap/
description: "Ok, but what's all the fuss about it? For me, there were three topics that I was interested to see how they develop: - AppDev & Dapr Graduation…"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2993.jpeg
tags:
  - "kubecon"
  - "cloud native"
  - "kubernetes"
  - "2024"
  - "salt lake city"
  - "appdev"
  - "platforms"
  - "book"
  - "dagger"
  - "dapr"
  - "crossplane"
  - "events"
original_url: https://www.salaboy.com/2024/11/18/kubecon-na-2024-recap/
---

After thousands of exciting conversations, I survived KubeCon NA 2024. Personally, it was the most impactful and enriching KubeCon so far. I made many new friends and got to catch up with the usual cloud native suspects.

Ok, but what's all the fuss about it? For me, there were three topics that I was interested to see how they develop:

- Application Development Working Group, AppDeveloperCon Co-lo event and the Dapr Graduation
- Platform Working Group and Platform Engineering Day
- Extending Kubernetes to support a wide range of workloads (Multi-cluster, multi-tenant, AI, LLMs, Multi cluster Batch Jobs)

Let's cover these topics briefly. All slides, videos, and pictures can be found at the end of the blog post.

### AppDevs

With the last edition of AppDeveloperCon, and the topic graduating to a full track at KubeCon EU 2025 in London, we saw a large number of submissions about tools focused on improving developer's day to day operations including testing, observability and abstractions to facilitate the creation, operation and maintenance of cloud native applications.

As part of the [Application Development Working Group for the CNCF](https://tag-app-delivery.cncf.io/wgs/app-development/charter/) we have been working hard to get the following survey out. I would appreciate it a lot if you can fill it in. This will help the AppDev WG to define the next steps and start preparing for 2025 with hard data coming from the cloud native communities interested in application developers.

[![QR code DJLWGM6](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/QR_code_DJLWGM6.png)](https://www.surveymonkey.com/r/DJLWGM6)

I had the pleasure of hanging out with [Collin Lacy from Cisco](https://www.linkedin.com/in/colinjlacy/), [Jonas Kunz from Elastic](https://www.linkedin.com/in/jonas-kunz-8b8581167/), and my friend and co-chair of the WG [Daniel Oh from Red Hat](https://www.linkedin.com/in/daniel-oh-083818112/). All these conversations, including the most dense and compact chat with [Ryan Nowak from Microsoft](https://www.linkedin.com/in/ryan-nowak-3a2927185/) made me think about the gaps we currently have in unifying application portability across environments (blog post coming soon).

On completely different news, the new messaging around WASM was quite a shock to hear during the keynote on Friday, so I "ranted" a bit on X.

![🇺🇸 KubeCon NA 2024 recap](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_3040-1.PNG)

At the end of the day, this is great as the new messaging about decoupling application code from the runtime/environment has traction in all cloud native communities, not only WASM and mature tools like [Dapr](https://dapr.io) are already providing a solution for such concerns.

With [Dapr graduating from the CNCF incubation process](https://www.cncf.io/announcements/2024/11/12/cloud-native-computing-foundation-announces-dapr-graduation/), I can feel the momentum building up and I can't wait to see how this evolves until KubeCon London 2025.

Now that there is a whole dedicated track to Application Development, I am sure that tools like [Dapr](https://dapr.io) will shine. It was a real pleasure to have [Hugo Smitter from FICO](https://www.linkedin.com/in/hugosmitter/) present their platform use case at both Platform Engineering Day and AppDeveloperCon.

![Fico hugo](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/fico-hugo-1.jpg)

We also saw a sneak peak of the new Dapr Conversation API, from [Yaron Schneider](https://www.linkedin.com/in/yaron-schneider-2130b7a3/) Dapr co-creator. This new API brings caching and PII scrubbing to make it easy to interact with a wide range of LLMs and save money.

![Yaron dapr conv api](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/yaron-dapr-conv-api-1.jpeg)

I did two presentations at [AppDeveloperCon](https://colocatedeventsna2024.sched.com/overview/type/AppDeveloperCon)With:

- Intro to the App Dev WG with Daniel Oh
- Why does continuous profiling matter to developers? With Jonas Kunz from Elastic

![App dev wg](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/app-dev-wg.jpeg)![Salaboy jonas](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/salaboy-jonas.jpeg)

I look forward to seeing how the first Application Development Track shapes up for 2025. If you haven't submitted your presentation yet, please do so here: <https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/program/cfp/#submit-your-talk>

### Platforms

There was a lot of movement in the platform space last week. With the new announcement [around official CNCF trainings and certifications coming next year](https://training.linuxfoundation.org/platform-engineering-programs/).

I was lucky to meet the platform working group co-chairs and members and discuss what topics these training and certifications should cover in person. If you are interested in helping to shape the future of these certifications and trainings, please fill out the form here: <https://training.linuxfoundation.org/platform-engineering-programs/>

![Screenshot 2024 11 18 at 09.26.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/Screenshot-2024-11-18-at-09.26.17.png)

My presentation ["Taming your application's environments" at the SLCD track with Marcos from the Dagger team](https://www.youtube.com/watch?v=PSenmCMU5mQ) aimed to show how important it is for platform teams to craft experiences that can work across environments and smooth out the way of working, no matter which environment we are targeting.

![Marcos solomon salaboy](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/marcos-solomon-salaboy.jpeg)

I also had the pleasure of doing a quick presentation at the OpenShift Commons Gathering, a parallel event that is hosted by Red Hat to their OpenShift customers. Thanks a lot [Valentina](https://www.linkedin.com/in/valentina-rodriguez-sosa/) for organizing!

![Openshift](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/openshift.jpg)

I also did a book signing session of my book titled [Platform Engineering on Kubernetes](/book) with [Loft Labs](https://www.loft.sh/) that went extremely well. I had the pleasure to say hi to so many people, unfortunately I haven't got all the pictures yet, but if you stopped by the booth, thank you so much!

![Salaboy alexa](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/salaboy-alexa-1.jpg)![🇺🇸 KubeCon NA 2024 recap](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_5347.jpg)![🇺🇸 KubeCon NA 2024 recap](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_5350.jpg)

Kudos to my friend [Abby from Syntasso](https://www.linkedin.com/in/abbybangser/) and the Platform WG for organizing the CoffeeOps / Platform Coffee rounds at Cupla Coffee where they met every morning at 7:30 🕢 to move the working group discussions forward and catch up in person. I had the pleasure to have a quick but very enriching chat with [Erica from Tetrate](https://www.linkedin.com/in/ericahughberg/) and do a quick book signing thanks to Synstasso for the books too!

![Platform coffee](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/platform-coffee.jpg)

### Extending Kube

On the first day of the keynote, [Ricardo Rocha](https://www.linkedin.com/in/ricardo-rocha-739aa718/) did a live demo on scheduling batch jobs across multiple clusters in different cloud providers with an instant feedback mechanism using the [Kueue project](https://kueue.sigs.k8s.io/). While this approach follows projects like Cluster API of solving one problem across multiple providers, I liked the showcase of the project applied to a real-life use case at CERN.

I realized that most of the sessions that I wanted to attend were around tools that will focus on managing tasks across multiple Kubernetes clusters, multi-tenant solutions (including solutions that work on a single cluster), and how these tools relate to each other. I was interested to see which vendors are getting into this space and how new tools are created to solve core challenges that most companies will face when adopting Kubernetes at scale.

It was always good to catch up with [Stefan from Upbound/Crossplane/KCP](https://www.linkedin.com/in/stefanschimanski/) as I still believe that we should be investing more time on grow the capabilities in the management layer that is distributed across multiple Kubernetes Cluster (and other cloud resources). I was happy to see that the [KCP](https://github.com/kcp-dev/kcp) is extremely vibrant and moving forward.

![Stefan salaboy](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/stefan-salaboy.jpeg)![🇺🇸 KubeCon NA 2024 recap](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/kcp.jpeg)

I enjoyed the presentation from [James](https://www.linkedin.com/in/munnellyjames/) (creator of the [Cert Manager](https://cert-manager.io/) project, now working at Apple), who discussed the idea of introducing the concept of WorkingSpaces (a logical group of Namespaces) to the Kubernetes APIs server. It is interesting how large companies like Apple need to build these mechanisms outside the Kubernetes project (right now it is a proxy in front of the Kube API Server) to prove value before going through the hassle of proposing the changes officially to the project.

Finally, with the recent announcement of [KRO (Kubernetes Resource Operator) from Amazon](https://aws.amazon.com/blogs/opensource/introducing-open-source-kro-kube-resource-orchestrator/) makes me think we will have an exciting 2025 in this space. (👀 waiting for the Google announcement in the same space).

### Sum up

I am sure that I am forgetting tons of important conversations, topics and people, but I wanted to close this blog post with two things that I hope to see in London.

First, let's make sure we help new people join these communities. It can be really challenging for newcomers to understand how these very large events works. Going one step further and making sure that they know how to contribute or move forward with the project that they are interested in is key to not only being more inclusive but also making sure that the cloud native space remains vibrant. Meeting [Zoey](https://www.linkedin.com/in/iam-zoey/), a GSoC student and [Knative](https://knative.dev) contributor, was a pleasure and a reminder of how important it is to make first-time comers feel welcome and connected.

![🇺🇸 KubeCon NA 2024 recap](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_3049-1.PNG)

Finally, have FUN, make sure to connect with other people and have FUN! I think this picture summarizes it for me. Beating the classic The Simpsons video game with [Jared from Upbound](https://www.linkedin.com/in/jared-watts-jbw976/) at the Dapr + Crossplane Graduation party was one of the highlights.

![Jared salaboy](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/jared-salaboy.jpeg)

See you all in London! 🇬🇧🫖

### Slides

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/6570f2c50f674bd08be70183b8d4b141" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Why does continuous profiling matter to developers? #appdevelopercon"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/4873fe5c679042f896f077561201b796" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Taming you application's environments"></iframe></div>



<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" loading="lazy" referrerpolicy="strict-origin-when-cross-origin" src="https://www.youtube.com/embed/PSenmCMU5mQ?feature=oembed" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title='Taming Your Application’s Environments - Marcos Lilljedahl &amp; Mauricio "Salaboy" Salatino'></iframe></div>



<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/39457fc3fc574ebc9783938d1e7fe0ba" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Application Development WG Intro at AppDeveloperCon"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/b9f412429c4b48608bbc0bc69c07605d" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Making your applications cross-environment - OSCG 2024 NA"></iframe></div>

![IMG 2924 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2924-Large.jpeg)![IMG 2921 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2921-Large.jpeg)![IMG 2920 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2920-Large.jpeg)![IMG 2912 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2912-Large.jpeg)![IMG 2893 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2893-Large.jpeg)![IMG 2857 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2857-Large.jpeg)![IMG 2856 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2856-Large.jpeg)![IMG 2851 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2851-Large.jpeg)![IMG 2943 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2943-Large.jpeg)![IMG 2941 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2941-Large.jpeg)![IMG 2935 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2935-Large.jpeg)![IMG 2934 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2934-Large.jpeg)![IMG 2933 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2933-Large.jpeg)![IMG 2932 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2932-Large.jpeg)![IMG 2929 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2929-Large.jpeg)![IMG 2901 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2901-Large-1.jpeg)![IMG 2955 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2955-Large.jpeg)![IMG 2954 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2954-Large.jpeg)![IMG 2952 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2952-Large.jpeg)![IMG 2951 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2951-Large.jpeg)![IMG 2950 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2950-Large.jpeg)![IMG 2949 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2949-Large.jpeg)![IMG 2947 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2947-Large.jpeg)![IMG 2946 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2946-Large.jpeg)![Fico hugo](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/fico-hugo.jpg)![IMG 2966 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2966-Large.jpeg)![IMG 2965 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2965-Large.jpeg)![IMG 2964 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2964-Large.jpeg)![IMG 2962 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2962-Large.jpeg)![IMG 2961 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2961-Large.jpeg)![IMG 2958 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2958-Large.jpeg)![IMG 2957 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2957-Large.jpeg)![IMG 2956 Large](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/11/IMG_2956-Large.jpeg)
