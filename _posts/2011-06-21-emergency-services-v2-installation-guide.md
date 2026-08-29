---
title: "Emergency Services V2: Installation Guide"
date: 2011-06-21 05:28:46 +0000
permalink: /2011/06/21/emergency-services-v2-installation-guide/
description: "I'm back again with another post about the Emergency Services Application to show the new features that we just add and how to get started with the…"
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
  - "business"
  - "event"
  - "events"
  - "example"
  - "jBPM"
  - "process"
  - "processes"
  - "rules"
  - "Salaboy"
  - "services"
  - "tutorial"
original_url: https://www.salaboy.com/2011/06/21/emergency-services-v2-installation-guide/
---

I'm back again with another post about the [Emergency Services Application](/2011/05/28/emergency-services-v2-jbpm5-and-drools-blueprint/) to show the new features that we just add and how to get started with the project. Some new modules were added but the start up time was reduced dramatically. During this posts I will show how to download, start and use the application in your machine.

## Introduction

After doing the first release of the second version we (@calcacuervo, @ilesteban and @salaboy) were focused on allowing the builds to be much easier and correct some well known issues. We also work to get the iPhone Accelerometer and the Android Accelerometer exposed with some applications to be able to use the generated event stream to simulate the patient vital sign.

This application was built to show how to architect applications using BPM, a Rule Engine and Complex Event Processing. The aim of the application is to provide a generic architecture to implement flexible solution t hat uses the previous mentioned topics as basic principles.

The application is right now decoupled in 7 logical modules that are responsible for different activities. We tried to maintain as decoupled as possible each module to provide a flexible and pluggeable architecture. If you don't like the implementation of one of these modules, you can easily replace it for one that cover all your needs.

Each module is a functional block that allow the overall application to run and interact with different services. This allows you to customize each module configuration to run smoothly on your specific environment.

## Main Modules Introduction

The following sections describe each module responsibility:

![Screen shot 2011 06 20 at 4 41 43 pm](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/06/screen-shot-2011-06-20-at-4-41-43-pm.png "modules")

### Model

This module contains your domain objects that represent the information that your application is interested to handle. This module now contains some extra utility classes and some *WorkItemHandlers* that will be used by the core module. I'm planning to create a separate module with these technical assets, but for now they can live there for practical reasons.

### Core

The core module contains all the Domain Specific Services interfaces and implementations. This project can be expanded as a multi module pom project in the future for storing one single service per project, allowing more flexibility for deployments.

### World UI

This module allows us to see what is happening in the real world. You need to think about this module as a view of our world that allows to generate interactions. For real implementations this module can be seen as external sources of events that will be directly plugged to the core module with external connectors

### Task Lists UI

We currently have two different implementations of this module. This module represent the software that is being used inside the Emergency Services company. You will find in the project source code that a Standalone implementation and a Web Application provide the same functionality. Two more implementations are being created for demonstrating best practices and for mobile phones.

## Running the Application

We first need to download the source code using git from: <https://github.com/Salaboy/emergency-service-drools-app>

Once you get the source code in your machine go inside the project structure and run:

mvn clean install

This will build all the modules and allow you to start playing with the application. If you get problems with maven dependencies you need to add a new certificate to your JDK to allow maven download snapshots from Plug Tree (org) repositories hosted in cloudbees.com. I strongly recommend you doing this to get always the latest version of our projects.

"*Make sure that java trusts the PlugTree repository by adding it's public key to the cacerts file. To do that, follow these steps:*

- *Browse to  `https://repository-plugtree-org.forge.cloudbees.com/snapshot/`*
- *Select "Tools->Page Info" from the menu.*
- *Select the "Security" icon and then click the "View Certificate" button.*
- *Select the "Details" tab.*
- *In the "Certificate Hierarchy" pane, select "*.forge.cloudbees.com" and then click the "Export..." button at the bottom of the dialog.*
- *Save the certificate in a file (I used "publickey.forge.cloudbees.com") and select the "X.509 Certificate (PEM)" format.*
- *Execute the following command (you may need to adjust the arguments for `alias`, `keystore`, and `file` based on your installation and where you saved the public key):*

*sudo keytool -import -alias mail.redhat.com -keystore /usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre/lib/security/cacerts -file ~/publickey.forge.cloudbees.comWhen prompted, the default keystore password is "changeit".* " -> copied from the project wiki: https://github.com/Salaboy/emergency-service-drools-app/wiki/Fedora-14-install

### The Run Module

We have developed a special module that facilitates running all the application modules. we are planing to create a graphical interface to start up all the modules but it is still work in progress. Right now you can start the application using maven and one terminal per module that you want to start up.

To start up the application there are are some dependency restrictions. We obviously need to start the application core before starting the UIs. If we are planing to use an external event generator (sensor) we need to bind it before generating emergencies in the world UI application. If we are not planning to use external sensors we can go ahead without running the sensors module.

Let's run the following modules: *emergency-service-core, emergency-service-world-ui, emergency-service-tasklist-ui-web*For starting the application you should open three different terminals/consoles in your computer and have maven installed.

From the first terminal, standing inside the **run/** module you need to run: **mvn -Pcore**

Once core is started you can start world ui and task lists web ui.

From a different terminal you need to run: **mvn -Pworld-ui**From a different terminal you need to run: **mvn -Ptasklists-ui-web**

## Interacting with the application

Now that we have the main three modules running we can start interacting with the application. Let's create and emergency and let's try to solve it. The following video guides you through the Heart Attack Scenario.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://player.vimeo.com/video/25374405" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Vimeo video player"></iframe></div>

Video direct URL: <http://www.vimeo.com/25374405>

### Useful URLs

Git: <http://git-scm.com/>

Maven: <http://maven.apache.org/download.html>

Emergency Services Source Code: <https://github.com/Salaboy/emergency-service-drools-app>

To clone the source code (for having a local copy of the source code) run in your terminal:

*git clone git://github.com/Salaboy/emergency-service-drools-app.git*

Task Lists UI - Web Implementation: <http://localhost:8081/emergency-services/>

## Extra Modules

I will be covering the following modules in the next blog posts:

- Dashboard UI
- Sensors
- Documentation

## Sum Up
