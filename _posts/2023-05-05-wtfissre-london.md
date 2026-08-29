---
title: "#WT*isSRE Conference in London"
date: 2023-05-05 18:06:17 +0000
permalink: /2023/05/05/wtfissre-london/
description: "WT*isSRE is a London Conference focused on Observability, Platforms, and DevEx. My presentation this time focused on Platforms for Developers on top of…"
tags:
  - "cloud-native"
  - "kubernetes"
  - "platforms"
  - "conference"
  - "london"
  - "crossplane"
  - "dora"
  - "devex"
original_url: https://www.salaboy.com/2023/05/05/wtfissre-london/
---

While I am usually far from the hardcore SRE communities, attending [WT*isSRE](https://www.cloud-native-sre.wtf/) (run by [Container Solutions](https://www.container-solutions.com/)) was quite a pleasant experience as there was a lot about Platform Engineering. Some topics I saw were relevant to the Kubernetes and Cloud Native communities. While the main track was about Observability, there was a special track about Platform Engineering and Developer Experience.

- Platform engineering was strong.
- Developer experience is becoming a central topic of discussion
- Observability (OpenTelemetry), metrics, security, and some eBPF, were the main topics being discussed for the SRE audience

I was pretty happy to see the first-day Keynote from [Snyk](https://snyk.io/) around Platforms:

![Snyk platform tools](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/snyk-platform-tools.png)

Their Platform journey has been going on for two years, and some of the tools they use are the usual suspects: [Kubernetes](https://kubernetes.io/), [Backstage](https://backstage.io/), [Istio](https://istio.io/), [Tetrate](https://tetrate.io/), [Terraform](https://www.terraform.io/), [ArgoCD](https://argo-cd.readthedocs.io/en/stable/), and two major Cloud Providers: AWS and Google Cloud. It was interesting, but not surprising, to see CircleCI, Datadog, OKTA, PagerDuty, [Teleport](https://goteleport.com/), and [Kyverno](https://kyverno.io/) there.

More interesting and relevant to the work that I am doing on my book [Platform Engineering on Kubernetes](http://mng.bz/jjKP?ref=salaboy.com) was the heavy emphasis on DORA metrics and what they have been learning about that. We need a Kubernetes-based / CloudEvents-based DORA tool that works out of the box with our Kubernetes-based Platforms. I worked on something like this for the book, but it is just a [prototype you can find here](https://github.com/salaboy/from-monolith-to-k8s/tree/main/four-keys). Check the metrics that they shared. It is interesting to notice that most focus on Pipelines executions. It feels that they put a lot of effort into improving their CI pipelines.

![Snyk dora](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/snyk-dora-5.png)![Snyk dora](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/snyk-dora-4.png)![Snyk dora](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/snyk-dora-3.png)![Snyk dora](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/snyk-dora-2.png)![Snyk dora](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/snyk-dora-1.png)

There were two other highlights around platforms: API First Platforms and a Platform discovery workshop from Red Hat.

I liked [Abby's](https://twitter.com/a_bangser) message about API-first platforms. I am aligned with this way of looking at Platforms. Dashboards will come if you have a good API, tools like [Backstage](https://backstage.io/) are becoming synonymous with Platforms today, but the reality is that if you don't have the right APIs, your platforms will not be easy to use.

![Synstasso api first platforms](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/synstasso-api-first-platforms.png)![Syntasso responsability model](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/syntasso-responsability-model.png)

Check her shared responsibility model showing the difference between Dev & Ops, DevOps, Platforms offering templates, and Platforms providing APIs.

I wanted to give a  shout out on a presentation from [Red Hat](https://www.redhat.com/en) about a free workshop that you can run to find where your org is in its "platforms as product" journeys. The reinforcement on Platform as Product, the [Team Topologies](https://teamtopologies.com/) book, and the [CNCF TAG App Delivery Whitepaper](https://tag-app-delivery.cncf.io/whitepapers/platforms/) on platforms are excellent, as not everyone in the audience knew these resources. You can find the workshop here: [https://miro.com/miroverse/platform-as-a-product-workshop/](https://t.co/IXcPiQwTEX)

![Red hat platforms workshop](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/red-hat-platforms-workshop.png)![Red hat platforms workshop](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/red-hat-platforms-workshop-1.png)

And finally to close the whole conference, what a better way to close an SRE conference than with some more DORA from the one an only [Nathen](https://twitter.com/nathenharvey) from Google:

![Closing keynote](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/closing-keynote-5.png)![Closing keynote](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/closing-keynote-3.png)

Check out their new websites: [dora.dev](https://dora.dev) and [r9y.dev](https://r9y.dev) (reliability)

### Developer Focused Platforms on top of Kubernetes

My presentation this time was all about Platforms on top of Kubernetes but making some strong points on API-first and Developer Experience. I believe that we have learned to deal with complex multi-cluster and multi-tenant setups in the Kubernetes land, and what is coming next is making developers not learn all these tools. Defining platform boundaries and capabilities is the next milestone we must achieve in the Cloud-Native space.

You can run the demo that I did by following this step-by-step tutorial: <https://github.com/salaboy/from-monolith-to-k8s/tree/main/platform/prototype>

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe loading="lazy" marginheight="0" marginwidth="0" scrolling="no" src="https://www.slideshare.net/slideshow/embed_code/key/Fb00rVyXDtxpGe?hostedIn=slideshare&amp;page=upload" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;"></iframe></div>

![#WT*isSRE Conference in London](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/IMG_4926.JPG)![#WT*isSRE Conference in London](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/IMG_4925.JPG)![#WT*isSRE Conference in London](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/IMG_4924.JPG)![#WT*isSRE Conference in London](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/IMG_4923.JPG)

After the presentation, I got a lot of feedback from people like the Kubernetes journey part of the presentation, so a blog post is coming about that topic next week.

![Thanks salaboy](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/thanks-salaboy.png)

That's a wrap! See you all at [DevoxxUK](https://www.devoxx.co.uk/) next week!
