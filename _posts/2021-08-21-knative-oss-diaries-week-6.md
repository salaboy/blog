---
title: "Knative OSS diaries – week #6"
date: 2021-08-21 08:23:06 +0000
permalink: /2021/08/21/knative-oss-diaries-week-6/
description: "This was quite a week! Since I've joined the KnativeProject, this has been the week that I've learnt the most."
tags:
  - "Java"
original_url: https://www.salaboy.com/2021/08/21/knative-oss-diaries-week-6/
---

This was quite a week!

Since I've joined the [KnativeProject](http://knative.dev), this has been the week that I've learnt the most. I've started looking into how Controllers are built and wired up. Coming with a bit of background in KubeBuilder and Controller runtime, it took me a while to actually understand how things were working, since there is code generation, some Yaml decorations for CRDs and heavy use of injection (using a custom framework). After digging and trying to get my own controller up and running I can say that this is world-class engineering in the making. It is one of those weird moments when you realise that the lower layers of Knative are quite complex, and does pretty advanced reconciliation loops.

Because of all these learnings, I wanted to reflect in a document some kind of personal tutorial to create controllers using these frameworks and the Knative approach, so I've started an [MD file](https://github.com/salaboy/opensource/blob/master/knative-controllers.md) in my Open Source GitHub repo: <https://github.com/salaboy/opensource/> I can clearly see the different design decisions around creating and maintaining Kubernetes controllers compared with Java libraries and even controller-runtime, so I want to make sure that I document my learnings so I can spread the knowledge around with other folks working in the same space.

At the same time I did two meetups related with Knative:

- [Keptn Meetup about Building an Interoperable CI/CD Ecosystem](/2021/08/18/building-a-ci-cd-interoperable-ecosystem/)  
  ![Sig events functional](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/08/sig-events-functional.png)
- [Intro to Knative for Jump! Conference (Spanish for Argentina)](https://www.vamosalajump.com), slides here: https://www.slideshare.net/salaboy/intro-to-the-cloud-with-knative-spanish but I will create a new post with the recordings when they are available.

On the Knative Conformance side things are also moving forward, more of this to come next week. As I will be focusing on understanding how controllers are tested with the [reconciler-test](https://github.com/knative-sandbox/reconciler-test) framework and writing more about how the conformance program should work from the technical side. It feels like a lot of automation will be needed to create at least two Sonobuoy Plugins (one for Eventing and one for Serving) for each Knative release in the future. It is also interesting to decipher the guts of how to do proper Conformance testing based on an MD file that defines the Spec that you are trying to test against. Linking tests to English sentences that are going to change over time is quite a difficult challenge to solve, and I am interested to research a bit more about how other projects are doing that.

While writing this blog post I've decided to create a feature request in Knative Serving (which can include the creation of a new controller) so if you want to collaborate on that, that will be pretty awesome! Here is the link to the issue: <https://github.com/knative/serving/issues/11844>

That's all for this week, I will be back next week with more news about Conformance and Knative Controllers. Feel free to get in touch if you are researching or doing something around these projects.
