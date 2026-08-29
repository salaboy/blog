---
title: "Microservices, Spring Cloud, DDD, BPM and DM"
date: 2017-06-20 13:41:46 +0000
permalink: /2017/06/20/microservices-spring-cloud-ddd-bpm-and-dm/
description: "Hi everyone, I'm here with Mario Romano in JBCNConf 2017 and I wanted to share with you some of the details about the example that we presented which uses…"
tags:
  - "cloud"
  - "community"
  - "engine"
  - "Java"
  - "rules"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "BPM"
  - "distributed"
  - "microservices"
  - "spring boot"
original_url: https://www.salaboy.com/2017/06/20/microservices-spring-cloud-ddd-bpm-and-dm/
---

Hi everyone, I'm here with [Mario Romano](http://twitter.com/MagemelloMario) in [JBCNConf 2017](http://www.jbcnconf.com) and I wanted to share with you some of the details about the example that we presented which uses [Spring Boot](https://projects.spring.io/spring-boot/) / [Spring Cloud](http://projects.spring.io/spring-cloud/) components.  [This Demo builds up on the topics described in my previous post.](/2017/06/07/ddd-knowledge-centric-methodologies-are-they-converging/)

We strongly believe that this is the first step to apply BPM & DM technologies in modern environments, but we also know that there is still a lot to do to work efficiently with these technologies. BPM & DM technology were created long time ago, relying on different architectural patterns and infrastructures, so we are doing our best to catch up and make sure that these technologies can fit and interact as is expected in highly distributed environments.

On this blog post I will be covering the scenario that we described in the presentation and what are the main points that we wanted to highlight to the audience.

## Slides

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/77103680" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

## Emergency Dispatcher Demo

In our Demo we described how an emergency service deals with an emergency request being reported. From the company perspective, everything starts with an emergency report that needs to be handled. This might include coordinating firefighters, hospitals and other organisations.

![Screen Shot 2017-06-20 at 10.04.16](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/06/screen-shot-2017-06-20-at-10-04-16.png)

The core domain knowledge is centered around how to correctly Dispatch and Emergency request to start the most appropriated procedure. These procedures as well, will contain information about how to coordinate different entities, so they will be highly regulated, monitored and audited.

From the business perspective the following Events and actions describe the logical steps to be executed:

1. Emergency Request arrives
2. Emergency information enriched and processed
3. Emergency Procedure is selected and triggered

The Demo shows how we can handle this scenario in an efficient way, making sure that we spend time on the core business problems instead of in the infrastructure.

## Spring Cloud / Spring Boot and MicroServices Implementation

You can find the example here: <https://github.com/Salaboy/jbcnconf-2017-emergency-dispatcher>

This example is using Zuul as a Gateway Proxy to interact with all the services, Spring Cloud Data Flow to deal with the incoming Emergency Requests, Eureka for Discovery and as Service Registry, RabbitMQ as the Spring Cloud Message Bus provider and Zipkin to keep trace of all the system calls in context.

![Screen Shot 2017-06-20 at 10.04.02.png](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/06/screen-shot-2017-06-20-at-10-04-02.png)

The example is using Docker Compose to start Rabbit MQ and Zipkin, and we can of course, provide a docker image of each of the services, but that was out of the scope for this demo.

If you look at the Github repository you will see that there a lot of projects. These projects are all independent to each other and can run in isolation. You will find out that as soon as you start the procedure-registry-service all the available services will be registered to it. When you start the gateway project all your registered services will be automatically routed through Zuul.

Spring Cloud Data Flow is being used to process stream incoming of data, in this particular example, this is being used to define a pipeline that will be listening for Incoming Emergency Requests, enrich these request with more information by calling third party services (Google and Patient Records Service) and then delegating the responsibility of picking the right procedure to the Emergency Dispatcher.

Emergency Procedures are registered as normal services but they add extra metadata so then we can dynamically query to see which procedures are available.

The Emergency Dispatcher block is in charge of having the logic to score each emergency and based on that score the most appropriate procedure will be executed.

Procedures in general terms can be implemented in anyway you want, using any technology that you want, but we recommend to use tools that can help you and your domain experts to share their expertise. We show in these procedure how you can use the [Activiti Process Engine](http://www.activiti.org) to automate Business Process Definitions. These business processes will describe how the emergency will be handled depending on their information and context.

A Fire Emergency process might look like this:

![Screen Shot 2017-06-19 at 10.22.58](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2017/06/screen-shot-2017-06-19-at-10-22-58.png)

Notice that the emergency dispatcher is also a good place to add a Model, like a decision table or a decision tree, to externalise how the Dispatching decision is made and how the scoring system works. For this presentation we wanted to show the mess that you can create when you mix infrastructural code such as interacting with the Service Registry and business logic. If you look at the Dispatcher you will find that the logic is quite simple but the code becomes a mess quite easily.

I encourage you to run the example on your environment to understand the details. You can follow the README file to set up the project in your environment and please feel free to send questions, comments and feedback if you find issues with the README file.

I will be publishing the video form the conference when it is available.
