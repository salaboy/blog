---
title: "Inception - The Anti Pattern - jBPM5 & Drools"
date: 2011-12-31 19:59:27 +0000
permalink: /2011/12/31/inception-the-anti-pattern-jbpm5-drools/
description: "It was a great year (2011), I have been doing consulting for all over the world about jBPM5 and Drools, visiting more than 15 different clients on…"
tags:
  - "bootcamp"
  - "community training"
  - "Drools"
  - "drools training"
  - "drools5 training"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jbpm training"
  - "jbpm5 training"
  - "jbug"
  - "PlugTree"
  - "BPM"
  - "BPMS"
  - "business"
  - "community"
  - "event"
  - "jBPM"
  - "jBPM5"
  - "process"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2011/12/31/inception-the-anti-pattern-jbpm5-drools/
---

It was a great year (2011), I have been doing consulting for all over the world about jBPM5 and Drools, visiting more than 15 different clients on different locations. All of them highly interested in learning and using these projects. But I notice, in at least 5 of them a weird new Anti Pattern which I call "Inception". Most of the time they have a "Business" justification, but technically they all know that they are gonna have troubles at some point in the future. So, I decide to write a post with some thoughts around this anti-pattern for two main reasons:

- It's good to share when something around the projects, or how the people use the projects, is not right
- I want to write a post before the end of the year with a special thanks section :)

## Introduction

In all the jBPM5 & Drools Community training that I gave during this year, I took about an hour discussing about the classic integration between a BPM System and Rule Engines. The strongest point in my perspective is the fact that most of the BPM Systems out there do a very poor integration with a Rule Engine (by the way, most of them integrates with Drools). Most of them just use a Rule Engine for Decision Points inside the process or to do some Data Validation. Most of the time this interaction is completely stateless by nature and the inferences capabilities of the Rule Engine are not used at all.

This diagram represents this integration, very stateless, very poor ...

![6440 01 03 classicinteractionbpmandbre](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440_01_03_classicinteractionbpmandbre.png "6440_01_03_ClassicInteractionBPMandBRE")

This kind of integration, nowadays is a common integration pattern widely accepted and used. The BPMN 2.0 specification defines a Business Rule Task that can be used to model this interaction.

![6440os 03 23 business rule task](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440os_03-23-business-rule-task.png "6440OS_03-23-business-rule-task")

This node/activity can be used to interact with the Rule Engine (the specification mention that the interaction can be done via a web service), sending information and receiving a set of results from the evaluation.

## The Problem

Obviously we can solve real life problems with the previously mentioned pattern, but the problem begins when I notice some ["Inception"](http://www.imdb.com/title/tt1375666/) ([ref1](http://cheezcomixed.files.wordpress.com/2010/07/inceptionp1.jpg), [ref2](http://www.checkdaoffice.com/wp-content/uploads/2011/02/koma-comic-strip-windows.jpg), [ref3](http://7.asset.soup.io/asset/1789/8311_fa48.jpeg), [ref4](/content/images/entries/icons/original/000/000/048/800px-sup_dawg.jpg), ... ) Anti Pattern being applied in practice.  So, what's the real problem, let's analyze the following figure:

![6440 01 03 classicinteractionbpmandbreinblip](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440_01_03_classicinteractionbpmandbreinblip.png "Classic Interaction BPM and BRE InBLiP")

Hmm.. it looks OK!, the integration seems right.. The problem starts when a Smart Developer, having smart developers usually cause troubles :), notice that if they are using [Drools 5 as a Rule Engine](http://www.drools.org), they get [jBPM5](http://www.jbpm.org) for free and they can start running processes inside the Business Logic Integration Platform. So.. They start to wonder.. *why do I need my original BPM System, if I have jBPM5 fully integrated with Drools and I can avoid moving data all around, calling slow web services that needs to marshal complex structures into XML each time that I want to interact?* This is a very long question, but a very valid one :)

If we don't control this situation when it start, sooner or later we will find ourselves into the

**INCEPTION ANTI-PATTERN!!!!!**![Xzibit meme 7219 re anne hathaway is hot s510x334](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/xzibit_meme_7219_re_anne_hathaway_is_hot-s510x334-195393.jpg "xzibit")

*YO DAWG, I NOTICE THAT YOU LIKE PROCESS ENGINES, SO I'VE INCLUDED A PROCESS ENGINE INSIDE THE RULE ENGINE, SO WHEN YOU CALL THE RULE ENGINE FROM YOUR OLD PROCESS ENGINE YOU CAN START PROCESS INSIDE THE RULE ENGINE :)*

![6440 01 666 classicinceptionbpmandbre drools jbpm51](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440_01_666_classicinceptionbpmandbre_drools_jbpm51.png "Inception Number 1")

A Business Process talking with a Rule Engine that start another Business Process but not in the same BPMS??? So, now the question is: if I already integrate or if I'm planning to integrate my application with a Rule Engine(specially Drools 5) and I already have another BPM System (different than jBPM5), what should I do?

## Some Thoughts

If you notice that you are running in a situation like the one previously described, I suggest you to analyze your architecture once again before making any decision. If your company wants to leverage the power of a Rule Engine like Drools 5, they need to understand the context and all the other features that it provides now. Once again, Drools 5 its not just a Rule Engine.

In large companies, they can't drop their old Process Engine. Most of the time they have paid a lot of money for it and they need to justify that investment. So, sooner or later, you will find this pattern.

![6440 01 666 classicinceptionbpmandbre final drools jbpm5](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440_01_666_classicinceptionbpmandbre-final_drools_jbpm5.png "6440_01_666_ClassicInceptionBPMandBRE-Final_Drools_jBPM5")

Large companies tends to out source projects that use the BPMS as backbone to plugin and coordinate different components. If one or multiple companies are in charge of designing these business processes and interacting with the Rule Engine, they will start to avoid unnecessary communications to create high performance components and business processes. The Inception 2 - figure- shows how the company decide to move their process to the Drools BLiP and handle the logic and the orchestration of activities inside the Drools 5 runtime. Instead of defining a business process that interact in an stateless way with the Rule Engine. I'm not agree with keeping the old Process Engine, but there are sometime when that decision is more political than technical. The advantages of this approach are obvious. Now the processes and the rules are working together to achieve a business goal, in the same stateful context, sharing the same information.

I will not go over all the advantages of these approach, I will leave that for the jBPM Developer Book, but I want to mention that the fact that I start noticing this recurrent situation in different companies from different industries and different countries, is that people is realizing the power of the BLiP Platform. Developers are starting to understand how they can model and solve more complex scenarios using the synergy of all these approaches together.

So, what you should do? Learn, read and join the community of these amazing projects. Most of the times, when you are using a BPM System, someone in your team will introduce a Rule Engine. If you are working in Java there are high chances that the Rule Engine will be Drools, so take your time and know by hand that your smart developers will want to take advantage of all the features inside the platform and not just the 5% that represent stateless evaluations.

To wrap up this post, because it's getting late and the new year is coming, I would like to mention a very similar scenario that I didn't see yet, but I'm pretty sure that it will start to appear.

Similary to BPM, and in conjunction with BPM (see the 2012 BPM prediction -> <http://blogs.forrester.com/derek_miers/11-12-31-a_bpm_prediction_for_2012_connecting_the_dots>)  Complex Event Processing (CEP) is another hot topic.

Once again, how we integrate the Process Engine with the Processing Agents provided by the CEP component? We will need to waste time learning about these three components :(

![6440 01 666 classicinceptionbpmandbre final drools jbpm5 cep](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440_01_666_classicinceptionbpmandbre-final_drools_jbpm5_cep.png "6440_01_666_ClassicInceptionBPMandBRE-Final_Drools_jBPM5_CEP")

Don't worry! We are almost in 2012! Once again the BLiP platform remove the

EVIL RED LINES

:)

![6440 01 666 classicinceptionbpmandbre final drools jbpm5 cepbutfusion](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/12/6440_01_666_classicinceptionbpmandbre-final_drools_jbpm5_cepbutfusion.png "6440_01_666_ClassicInceptionBPMandBRE-Final_Drools_jBPM5_CEPbutFusion")

## Thank You, Thank You and Thank You!

I really want to thank you for the support during this last year! I want to thank you for posting a comment here or for giving feedback about the content of this blog! I've reached 100K visits during 2011, and that means that Drools & jBPM5 are getting better and better! I hope to be able to double that number on 2012!

I wish you all Happy New Year and I promise you that I will stay active in the community! Stay tuned because 2012 will be a great year for these projects and all the community around them!

Salaboy - 2011

![Aboutme](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2008/02/aboutme.png)
