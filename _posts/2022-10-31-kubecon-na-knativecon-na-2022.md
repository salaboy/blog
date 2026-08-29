---
title: "KubeCon NA / KnativeCon NA 2022"
date: 2022-10-31 20:41:56 +0000
permalink: /2022/10/31/kubecon-na-knativecon-na-2022/
description: "This is a quick blog post about my experiences during the last week's KubeCon and KnativeCon NA."
tags:
  - "CD"
  - "cdevents"
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
  - "helm"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "tekton"
  - "book"
  - "conference"
  - "crossplane"
  - "functions"
  - "knative"
  - "kubecon"
  - "platform"
original_url: https://www.salaboy.com/2022/10/31/kubecon-na-knativecon-na-2022/
---

This is a quick blog post about my experiences during the last week's KubeCon and [KnativeCon](https://www.youtube.com/playlist?list=PLj6h78yzYM2ORhfy3tu0Hm7fSyVGupZpT) NA. It is not a secret that the success of these events is highly correlated with the people attending, but this time, the "hallway track" blew my mind 🤯 and I only have words of appreciation to everyone I crossed paths with.

Of course, there are some tech highlights, but I would start this blog post with the people who made a mark on me. All those who know me know that I am terrible at taking selfies, so, unfortunately, there are not many visual records of these chats.

Let me start by thanking [Stefan](https://twitter.com/the_sttts) and [Andy](https://twitter.com/andygoldstein) for some great talks about [#kcp](https://github.com/kcp-dev/kcp) and [#kube-bind](https://github.com/kube-bind/#kube-bind). (I did get my #kube-bind t-shirt in the end! 🥳) Of course, [Viktor](https://twitter.com/vfarcic), [Dan](https://twitter.com/hasheddan), [Nic](https://twitter.com/internegz), and [Jared](https://twitter.com/jbw976) from [#crossplane](https://crossplane.io), these folks have my utmost respect and [Rich](https://twitter.com/richburroughs) and [Fabian](https://twitter.com/fabiankramm) from [#vcluster](https://vcluster.com). ***I look forward to keeping working with you all!***

I will always be grateful to [Cheryl](https://twitter.com/oicheryl), [Katie](https://twitter.com/k_gamanji), [James](https://twitter.com/jamesmunnelly), [Kohei](https://twitter.com/_inductor_), and [Duffie](https://twitter.com/mauilion) for the very insightful conversations, introductions to other amazing people, and the invaluable advice they gave me.

I've also met a lot of local (UK/London) people that I will most likely be meeting again soon, like [Alex](https://twitter.com/AlexJonesax), [Carla](https://twitter.com/CarlaAtGG), [Abby](https://twitter.com/a_bangser), [Paula](https://twitter.com/PaulaLKennedy), [Tracy](https://twitter.com/tracymiranda), [Naadir](https://twitter.com/naadirjeewa), [James](https://twitter.com/jdrawlings), [James](https://twitter.com/jamesspurin) and [Lewis](https://twitter.com/denhamparry) (who I keep meeting no matter what I do to escape him 😅).

And, of course, the usual suspects:  [Evan](https://twitter.com/e_k_anderson), [Carlos](https://twitter.com/csantanapr), [Dr. Max](https://twitter.com/maximilien), Paul, [Maria](https://twitter.com/marianarra_), [Lance](https://twitter.com/lanceball), [Naina](https://twitter.com/madhatter_ns), [Roland](https://twitter.com/ro14nd), [Gabriel](https://twitter.com/Gabilloillo), [Lionel](https://twitter.com/lionelvillard), [Zbynek](https://twitter.com/zroubalik), [Murugappan](https://twitter.com/itsmurugappan), and the rest of the amazing [Knative Community](https://knative.dev).

It was great to finally meet in person, [Mark](https://twitter.com/m_f_), and meet [Spencer](https://twitter.com/spencerbgibb) again after almost 3 years of our joint session about Spring and Kubernetes (I remember that I included some [Jenkins X](https://jenkins-x.io)). I've also met [Bilgin](https://twitter.com/bibryam), [Mark](https://twitter.com/mfussell), and [Yaron](https://twitter.com/yaronschneider) from the [#dapr](https://dapr.io/) community, which whom I look forward to collaborating.

It was also mind-blowing that the amount of appreciation that I got after the Keynote session (with [Whitney](https://twitter.com/wiggitywhitney)) and meeting Cody  (conference organizer), Charlie (an old friend), and [Ricardo](https://twitter.com/ahcorporto) (conference co-chair) was definitely one of my personal highlights.

I am sure I forgot to mention loads of folks I've met, but I want to thank everyone with whom I crossed paths.

Finally, it was great to see a big push in the industry to protect people, especially OSS maintainers. Let's keep the ecosystem healthy!

### Tech trends and what's next

Ok, so two things were clear, `#crossplane` and `#argocd` are all over the place. This means provisioning infrastructure and using GitOps for infra and workloads is becoming more widely adopted. I liked Katie's presentation about bare-metal provisioning with Cluster API and Tinkerbell as it followed the same lines, provisioning clusters, no matter where they are, can be done in a declarative way and following a GitOps approach.

[Crossplane](https://crossplane.io) (and [ClusterAPI](https://cluster-api.sigs.k8s.io/user/quick-start.html)) and `#argocd` are usually glued under the Platform story (Internal Developer Platforms - IDPs). I was happy that our Keynote session resonated well with the audience as we focused on demonstrating these concepts in action.

Tools like `#crossplane` and `#argocd` are all over the place. This means provisioning infrastructure and using GitOps for infra and workloads is becoming more widely adopted. I liked [Katie's presentation about bare-metal provisioning with Cluster API and Tinkerbell](https://sched.co/182In) and `#argocd`. Provisioning infrastructure and using GitOps for infra and workloads are becoming more widely adopted, as there were several talks covering examples and different use cases. More recent projects like [#kcp](https://github.com/kcp-dev/kcp) and `#kube-bind` are already trying to tackle challenges that most platform teams and service providers will need to tackle in the next few years. Presentations like [Content Addressable CRDs by Dan](https://sched.co/182DE) and [Towards 1.000.000 clusters by Stefan](https://sched.co/182I7), covered real use cases and scenarios for which we are still trying to figure out tools to help Platform teams to build highly scalable solutions for their companies.

I was hyped to see the journey of companies like [Cruise](https://getcruise.com/) and to know their platform approach and that they will probably also be looking at [Knative](https://knative.dev).

WASM is a big thing, and it is something that we have been looking at closely with the Knative Functions community,  but after meeting several folks from the WASM community, I am hoping to see this done in the short term.

This makes a lot of sense for platform building too. I see a combination of tools that really plays nice with building platforms. I see collaborations in the ecosystem to make this easier for everyone involved for developers' tools Dapr, Knative (and functions), WASM can provide not only an excellent but also efficient developer experience. Tools like Crossplane, Cluster API, and KCP can give Platform engineers the necessary glue to enable these developer experiences while using GitOps tools to manage their environments and workloads.

I am looking forward to [KubeDay Japan](https://events.linuxfoundation.org/kubeday-japan/) to see what is going on there!

### Some Links and Pics

While we wait for the KubeCon videos, you can take a look at an interview that I did with the folks at Loft: <https://loft.sh/blog/interview-with-kubecon-keynote-speaker-mauricio-salatino-from-vmware/>

Keynote Video:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/eJG7uIU9NpM" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

You can also check the run demo from the Keynote by following this step-by-step tutorial: <https://github.com/salaboy/kubecon-na-keynote>

**KnativeCon Videos:** <https://www.youtube.com/playlist?list=PLj6h78yzYM2ORhfy3tu0Hm7fSyVGupZpT>

Check the book that I am writing and get a 35% discount by using the code **ctwkubecon22**: [Continous Delivery for Kubernetes](http://mng.bz/jjKP)

And check the official pictures from the event here: <https://www.flickr.com/photos/143247548@N03/52467386035/in/datetaken/>

[![Img 3088 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3088-edited.png)](/content/images/2022/10/img_3088.png)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/pxl_20221027_223312503-1.jpg)](/content/images/2022/10/pxl_20221027_223312503-1.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3090.png)](/content/images/2022/10/img_3090.png)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3094.png)](/content/images/2022/10/img_3094.png)[![Img 3096 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3096-edited.png)](/content/images/2022/10/img_3096.png)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3113.png)](/content/images/2022/10/img_3113.png)[![Img 3131 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3131-edited.png)](/content/images/2022/10/img_3131.png)[![Img 3134 edited](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3134-edited.png)](/content/images/2022/10/img_3134.png)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_0043.jpg)](/content/images/2022/10/img_0043.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_0039.jpg)](/content/images/2022/10/img_0039.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_0050.jpg)](/content/images/2022/10/img_0050.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_0023.jpg)](/content/images/2022/10/img_0023.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_6008.jpg)](/content/images/2022/10/img_6008.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_6002.jpg)](/content/images/2022/10/img_6002.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_5995.jpg)](/content/images/2022/10/img_5995.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_5969.jpg)](/content/images/2022/10/img_5969.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_5944.jpg)](/content/images/2022/10/img_5944.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_5941.jpg)](/content/images/2022/10/img_5941.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_5938.jpg)](/content/images/2022/10/img_5938.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3170.jpg)](/content/images/2022/10/img_3170.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3125.jpg)](/content/images/2022/10/img_3125.jpg)[![KubeCon NA / KnativeCon NA 2022](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/10/img_3061.jpg)](/content/images/2022/10/img_3061.jpg)
