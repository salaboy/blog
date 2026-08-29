---
title: "(PROCESSES & RULES) OR (RULES & PROCESSES) 3/X"
date: 2012-07-29 11:58:03 +0000
permalink: /2012/07/29/processes-rules-or-rules-processes-3x/
description: "Once you become familiar with the topics discussed in my previous two posts: (PROCESSES & RULES) OR (RULES & PROCESSES) 1/X -> Introduction (PROCESSES &…"
tags:
  - "bpmn2"
  - "Drools"
  - "English"
  - "Java"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "BPM"
  - "BPMS"
  - "business"
  - "JBoss"
  - "jBPM"
  - "jBPM5"
  - "management"
  - "process"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2012/07/29/processes-rules-or-rules-processes-3x/
---

Once you become familiar with the topics discussed in my previous two posts:

- [(PROCESSES & RULES) OR (RULES & PROCESSES) 1/X -> Introduction](/2012/07/28/processes-rules-or-rules-processes-2x/)
- [(PROCESSES & RULES) OR (RULES & PROCESSES) 2/X -> Old Integration Patterns](/2012/07/19/processes-rules-or-rules-processes-1x/)

You can start playing more and more with the Rule Engine. One of the things that you will notice during your first steps is the behavior mismatch between a Rule Engine and  Process Engine. This is the main topic of this short post.

## Introduction

Every time that we start a new Process Instance inside any Business Process Engine we expect that the engine will execute all the activities defined inside the process definition. We understand that the process will run until it reaches a Wait State, meaning that an external Asynchronous interaction is required by the process to continue. All the Synchronous activities will be automatically executed by the engine as soon as possible.

In the previous post we've analyzed a process which includes some rules to Rank a Car and Define the Price of that Car.

![Synchronous Process](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2012/07/example21.png "Synchronous Process")

*Synchronous Process*

For that example, we never doubt about the Synchronous nature of the Rules Evaluation and Execution. Once again, unless we introduce an Asynchronous External Interaction into our process like a Human Interaction or an Asynchronous call to an external system  our process will run each activity as soon as it finishes the previous one.

Now if we jump to the Rule Engine Arena, we have a different expected behavior.

![Rule Engine: Evaluation and Firing Cycle](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2012/07/6440_09_03-activationscycle.png "Evaluation and Firing Cycle")

*Rule Engine: Evaluation and Firing Cycle*

Rule engines work using a two phase execution cycle:

- **Evaluation / Activation:** When we insert new data (Facts) into the Rule Engine, the information is evaluated and all the rules that evaluates their conditions to true will be activated. All this activations are placed inside the Agenda.
- **Firing:** Using a Conflict Resolution Strategy, the Rule Engine will pick **one** Activation from the agenda and it will execute the Consequence for that rule, which can cause  new activations to be placed inside the agenda or the cancellation of previous activations. After finishing executing the selected activation, the engine will pick another activation to execute. This loop will continue until there are no more Activations in the Agenda.

This recursive nature of the rule execution cycle, and the fact that we need to enter into the firing phase explicitly by calling the ***fireAllRules()*** method, force us to think about how the process and rules combination will work at runtime.

## Stateful vs Stateless

As I've promised in my previous post, from now on we will work with Stateful Sessions, meaning that our processes and our rules will be hosted in a session that will be responsible for keeping the status, allowing us to have a richer context to work.

Stateless Sessions can be considered a simplified version of Stateful Sessions, were the execution cycle just run once, and the context cannot be reused to add more information later on. When we start using Stateful Sessions, long running Processes and Rules can coexist and influence each other behaviors.

The Process Instance itself can become a Fact inside the Rule Engine and we can start doing inferences about it. At the same time we can create Rules to evaluate a set of Process Instances which are running in the same session, opening the door for a whole set of patterns. But, before jumping into the patterns we need to understand the execution behavior in this Stateful Environment.

Now if we have a Process which requires to evaluate some Rules as part of an activity we will find out that we explicitly need to call the ***fireAllRules()*** method to execute the consequences of the activated rules. We need to know that our Rules living in the same session where the process is being executed will be evaluated as soon as we insert information into the Rule Engine, activations will be created and placed inside the Agenda, and they will be there until we call the ***fireAllRules()*** method.

From our previous example we can see clearly how different contexts were used and how with stateless session we can obtain a synchronous execution.

![Stateful and Stateless Contexts](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2012/07/6440_09_xx4-statefulandstatelesscontext.png "Stateful and Stateless Contexts")

*Stateful and Stateless Contexts*

Now if we want to do all the evaluations inside the same Stateful Context we need to be careful with the execution behavior. Take a look at the following figure which shows the Process Instance and a set of facts coexisting in the same Stateful Session, where all the evaluations will be made.

![Stateful Context](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2012/07/6440_09_xx5-statefulcontext.png "Stateful Context")

*Stateful Context*

Now we have facts that we will be evaluated as soon as we insert them into the Session, so it will be our responsibility to define where the current activations will be fired. If we want to simulate the same behavior from our previous example, we will need to call the fireAllRules() method after each activity which is related with rules evaluations.

From the application perspective this is not easy to handle, because if we have several processes being executed we will not know when it is necessary to call the ***fireAllRules()*** method for sure.

For this reason, the following section explains a technique which help us to put the Rule Engine a ***Reactive Mode***.

## The Reactive Mode

There are two ways to put the Rule Engine in what we call "***The Reactive Mode***".

- Fire Until Halt
- Agenda & Process Event Listeners

Using these two alternatives we will be forcing the Engine to fire the activations as soon as they are created, without the need of calling explicitly the ***fireAllRules()*** method.

### Fire Until Halt

The **Fire Until Halt** alternative requires another thread to be created, which will be in charge of monitoring the activations and firing them as soon as they are created. In order to put the Engine in a reactive mode using the ***fireUntilHalt()*** method, we use the following code snippet:

```java
new Thread(new Runnable() {
public void run() {
ksession.fireUntilHalt();

}
} ).start();
</div>
```

The only downside of using the **Fire Until Halt** approach is that we need to create another thread – this is not always possible. We will see that when we use the persistence layer for our business process, using this alternative is not recommended. For testing purposes relying on other thread to fire our rules can add extra complexity and possible race conditions. That’s why the following method, which uses listeners, is usually recommended.

Check an example of Fire Until Halt here: <https://github.com/Salaboy/jBPM5-Developer-Guide/blob/master/chapter_09/jBPM5-Process-Rules-Patterns/src/test/java/com/salaboy/jbpm5/JBPM5ProcessAndRulesIntegrationPatternsTest.java#L113>

### Agenda & Process Event ListenersUsing the Agenda and Process Event Listeners mode allows us to get the internal Engine events and execute a set of actions as soon as the events are triggered. In order to set up these listeners, we need to add the following code snippet right after the session creation, so we don’t miss any event:

```java
ksession.addEventListener(
new <strong>DefaultAgendaEventListener</strong>() {
@Override
public void <strong>activationCreated</strong>(
                         ActivationCreatedEvent event) {
    ((StatefulKnowledgeSession) event.getKnowledgeRuntime())

.fireAllRules();
  }
});
ksession.addEventListener(
   new <strong>DefaultProcessEventListener</strong>(){
@Override
public void &lt;strong&gt;afterProcessStarted&lt;/strong&gt;(

ProcessStartedEvent event) {
    ((StatefulKnowledgeSession) event.getKnowledgeRuntime())

.fireAllRules();
   }
});
```

Notice that we are attaching a **DefaultAgendaEventListener** and a **DefaultProcessEventListener** that define several events where we can hook up behavior. In this example, we are overriding the behavior of the **activationCreated(…)** and **afterProcessStarted(…)** methods, because we need to fire all the rules as soon as an activation is created or a process has started. Look at the other methods inside the DefaultAgendaEventListener and DefaultProcessEventListener to see the other events that can be used as hook points. This approach using listeners gives us a more precise and single threaded approach to work.

Check an example using **Agenda** and **Process** **Event** **Listeners** here: <https://github.com/Salaboy/jBPM5-Developer-Guide/blob/master/chapter_09/jBPM5-Process-Rules-Patterns/src/test/java/com/salaboy/jbpm5/JBPM5ProcessAndRulesIntegrationPatternsTest.java#L164>

Notice that this example works in the same way that the previous one, it give us the same results, but in this one we don't need to sleep to wait another thread to finish the execution of the fire all rules cycle. Sleeping is not an option for real applications, and because of the recursive nature of the cycle we will never know for sure how much time the other thread will require to finish.

## SummaryKnowing about how to put the Rule Engine in Reactive Mode will be a common practice to work with processes and rules. It is important to know that both approaches – **Fire Until Halt** and **Agenda and Process Event Listeners** – give the same results in the previous tests, but they work in different ways. We need to understand these differences in order to choose wisely.

I strongly recommend you to check the examples provided in the links, to get familiar with this behavior. Future posts will work in Reactive Mode, and understanding how everything works in the back will help you to understand more advanced examples. Enable the logs in the example and analyze the output to understand the Process and Rules execution.

If you have questions about the examples, post a comment :)

If you have suggestions about how to improve the examples, post a comment :)

Enjoy!
