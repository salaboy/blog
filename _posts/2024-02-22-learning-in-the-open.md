---
title: "Learning in the Open"
date: 2024-02-22 14:03:59 +0000
permalink: /2024/02/22/learning-in-the-open/
description: "I wanted to focus on lessons learned when interacting with different projects, advice for people looking to contribute to open-source projects, and…"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2024/02/IMG_0239.jpeg
tags:
  - "cloud-native"
  - "open-source"
  - "kubernetes"
  - "platform engineering"
  - "book"
  - "lessons"
  - "open"
  - "learning"
  - "kcd brazil"
original_url: https://www.salaboy.com/2024/02/22/learning-in-the-open/
---

I wanted to share my learning journey from open-source and cloud-native communities in this blog post. I’ve wanted to write this blog post for a while now as I tried to document learnings from writing my book [Platform Engineering on Kubernetes](http://mng.bz/jjKP?ref=salaboy.com). In the book, I couldn’t spend many pages going deeper on topics not strictly related to Platform Engineering. Here, I wanted to focus on lessons learned when interacting with different projects, advice for people looking to contribute to open-source projects, and suggestions for teams “fighting” against myriad tools being thrown at them daily.

I divided the content into three sections to make it more readable. I’ve pointed to technical examples but not covered them in detail, as the primary purpose of this post is to share lessons learned and not technical details. Feel free to skip to the section that you are more interested in, but trust me, they are all related and complementary to each other.

- Connecting the dots: figuring out complex ecosystems
- Working with people: engaging with communities and companies
- Dealing with changes: be ready to pivot at any time, design and build future-proof

Let’s start with what has become a community trend over the last few years: blame the ecosystem; it is too large to figure it out.

## Connecting the dots

A few years back, it became pretty apparent that navigating the CNCF landscape was a problem for companies starting their cloud-native journeys. Almost every presentation at KubeCon or a Kubernetes meetup used the following screenshot to highlight that the size of the ecosystem was becoming a problem.

![Learning in the Open](https://lh7-us.googleusercontent.com/a-LAszAUjxAXMfZdwrJJVeN-S7ic_Dxc7pMxcVyAwM-HJns8LWHHNW9GmnasxY9QNkPpOncuvYcQlW48NXi12be2KqFguArly5s2jfH1dHfCdp8gQ1D6VJylKvi0y8F96E5otF3isgVe6PTE1kNGu6c)

While most of the time, the more, the better, having too many options puts the barrier of entry relatively high for newcomers, and that was a great call to action for me to write a book about how to make some popular tools in the ecosystem work together.

I am not a stranger to ecosystems where we have too many options. Coming from the Java ecosystem, where for years and years, we have at least five options to do parsing, logging, serving HTTP requests, and configuring applications, among others, you know that sooner or later, communities and/or companies will come to create curated sets of tools to approach different problems. Popular projects will not last if actual companies do not adopt them, which has been consistently the case in the cloud-native space.

As with any ecosystem, tools and communities eventually become mature, and the focus shifts. With more and more projects graduating in the CNCF, becoming more mature and “boring” (boring being a good thing for real adoption), I am keen to see which new areas of innovation start popping up in this space. With the CNCF fast approaching its 10th anniversary, I am also interested in how it can attract new generations to bring their ideas to the cloud-native space. The Linux Foundation has been very successful for over 24 years, so I hope to see similar traction in the CNCF. Failing to capture new generations is my biggest fear around this ecosystem.

So, how do you connect the dots in a forever-growing and changing ecosystem? For the book, I wanted to avoid covering just hello worlds for different tools, as the projects’ official documentation are pretty good at covering basic use cases to get started. Leveraging that most of the projects in the CNCF are in some way or another related to Kubernetes, I decided to cover tools and how they are related to our applications’ design, architecture, deployment, and overall lifecycle. But how difficult is it to map the problems you are trying to solve with projects in the landscape? Understanding which projects will solve specific problems is one thing, but you rarely solve a single issue at a time, so if you need to use two or three projects together, would they work?

When I started my cloud-native journey, nothing worked as I expected. Remember that I have a development background, and by being involved in developing tools for developers for some time, I quickly realized that there was a lot of work needed to get these tools to work together. My eagerness to work with these tools drove me to try them and engage with different communities.

It is an intrinsic property of each tool (in the landscape) to be designed with a concrete set of use cases in mind, so expecting any of these tools (in early stages) to work for your company's particular use case is quite a big ask. Problems become more apparent when you start combining tools designed for use cases that seem compatible, but when you look deeper, there are too many technical gaps, and too much work required on your side to make things work.

Before even dreaming about writing a book, I started combining projects I knew teams would use. If Kubernetes is your target runtime, creating containers, publishing them to registries, and dealing with manifests and environments are some tasks teams must optimize to be efficient.

If you look at the book's table of contents, you will find topics (and related tools) that map the journey of teams trying to run applications on top of Kubernetes. As a very good friend ([Carlos Santana](https://twitter.com/csantanapr)) pointed out, the book adopts a practitioner approach and doesn’t focus on running the tools mentioned for production environments. In some way, I’ve prioritized the reader getting hands-on experience with these tools and projects instead of sharing advice for production use cases. Each chapter points to hands-on, step-by-step tutorials (<https://github.com/salaboy/platforms-on-k8s>) that the reader can follow to use the mentioned tools.

Creating the table of contents was easier than making projects work together. I quickly realized that to make two projects work together, you need to gain a deep understanding of both projects, their technical maturity and flexibility, and how to open their communities to accept changes and suggestions.

For the book, I wanted to create a practical example of combining multiple tools to solve a high-level scenario. For this, I used Crossplane and vcluster to demonstrate how to create team development environments. You can check the tutorial here: <https://github.com/salaboy/platforms-on-k8s/blob/main/chapter-6/README.md>

The whole point of this example is to push the reader to think about how to offer complex solutions by exposing simple interfaces to the interested parties (teams).

Whenever you feel overwhelmed by the number of options, think about the following:

- Identify the problems that you are trying to solve, evaluate different projects in the space
- Create PoCs (proof of concepts) to gain deeper insights into how each project works, in other words, get hands-on experience
- Check if “Project X” integrates with other tools in the ecosystem, check if other companies are using the project, and for which use cases
- Check for case studies that may be published by the CNCF or companies sponsoring or using the projects
- Keep an open mind, and do not get too biased by the hype of specific projects. For example, it is ok to look for projects outside the CNCF space.
- Reach out to maintainers and contributors; they are always willing to help

Luckily, most of these communities are driven by amazing people, which takes me to the next section: you must be open to working with people and companies worldwide.

## Working with people

Writing a book about the cloud-native landscape was only possible by getting help from people involved in each of the projects mentioned in the book. Every chapter in the book was heavily influenced by a maintainer or someone very involved with the projects I covered. But before asking them for help and feedback on the book's contents, I contacted them via GitHub or the project’s preferred communication channel (Slack, Discord, etc) to report a bug or request a feature. It was funny because most of the time, my issues/requests were like: *“I am trying to do this with project X, but when I use project Y everything breaks”*.

When you report a bug or request a feature, you don’t know who will pick it up on the project side. You don’t know if they will think it is a dumb idea or even if they will consider your request. When you are evaluating a project for the first time, you don’t know the project motivations, financial support (is there a company behind it sponsoring the development), and the health of its community.

With time and as I get older, I realize that understanding the context of open-source projects is vital to justify my time investment in these projects. Open source projects are just hobbies if companies do not adopt them, and you need to wonder, are you doing a hobby, or are you adopting open source projects for real-life use cases where there will be a financial implication to it?

When I interact with people across different communities, I know that they are, most likely, being sponsored by companies with some kind of financial motivation. Sometimes, companies behind open-source projects don’t have clear goals or objectives with their open source projects, and that is also an essential factor to be considered.

With all this in mind, all these interactions with people from all over the world, with different motivations and goals, are an extremely rich environment to learn and move forward in your career. In my case, I feel that I’ve not only learned technical things but also created connections with people from different backgrounds that I wouldn’t have managed to make by working at a single company.

For the book, I was looking for continuous integration tools that enabled me to build and distribute container images. I created a simple PoC with Tekton that provides a very Kubernetes-native way of doing pipelines. But I knew that I needed to compare that with, for example, GitHub Actions, and both options frustrated me a lot because both require a remote environment. That is where I found about Dagger, which allows you to define pipelines that you run across environments, even in GitHub actions: <https://github.com/salaboy/platforms-on-k8s/tree/main/chapter-3>

![Learning in the Open](https://lh7-us.googleusercontent.com/pQoLcaHb71gtbX8GihkyGsWZGR25-INxCRZ8-XLAoXJWyJFVfGjO0vfGBILyShw9ZF9w6jemYt962W3dQOkpZYffnWj-BGrs8NLjD9X7XvmtnEcdyz4TlpqU0mBGQU0j5KEg7ZwuHKEPnDystbtJme4)

I engaged with the Tekton and Dagger communities to create the example listed in this chapter. I was lucky to work and learn from [Andrea](https://twitter.com/blackchip76) from IBM, who works on the Tekton and CDEvents projects. I also met Marcos Lilljedahl (@marcosnils) from Dagger, an Argentinian like myself working from Uruguay, who I am presenting in the next edition of the [AppDeveloperCon co-located event with KubeCon EU Paris](https://sched.co/1YFdQ).

Tools like Tekton, Dagger, and even GitHub Actions offer marketplaces where you can reuse building blocks that other companies/individuals have made, heavily promoting reuse instead of building every step from scratch.

Keep learning from others by:

- Engaging with open-source communities, using their tools, and providing feedback. You are going to get more from it than you expect.
- Engaging with companies behind open-source projects and checking what they are building. Companies are always looking for feedback and usually offer products that will save you time. Remember, they are probably sponsoring most of the development work being done in the project.
- Go to conferences and meetups and share what you learn. I know this can be hard, but it pays off. Conferences give you great insights into projects and where companies are going to. Use this knowledge to influence your decisions around projects and products.
- Reach out, don’t be shy, and make new friends. Most people working on open-source are always welcoming to help new people and answer questions

Finally, let’s talk about something we think we are used to but are not: dealing with changes.

## Dealing with change

Writing a book is a crazy thing because whatever you write will be printed, and it will not change. In an industry where things change constantly, writing a book about a dynamic landscape was specifically challenging, and I got hit by this several times.

In the span of two years, I wrote about projects and tools that were discontinued or that heavily changed direction. Some ideas were good two years ago, but things changed, and these projects were replaced. Sometimes, the company behind the project goes bust, and the community around it needs to be stronger to keep it alive. After going over three or four of these cases, I realized that this is a constant more than an exception.

How do you deal with changes when designing and architecting your applications? As a developer, I would create interfaces to abstract away some low-level decisions. You can apply the same principle when adopting and evaluating tools. Is the tool you are looking for helping you be more flexible about your options down the road or pushing you to make some decisions that will be hard to revert to later on?

Projects like Crossplane and Dapr are perfect examples of tools that abstract away decisions with the primary purpose of giving you flexibility. These projects provide APIs to achieve completely different things but complement each other perfectly ([check my blog post in the Crossplane Blog](https://blog.crossplane.io/crossplane-and-dapr/)). I was surprised when I first looked into the Dapr project, as it provides something that directly aims at developers creating cloud-native applications. I was surprised mainly because there were few tools focused on developers in the cloud-native space, but also because with tools like Dapr, you extend Kubernetes capabilities to not only standardize how you run your workloads but how your workloads can interact with their environments.

For the book, I show how adding Dapr to the example application makes the application independent of the environment so developers can focus on consuming stable APIs configured to work with different implementations on different cloud providers. <https://github.com/salaboy/platforms-on-k8s/tree/main/chapter-7>

![Learning in the Open](https://lh7-us.googleusercontent.com/h4Kz_RlF2n03ZoitOo_36GjzPEbarEUQf_CVg5ObSKJ6cZlCpVc-tWlJB057UTACKlLXWH8xOOPIo_m-4huJHNNZ17HNCa1EhEIUbfHUmx9969StLl8TYKJZ12peaKdy3f66Dq9T851IEI8QujhhX3w)

Combining this approach with tools like [Crossplane](https://crossplane.io) is just a natural step. I’ve also experimented with [vcluster](https://vcluster.com) and sharing the same Dapr control plane with multiple vclusters, to not only enable teams with isolated clusters, but also to reuse components in multi-tenant setups. 

Make your tool decisions future-proof by:

- Making sure that these tools provide interfaces that support multiple implementations, down the road you might need to plug in your own for your use case
- Making sure that these tools provide hook points to be able to customize its default behavior
- Always ask yourself, how is this project going to work for local development, how many changes do I need to make to run this in production, and how is this going to impact teams
- Looking for tools that also provide ecosystems, such as marketplaces with community-driven integrations or catalogs with pre-made configurations

## Sum Up

In this relatively large blog post, I wanted to cover three aspects that became fundamental for me to understand when writing the book. I couldn’t have finished it without the invaluable help of very committed individuals working on open-source projects. Understanding that things will change and that change is constant was the biggest lesson that I took from this experience. While ecosystems will keep growing, we (the individual contributors), as a vital part of this industry, are responsible for helping things improve.

As always, get in touch ([@salaboy](https://twitter.com/salaboy)) if you have questions, want to chat about these topics, or collaborate on some open-source projects. There is always too much work to do in the open and too many new lessons to be learned.
