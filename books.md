---
layout: page
title: "Books"
date: 2023-05-14 07:35:16 +0000
permalink: /books/
description: "The Platform Engineering on Kubernetes book reflects my journey of navigating the CNCF landscape and the Cloud-Native communities around it."
original_url: https://www.salaboy.com/2023/05/14/books/
---

### Developer Experience on Kubernetes MEAP

[![Book devex cover meap](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/06/book-devex-cover-meap.png)](https://www.manning.com/books/developer-experience-on-kubernetes)

We (with Thomas Vitale - Cloud Native Spring in Action author) started writing this book in late 2024 and announced the MEAP (Manning Early Access Program) at KubeCon EU - London.

### Platform Engineering on Kubernetes (Published)

Update 30/1/23: [Book Published!](/2023/10/25/milestone-achieved-book-published/)

Update 14/09/23: [Book Updates and Beta Testers Request](/2023/09/14/book-update-and-beta-testers-request/)

Update 5/02/25: [Book Translated to Japanese presentation in Tokyo](/2025/02/03/platform-engineering-in-tokyo/)

[Platform Engineering for Kubernetes](https://mng.bz/Ddm9) for Manning Publishing:

[![Platform Engineering on Kubernetes micro2](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/05/Platform_Engineering_on_Kubernetes_micro2.jpeg)](http://mng.bz/jjKP)

### Abstract and ToC

The [Platform Engineering on Kubernetes](http://mng.bz/jjKP) book reflects my journey of navigating the CNCF landscape and the Cloud-Native communities around it. Since I started my Kubernetes journey (2015), I've met a lot of brilliant folks who have taught me most of what you will read in this book, so my biggest hope is to help people to save time when navigating this complex ecosystem. I am a developer at heart. This means that most of the topics are covered with a development focus in mind, and while some chapters feel more infrastructure-related, there is always something bringing you back to your developer's day-to-day tasks.

In the following ToC (Table of Contents), I will update each chapter's state as I progress with the drafts. I've started a process to re-write most chapters to align with the following ToC, and I am thrilled with how things are shaping up now, so I am hoping to get all the re-writes done by the end of August 2023, so the book can be printed in the second half of this year.

Now you can find all the step-by-step tutorials on this GitHub repository: <https://github.com/salaboy/platforms-on-k8s/>

- **Chapter 1**: (The rise of) Platforms on top of Kubernetes
  - Introduction, what are platforms, introducing a walking skeleton
- **Chapter 2**: Cloud-Native Application Challenges
  - How to install and run applications on Kubernetes, Helm, and core Kubernetes concepts
- **Chapter 3**: Service Pipelines: Building Cloud-Native Applications (Re-write done!)
  - Tekton, Dagger and GitHub Actions
- **Chapter 4**: Environment Pipelines: Deploying Cloud-Native Applications (Re-write done!)
  - GitOps and ArgoCD to manage and deploy our workloads to different environments
- **Chapter 5**: Multi-Cloud (App) Infrastructure
  - Local and Cloud-Provider agnostic application infrastructure using Crossplane
- **Chapter 6**: Let's build a platform on Kubernetes
  - Creating a Platform walking skeleton using Crossplane Compositions and `vcluster` we can enable teams to request new development environments.
- **Chapter 7**: Platform Capabilities I: Shared Application Concerns
  - Reading/Writing data to a persistent store, exchanging async messages and enabling reliable service-to-service invocations while empowering the platform teams to wire up the platform infrastructure with Dapr
- **Chapter 8**: Platform Capabilities II: Enabling Teams to Experiment
  - Auto-Scaling, Release Strategies, Common Cloud-Native patterns and best practices using Knative Serving and Argo Rollouts.
- **Chapter 9**: Measuring Platforms
  - Using an event-driven approach to get key (DORA) metrics to understand if your platform is delivering on its promise of making your application development teams easier. This chapter also covers the basics of the Keptn Lifecycle Toolkit to extract software delivery metrics.

[Check this blog post about why I've changed the book title.](/2023/03/31/what-platform-engineering-why-continuous-delivery/)

As I am rewriting the content for the chapters to be more aligned, I've been spending a lot of time refining the examples, which I will probably end up moving into a separate repository containing all the step-by-step tutorials and the source code for the applications. I still need to refactor the Conference Application, as I wanted it to look nice and include valuable examples for developers and architects.

[The book is now published and available in the printed version.](/2023/10/25/milestone-achieved-book-published/)

### Thanks to contributors

I will be forever grateful to the following outstanding contributors and the time they spent making this book better for everyone:

Ezequiel Salatino, Thomas Vitale, Matheus Cruz, Mark Fussel, Yaron Schneider, Carlos Santana, Whitney Lee, Fabian Kramm, Ishan Kahre, Jared Watts, Asare Nkansah, Jean Louis Van Belle, Marcos Nils, Nwiizo, and the list will keep growing.
