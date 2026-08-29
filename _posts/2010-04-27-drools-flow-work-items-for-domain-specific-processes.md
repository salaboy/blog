---
title: "Drools Flow - Work Items for Domain Specific Processes"
date: 2010-04-27 00:25:10 +0000
permalink: /2010/04/27/drools-flow-work-items-for-domain-specific-processes/
description: "When we define business processes one of the main points behind the graphical representation is the fact that we expose in a declarative way how our…"
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "jbug"
  - "PlugTree"
  - "BPM"
  - "bpmn"
  - "Drools"
original_url: https://www.salaboy.com/2010/04/27/drools-flow-work-items-for-domain-specific-processes/
---

When we define business processes one of the main points behind the graphical representation is the fact that we expose in a declarative way how our business works. It's important that our processes reflect the functional behavior of the activities inside it. For this reason, we need to choose wisely how to represent each activity and how these activities will behave in our process runtime execution.

## Domain Specific Processes

Work Items inside Drools Flow allow us to define the Activity Graphical Representation and it's Functional Behavior. This is where Drools Flow let us customize it's behavior to represent domain specific activities. For us, it's important to understand that for each specific activity with a different functional and specific behavior we need to create a different Work Item.

For each work item, we will be responsible for define it's internal behavior and it's graphical representation. This is an important task, because we need to define to main points:

"What": we need to define what the activity is, in a domain specific context. What does it means for the business people, how they understand the activity, what they expect from it.

"How": we need to define how the activity needs to be executed, which are the technical steps required from the activity to be completed. Another point important here is how we use Drools Flow to integrate and orchestrate different systems and humans interactions. When we talk about domain specific activities we are basically describing a different and domain specific way of interaction. We need to understand that specific Work Items will have domain specific logic and mechanism to interact with different systems that require different types of interaction.

## Generic Perspective for interacting with third party applications

Now we have clear goals to use Work Items and a well defined line  that separates the generic behavior of the out-of-the-box Drools Flow  activities and our domain specific ones we can start using Work Items. Work Items will be closely related to the way that our applications were built and it will practically represent the following generic situation:

1. Our business process reach a domain specific work item
2. The domain specific work item will execute a domain specific logic to interact with a specific system. This logic will include synchronous as well as asynchronous interactions with another systems and/or business users. No matter what happens inside the work items, it's not a Drools Flow concern. Drools Flow only keeps track about the processes status (executing node) in a generic way. 3)  The third party application/service/human will execute the activity (synchronously or asynchronously) and it will return to the Work Item the information needed by the process.

We need to recognize the boundary between the Work Item generic mechanism and our domain specific implementation, that it's basically an interaction point with our external application.

Let analyze the following figures that describe Drools Flow responsibilities and your application domain specific.

![Workitemsinteractions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/04/workitemsinteractions.png "WorkItemsInteractions")

The previous image describe the interaction of two different Custom Work Items. The first one with a Synchronous application, where the work item will call an external service wait for it's response and complete internally the work item execution. And the second one interact with an asynchronous service sending a JMS message and behaving as a Wait State/Safe Point. In this second case, the external application is responsible for completing the work item when the JMS message is consumed, executed and finished. For this reason, the external application will require to have access to the KnowledgeSession and the work item id to be able to complete it.

The following figure shows the different components used between Drools Flow and a third party application that it's related with a specific work item.

![Workiteminfo](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/04/workiteminfo.png "workiteminfo")

As you can see, the Drools Flow box show how the framework keeps tracks of the **NodeInstances** that are being executed. In this case when the **WorkItem** is reached a new **WorkItemNodeInstance** will be created and the work item handler associated to that type of work item will be called. This Work Item Handler and the Work Item Manager are shared between Drools Flow and your specific application. It's important for us to know that the code inside our custom Work Item Handler will be tightly coupled with the third party application, and all the logic inside it will create and manipulate information on the third party application.

This application will know how to complete the task that needs performed by the Work Item and when the task is finished the application will have the responsibility to inform the Work Item Manager that the work item was completed or aborted. For that, the application needs to have access to the Knowledge Session and the Work Item ID.
