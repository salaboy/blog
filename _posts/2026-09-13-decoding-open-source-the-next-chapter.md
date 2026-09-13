---
title: "Decoding Open Source, the next chapter"
date: 2026-09-13 10:44:28 +0000
permalink: /2026/09/13/decoding-open-source-the-next-chapter/
description: "Some thoughts about Open Source, GenAI and Platform Engineering"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2026/09/road-ahead.jpg
tags:
  - "kubernetes"
  - "agentic"
  - "platform engineering"
  - "developer experience"
  - "devex"
  - "open source"
  - "cloud native"
  - "2026"
original_url: https://www.salaboy.com/2026/09/13/decoding-open-source-the-next-chapter/
---

Over the last 15+ years I’ve been working with the cloud native ecosystem, using my developer background (mostly in Java and enterprise software) to help organizations to adopt and build Kubernetes-based platforms to speed up development teams. Building on and extending Kubernetes and Open Source projects like Knative, Crossplane, Dapr, Argo, OpenTelemetry vcluster and developer frameworks like Drools, jBPM, Activiti, Camunda, Spring Boot, Spring AI, Quarkus and Langchain4j taught me several lessons. 

First, there is no silver bullet, every organization, every team have different requirements (scale, flexibility, priorities, etc), hence a generic tool will never be perfect. They need to customize, extend, adapt and stress test in different ways. Being able to extend your tools is extremely important, but also avoiding starting from scratch will save you huge amounts of time, and this is extremely important. 

When you adopt an existing project you get the wisdom of a community of people who have thought about specific challenges and how to solve them. They created a mental framework to solve a set of challenges and the project represents one possible implementation of this framework. To successfully adopt an existing tool (open source or not) you need to learn this mental framework to align your expectations. Failing to do so, whenever you hit something that the tool doesn’t do in the way you were expecting, the natural reaction is to create your own tool, dropping all the accumulated wisdom from that community. I urge teams to avoid creating their own solutions before understanding the tools that are available. The Cloud Native community and the Java communities have decades of experience on how to build and run software that as a team you can leverage. In my opinion, reinventing the wheel should be always the last option and for sure it will be the one that costs the most. 

The second big lesson is more specifically about Open Source. I’ve seen a lot of people recently doubting about the future of Open Source projects, and at the core, people doubt about the value of human crafted software. With crafting code becoming “cheaper” and “faster” it is natural to think, if I need a solution for X, I will just vibe code it. This is one of the biggest misconceptions of using GenAI specifically for software engineering practices. In my 15+ years of working across stacks and being involved with projects that are purely developed using an Open Source approach (public repository with contributors from different backgrounds, with different goals and motivations), I’ve experienced first hand the value of iterating a solution in the open. Most of the time, the value is not in the code itself, but in understanding what the code does to solve a particular problem. By iterating that understanding (and the code associated with it) is how experts get formed and how the concepts used to create solutions evolve. Something very valuable happens when you translate a concept into code that can be executed, then the concept evolves with its runtime behavior. But because this evolution is predictable (cause -> effect), the tools that we have created for decades rely on basic mechanisms and behaviors that we understand. 

Besides the personal experience of moving from idea to executable code, the most enriching experiences of my career have been around, not learning about how to code better (I am not the best coder around), but sharing concepts and approaches to solve specific situations. What I’ve considered mentors, never focused on code, they focused on architectural patterns, how to map those to very real business scenarios and how technology should be used to deliver value. 

With the rise of GenAI, the lack of metrics to really measure ROI when using these tools is a clear sign that we have an industry-wide problem. I am really proud to have participated as a TOC member for the CNCF, as I got access to the latest initiatives that the Linux Foundation is running to measure the health of their ecosystems and the value that these projects have across different industries and verticals. 

It feels to me that there is no way out, we need to get better at measuring the software that we produce, how much does it cost to run (time and money) in a real environment, its impact on real users and the value that it creates. In my head, the term slop in the software engineering industry means “software that is not measured”. Unfortunately, we have a lot of that. We have a lot of technical debt.

During my career, I’ve built a lot of automation tools, some of them dealt with automating non-deterministic humans (behaviors and flows), so I am all up for automating and speeding up work, as soon as you can understand and measure how the work is being done, I am all up to try different approaches and tools (and yes GenAI LLMs are just a tool). 

I am really thankful for the Kubernetes and Cloud Native community as they have taught me how to collaborate with distributed teams and experts that are not only world class, but also amazing people always willing to share their experiences. Early in my Kubernetes journey, I realized that I couldn’t become an expert on the entire ecosystem and knowing the right folks (experts on different projects) was my way to level up.

In the next chapter of my career, while I know for sure that I will be digging deeper into the topics that I love, such as platform engineering and developer experience, my experience tells me that measuring ROI, adoption and the use of GenAI will become fundamental practices to success. Metrics like DORA, SPACE have paved the way for companies to pay the debt, but you need to be really strategic on how you move forward. Vibe-code all your new software, get rid of your expert developers and you will not only end up with slop, but without people that can actually understand how your business works in the long run. Push for the use of coding agents without measuring how effective they are and you will end up with 20 solutions for the same problem and nothing running in front of your customers. 

I am extremely excited to see how the things that I’ve learned over the past 20 years apply to a different organizational culture, massive scale and I am looking forward to sharing the lessons that I learn in this new chapter. 

As always, if you are reading this, I really appreciate your support, hit me up on Linkedin if you have comments or questions. 

Until the next blog folks! Stay tuned, it might be a while but it will be worth it.