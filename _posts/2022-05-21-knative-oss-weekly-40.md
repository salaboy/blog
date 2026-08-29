---
title: "Knative OSS Weekly #40"
date: 2022-05-21 08:35:27 +0000
permalink: /2022/05/21/knative-oss-weekly-40/
description: "Week #40 is probably the most important week ever (on the community side) since I've joined the project."
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "crossplane"
  - "docker"
  - "English"
  - "event"
  - "eventing"
  - "func"
  - "go"
  - "knative"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "platform"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "tekton"
  - "workflow"
  - "community"
  - "kubecon"
original_url: https://www.salaboy.com/2022/05/21/knative-oss-weekly-40/
---

Week #40 is probably the most important week ever (on the community side) since I've joined the project. We had our first **[#KnativeCon](https://events.linuxfoundation.org/knativecon-europe/program/schedule/)** as a collocated event with KubeCon in Valencia, Spain. It was surreal to meet people who I've been working with for more than a year in real life. The vibe at KnativeCon was awesome, a full day about Knative, so I've learnt a lot and made a lot of new friends. Knative Videos are already up on Youtube!

https://www.youtube.com/playlist?list=PL3u18ntxxpFWoiYLbwVDpKlPCip9o6-BO

Big shout out to Lance, Zbynek, Carlos, Dr Max, Evan, Sebastien, Pierangelo, Ville, Scott, Matt, Whitney, Sameer, Ricardo, Roland, Maria, Niana, Aizmahal and all the folks who were there it was a wonderful experience to present with you all. My gut feeling tells me that we will do amazing stuff together! I had the honour to present with Lance Ball about Knative Functions, a project that is getting a lot of momentum. Check the slides, videos and some pictures below.

Happening at the same time as the first **[#CDEventsCon](https://events.linuxfoundation.org/cdeventscon/program/schedule/)** by the [CDFoundation](http://cd.foundation) happened, but shout out to Emil, Andrea, Erik, Shruti, Fatih and my co-speaker Ishan Khare who really rocked the stage with a mindblowing demo!

And then...

### KubeCon Valencia, Spain 2022

KubeCon deserves a special section, I had the pleasure to present twice on the day of my birthday (18th May), so I couldn't ask for a better gift than sharing the stage with two amazing co-speakers: Carlos Santana and Thomas Vitale.

Both sessions with a heavy focus on Knative and Knative Functions. With Carlos, we did the maintainers track for Knative, where I realized how important these tracks are at updating the community about the status of the project, and the roadmap and it is also a good opportunity to clear up common misconceptions about the project.

[![Screenshot 2022 05 21 at 08.30.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/screenshot-2022-05-21-at-08.30.18.png)](/content/images/2022/05/screenshot-2022-05-21-at-08.30.18.png)

With Thomas, we focused on building a CaaS and FaaS polyglot platform that simplifies the developer experience by letting them focus on writing code using the tools that they love. Knative Functions will take care of packaging and deploying their functions into a Knative-enabled Kubernetes Cluster. I still can't believe that we had 600 people in the room and around 1100 registered for the session, that is completely mind-blowing. We played a live game built using functions with at least 400 people concurrently and I am really looking forward to seeing the recording for that, as the number of notifications being pushed to the game leaderboard might have hit 2000. These really tested the limits of the confetti and toast react libraries 🥳

### Some shoutouts

It is impossible for me to summarize the number of amazing conversations that I had during the week, but a big shout out to these folks who spent a considerable amount of time (both physical and mental) trying to understand my ideas, proposals, predictions and opinions about what we should be doing as an industry, project, community and in general, how can we keep having fun with all these amazing projects.

Jared, Dan and Viktor from Crossplane went above and beyond in showing community appreciation. I am really looking forward to the "Registries after dark part 3" presentation from Dan. These folks are world-class engineers with a very clear purpose.

I also had a great time understanding more about [VCluster](https://github.com/loft-sh/vcluster), which is something I think we all need to be paying more attention to. If you are building tools for Kubernetes and you don't know about VCluster, how it works or how does it apply to your project you should be looking into it asap.

The [Chainguard](https://www.chainguard.dev/) folks (Matt, Scott, Ville) also shared a great number of insights that I will carry with me to my everyday tasks. Big shoutout to Matt: that short conversation about freezing containers and building a smart activator that can pull images to nodes to reduce cold starts was pretty awesome. Hanging out with Ville and Scott is always surreal, these folks are sooo deep into topics and have such a vast experience that I find myself always learning something new.

It was fun, as always, to meet Mr Rawkode, even if we didn't manage to spend much time together is always great to see what he is up to.

I had an amazing dinner with Gerhard and Johann (from [Cloud Native Day Switzerland](https://cloudnativeday.ch/#/)), once again, impossible to summarize, but the amount of experience that these two folks have and the amazing projects that they are involved in were combined into a two hours dinner + conversations that I really hope happens again. I looking forward to being able to attend Cloud Native Day Switzerland because it looks like a unique event that I don't want to miss.

It was a pleasure also to meet Maria and Aizmahal (from Google) who had been with the project for a long time and had made Knative the community better in so many ways! Thank you both!

I also met Ricardo, Pierangelo and Pablo on the topic of Knative Flows and Workflows, something that I am really excited about, as it is a topic that has been close to my heart for the last 12 years. I am sure that with these folks we will have loads of fun in the following months. I am really looking forward to building stuff and sharing with the community all this stuff that we are cooking together in the community!

Finally, yesterday night I made a new friend [Duffie](https://twitter.com/mauilion) (from Isovalent) that thanks to Michael we ended up in an Argentinian restaurant, once again having a 2hs+ conversation about Open Source, where are things going and life in general. These kinds of conversations don't happen often and when they happen they stay with you for quite a while. Something that surprised me about Duffie, besides being an amazing person,  was that you can clearly experience in real life his Twitter bio ***"I am committed to seeing others succeed"***, something that has become more and more relevant to me as I navigate the tech world and the kind of people that you want to be surrounded with.

(fun fact: when you mention that many people, it is a lot of work to link to their Twitter profiles, so I just gave up)

### Join Us

If you saw any of my presentations or if you are interested in the topics that I am usually blogging/writing/talking about please reach out, as there are a lot of opportunities to join these projects and actually be paid to do work on these amazing technologies. If you are a student and want to get some hands-on Open Source, Cloud and Kubernetes, this is a great opportunity to get started! DM in Twitter or just drop me a comment here.

### Slides, Pictures and Videos

KubeCon recordings are not still out but here are the slides, some pictures and the Devoxx UK recordings.

[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1463.png)](/content/images/2022/05/img_1463.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1469.png)](/content/images/2022/05/img_1469.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1471.png)](/content/images/2022/05/img_1471.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1472.png)](/content/images/2022/05/img_1472.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1473.png)](/content/images/2022/05/img_1473.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1477.png)](/content/images/2022/05/img_1477.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1478.png)](/content/images/2022/05/img_1478.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1483.png)](/content/images/2022/05/img_1483.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1485.png)](/content/images/2022/05/img_1485.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1487.png)](/content/images/2022/05/img_1487.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1500.png)](/content/images/2022/05/img_1500.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1504.png)](/content/images/2022/05/img_1504.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1505.png)](/content/images/2022/05/img_1505.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1507.png)](/content/images/2022/05/img_1507.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1540.png)](/content/images/2022/05/img_1540.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1548.png)](/content/images/2022/05/img_1548.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1551.png)](/content/images/2022/05/img_1551.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1553.png)](/content/images/2022/05/img_1553.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1555.png)](/content/images/2022/05/img_1555.png)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1538.jpg)](/content/images/2022/05/img_1538.jpg)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1537.jpg)](/content/images/2022/05/img_1537.jpg)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1488.jpg)](/content/images/2022/05/img_1488.jpg)[![Knative OSS Weekly #40](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/05/img_1481.jpg)](/content/images/2022/05/img_1481.jpg)

https://www.slideshare.net/salaboy/a-polyglot-developer-experience-on-kubernetes-kubecon-eu-valencia

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/251823705" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/251823713" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/251823721" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

Here are the Devoxx UK recordings:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/lWsiw_H5FpQ" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/EKDYE_dStTI" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>
