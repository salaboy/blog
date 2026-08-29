---
title: "Why? Continuous Delivery, What? Platform Engineering"
date: 2023-03-31 10:38:40 +0000
permalink: /2023/03/31/what-platform-engineering-why-continuous-delivery/
description: "My book title and ToC is changing to Platform Engineering on Kubernetes"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/03/whywhat.png
tags:
  - "platform"
  - "kubernetes"
  - "book"
  - "cloud native"
  - "manning"
original_url: https://www.salaboy.com/2023/03/31/what-platform-engineering-why-continuous-delivery/
---

Big announcement here! After getting a lot of feedback and long long conversations and deliberation, the title of my book is changing to [Platform Engineering on Kubernetes](https://www.manning.com/books/platform-engineering-on-kubernetes). There are several reasons for this change, and I get that this might look like: "Oh Salaboy is jumping on the Platform Engineering hype!" That will be a fair assumption, but there are other core reasons why this change makes a lot of sense.

**Continuous Delivery** and **Platform Engineering** are highly related. The ultimate goal of building platforms and the ultimate goal of Kubernetes itself is to enable teams to deliver software continuously. Having the core building blocks designed to allow organizations to roll out deployments with zero downtime and providing teams with a declarative approach to deploy and run their workloads is, unfortunately, not enough to have a smooth experience. I've said it once, and I can say it thousand times, learning and mastering Kubernetes is just the starting point of a long journey. I can't deny, it has been a fantastic journey, I've learned a lot, and that is why I decided to write the book in the first place. Originally titled Continuous Delivery for Kubernetes, the book was born from my experiences with different Cloud Native communities such as [Tekton](https://tekton.dev), [Knative](https://knative.dev), [Jenkins X](https://jenkins-x.io), [ArgoCD](https://argo-cd.readthedocs.io/en/stable/), [CDEvents](https://cdevents.dev), [Crossplane](https://crossplane.io), [VCluster](https://vcluster.com), [Dapr](https://dapr.io) and with some CNCF and CDF Working Groups. It wasn't hard to find the relationships between all these projects as they aim to solve specific challenges you will face on your Cloud Native journey. But finding a title that can describe that journey was quite challenging. Writing a book about technologies that are changing quite fast is quite a challenge. Still, the underlying principles remain the same. Hence writing a book titled **"why"** you would spend time on understanding these projects and how these projects will make your life easier made a lot of sense.

Unfortunately, when I started writing the book (early 2021), the term Platform Engineering wasn't that popular, and we needed a title. Still, even the Table of Contents (ToC) strongly reflected these principles. Looking at the feedback that I've been getting from the early access (MEAP) program, the term Continuous Delivery is heavily related to Continuous Integration(CI) and Continuous Deployment (CD) practices, which makes people think that the book will be about only Pipelines and tools in the CI space. I was fully aware of this preconception when we decided to release the first drafts of the early access program, but there wasn't a better title at that point.

While the term **Platform Engineering** is already becoming a buzzword, I firmly believe that it reflects better the content as it represents the **"what"** you will be building with all these tools on top of Kubernetes. Let's get something straight if you are adopting Kubernetes for real, you will end up building platforms on top of it. There is no way out. Platform Engineering reflects the cultural and technical changes you will need to adopt to have a better Kubernetes adoption journey. I am closely following this space for new tools and practices to help you improve. For that reason, I am currently updating the book ToC to not only make sure that it is updated in this very fast-paced space but also to cover new aspects that are now becoming more formalized. Here is the updated ToC, which hasn't been updated on the Manning website yet, as I am still updating the manuscripts to include all these changes:

Platform Engineering on Kubernetes (ToC):

- Chapter 1: (The rise of) Platforms on top of Kubernetes
- Chapter 2: Cloud-Native Applications Challenges  
  ** Kubernetes core building blocks basics & Helm applied to a walking-skeleton
- Chapter 3: Service Pipelines  
  ** Tekton, Dagger, GitHub Actions used to build our application services
- Chapter 4: Environment Pipelines  
  ** GitOps and ArgoCD to manage and deploy our workloads to different environments
- Chapter 5: Multi-Cloud Application Infrastructure  
  ** Local and Cloud Provider agnostic application infrastructure using Crosspalne
- Chapter 6: The need for a platform-thinking  
  ** Using tools like Crossplane Compositions, VCluster and Kratix to abstract away al the complexity from development teams
- Chapter 7: Let's not forget about Developers (DevEx)  
  ** Knative, Dapr and how to make sure that developers have the tools that they need to focus on building features
- Chapter 8: Opinionated Platforms  
  ** Tools and products aimed for platform builders, more opinionated workflows: Red Hat Openshift, VMware Tanzu, KubeFlow, Functions as a programming model, Container Runtimes and other approaches.
- Chapter 9: Measuring your platforms  
  ** Using an event-driven approach to get key metrics to understand if your platform is delivering on its promise of making your application development teams easier.

One thing is clear. This book is still about Continuous Delivery and Platform Engineering. There is no way to talk about one without having the other. If you are building platforms that are not helping you to deliver more software efficiently, you are wasting your time. If you are building a platform on top of Kubernetes, build it to incrementally improve your software delivery practices, and make sure that you can measure it. This will help you to justify your investment in new tools and practices.

If you have already bought the book, there are not enough words of appreciation 🙏. I will be forever thankful for all the feedback I've received and for the people who have helped me promote this work, for example, [Carlos Santana](https://twitter.com/csantanapr) and his [book reading group that you can find here](https://santana.dev/book-club). Currently, you can find all the step-by-step tutorials in the following repository, which is forever growing, so I might need to clean it up before the book gets printed: <https://github.com/salaboy/from-monolith-to-k8s>

If you have questions or comments, don't hesitate to drop me a comment here or on Twitter [@Salaboy](https://twitter.com/salaboy)
