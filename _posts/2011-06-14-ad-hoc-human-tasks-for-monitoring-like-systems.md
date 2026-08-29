---
title: "Ad-hoc Human Tasks for Monitoring Like Systems"
date: 2011-06-14 04:19:41 +0000
permalink: /2011/06/14/ad-hoc-human-tasks-for-monitoring-like-systems/
description: "After playing and refactoring a little bit the Human Task Server in jBPM5 I decide to create a very simple project to highlight the advantages of having a…"
tags:
  - "Drools"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jBPM5"
  - "jbug"
  - "PlugTree"
  - "events"
  - "example"
  - "jBPM"
  - "processes"
  - "rules"
  - "Salaboy"
  - "services"
  - "tutorial"
original_url: https://www.salaboy.com/2011/06/14/ad-hoc-human-tasks-for-monitoring-like-systems/
---

After playing and refactoring a little bit the Human Task Server in jBPM5 I decide to create a very simple project to highlight the advantages of having a Rules Engine and the Complex Event Processing features of Drools Fusion. I decide to create a very simple use case to show how we can use some rules to dynamically create Ad-hoc tasks that doesn't belong to any business processes. In such cases we just need to create a simple task, assign it to the correspondent user and allow the user interaction providing a simple screen.

## Introduction

For demonstrating how to mix Rules, CEP and Human Tasks from jBPM5  let's imagine the following scenario:

![Usnavy 04 usecase01](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/06/usnavy-04-usecase01.png "Pipe Flow Control")

Imagine that we have a pipe where water can flow. In one end we have a valve that allow us to control the average liters that can go out of the pipe per second. We will have a person that it's responsible to control that the average flow is under a specified threshold. If the threshold is breached the user will need to close the valve to be be under the threshold again.

The question is what happen when the person assigned to this task need/want to go to sleep. We can set up a set of rules that monitor the current average of water flowing and based on that create an ad-hoc task if the threshold is breached. This new task creation will notify the person who is sleeping via SMS about the situation.

![Usnavy 07 usecase03](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/06/usnavy-07-usecase03.png "notification")

We can also create, in some way, the opposite rule that says that if  the current flow average  automatically goes under the threshold we can cancel the task that was created. We can also notify the user about the cancellation of the task.

![Usnavy 05 usecase02](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/06/usnavy-05-usecase02.png "cancellation")

The following application do exactly that. It allows us to generate the events that represent the current amount of water going out the pipe. It automatically calculate the average on the last 5 seconds and based on that compares with the threshold that can also be updated dynamically. Let's see  how it works.

## Demo Application

Enjoy:

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://player.vimeo.com/video/25064177" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Vimeo video player"></iframe></div>

You can find the application that it's being shown in the video here: <https://github.com/Salaboy/Drools_jBPM5-Training-Examples> -> [jbpm5](https://github.com/Salaboy/Drools_jBPM5-Training-Examples/tree/master/jbpm5) / [06-jBPM5-HumanTasksAndRulesExample](https://github.com/Salaboy/Drools_jBPM5-Training-Examples/tree/master/jbpm5/06-jBPM5-HumanTasksAndRulesExample)

It's a maven project so you can build it and test it in your own machine if you want.

## Rules and Events

I've defined a couple of rules to identify when the threshold average is breached and when the values are between the accepted values. Both rules uses Drools Fusion's temporal operators in order to get the events information and calculate the average. The following rule evaluates that the current average in the last 5 seconds is outside the boundaries of the threshold set.

```java
rule "Meausure WaterFlowing Event Average
          and react if threshold is breached"
 no-loop true
 when
    not(ThresholdBreached())
    $task: Task()
    $average: Number() from accumulate(
                       $acc: WaterFlowingEvent($value: value)
                            over window:time(5s) from entry-point "water-events"
                       average($value))
    $threshold: Threshold(name == "AverageThreshold",
                $average > valueUpperThreshold    ||   $average < valueLowerThreshold)
  then
     Task task = TaskClientHelper.getInstance().addTask($task, null);
     $task.setId(task.getId());
     update($task);
     insert(new ThresholdBreached(task.getId()));
 end
```

Notice that I'm using the *"from accumulate"* Conditional Element to collect all the ***WaterFlowingEvents*** that happen in a sliding window in the last 5 seconds. Once I get the average for the last five seconds I need to check if the value is outside of the boundaries defined by the Threshold fact. Notice that ***Threshold*** fact can be updated dynamically by the application, changing the threshold at runtime. It's also important to notice that I'm inserting the ***Task*** definition as a fact, this allow me to dynamically define the type of the task that I want to create, we will see a little bit more about this in the next section. If the rule engine find out that we are in this situation, where the threshold is breached, we will add the task in the remote task server and we will insert a new Control Fact called ***ThresholdBreached*** just to notify the engine that we are in that situation. If we want to create a more complex use case, this threshold breached could also be an event that can be feeding a different systems that can be also reacting on these events. Take a look at the complete rule file [here](https://github.com/Salaboy/Drools_jBPM5-Training-Examples/blob/master/jbpm5/06-jBPM5-HumanTasksAndRulesExample/src/main/resources/rules/SimpleRulesAndTask.drl) to see the other rule that dynamically complete the task when the values becomes normal again after the threshold was breached. The concepts are the same used in this first rule. Notice that I've defined a query and I'm using an **Average** fact with a **value** field to be able to track the current average at all times.

## jBPM5 Human Interactions

Usually when we talk about human interaction, we are inside the scope of a business process. Most of the times the process engine will create a new task when the process execution hits an ***UserTask***. At that point the user will be able to query the human task server to get their assigned tasks. In this situation we don't have a business process defined, because we never know when the task will be needed. There is no well defined sequence of activities and we will need to create this kind of activities dynamically on demand and we don't want to spawn a complete business process just for doing this isolated task. As we  saw on the video, the task list of the user in this case will be populated on demand based on the current flow average. It's important to notice that I'm using a ***Helper*** class inside the rules to interact with the task server. I've defined this wrapper class to simplify the interaction. This class was designed as a singleton class to be able to get just one intense of the client that will manage the connection with the remote human task server. If you take a look at the source code of the project example this class it's very basic and I didn't have the time to do a good work there, but I gather a couple of ideas to improve the current implementation that it's inside the jBPM5.

## Future work and suggestions

I'm using these very simple examples to test ***Drools Grid*** implementation and to show some cool ways of handling ad-hoc human tasks. As you can see I'm mixing Complex Event Processing, Rules and Humans interactions that we usually define inside our business processes in this very simple use case. The main idea to share these projects is to have some working examples that show the power of these technologies and how you can quickly create a smart solution using them. I'm planning to add this feature inside the Emergency Services Demo Application (you can find a description here), but if you want to contribute with that I personally think that it's a good opportunity for you to make your hands dirty with code and helps us in the [Emergency Services](/2011/05/28/emergency-services-v2-jbpm5-and-drools-blueprint/) initiave. :) Please write me back if you are interested in collaborating adding these features into the [Emergency Services](/2011/05/28/emergency-services-v2-jbpm5-and-drools-blueprint/) application or if you want to contribute to make this example better or more complex.

*Enjoy!*
