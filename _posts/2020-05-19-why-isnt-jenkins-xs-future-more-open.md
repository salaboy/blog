---
title: "Why isn’t Jenkins X’s future more Open?"
date: 2020-05-19 18:34:22 +0000
permalink: /2020/05/19/why-isnt-jenkins-xs-future-more-open/
description: "Read 8th July 2020 Update Here: https://jenkins-x.io/blog/2020/07/08/jxopeninnovation/ and issue on Jenkins X closed…"
tags:
  - "cloud"
  - "cloud native"
  - "English"
  - "Java"
  - "Jenkins X"
  - "kubernetes"
  - "microservices"
  - "oss"
  - "ci/cd"
  - "cloudnative"
  - "community"
  - "jenkinsx"
  - "open source"
original_url: https://www.salaboy.com/2020/05/19/why-isnt-jenkins-xs-future-more-open/
---

**Read 8th July 2020 Update Here**: https://jenkins-x.io/blog/2020/07/08/jxopeninnovation/ and issue on Jenkins X closed https://github.com/jenkins-x/jx/issues/7207 . Once again Open Source is strong. I am super happy to see how this turned out and I am looking forward to getting even more involved with [Jenkins X](http://jenkins-x.io) and the [cd.foundation](http://cd.foundation).

***or as alternative title: "How to kill a community project 101"***

It is quite common to see companies behind Open Source projects fighting to provide a sustainable business model that builds up on top of these community projects. I know because I worked as a core engineer and also contributed to projects like [jBPM](https://jbpm.org/), [Drools](http://drools.org/), [Activiti](http://activiti.org/), [Spring Cloud](https://spring.io/projects/spring-cloud), [Jenkins X](http://jenkins-x.io/), [JHipster](https://www.jhipster.tech/), [Zeebe](http://zeebe.io/), etc. and I’ve seen these situations arise from the inside.

Finding the right commercial and Open Source balance isn’t always straightforward and it isn’t painless either. You might have heard of the stories of community engineers and teams arguing with “the company’s upper management“ to keep working on their open source project with their already open-source practices while the product is being built. Particularly after the team spent so much effort to nurture the right culture and collaboration with the community.

More recently I’ve noticed the Jenkins X community project going down the same path <https://jenkins-x.io/blog/2020/05/15/helm3/>

I decided to try to summarize the downsides of approaching building a product on top of an open-source project by killing its community.

## A bit of background

I’ve been involved with the Jenkins X initiative since the early beginning. Back in 2018, I delivered a workshop at JBCNConf about deploying distributed services using Jenkins X (<https://www.jbcnconf.com/2018/infoTalk.html?id=24> / <https://docs.google.com/document/d/1kfSYhIuPa249poM8quyiazolOyn-feWPbVHyHmy5pD8/edit#heading=h.h38mzmjnh0xo>) and since then I’ve kept spreading the word and advocating its benefits.

During this time the project owners and maintainers were always active in Slack and they kept an open and transparent way of running the project. What happened from 2018 until Jan of 2020 was remarkable, as the project grew a strong community of over 2500+ members in the Slack channel. Most of them were engaged in constructive discussions.

In 2019 I was nominated as a temporary Steering Committee Member for the Jenkins X project <https://github.com/jenkins-x/jx-community/tree/master/committee-steering> . I was honored to be awarded such a position. In 2019, the [Continuous Delivery Foundation](https://cd.foundation/) was created and Jenkins X joined as a founding member.

Jenkins X is unlike any other project that I worked on in the past.

Most of the project complexity comes from downstream projects that are glued together. The speed of changes in these projects is unprecedented and keeping up with all of it is a big challenge. Because of this, Jenkins X is more than a solution to a CI/CD problem, it is a shared community learning experience and a research project that pushes the boundaries of best practices for CI/CD in Kubernetes.

In 2019, there was a lot of pressure to stabilize dependencies. The Jenkins X team and the community really came together to find solutions to continuous integration and continuous delivery challenges in a cloud-native way (the actual purpose of Jenkins X). Also in 2019, the Jenkins X core team expanded thanks to CloudBees (the company behind the project) which hired a lot of people working in the community.

However, towards the end of 2019, the core engineering team began shifting its work to more private initiatives such as the SaaS offering of Jenkins X. As you would expect, the open-source project saw a slowdown.

I thought “that’s normal and there is nothing to worry about.” The company behind the project has to make a profit at the end of the day. CloudBees also announced that the project was to take a more defined route and not all decisions would be taken in the open, including the new work on the innovation side (<https://jenkins-x.io/blog/2020/05/15/helm3/#why-isnt-this-all-more-open>). It’s a tradeoff, of course. Cloudbees employees have more to say on the project and development might go faster in the short term, but you could lose the community engagement and contribution. What’s important is how you strike the balance.

## What we lose

When a popular Open Source project like Jenkins X decides to stop innovating in the open, you can expect a less engaged community and fewer core engineers looking after the project. The project might also lose:

- The strong sense of community
- The trust between core and community members
- The sustained pace and quality of work
- The drive to work together and solve challenges
- The [Open Source way](https://www.theopensourceway.org/wiki/Communities_of_practice) of working is no longer applied. Building, maintaining and growing a healthy community around it is hard, if not impossible
- The project loses its competitive edge
- The company’s appeal to new Open Source clients/users
- A transparent roadmap

Imagine if Linus Torvalds, or even a multinational company like Red Hat would decide to roll out their own version of Linux in private: Linux++. The next thing you’ll see is thousand of upset contributors looking for alternatives and customers wondering if it is time to move on.

I always wonder, “If you ask an Open Source project to stop working in a way that made your project popular, do you actually understand how Open Source works?”

## What can be done about this?

I’ve learned so many things from these last 2 years involved with the project that I think it is worth the time and effort to express my discomfort with their decision. Knowing personally the engineers behind the project, their careers, and their way of working, this is clearly a company’s decision to stop Open Source innovation in favor of product development. If you are part of the Jenkins X community, feel free to express your opinions about these changes made by the project, how do they affect the entire community, and the points raised in this blog post.

I’ve just created the following GitHub issue <https://github.com/jenkins-x/jx/issues/7207> for you to **upvote** if you agree with the points covered in this blog post. As a community, we should express our concerns, so the company behind the project can see that doing things in the open matters.   
If you want to get in touch, drop me a message via [twitter](http://twitter.com/salaboy) or drop me a comment here.

**Read 8th July 2020 Update Here**: https://jenkins-x.io/blog/2020/07/08/jxopeninnovation/ and issue on Jenkins X closed https://github.com/jenkins-x/jx/issues/7207 . Once again Open Source is strong. I am super happy to see how this turned out and I am looking forward to getting even more involved with [Jenkins X](http://jenkins-x.io) and the [cd.foundation](http://cd.foundation).
