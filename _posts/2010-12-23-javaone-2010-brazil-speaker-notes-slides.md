---
title: "JavaOne 2010 Brazil Speaker Notes + Slides"
date: 2010-12-23 19:39:41 +0000
permalink: /2010/12/23/javaone-2010-brazil-speaker-notes-slides/
description: "This post is basically the speaker notes from my presentation at JavaOne 2010 in Brazil. You can take a look at the prezi presentation here."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jbug"
  - "PlugTree"
  - "Trips"
  - "BPM"
  - "business"
  - "Drools"
  - "process"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/12/23/javaone-2010-brazil-speaker-notes-slides/
---

This post is basically the speaker notes from my presentation at JavaOne 2010 in Brazil. You can take a look at the [prezi presentation here](http://prezi.com/sfhxnuzxz5e-/java-one-drools-in-real-life/).

I would like to thanks to Alejandro Ramirez and Alejandro "El messie Barney" Romero for the presentation style and drawings.

## Slides

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/6333511" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

## Speaker Notes

How many of you know about drools? How many of you used it?

We will make a quick introduction about the main features of the project, so you can have a general idea what the project is about and what you can do with it. Drools is a project that right now is sponsored by JBoss that is a division of Red Hat. but it has a great community around it. We are in the community side and we try to improve the project and add more new features.

Drools is Apache licensed so if you want to try it or use it in your applications you can visit the official web page [www.drools.org](http://www.drools.org).

In the official web page you will see that Drools right now is defined as a **Business Logic Integration Platform** and during this talk we will see why. For this reason we believe that is highly recommended to understand the project evolution and all the concepts around it. After seeing a few concepts we will jump to see how an application can be created using it and what kind of cool functionalities we can develop.

So, lets start with the first and main concept that you need to incorporate. The concept of a Rule Engine.

## Rule Engine

Drools was born as an Rule Engine a.k.a Inference Engine. This is not a common concept in every developer mind and When I mention this, not too many developers feel comfortable with the rule engine idea. Let me try to describe the main concepts that you will see when we talk about a rule engine quickly.

We have our our living world that represents our situation right now. Just to be technical, Our Java Objects Instances will live in that world. We create our domain POJOs normally and then we insert them inside this world. Our Knowledge, is what we know about situations in our domain and what we must do when a situation takes place. Based on the state of the world and the knowledge that we have the rule engine make deductions and it execute some actions that will change the state of the world. We see a person here because the rule engine can give suggestions to a human that will be responsible for executing the action or directly execute an action in an external system.

A frequent example that you will find if you start reading books about these topics is the Fire/Alarm example.

In our world we have a house. In JAVA that means that we will have  House POJO, because our domain is knowing about Houses. And when we have  fire (A POJO that represent fire) inside the house we need to turn on the fire alarms. When the fire alarms are turned on the Fire fighters will come.

This is our knowledge about this situation and we can Express it in the form of Rules. Rules will express what to do in a specific situation in a declarative way. Meaning that we will define what to do and not how to do it. The rule engine will evaluate the world (our house and if there is Fire in it) and it will know when to turn on the fire alarms because it will have control about what is happening in our world.

Then we can have another rule that express that we need to call the fire department when the Fire Alarm is ON.

Just to be clear, this is not the replacement for **IF statements** in Java. The rule structure looks pretty similar to an IF/ELSE statement. But we will not be able to call this rule directly. This rule will only be executed when this situation take place.

You also need to know that Inside a Rule Engine we can have Thousand and Million of rules running at the same time, and that’s ok because they were designed for handling a huge amount of knowledge.

Imagine that for representing real life situations you will end up having a fair amount of rules depending your scenario.

These are the main concepts that you need to understand about a Rule Engine but:

### Why and When do I need this?

Books would say that You can use this kind of approach when you have a problem that doesn't have a clearly defined algorithm to solve it.

### Rule Engine Conclusions

In real life, because we are java developers and we design solutions for real life,  we can leverage this approach when our knowledge is updated frequently. Business reality, your company reality and your company business changes everyday making our current software obsolete for tomorrow. We need a way stay up-to-date to solve efficiently new business problems. With the current ways of development we don't have that flexibility. Changes take forever to be tested and moved to production. So we can use this approach to decouple the business logic that changes frequently in the form of rules. This will keep the business logic decoupled from the application infrastructure, letting us have different life cycles for rules and the rest of the application.

## BPM and CEP on top of the Rule Engine

Nowadays Drools is more than a rule engine. Right now Drools also provides modules about BPM and CEP. How many of you have heard about Business Process Management or Complex Event Processing? Raise your hands!

It is very important for you to know a little bit about this two disciplines to understand how we can use them both on top of the Rule Engine.

## Business Process Management

Is a discipline that was born to improve how  the companies do their work. The key concept inside this discipline is the concept of Business Process. A business process is another piece of knowledge about how the company achieve business goals. Achieve a business goal just means do a specific  sequence of tasks to do something valuable for the company. These tasks can be performed by people or systems and the business process definition helps us to formalize and coordinate all the interactions.

This example shows a simple business situation where the following happens:

A car comes to the Car Wash

The car is washed by the machine

A text message is sent to the owner to inform him/her that the car is ready for pick up

The keys are returned to the owner

This business situation can be formalized as a business process using the  declarative notation specified in the BPMN 2.0 Standard.

This process belongs to a Car Wash company and it describes the steps that are required to wash each car that comes. The goal of this business process of course is to Wash a Car. To have a clearly defined goal and owner for the process is extremely important.

What we see here is a formalization of the steps required from the company perspective to achieve the goal of washing a car. You can see that each step is described and also we will define for each step if is a Human Activity or a System Interaction. In this case the Ask for Service Type Human task will be in charge of Asking for the type car wash that the client wants. After this human task the washing machine will wash the car and we will have an external system that will send a text message when the washing is done. Finally we have Human task in charge of returning the keys to the owner and measure the client satisfaction asking some basic questions.

As you can notice this is a very simple example but you can imagine how business processes can look in big companies, right?

Business Process Management is a discipline that define how we can manage all our business processes definitions and executions. And Business Process Management systems are tools that helps to implement this discipline inside our applications.

Inside Drools we have a module called Drools Flow/jBPM5 that is a Business Process Management System where we can express and execute our Business Processes using a new standard called BPMN2.0 for business processes modeling and execution.

### Conclusion BPM

Having the company Business Processes defined helps a lot. First of all because we have visibility about the tasks that are being done inside the company. Because they are represented with a graphical notation non technical people can understand them and validate them. We can also train new people that comes in to the company easily, showing them the tasks defined in different processes that involves the roles that they  suppose to have. We gain all of that just defining the business processes, if we execute them using a software solution like jBPM5/Drools Flow we get a lot more. Imagine that if we execute our business processes they will guide the business users through their everyday tasks. We can also store metrics about how the tasks inside the business processes are executed and we can also analyze how the processes are being executed to be able to improve them.

From the manager perspective we can create a Dashboard that shows them in real time how many business processes are running and who are the bussiest roles and systems in the company. This information is too valuable for finding bottle necks and for decision making.

From an architectural view we can see a BPMS highly related with SOA architectures because they seem to be the glue that can be used to coordinate service interactions.

## Complex Event Processing

Finally, we have events that represent the dynamic aspects of our applications. All the functionality that is responsible for receiving / correlating / aggregating and creating new events can be also expressed declaratively using business rules that understand about these dynamic aspects.

A basic concept inside Complex Event Processing is the concept of event. If you start looking at books that talks about CEP you will find that an event can be defined as:

**Significant change of state. on something that is meaningful for our domain.**

In CEP we talk about complex events, and not complex processing. We use the term complex events to specify the notion of composition and aggregation of events to create more complex ones. We can say that a Complex Event is the one that is generated by a set of different events.

Complex Event Processing is a discipline that lets you define what kind of events will be meaningful our application and the rules that we will use to correlate and aggregate them to identify different situations.

A simple use cases of CEP is the following:

In this situation we have a coffee store company:

a client comes into the store,

orders a coffee,

pays for it,

the coffee assistant prepares the coffee and when the coffee is ready the client is called by his/her name

finally the client picks up the coffee.

In this situation we can identify different events. When the clients comes in can be modeled as an event called ClientsEntersToTheStoreEvent. When the client order a coffee we can have an OrderCoffeeEvent. When the coffee is ready we can have an CoffeeIsReadyEvent.

Notice that events are asynchronous by nature and have a strong temporal notion also they have specific information that can be captured from the change of state.

For example the OrderCoffeeEvent can contain the information about the coffee that the client order, the client name and some customizations that the client wants for that particular order.

If we start looking at these events and how they happen we can analyze the situation behavior and how we can improve it or measure it.

We can create the following rules that must be applied to keep the business working correctly:

if the number of OrderCoffeeEvents are greater than 10 in the last 5 minutes and we just have a sinlge employee working at moment, we need to hire more employees. (or raise an alarm that let us know that one employee is not enough for that situations)

if  we receive a CoffeeIsReadyEvent after 5 minutes the order was made we must give the client a gift card for being patient.

We can create a new event for HappyCustomers when the following sequences of events are generated for a client.

The time between the order and the pickup is less than 4 minutes. Notice that the HappyCustomer event will be generated only under these circunstances. Based on the amounts of HappyCustomerEvents that we have in one day we can generate another high level event for managing purpouses.

### CEP Conclusions

CEP let us handle different streams of events that come into our systems and correlate them in order to react on different situations. This will let us create more responsive applications that react in near real time and give information about what is happening right now.

If you start reading about CEP you will find that it’s closely related with Event Driven Architectures that also propose a very interesting approach to have Event Producers, Event Processors and Event Consumers in a decoupled  architecture to gain flexibility in our software designs.

## Conclusions

We would like you to take a look at these topics if you have time Because we think that they change the way that you think about developing applications. These concepts are not tied in any way with drools and when you learn about them you can apply them in every application that you develop.
