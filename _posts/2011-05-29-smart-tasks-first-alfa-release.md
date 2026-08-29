---
title: "Smart Tasks First ALPHA Release"
date: 2011-05-29 14:57:18 +0000
permalink: /2011/05/29/smart-tasks-first-alfa-release/
description: "Looks like this time of the year is good for doing releases! I'm proud to announce the first ALPHA release of the Smart Task project."
tags:
  - "Drools"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jbug"
  - "PlugTree"
  - "BPM"
  - "BPMS"
  - "jBPM5"
  - "Salaboy"
original_url: https://www.salaboy.com/2011/05/29/smart-tasks-first-alfa-release/
---

Looks like this time of the year is good for doing releases! I'm proud to announce the first ALPHA release of the [Smart Task project](http://www.github.com/salaboy/smart-tasks). We are exposing the project as it is right now to get some feedback from the community in order to decide the future Roadmap of the project. I'm writing this post as an introduction to the project and to highlight the main features provided in the current code base. Feel free to ask questions and let us know what you think about it!

![Screen shot 2011 05 29 at 11 39 27 am](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/05/screen-shot-2011-05-29-at-11-39-27-am.png "Smart Tasks")

## Introduction

The idea behind [Smart Tasks](http://www.github.com/salaboy/smart-tasks) was born 6 months ago when we notice that after a some implementations of Task List Oriented User Interfaces we copy and paste a lot of code for different customers that uses different rendering technologies to create their front ends. Having a methodology and a well defined way of creating unified task lists can speed up your development a lot and that's exactly what we are trying to share with the Smart Task Project.

This project it's being currently used inside the Emergency Services Demo Application and we will be posting some of the other implementations that we build to show how to use it.

The following sections of this post will describe the goals, features and roadmap of this project as we see it now. We truly believe that project will mutate, but our focus and effort for the initial versions is well scoped and defined. We are right now three developers: [@calcacuervo](http://www.twitter.com/calcacuervo), [@ilesteban](http://www.twitter.com/ilesteban) and myself [@salaboy](http://www.twitter.com/salaboy) and we receive some contribution from Mariano from OSDE, we are open to train and help more people to get involved so feel free to write us if you are interested in using or participating in this project :)

## Project Goals and Main Features

Every time that we deal with business processes that contains Human Interactions we need to build front ends that allow the participants to interact with their assigned tasks. A common approach of doing these interfaces is creating Task Lists and Task Forms.

Depending on the implementation and ecosystem where you are trying to implement your Task List Oriented User Interface is the technology that you will choose to develop your UIs. Depending the technology that you choose you will need to analyze how to render the information based on the role of the user that it's logged-in in the system. A common requirement at this point is to provide a mechanism to apply decorators to emulate different perspectives over the same set of information depending the context where the task(s) is/are being requested. To abstract the way that the information it's being retrieved and mangled to be presented to the end user, we have created a thin layer that provides the following features:

- Data Mapping between Human Tasks/Process related information and external application/data sources information that needs to be presented in the same task list / task form.
- Meta Form Builder based on the processes that we already have in our organization
- Declarative User Profile description and configuration
- Perspective Decorators and Profiles Relationships configurations
- Human Task Component Abstraction (using the WS-HT spec)

- Support Multi Human Task Components merging into standard structures hetereogeneous sources of information about tasks. This is very useful for legacy systems that were using different structures to store human tasks activities.
- It allows us to create different adapters to define the mapping between the old structures and the standard ones allowing us to do simple migrations between legacy BPM systems.

I will be explaining these features in the following sections. But I think that it's most important to understand that these set of features were created having in mind the fact that we need to speed up the development process and allow the developers choose different rendering technologies to create and integrate their UIs. We truly believe that each BPM implementation require custom technologies and domain specific components to improve the user interactions. Using Smart Tasks you will get all the information that you need without being forced to use a specific technology for the rendering layer. This will allow you to integrate the task lists and task forms into your legacy applications or to a myriad of platforms always handling the same data structures, configurations and behaviors.

The following list represent the advantages of adopting this framework in your BPM implementation:

- Rapid Application Development Approach speeds up your development and integrations
- Unified development approach that will allow you to measure time and get metrics about much time takes you to build your user interfaces
- Declarative and Unified way to define different perspectives for different users / roles that can be applied and decorate the information depending the context
- Self documented business definitions about how to expose the information to your different users
- Simple data models for your UI components to iterate and display, allowing multiple heterogeneous clients to behave equally in different platforms: Web, Desktop, Mobile, etc.
- Based on the WS-HT standard for human task interactions
- Support legacy or multi Human Task Service components, allowing us to merge legacy information about tasks that were created by different systems

For the long term goals (6 months from now) we hope to be able to include more advanced features like:

- Task Training using Mahout
- Probabilistic Suggestions for Tasks Fields
- Dynamic Surveys Task Structures
- Guided Work Mechanisms
- Task Events Detections, Aggregations and Automatic Filtering

## Project Structure

The project right now it's composed by the following modules that can be used together or separately depending what we are looking to solve in our implementation:

- smart-tasks-api
- smart-tasks-model
- smart-tasks-jbpm5-impl
- smart-tasks-activiti-impl
- smart-tasks-form-builder
- smart-tasks-metamodel-base
- smart-tasks-metamodel-simulation
- smart-tasks-utils
- smart-tasks-client-examples
- smart-tasks-doc

The following figure defines how the components interact between each other and where smart tasks will impact in your applications infrastructure.

![Smart Tasks First ALPHA Release](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/0wsd1gxfx4mcvphp4e2deab0rexucvfus6sywn2jtetrsywyoxmvw9hxfj77fvclmtvau3wofqipwgbsjjqzspogttkfav5gckpwugxryanvpalbrq.png)

### Smart Tasks API

Smart Tasks API defines the interface that needs to be implemented as adapters to support different underlaying implementations of Human Task Components. It defines a set of services, including the one that will be in charge of interacting directly with the underlaying implementation to provide a robust interaction with the human tasks components. The HumanTaskServiceImpl class allows us to plug different implementations and merge different sources of Human Tasks information using a single entry point.

This project it's also responsible of defining the strategies that will be applied to manage the underlaying communication transport with different human task components that needs to be treated differently. For future versions of the project a set of interfaces will be added to support different strategies to handle each underlaying provider differently if it’s needed. Caching mechanisms can also be plugged at this level.

The Smart Task API at this moment is in charge of defining the mechanism that needs to be implemented by the different providers in order to bring an unified and robust service to the client applications.

Some of these mechanism are:

- Data Structure Standardization
- Connection Management and Lifecycle
- Caching and Fault Tolerance (Offline Human Task Service)
- Auditing
- Security

### Smart Tasks Model

This project contains all the Data Structures and Interfaces provided by the Web Service Human Task Standard Specification. Allowing us to transform from vendor specific to the standard data structures and vice-versa the information about the tasks.  All the artifacts inside this project are being dynamically generated based on the WS-HT WSDL and Schemas definitions.

### Smart Tasks jBPM5 Implementation

This module implements the Smart Task APIs and add the mappings for the jBPM5 Human Task Server Component. Because the jBPM5 Project also implements the WS-HT standard a very straight forward mapping its being done.

### Smart Tasks Activiti Implementation

This module implements all the wrappers needed to interact with the Activiti's Human Task Service. Because Activiti doesn't implement the WS-HT standard a lot of mappings are required and some methods cannot be implemented. The aim of these mappings is to retrieve all the information that it's being stored by Activiti and standardize the results in order to be able to merge this information with the information provided by a different vendor.

### Smart Tasks HISE implementation (Future)

This implementation it’s pretty straight forward because the HISE project it’s WS-HT implementation.

### Smart Tasks Form Builder

This project provides the APIs and Utilities for the User Interfaces Developers. This project give us the APIs to retrieve information about Task Lists and Task Forms that it's required to render them and also execute actions to the rendered tasks. It also allows us to declaratively define the information that will be included in each task list and task form giving us the mechanism to relate them with a set of profiles/perspectives. The form builder project will serve as entry point for your application to start building your user interfaces. We will be posting real life examples about how to configure and use this project to quickly build your UIs.

### Smart Tasks Meta Model Base

This project defines the basic structures to display the information. The base Meta Model allow us to include meta information that can be used later, in the rendering framework, to change the way that the information it's being displayed.

### Smart Tasks Meta Model Simulation

This project inherit the structures from the Meta Model Base project but adding the information required by a business simulation tool. Information like: effort per task, resources per task, estimated time per task, etc can be defined to decorate each human interaction with meta information related with a certain topic. Allowing us to apply different decorators to change the perspective of the task or the set of tasks that it's being displayed. We will be creating parallel models for different use cases. We encourage and help you to add your own decorators and Meta Models for your domain specific use cases.

### Smart Tasks Utils

This project contains a set of utility classes that will make our life simpler. For future versions we are planing to include GUI that will allow us to use all the utility classes without using a Java class to allow non developer to use these tools. Right now it contains an utility to scan your processes and generate the meta model for the tasks that are defined inside them. Using these meta models with the Form builder Project will allow you to quickly get the default information to render for all you defined human interactions. Giving you also the possibility to customize the automatic mapping generations to add your domain specific customization for your different profiles.

### Smart Task Client Examples

This project includes different simple implementations that shows how to use the different modules with the default configurations. A more detailed post will explain how to set up and run the project provided here.

## Roadmap

We are aiming to do monthly releases mostly focused on adding examples about how to use the project and improving the current set of features supported. We are planning to add support for caching mechanisms and offline interactions in the next couple of versions. The next immediate releases  will be focused in improving the way that mappings are being done and how the expressions are resolved. We are planning to spend a couple iterations trying to get the mappings right to improve the way that the forms are being generated. We will be working to improve how the user can structure and decorate the information to get everything working as soon as possible.

We strongly believe that Contextual Decorations and Offline and Asynchronous interactions are important for most of the implementations. The following list covers the features and examples that we will be adding and publishing during June/July:

- Expressions to get Global Variables from pluggeable Data Sources
- Client side features like: Refresh mechanisms, Caching mechanisms, etc
- Business oriented data and meta data grouping
- Improve the documentation and provided examples
- Expose nightly build / snapshots and the web documentation of the project

As a separate effort we are expecting to provide a reference implementation for generic components that uses the utilities inside the Form Builder project using GWT (Google Web Toolkit) as a rendering layer. If you are GWT master and want to contribute we will be happy to help you during the first steps and probably reward you in some way :)

## Get Involved (a.k.a Please Help!)

As in every community and open source project we are open to contributions and we want to help you to get involved if you are interested. We are looking for people interested in learning and improving these generic mechanism to speed up your implementation. If you have suggestions, find troubles or want to be in contact with us to know more about the project and how to leverage all the features please write us!
