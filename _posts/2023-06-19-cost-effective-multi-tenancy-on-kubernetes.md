---
title: "Cost-Effective Multi-tenancy on Kubernetes"
date: 2023-06-19 06:24:46 +0000
permalink: /2023/06/19/cost-effective-multi-tenancy-on-kubernetes/
description: "Provisioning Kubernetes Clusters is expensive and becomes problematic if your organization or customers demand tenant isolation."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/06/cloud-native-snapshots-1.png
tags:
  - "cloud-native"
  - "snapshots"
  - "Salaboy"
  - "open-source"
  - "kubernetes"
  - "cncf"
  - "vcluster"
  - "loft-labs"
  - "company"
  - "project"
original_url: https://www.salaboy.com/2023/06/19/cost-effective-multi-tenancy-on-kubernetes/
---

TLTR: Provisioning Kubernetes Clusters is expensive and becomes problematic if your organization or customers demand tenant isolation. In this report, I decided to cover `vcluster`. This tool is becoming more popular in the CNCF space, as it offers an alternative to the options available when faced with tenant isolation and costly bills at the end of the month just to pay machines to run Kubernetes itself. The company behind `vcluster`, [Loft Labs](https://loft.sh/), enables teams with cost-effective clusters and the management tools you will need to give your developers what they need to work.

You can DOWNLOAD the PDF version of the report HERE.

**[Cloud Native Snapshot #2 vcluster/Loft Labs - June 23 (13 MB)](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/files/2023/06/Salaboy-Cloud-Native-Snapshot--2-June-23-v1.pdf)**

Name: [Loft Labs](https://loft.sh/)

- Funding: Seed -  25 people
- [Investment: 4.3 M U$D](https://github.com/loft-sh/vcluster)
- Competitors: - Hypershift / Kamaji **
- Community Involvement: CNCF Gold Sponsor - KubeCon EU 2023, core maintainers
- Product: Loft V3 - Self-Service Virtual Clusters at Scale with GitOps integrations

Project: [vcluster](https://github.com/loft-sh/vcluster)

- Popularity: [Almost 2.5K Github stars](https://github.com/loft-sh/vcluster/)
- Maturity: CNCF incubating, solidifying its user base and refining use cases
- Space: multi-tenancy, developer environments, isolation  
    
  ** These projects are not direct competitors to `vcluster` but they are in the same space, multi-tenant Kubernetes. Hypershift is mostly maintained by Red Hat and Kamaji by Clastix.

Ratings:

- Buzz Factor 6 / 10
- Community 5 / 10
- Project Readiness 6 / 10
- Ease of Use 8 / 10
- Product market fit 5/10
- Company success 3/10

### **Problem Space**

Sooner or later, you will need more than one Kubernetes cluster, this isn’t cheap. It doesn’t matter if you need a new cluster for internal teams to run their applications or if you want to give each of your customers their isolated clusters to run your services. Once this conversation starts, two main factors get in the way and block teams from moving forward: money and time. Paying for new clusters is not a decision that most teams can make, they will need the whole organization's buy-in. Creating clusters in any cloud provider is not instant. It usually takes 5 to 10 minutes (depending on the cloud provider) to set up hardware and software. While this is almost nothing compared to the time it would take you to set up a cluster On-Prem, you cannot make your customers wait for 10 minutes to start using your software.

### The Open Source Project

`vcluster` offers a simple way to create new virtual Kubernetes clusters inside an existing Kubernetes cluster (host). These virtual clusters can be created using the `vcluster` CLI or Helm, a package manager for Kubernetes. Once a virtual cluster is created, you can share the details (credentials and API Server URL) for teams/customers to interact with it. From the consumer's perspective, they interact with a real cluster. From the provisioner's point of view, you still have a single Kubernetes cluster with workloads running on them. Because each `vcluster` spins up a new API Server, the load of each tenant on the API Server is isolated and doesn’t go through the host.

### Product Space

Founded in 2019, Loft Labs is focused on enabling teams to adopt Kubernetes in a fast and cost-efficient way. Tools like vcluster, DevSpace, and now (May 2023) DevPod aim to facilitate platform teams with tools focused on adopting Kubernetes-based solutions. Loft V3 is a managed service suite that provides a central place for you to create vclusters for your teams. Their pricing model is based on users. Loft V3 allows you to create and manage vclusters in multiple regions, including VPC support and Single Sign On capabilities. Features offered by Loft V3 can save companies time, as you are most likely to implement all these features in-house.

### Rating Details

- **Buzz Factor (6/10):** vcluster is gaining popularity, as it is an easy project to start and provides increased isolation compared with Kubernetes namespaces. If you have a multi-tenant discussion in your organization, vcluster will pop up in that conversation more than once.
- **Community (5/10):** vcluster has around 2500+ GitHub stars and external companies contributing back to the project. Still, the project is driven mostly by Loft Labs engineers.
- **Project Readiness (6/10):** vcluster is one of those projects that do one thing and does it well. The project's scope is well defined, and now the focus is switching to make it more efficient and stable.
- **Easiness of use (8/10):** To get started with vcluster you don’t need much besides a Kubernetes cluster (host). The vcluster CLI makes it easy to create, connect, pause/resume and delete a vcluster.
- **Product market fit (5/10):** Multitenancy is hard, and vcluster comes as an alternative to mitigate some of those issues with a tool that you can adopt today. Once you have faced these issues and decided that vcluster can help your teams, Loft V3 comes into play. If the number of vclusters grows over 10, and if you need Single Sign On, multi-region, VPC connections, it might be worth considering having a quote from Loft V3 as all these capabilities will need to be designed and built in-house otherwise.
- **Company success (3/10):** Loft Labs is a young company with exciting Open Source projects and initiatives. Their product provides a solution to a problem that companies are facing today. Loft V3 can save time and enable teams to self-serve on Kubernetes cluster today. If you are not at the stage in your Kubernetes journey, these tools can get you there in no time. For the company to be successful, organizations need to be aware that `vcluster` exists and then understand how costly and time-consuming it would be to build a self-service platform around it in-house.

### Community buzz

- Do you need a cost-effective alternative to provision clusters? `vcluster` might be the answer
- If the overhead of creating a `vcluster` can be easily parameterized for different scenarios, platform teams can tweak `vcluster` for their use cases.
- Check out the ArgoCD and `vcluster` integrations, and how Codefresh uses `vcluster` for their managed service
- Check the newest `vcluster` friend DevPod, like GitHub codespaces/GitPod but Open Source
- `vcluster` 0.15.0 includes a generic sync mechanism that lets you save not only on clusters but the tools installed on them. I am eager to see DevPod and vcluster-enabled platforms at KubeCon NA 2023

### Cost of Adoption

`vcluster` is easy to use and adopt by existing Kubernetes users, as it doesn’t require installing anything on your existing clusters. No training is needed for `vcluster` users either, as they will receive access to a fully fledge Kubernetes API Server. Once adopted, a platform team will need to build a management layer to enable development teams to request new `vcluster` and have access to them. Depending on your organization's maturity, you might want to avoid designing and building this self-service management layer.

### Speed

If you are having conversations about how to deal with multi-tenant scenarios in relation to your Kubernetes Clusters or getting large bills at the end of each month because your teams are creating too many clusters, `vcluster` can save you time and money.

If it is clear that your teams will benefit from a cost-efficient and self-service approach to access their Kubernetes clusters, I suggest you have a chat with Loft Labs. At the end of the day, it is a decision about cost and reducing the time that teams need to get their clusters for their applications.

### Risk

Other multi-tenant approaches exist in the market, such as Hypershift and Kamaji. The main difference between `vcluster` and these other tools is complexity, but it all boils down to your requirements today. Are you suffering from developers requesting clusters that you can’t pay? Or are you managing a large fleet of Kubernetes Clusters that you want to isolate and manage across regions? My strong recommendation here is to consider `vcluster` as an option when deciding about splitting a single Kubernetes Cluster to be shared across tenants.

### Takeaways

Why should you keep an eye on `vcluster` and Loft Labs:

- `vcluster` provides a viable alternative for multi-tenant scenarios
- `vcluster` makes Kubernetes accessible to teams without the need to pay premium prices for isolated clusters on Cloud Providers
- Loft Labs is building the tools to self-serve and manage `vcluster`s at scale for more targeted use cases, such as development environments.
- Loft Labs is expanding its Open Source portfolio and products to tackle more challenges that companies and teams are facing when on-boarding teams to Kubernetes

### What's Next?

- [Check my blog post about Crossplane and vcluster for creating development environments](/2022/08/03/building-platforms-on-top-of-kubernetes-vcluster-and-crossplane/)
- [Check this vcluster introduction](https://www.youtube.com/watch?v=nvD47PBrTNM) from the Loft Labs Youtube Channel
- Create your first `vcluster` by following [this getting started guide](https://loft.sh/blog/intro-to-vcluster-tutorial/)
