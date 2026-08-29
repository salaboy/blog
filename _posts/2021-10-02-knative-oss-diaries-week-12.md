---
title: "Knative OSS diaries – week #12"
date: 2021-10-02 08:48:31 +0000
permalink: /2021/10/02/knative-oss-diaries-week-12/
description: "Another week went by and it has been busy over here in the Knative Project. This past week DevOps World happened and it was packed full of interesting…"
tags:
  - "cloud"
  - "cloud native"
  - "community"
  - "engine"
  - "English"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "ci/cd"
  - "cloudevents"
  - "cloudnative"
  - "eventing"
  - "knative"
  - "serving"
  - "update"
  - "weekly"
original_url: https://www.salaboy.com/2021/10/02/knative-oss-diaries-week-12/
---

Another week went by and it has been busy over here in the [Knative Project](http://knative.dev). This past week DevOps World happened and it was packed full of interesting presentations from a very vibrant community.

I had the pleasure to present with [Andrea Frittoli](https://developer.ibm.com/profiles/andrea.frittoli/) from IBM about the work that we did with the [CD Foundation](http://cd.foundation) [Events SIG (Special Interest Group)](https://github.com/cdfoundation/sig-events) in a presentation called [Using CloudEvents to Create an Interoperable CI/CD Ecosystem](https://www.devopsworld.com/agenda/session/581449) . I personally believe that the demo shows the potential that a standard vocabulary to express Continuous Delivery concepts based on [CloudEvents](http://cloudevents.io) will lead us to a more open and interoperable ecosystem, where teams can choose the tools that they most like and combine them in any way they need. If we are talking about Events, routing events and building Event Driven architectures, of course that the demo had Knative Eventing in it. The following diagram shows all the components that the demo used to connect [Tekton Pipelines](http://tekton.dev) with [Keptn](http://keptn.sh) by just using the [CDE SDK](https://github.com/cdfoundation/sig-events/tree/main/cde/sdk/go) and [Knative Eventing](https://knative.dev/docs/eventing/) for connecting things together.

![If you want to run this demo in your own environment check out the poc directory in the sig-events repository for instructions.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/cdfoundation/sig-events/main/poc/sig-events-functional.png)

*If you want to run this demo in your own environment check out the poc directory in the sig-events repository for instructions.*

The Demo shows how you can integrate Tekton Pipelines with Keptn orchestration events to drive an end to end process, from building a service to deploying it into a Kubernetes Cluster where Keptn will monitor how the new version is doing and possible trigger remediation flows when things go wrong. The Demo also shows manual intervention to decide when to promote the new version to a live environment, which in this case help us to separate the stages of the Keptn Sequence and the responsibility of each section (developers will create new versions of the services, operations teams will validate, run tests and then decide when to promote those new versions to live environments). You can find the slides from the presentation here:

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/250001325" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

As a long overdue side project, this week I've created a proposal for a new controller for Knative Serving that you can find here: [https://github.com/salaboy/knative-cloudevehttps://github.com/salaboy/knative-cloudevents-controller/issues/1nts-controller/issues/1](https://github.com/salaboy/knative-cloudevents-controller/issues/1)  . I find this project pretty simple and interesting to get started building Knative style controllers. It also help me to do some hacking with my new co-worker [Carlisia](https://github.com/carlisia) which brings a lot of experience from the [Velero](https://velero.io) team, another tools that I love. If you are interested in trying this new controller and help us building it, get in touch!

Changing topics, but still related with Events, the Knative Eventing Working Group has been busy find out missing bits and rough edges to be able to go GA. This is quite a big effort and if you are using Knative Eventing in your applications this is a perfect time to get involved and provide feedback that will directly contribute to the first Knative GA release.

One issue that I worked on this week which if find really interested is related with how event producers and the "infrastructure" (in this case Knative Channels and Brokers) can "hint" consumers about how they will deal with replies. The whole discussion about how to do this in a way that is clear for consumers [can be found here](https://github.com/knative/eventing/issues/4127), and because this behaviour is described in the Knative Eventing spec the reference implementations needs to follow this approach. To summarise, a new header (`Prefer: reply`) is added to the requests going out from Channels and Brokers, with this consumers can check if the header is present and then send a reply with confidence that the infrastructure will deal with routing for that reply to arrive safe to its destination.

Finally, and because I don't want to make this post too long, I spent some time looking at [Kapp](https://github.com/vmware-tanzu/carvel-kapp), which is a package manager for Kubernetes applications. My first reaction was, this is basically doing the same as [Helm](http://helm.sh), without the templating stuff, but then digging deeper I can see a lot of interesting stuff going on. More of this will come in future posts, because Kapp solves some very common problems of packaging and distributing packages that can be easily installed in Kubernetes Clusters (one of my favourite things to do over the weekends 🤓 )

Stay safe, don't forget to checkout my [Continuous Delivery for Kubernetes](https://www.manning.com/books/continuous-delivery-for-kubernetes) book and see you all next week!
