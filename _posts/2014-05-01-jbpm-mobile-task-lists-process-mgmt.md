---
title: "#jBPM Mobile: Task Lists & Process Mgmt"
date: 2014-05-01 15:31:34 +0000
permalink: /2014/05/01/jbpm-mobile-task-lists-process-mgmt/
description: "Hi everyone, this time I would to share a community effort related with building a Mobile implementation of the jBPM Console NG."
tags:
  - "community"
  - "Drools"
  - "English"
  - "Java"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jBPM"
  - "jBPM5"
  - "bpmn"
  - "process"
  - "Salaboy"
original_url: https://www.salaboy.com/2014/05/01/jbpm-mobile-task-lists-process-mgmt/
---

Hi everyone, this time I would to share a community effort related with building a Mobile implementation of the jBPM Console NG. There are some screens which really make sense to access from a Mobile Device. This post is about which features are currently provided and how you can get involved in the development of such features.

## Technology Stack: MGWT + Uberfire

All the jBPM Console and KIE Workbench is built using [Uberfire](http://www.uberfireframework.org) which relies on Errai and GWT. For that reason, it was a logical step to use [MGWT](http://www.m-gwt.com) to build a hybrid application (between native and web app) that allows us to interact with some of the functionality that is currently provided by the jBPM Console and the KIE-Workbench. MGWT give us the power of reusing all the GWT exposed backends providing UIs that fits better for Mobile Devices, such as phones and tablets. By reusing all the backend logic we can make sure that the functionality being consumed by mobile devices is exactly the same used to support the stable version of the Web UI in our products. One of the main goals is to provide a lightweight implementation that serves for both Android and iOS devices, it is fast and flexible so it can be extended and adapted for different business needs.

## Demo

Here you can see a short video showing the UI, and how you can interact at the same time with the Web UI and the Mobile UI.

[embed]https://vimeo.com/96494150[/embed]

## Get Involved

All the work was done by Tomáš Livora and it was part of his Bachelor Thesis that you can find here:

https://is.muni.cz/th/396542/fi_b/thesis.pdf (<- if you are interested

Tomáš did a great initial work, but there is a lot of room for other community contributions, regarding testing, documentation and more features. For now you can find all the source code of this implementation in a branch of the  jbpm console ng repository: https://github.com/droolsjbpm/jbpm-console-ng/tree/mobile-integration Please get in touch if you are willing to collaborate or if you want to know more about the project.
