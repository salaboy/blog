---
title: "Orchestrating MicroServices"
date: 2020-10-28 08:42:39 +0000
permalink: /2020/10/28/orchestrating-microservices/
description: "During this presentation, I've focused more on the orchestration side of the example that you can find here…"
tags:
  - "BPM"
  - "bpmn2"
  - "camunda"
  - "cloud"
  - "community"
  - "docker"
  - "engine"
  - "English"
  - "event"
  - "Java"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "spring cloud"
  - "tutorial"
  - "workflow"
  - "zeebe"
  - "cloud native"
  - "containers"
  - "k8s"
original_url: https://www.salaboy.com/2020/10/28/orchestrating-microservices/
---

During this presentation, I've focused more on the orchestration side of the example that you can find here: <http://github.com/salaboy/from-monolith-to-k8s> . Instead of spending time discussing the frameworks used for the example, I've highlighted the importance of exposing the business logic and flow of our applications to other relevant stakeholders.

The first half of the presentation was focused on the example scenario and some tools that I've used to build the Cloud Native version of the application. This intro covered the use of [Spring Cloud Gateway](https://spring.io/projects/spring-cloud-gateway) with [Resillient4J](https://github.com/resilience4j/resilience4j) to provide a single entry point for all our services from outside the cluster.

After showing some of these projects in action and describing why you might want to look at them for your own projects. I spent some time describing the common pain points and challenges of building this kind of applications and how we can use Zeebe, a workflow engine, to tackle some of these challenges.

### Slides & Video

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/238988609" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/ZM9dfvXAncQ" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="YouTube video player"></iframe></div>

During the demo, I focus 3 versions of the workflow model that built on top of each other.

First, we replace the code inside the *Call for Proposals* (C4P) service with a workflow model and we delegate the execution of this model to the workflow engine. You can find the code that was used before adding the workflow engine interaction [here](https://github.com/salaboy/fmtok8s-c4p/blob/no-workflow/src/main/java/com/salaboy/conferences/c4p/C4PController.java#L60). The new version where the following model is used can be found [here](https://github.com/salaboy/fmtok8s-c4p/blob/master/src/main/java/com/salaboy/conferences/c4p/C4PController.java#L133). The main difference in code is that now the *Call for Proposal* service doesn't know or care which service is called next, that decision is now delegated to the following model (Version 1).

[![Call for proposals workflow](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/10/call-for-proposals-workflow.png)](/content/images/2020/10/call-for-proposals-workflow.png)

The second version of the model adds on top of the first one, by changing the model, hence changing the sequence of interactions, demonstrating how useful is to have the core business logic expressed as a model that can be shared with non-technical teams.

The new model covers the scenario where we need to send a confirmation link to our potential speakers to confirm their participation, before publishing the proposal to the Agenda.

[![Call for proposals workflow speaker validation](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/10/call-for-proposals-workflow-speaker-validation.png)](/content/images/2020/10/call-for-proposals-workflow-speaker-validation.png)

Now that we have two versions of our workflow model, you can clearly explain how your Cloud Native applications are working today and how they were working yesterday, as these models can serve as live documentation about how your compony/organization is currently operating.

The third version of the model included an example of time-related actions, such as notifications or "Cron Jobs" that needs to be triggered at a certain point in time-related to the context of our execution. In other words, time-sensitive actions that are associated with each individual instance of our models.

[![Call for proposals workflow time](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2020/10/call-for-proposals-workflow-time.png)](/content/images/2020/10/call-for-proposals-workflow-time.png)

This last version exemplifies notifications that needs to be sent to the committee only when they haven't reviewed a new proposal after a certain period of time. This kind of mechanism, allows us to implement reminders and notifications which can help us to delivery a better service to our "customers" in these case our potential speakers.

It is important to remember that, the workflow engine keeps track of all the data about these executions and send this data to ElasticSearch where it is indexed and ready for reporting and analytics. For this specific example, it might be interesting to know the average time that takes to make a decision in a proposal and configure the notifications according to a deviation from that time.

### Sum up

There are loads of other interesting details inside the project, and as I mention in the presentation I want to thank to [mcruzdev1](https://twitter.com/mcruzdev1) for helping me to make the application better, more real and more complete. If you are interested in running this example in your own cluster visit: <http://github.com/salaboy/from-monolith-to-k8s> and get in touch if you want to get your hands dirty and help me and [mcruzdev1](https://twitter.com/mcruzdev1) to keep improving the app to make a better example for everyone to use.
