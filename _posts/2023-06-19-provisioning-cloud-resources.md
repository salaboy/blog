---
title: "Provisioning Cloud Resources"
date: 2023-06-19 06:22:15 +0000
permalink: /2023/06/19/provisioning-cloud-resources/
description: "Crossplane (the project) has matured fast and is ready for its prime time. The Open Source project is a safe bet today."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/06/cloud-native-snapshots.png
tags:
  - "cloud-native"
  - "snapshot"
  - "open-source"
  - "Salaboy"
  - "kubernetes"
  - "crossplane"
  - "upbound"
  - "project"
  - "company"
  - "cncf"
original_url: https://www.salaboy.com/2023/06/19/provisioning-cloud-resources/
---

TLTR: [Crossplane (the project)](https://www.crossplane.io/) has matured fast and is ready for its prime time. The Open Source project is a safe bet today. The company behind the project ([Upbound](https://www.upbound.io/)) had created impressive momentum bringing collaborations from large companies in the Cloud-Native space to contribute back. The future looks bright for Crossplane (the project), but what about the company? Monetizing an Open Source project is hard, but [Upbound](https://www.upbound.io/) is betting on a managed service around the Open Source project and establishing partnerships with other software and service providers.

You can DOWNLOAD the PDF version of the report HERE.

**[Cloud Native Snapshot #1 Upbound/Crossplane - May 23 (12 MB)](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/files/2023/06/Salaboy-Cloud-Native-Snapshot-May-23-v2.pdf)**

Company Name: [Upbound](https://upbound.io)

- Funding: [Series B - + 60 people](https://www.crunchbase.com/organization/upbound)
- [Investment: 69 M U$D](https://www.crunchbase.com/organization/upbound)
- Product: [Upbound - Managed Control Planes](https://www.upbound.io/product/upbound)
- Competitors: [HashiCorp](https://www.hashicorp.com/) / [Pulumi](https://www.pulumi.com/)
- Community Involvement: CNCF Gold Sponsor - KubeCon EU 2023, core maintainers

Project: [Crossplane](https://github.com/crossplane/crossplane)

- Popularity: [Almost 7K Github stars](https://github.com/crossplane/crossplane)
- Maturity: CNCF incubating, Mature, and production-ready
- Space: infrastructure as code, internal development platform

Ratings:

- Buzz Factor 10 / 10
- Community 9 / 10
- Project Readiness 8 / 10
- Easiness of Use 4 / 10
- Product market fit 7/10
- Company success 4/10

[KubeCon Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/) was a great chance to see how vibrant the Cloud-Native space is. In this monthly report, I wanted to highlight a company and a project close to my heart: Crossplane and Upbound, which were very active at this year's conference.

I’ve been contributing where I can to the Crossplane project for a while and interacting with Upbound engineers, Crossplane maintainers, and some of the companies associated with the project. I know the project well, I’ve been following Upbound for a while now, so I thought about using my personal experience, the data that I’ve collected during KubeCon, and some external feedback to shape up these reports.

### Problem Space

Creating Cloud-Native applications require teams to provision cloud resources such as databases, clusters, networks, VMs, brokers, buckets, etc. Creating and configuring these cloud resources is challenging and Cloud Provider specific. Teams have learned to use tools like [HashiCorp’s Terraform](https://www.terraform.io/) to describe and provision complex infrastructure across cloud providers. Terraform uses its language (HCL) to describe what needs to be provisioned then the operator can run a terraform command to apply these configurations to your Cloud Provider of choice. This approach (infrastructure as code) is well-known and widely used in the industry.

### The Open Source Project

Crossplane was created to make the process of defining and configuring infrastructure Kubernetes-native. What does this mean? Or why is this important? First, Crossplane allows users to define the infrastructure needed as Kubernetes resources. It doesn’t introduce a new language. If you are a Kubernetes user, using Crossplane feels natural. This also allows you to reuse all your Kubernetes tooling to manage and use Crossplane. No new tools are needed. For teams that are heavily invested in Kubernetes, Crossplane makes a lot of sense.

### Product Space

After almost three years after Crossplane's inception (donated to the CNCF on June 25, 2020) into the Kubernetes space, I can say that the tool is solid, production-ready, and has very healthy community support. Recently VMware added support for Crossplane [in their Kubernertes offering, Tanzu](https://blog.upbound.io/vmware-tanzu-partner-tap-uxp/), which is a good sign of trust from third-party product providers. Upbound the company behind the project, offers [Upbound](https://www.upbound.io/product/upbound), a Crossplane Managed Service. In other words, you offload the responsibility of running Crossplane itself to Upbound. Check their [company’s one pager](https://resources.upbound.io/upbound-launch/upbound-one-page-brief) released after KubeCon here.

### Rating Details

- **Buzz Factor (10/10):** Crossplane went from being a great community project with great potential to a solid project with massive support from different companies interested in the space. The amount of companies mentioning Crossplane on CNCF working groups and main tracks in conferences like KubeCon NA and KubeCon EU shows that the project is ready for mass adoption.
- **Community (9/10):** The Crossplane Contrib GitHub organization contains 75 extensions that are community driven. Showing integrations with Cloud Providers such as Linode, Civo, and DigitalOcean.
- **Project Readiness (8/10):** While Crossplane is complete with its basic features, some more complex features are being developed. This shows that the project is entering a phase where it needs to be ready for complex and large setups for real-life use cases.
- **Easiness of use (4/10):** To install and use Crossplane, you must be a seasoned Kubernetes user. Crossplane extends Kubernetes with very advanced capabilities. This requires  users to understand it will connect and interact with Cloud Providers to create external resources.Extending Crossplane is possible but requires seasoned Kubernetes engineers.
- **Product market fit (7/10):** If you are a Kubernetes user and working on top of a Cloud Provider, Crossplane makes a lot of sense. Running and maintaining Crossplane in a production setup is a completely different story, as SREs will need to learn how to manage and troubleshoot it when problems arise. **Company success (4/10):** Upbound’s public [Customer List](https://www.upbound.io/why-upbound/customers) doesn’t show any big names, but convincing big names to endorse startups is always hard. I expect an expansion in their public customer references and partners. I am sure that more announcements will come for KubeCon NA in November.

### Community buzz

- [Daniel Magnum](https://github.com/hasheddan), one of the original Crossplane engineers, recently left the company to [follow his passion for hardware and IoT](https://danielmangum.com/posts/leap-of-faith/%20%20.). He was experimenting with managed control planes on the commercial side, and I was half surprised by his departure.
- A Red Hat founded/sponsored project called [KCP is now dead](https://github.com/kcp-dev/kcp) and defunded. [Check this tweet](https://twitter.com/andygoldstein/status/1651569871178588165?s=46&t=W8bsQGNGpRE0tr-Si6vXLA).
- Provisioning infrastructure has a direct impact on developer activities. Enabling developers to consume all the created cloud resources is also an important piece of the puzzle. [Check this blog post](https://blog.crossplane.io/crossplane-and-dapr/).
- [Stefan, ex-Red Hat and KCP project leader](https://twitter.com/the_sttts/status/1651916313982271488?s=46&t=W8bsQGNGpRE0tr-Si6vXLA), joined the Upbound team.
- [Nic](https://twitter.com/internegz) from Upbound published an ebook titled What is Crossplane with O'Reily. You can [download it here](https://www.upbound.io/resources/lp/whitepaper-a/oreilly-what-is-crossplane).
- I’ve heard more than once: “I love Crossplane, but I’m already using Terraform”

### Takeaways

Why should you keep an eye on Crossplane and Upbound:

- They are pushing the boundaries on how managed services on top of Kubernetes are run and productized
- They are solving challenges that you will need to solve sooner or later in your Kubernetes journey
- They are partnering with organizations [like VMware](https://blog.upbound.io/vmware-tanzu-partner-tap-uxp/), which aggregates multiple Open Source projects to offer services and products to large organizations.  This is a great sign of maturity. As larger companies bet on the project, the adoption will grow.
- Upbound's biggest challenge is gaining market share with Pulumi and Terraform users. Showing more production use cases and case studies dramatically impacts the community and new potential large users' perceptions.
