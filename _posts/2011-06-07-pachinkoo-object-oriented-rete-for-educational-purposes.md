---
title: "PachinkOO: Object Oriented RETE for Educational Purposes"
date: 2011-06-07 15:43:14 +0000
permalink: /2011/06/07/pachinkoo-object-oriented-rete-for-educational-purposes/
description: "I'm glad to share this simple implementation of the RETEOO algorithm. I've created this implementation in just 24hs, trying to copy and reuse the same…"
tags:
  - "community training"
  - "Drools"
  - "drools training"
  - "drools5 training"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jBPM5"
  - "jbug"
  - "PlugTree"
  - "Salaboy"
original_url: https://www.salaboy.com/2011/06/07/pachinkoo-object-oriented-rete-for-educational-purposes/
---

[I'm glad to share this simple implementation of the RETEOO algorithm](https://github.com/Salaboy/pachinkOO). I've created this implementation in just 24hs, trying to copy and reuse the same terminology that it's being used in the Drools Project simplifying all the mechanisms that are being used in the back. This version of the algorithm is only for educational purposes and it is not completed yet. My main goal with this implementation is to have a simple java project that allows me to explain how the RETEOO algorithm works internally in Drools. During the next few days I will be adding comments, writing posts and highlighting the missing bits that makes the Drools' implementation of the algorithm robust and feature complete. As I'm only implementing the RETE algorithm and not the DRL grammar you will find tests that build the network by hand and then use it to evaluate different situations.

Right now I'm only focused in assertions/insertions of the facts and try to show a full path of execution. Object Type Nodes,  Simple Alpha Nodes, Simple Join (Beta) Node and Activations are supported. I'm pretty sure that working with updates and retractions is pure fun, so I will be working on that on my way back to Argentina. You can browse the code, ask questions and help me to improve the current code base. I'm pretty sure that there a a lot of mistakes, errors and bad assumptions there, but at least allows you have a quick overview about how the network is built and how it react on runtime.

You can find the Source Code: <https://github.com/Salaboy/pachinkOO>

Take a look at my previous post to understand how you can build a network based on the rules that you want to express and please write me back if you have some feedback about this idea.

Previous Post about RETEOO introduction: </2011/06/06/drools-reteoo-for-dummies-1-intro/>

PS: the name of the project was not my idea, I've seen in the past that there is a project called [pychinko](http://www.mindswap.org/~katz/pychinko/), it's a RETE implementation written on python and it makes reference to the [Pachinko Machines](http://www.google.com/search?q=Pachinko+Machines&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&tbm=isch&source=og&sa=N&hl=en&tab=wi&biw=1280&bih=687) from Japan. It's a very good analogy that I think it's extremely important to explain how the algorithm works!
