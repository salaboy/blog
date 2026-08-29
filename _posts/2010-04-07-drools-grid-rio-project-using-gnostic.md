---
title: "Drools Grid + Rio Project (using Gnostic)"
date: 2010-04-07 14:46:30 +0000
permalink: /2010/04/07/drools-grid-rio-project-using-gnostic/
description: "In this post I will describe a simple use case to demonstrate the Drools Grid + Rio Project integration capabilities."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "Drools"
  - "events"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/04/07/drools-grid-rio-project-using-gnostic/
---

In this post I will describe a simple use case to demonstrate the Drools Grid + Rio Project integration capabilities. I will include also the use of Gnostic, that it's a Rio new service to monitor our grid of services based on rules that we define using SLAs.

Note: the Drools Grid Rio implementation is already merged into the trunk, but it needs to be compiled against an special Rio branch that includes Gnostic. We also need to compile the Drools Trunk and also the RIO Branch using JDK 1.6.

[Please    read  the disclaimer  first](/disclaimer/)

## Simple Use Case (Hospital Beds)

Here I will define a simple use case to test the Drools Grid RIO features, using two networked machines that will be hosting a dynamic grid that will scale up based on demand. For this example I will define an Object Model to represent a Hospital that has a finite number of beds where we check in patients that will have a set of monitors to check their vital signs in real time.

The model will looks like the following figure:

![Hospitalusecasemodel](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/04/hospitalusecasemodel.png "HospitalUseCaseModel")

Basically, a new Patient comes into the Hospital, the system automatically assign him/her a Bed, and a set of default monitors. What we will analyze with this simple example is how we distribute the load and the knowledge sessions used to monitor each patient. Here I will demonstrate an architecture to dynamically allocate new knowledge session containers over the net creating an elastic grid of knowledge that will grow on demand.

## Proposed Distribution

Imagine that we have a lot of vital signs monitors for each patient, we can generate a high load for each session, requiring a lot of memory and CPU resources. We need to define how we will distribute this sessions over the grid and the SLAs needed to enforce a certain quality of service.

The proposed distribution will looks like:

![Grid distribution](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/04/grid-distribution.png "grid-distribution")

As we see in the previous figure we will have the following components interacting:

- Execution Nodes, will be knowledge session containers. We can define how many knowledge session each execution node will host in a SLA format.
- Gnostic, will be in charge of enforce the accomplishment of all the defined SLAs
- The Directory Node will be in charge of knowing where, in which execution node, is hosted a specific session.

Using these components we can define the following restrictions:

- Each ExecutionNode will host a maximum of 4 knowledge sessions.
- Each ExecutionNode will start with no knowledge session inside it. These sessions will be created dynamically for each patient that is checked in.
- When the Rio Grid environment start up, and a drools-grid-rio oar file is deployed just one ExecutionNode will be created. Gnostic will be in charge of scaling up (creating new ExecutionNodes) when the maximum number of knowledge sessions per ExecutionNode was breach.
- Each Drools-Grid-Rio distribution can host a maximum of 3 Execution Nodes per machine.

## Live Demo

The end result of a series of posts will be a live demo that shows how the grid will scale up. I would like to show also how we can plug new machines to the grid, and they auto-magically can be used as computation resources for spawning new ExecutionNodes.

In the demo you will see:

- How a new knowledge session will be created when a new patient is checked in
- How the grid is dynamically scaled up when an execution node already contains 4 knowledge sessions, and a new session needs to be created
- How the grid can be extended over the net plugging new computation resources (new machines) with the drools-grid-rio distribution.

## Playing with Gnostic

The following image shows some of my previously results. I was playing with Gnostic and scaling up my ExecutionNodes based on load. This was just a test to see how all the stuff works. I will expand my tests to create the Live Demo. This is just to show the results that I've already obtain.

![Playing with gnostic](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/04/playing_with_gnostic.png "playing_with_gnostic")

I was using the following SLA:

```java
sla(id:'load', low:10, high: 30) {
  rule resource: 'ScalingRuleHandler', max:5
}
```

With that SLA Gnostic monitor each ExecutionNode load, and if the mean (green line in the chart) is over 30%  (red line in the chart)f or more than one minute, it dynamically creates a new ExecutionNode. This SLA also enforce that we will have a maximum of 5 ExecutionNodes in this cybernode.

## Wrap-up and some notes

I need to include some new features inside the Drools Grid Rio project to support SLA based on the count of knowledge sessions per execution nodes. With this SLA defined, I will create a screencast showing how the grid will scale dynamically when a new patient is checked in.

Feel free to add suggestions, desired behaviors and everything that you want to see in the screencast!
