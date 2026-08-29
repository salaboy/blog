---
title: "Knative OSS Weekly #42"
date: 2022-06-04 09:06:06 +0000
permalink: /2022/06/04/knative-oss-weekly-42/
description: "(KubeCon EU recordings are here && KubeCon NA proposals had been sent)! This is usually a big milestone as one cycle ends but immediately the next one…"
tags:
  - "CD"
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
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "sig-events"
  - "spring cloud"
  - "spring-native"
  - "tekton"
  - "Trips"
  - "CDF"
  - "functions"
  - "knative"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2022/06/04/knative-oss-weekly-42/
---

**(KubeCon EU recordings are here &&  KubeCon NA proposals had been sent)!** This is usually a big milestone as one cycle ends but immediately the next one begins. You can find some links to the recordings below.

This last week was a short week for me personally, as in the UK we had 2 national holidays, hence my week was supposed to end on Wednesday, but as usual, it didn't 🤓

### Knative Functions Working Group

Knative Functions WG was finally accepted as its own separate working group (it was part of the Knative Clients Working Group) hence we are now officially a separate and autonomous group with a standalone roadmap (more on this to come). I am really happy to be acting as a [Working Group Leader with Lance Ball from Red Hat](https://github.com/knative/community/pull/1032) who was leading the group since forever. I am hoping to bring to this group my experience from using and building Kubernetes tooling for the last 6 years, the experience that I've gained by using loads of different tools in the CNCF landscape and my experience of working on Open Source projects for the last 10+ years. I am also hoping to be able to bring more people to contribute to the project as the more views and opinions we can get together the better the outcome will be. And it goes without saying that I am happy to represent VMware and its product teams in this working group.

My focus in the following months will be all about making sure that we scope, implement and polish all the rough edges that we need to get out for having a 1.0 version of Knative Functions. There is a lot of work to do, but I am super excited to work with an amazing team with people from different companies all sharing the same goals: ***"Building an amazing function-based experience for developers on top of Kubernetes"***. If you feel close to these goals or if you want to start contributing to an amazing Open Source project please reach out ([@Salaboy](https://twitter.com/salaboy) on Twitter), or join the [Knative Slack Org](https://knative.dev/docs/community/contributing/#learn-and-connect).

### KubeCon Recordings & Next Week

Before jumping into the recordings, next week I will be attending and presenting at [CDCon 2022 in Austin, Texas, USA](https://events.linuxfoundation.org/cdcon/). The presentation is titled: [Expanding Interoperability in the CD Ecosystem](https://cdcon2022.sched.com/event/10fQP/expanding-interoperability-in-the-cd-ecosystem-ishan-khare-loft-labs-mauricio-salatino-vmware?iframe=yes&w=100%&sidebar=yes&bg=no) and I will be doing a live demo where at least 20 things can go wrong. Also because CDCon and the CD Foundation are close to my heart, I am preparing a plot twist at the end that I haven't finished yet.  Unfortunately, Ishan will not be able to make it in person, but I will be demoing the amazing demo that he put together.

[![Ishan khare porter mauricio salazar vmware](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/06/ishan-khare-porter-mauricio-salazar-vmware-1.png)](https://events.linuxfoundation.org/cdcon/)

I will be also replacing Kara, as she cannot make it in person, [in a panel discussion about interoperability in the CI/CD ecosystem](https://cdcon2022.sched.com/event/10UYm/toolchains-are-only-as-strong-as-their-weakest-link-a-discussion-on-interoperability-across-cicd-solutions-melissa-mckay-jfrog-andrea-frittoli-ibm-fatih-degirmenci-continuous-delivery-foundation-mauricio-salatino-vmware-justin-abrahms-ebay?iframe=no&w=100%&sidebar=yes&bg=no), which is pretty related to the topic of my presentation.

If you are around please reach out I will be probably hacking most of the week and I would love to hear about your Cloud-Native journey. This is a perfect time to meet up with people and see if we can do some Open Source together finally in person!

Now the videos. First the Overview and State of Knative session that I did with Carlos Santana. This was a presentation in the KubeCon maintainers track, meaning project-specific updates for the community about roadmap, how to contribute and I loved the fact that Carlos added a list of misconceptions about Knative, check the whole session here:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/e5CbFDq-Jos" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

Next my session with Thomas Vitale, I've blogged about this one a lot, but here you have the full session. I really love how the application survived 600 people playing at the same time, as the notifications went crazy on the screen, look at all that confetti! 🥳

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/OJwQkFl7gRY" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

Finally, I am posting again KnativeCon EU's first presentation after the keynotes, yes you guessed right Kantive Functions, intro, roadmap and demo. I'm really looking forward to doing this presentation with all the updates that we are planning for 1.0.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/5NQAAnZZors" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

See you all next week!
