---
title: "Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025"
date: 2025-10-13 08:18:35 +0000
permalink: /2025/10/13/learnings-from-cloud-native-denmark-and-devoxx-belgium-2025/
description: "The software industry is vibrant with the GenAI bubble, but the good thing is that all this movement promotes new ideas, new patterns, and new challenges…"
tags:
  - "2025"
  - "cloud native"
  - "denmark"
  - "devoxx"
  - "belgium"
  - "2024"
  - "kubernetes"
  - "testing"
  - "dapr"
  - "workflows"
  - "microcks"
  - "langchain4j"
  - "agents"
  - "conference"
  - "event"
original_url: https://www.salaboy.com/2025/10/13/learnings-from-cloud-native-denmark-and-devoxx-belgium-2025/
---

> **&lt;Begin of AI Rant&gt;**

> *The fact that a presentation includes AI in its title or proposal doesn’t necessarily make it interesting.*

> I had the opportunity to talk to many folks who raised a very important issue. While AI is in hype, ***let’s make sure that we don’t forget about how we actually deliver software***, the core libraries and tools that will not change even if AI takes full control of the development process. Logging remains essential for humans, testing is still necessary, APIs are important, and specs benefit both machines and humans in conceptualizing and architecting large-scale systems.

> A constant across communities that I found fascinating is the lack of clear direction in tooling within the GenAI space. While numerous frameworks are emerging to build agentic systems, the clarity of the use cases these systems will implement remains a significant open question. As is typical in the industry, we are developing solutions for problems that have yet to arise.

> **&lt;End of AI Rant&gt;**

With all that being said, I had a fantastic time at both Cloud Native Denmark, happening in the beautiful city of Aarhus, and Devoxx Belgium, happening in Antwerp.

The software industry is vibrant with the GenAI bubble, but the good thing is that all this movement promotes new ideas, new patterns, and new challenges that we will need to tackle in order to keep our software development and delivery practices updated and efficient.

## Cloud Native Denmark

Organized by [Cloud Native Nordics](https://cloudnativenordics.com/) (with around ten thousand members) and previously part of the KCD events, this was the third edition of the conference. With around 450 attendees, the conference is very targeted to platform engineers in the cloud native space.

If you are in the Nordic countries and haven’t attended these events, despite working daily with Kubernetes, I strongly recommend checking out the next edition in Copenhagen, Denmark, in 2026.

![Cloud Native Denmark 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/Cloud-Native-Denmark-2025-631.jpg)![Cloud Native Denmark 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/Cloud-Native-Denmark-2025-627.jpg)![Cloud Native Denmark 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/Cloud-Native-Denmark-2025-613.jpg)![Cloud Native Denmark 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/Cloud-Native-Denmark-2025-611.jpg)![Cloud Native Denmark 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/Cloud-Native-Denmark-2025-610.jpg)

As I shared in my keynote session, these events are where you meet people from whom you can learn. In our field, where we learn almost every day, attending these events not only fosters personal growth but also creates opportunities for cross-organizational collaborations.

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/a47bd26d3d95466783ab7a2c6743d780" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="[Keynote] What do you need to know about DevEx in 2025"></iframe></div>

I had great chats with [Mads from Lego](https://www.linkedin.com/in/danquah/) about Open Source, and my good friends [Andrea](https://www.linkedin.com/in/giardiniandrea/) from [Overstory](https://www.overstory.com/), Kasper from [Dash0](https://www.linkedin.com/in/kaspernissen/) (and organizer), and [Abdel](https://www.linkedin.com/in/sabdelfettah/) from Google.

![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6228-2.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6227-2.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6215.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6224-2.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6223.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6220.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6219.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6218.jpeg)

It was interesting to see, as part of Andrea's keynote, how important [Dagster (a data orchestration platform, mostly Python)](https://dagster.io/platform-overview/data-orchestration) was to the journey to improve operations. Seeing real-life use cases where technology is applied to solve concrete problems is always refreshing, as it demonstrates the before and after of adopting new tools to improve company operations.

From Abdel, I took a lot of notes about [llm-d (llm-d: a Kubernetes-native high-performance distributed LLM inference framework)](https://llm-d.ai/), a tool I’ve been looking for a while but haven’t had time to dig deeper into. Learning about the architecture and reasons behind this tool's existence was also refreshing. In a saturated market of tools, unification, reuse of common specs, and existing components to solve new problems only start to emerge where the problems we are trying to solve make sense.

![Data src image 4ec59ff5 acb6 4ee6 85dc 848d9940632b](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/data-src-image-4ec59ff5-acb6-4ee6-85dc-848d9940632b.png)

Running GenAI on Kubernetes is not easy, and you need ot be ready to spend some money on GPUs, but understanding how these projects work and which components from other projects are being reused is quite important to mature the ecosystem.

[Check out all the professional pictures from the Conference here](https://www.picdrop.com/kim-yennguyen/Rpea9zFuqv)

### Devoxx Belgium

At Devoxx Belgium, you have the opportunity to mingle with a lot of Java Developers. With more than three thousand attendees, I had the pleasure of presenting with my good friend Laurent from Postman / Microcks about creating and testing distributed applications that include workflows and LLM interactions.

Here are the slides for the presentation:

<div class="video-embed" style="position:relative;padding-bottom:75%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="true" class="speakerdeck-iframe" loading="lazy" src="https://speakerdeck.com/player/c70c94348b684cb493898307fca08a80" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Simplifying Cloud Native app testing across environments with Dapr and Microcks"></iframe></div>

In this session, we focused on an updated version of the Pizza Store, which uses [Dapr Workflows](https://docs.dapr.io/developing-applications/sdks/java/spring-boot/), [Spring AI](https://spring.io/projects/spring-ai) to handle pizza orders across multiple services. You can find the source code of this demo that you can run on your laptop in the following repository <https://github.com/salaboy/pizza> (notice we used the ***agentic-workflow*** branch)

![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/54844501986_40ee23e412.jpg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/54843646282_4317e6319a.jpg)

If you are interested in this topic, you can check the following article in Dzone that goes into more details around Dapr workflows and Spring AI

<https://dzone.com/articles/durable-agents-with-spring-ai-and-dapr>

I had the chance to hang out with old colleagues from Drools/JBPM (Red Hat / IBM now) from the Quarkus team, including Roberto, Mario, Kevin, Kris, and Geoffrey, who provided me with a lot of insights about the Quarkus community. They are doing an amazing job with [Langchain4j](https://github.com/langchain4j/langchain4j), hence it is worth keeping an eye on. I was fortunate to attend the [Langchain4j](https://github.com/langchain4j/langchain4j) BOF, where discussions centered on implementing new agent interaction patterns and the value of developing more complex mechanisms, given the unclear use cases.

I find it fascinating how all the agents' discussion is leaning towards re-implementing mechanisms that we have implemented 100's of times before such as [human in the loop pattern highlighted by the linked example](https://github.com/langchain4j/langchain4j-examples/blob/main/agentic-tutorial/src/main/java/_9_human_in_the_loop/_9a_HumanInTheLoop_Simple_Validator.java#L31 ).

![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6275.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6273.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6318.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6310.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6303.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6305.jpeg)![Learnings from Cloud Native Denmark 🇩🇰 and Devoxx Belgium 🇧🇪 2025](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2025/10/IMG_6299.jpeg)

I had the opportunity to spend some time with Roberto Cortez discussing the Dapr Quarkus Extension, which Matheus Cruz has been working on extensively, and I'm pleased to report that progress is being made. Expect a blog post about this soon, too.

I would say that Roberto’s session about how to create Quarkus extensions and Quarkus internals takes the prize of most valuable session.

Spring presented Spring Boot 4, and although it's bringing some good features, I wasn't particularly excited. That's why I was happy to see [Thomas Vitale over the weekend about the Arconia](https://www.thomasvitale.com/arconia-dev-services-spring-boot/) been working on.

Stay tuned for more news! The next stop is [KubeCon NA](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/), happening in Atlanta, US, in November.
