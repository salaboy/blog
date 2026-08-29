---
title: "Drools Guvnor Enhancements"
date: 2010-04-21 17:46:00 +0000
permalink: /2010/04/21/drools-guvnor-enhancements/
description: "During this post I will describe some of the enhancements that we are doing from the community side of the project at Plug Tree."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "Trips"
  - "Drools"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/04/21/drools-guvnor-enhancements/
---

During this post I will describe some of the enhancements that we are doing from the community side of the project at Plug Tree. The main idea here is to show our current work and get all the feedback from the community in order to improve our current work. Take this blog post as speaker notes from my presentation at the San Diego Health Care Drools Boot Camp.

## New Features

Here I will describe some of the things that we have being doing in the last couple of months. I will show some of our work in the following categories:

- Full DRL Syntax Support in Guided Editors
- Guided Rule Templates

In both of these topics we are working right now, so I will describe the current state of art. Take a look at the slides/prezis for more examples and screenshots.

Prezi: [Drools Guvnor Enhancements Slides/Prezi](http://prezi.com/-jz1mquombl7/)

## Full DRL Syntax Support in Guided Editors

The older versions of Guvnor only support simple rules creation, with simple patterns that were guided, but when you try to write more advanced rules, you have a lot of limitations, and the users needs to know about how to write DRL syntax for almost 80% of rules.

Right now, we are focused to support all the structures supported by the DRL language inside the Guided Editors Widgets inside Guvnor. To achieve this goal we tackle down the following set of points:

- We need an Expression Builder
- We must support From, From Collect and From Accumulate Condition Elements for advanced rules
- We must improve the productivity times to create Business Rules (Pattern Ordering)

## Expression Builder

The main idea behind the new Expression Builder is to help Business Users to inspect the Business Model in order to create guided expressions that will be used inside a rule. The Expression Builder widget can be hooked up every where in the structure of the rules where we need to obtain a value that is inside a nested object structure.

## FROM / COLLECT / ACCUMULATE Conditional Elements Support

We also add the support for more complex structures that Drools Guvnor wasn't support in the past. Right now the guided editor drives the user through out the creation of complex rules including FROM, FROM Collect and FROM ACCUMULATE Conditional Elements. This is very important because with the lack of these features our business analysts cannot create guided rules using these commonly used Conditional Elements. We realize that this limitation in the past reduce the adoption of the Guided Editors, because in the previous versions the only choice that you have was knowing the From/Collect/Accumulate syntax in order to manually write the complex parts using a free form text area.

## Pattern Ordering

This last one might sound as a minor thing, but we discover that in the past, if the user can re arrange the order of the patterns inside a rule, they need to erase all the previously added patterns and start over again. Imagine if you write a 20 condition Left Hand Side, and then you want to change the first condition and add a different one. In such situations, the user was forced to erase all the patterns and start from the beginning. That's terrible in a productive perspective. This kind of things reduce the happy adoptions of the whole tool. So, we fix that. Now the users can select where to put the next Pattern inside an existing rule, and then, when the rule is written they can also change the patterns order without erasing the entire Left Hand Side.

## Rules Templates

Imagine that you need to write one hundred rules that are all similar, and the only thing that changes is just some parameters/values. In such situations, the guided editor doesn't provide any functionality to copy a set of patterns to a new rule to be able to change that parameters. So basically, your business analyst/business user should create one by one each of these rules. This is very bad from the productive perspective as well.

We decide that a templating mechanism for such situations will increase the speed of rules authoring. For this reason we create a new business asset called Rule Template. This Rule Template will be authored as a normal Guided Rule, with the only difference that you can define variables to be replaced for your custom parameters that will be used to create a bunch of similar rules.

## Wrapping Up

During this presentation I only show enhancements to the widgets that already exists inside the Drools Guvnor project. The things that I don't mention here is the fact that we change a lot of the Guvnor internals to make it more service oriented, and we do a lot of plumber work to make the internal code more externalisable in order to provide services that allows different UI implementations. We recognize that some companies, or for some use cases there will be a good decision to build your own custom UI for guided editors, knowledge repository management, etc, so we work toward to provide you all the existent code logic behind the UI, to make your life easier if you decide to provide your own UIs.
