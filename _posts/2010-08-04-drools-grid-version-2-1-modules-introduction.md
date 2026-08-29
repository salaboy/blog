---
title: "Drools Grid (version 2) - #1 Modules Introduction"
date: 2010-08-04 07:32:51 +0000
permalink: /2010/08/04/drools-grid-version-2-1-modules-introduction/
description: "Hi there, I'm right now commiting/merging into the JBoss Drools trunk the new version of the Drools Grid module."
tags:
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "jbug"
  - "PlugTree"
  - "BPM"
  - "distributed"
  - "Drools"
  - "knowledge"
  - "processes"
  - "rules"
original_url: https://www.salaboy.com/2010/08/04/drools-grid-version-2-1-modules-introduction/
---

Hi there, I'm right now  commiting/merging into the JBoss Drools trunk the new version of the  ***Drools Grid*** module. The idea of this module and all its submodules is to  provide the ability to execute distributed knowledge session across  distributed grid of machines/nodes.

For achieving this big goal we can set  up different components that will allow us to transparently distribute  our knowledge session based on the requirements that we have for our  applications. In this post I will give a quick overview about each of these  components and in the next few post I will be trying to show how we can  use this project in real life scenarios.

Remember that this is a  work in progress, so community feedback is appreciated!

Inside the drools-grid  directory you will find the following sub modules:

## Drools Grid API  (drools-grid-api -  Low level API)

This module contains all the low level APIs  to interact with nodes across the grid.  You will find here core  concepts that will be used in the grid internals to define different  types of services. Some of the core interfaces that you will find here are:

**ExecutionNodeService:** this interface will  represent across the grid Nodes that will be able to host and execute  knowledge sessions. **DirectoryNodeService:** this interface will represent across the  grid Nodes that will be in charge of hosting a directory with  information about what’s living inside the grid. Inside these nodes we  can find all the ExecutionNodeServices and HumanTaskNodeServices that we have  currently running inside our distributed nodes and also the knowledge  sessions that we have running inside them. **HumanTaskNodeService:** this interface will  represent a HumanTaskNodeService that will be in charge of hosting and  executing human tasks for business processes.

(Work in progress, so expect changes)

*(note: In the future  expect to see more of these interfaces representing new type of services  running inside the grid.)*

These services will be distributed running in  different places and we will use a simple API to be able to be  connected with these services in order to use them. For handling these  connections to different services we have a class called *GridConnection*. This *GridConnection* class will let us add  new connectors to our different services. We can add new  ExecutionNodes, DirectoryNodes or HumanTaskNodes connectors to a *GridConnection*. Based on these  connectors when we ask for a specific service (executionNode,  directoryNode or humanTaskNode) the GridConnection will choose one of  the registered connectors and it will give us one connection to the  service. In the case that we want to create a new knowledge session, we  need to request for an ExectuionNode to the *GridConnection*. This will  take one of the available connectors and it will create an ExecutionNode  (client) for you to start using it. The executionNode internally will  contain a set of low level services, that based on the connector type  will be configured to provide an execution environment that will run  locally, remotely or in a real distributed environment.

As you can imagine,  these interfaces needs to be implemented in order to provide the  functionality. That's why we have different modules that provides  different implementations for these services. It’s also important to  note, that this APIs are extended for each particular type of  environment. You will find two extensions right now:  *drools-grid-remote-api and drools-grid-distributed-api*. Both will  contain a set of specific classes and interfaces that extends the core  functionality provided by the project drools-grid-api.

Let's take a look at  the different different environment types and the sub-modules that we  need to use in each of them.

## Local Environments

This is a pretty  straight forward environment. This environment will let us execute  Drools in the way we already are used to. The only difference with the  common Drools APIs is that we will use the Drools Grid APIs that will  give us the power to move our application to a different type of  environment in the future.

### Drools Grid Local Impl (drools-grid-local):

This module provides a  Local implementation of the previously described services. With Local I  mean, in the same JVM instance. This implementation behaves in the same  way that if we were using the common Drools APIs.  The idea behind this  implementation is to provide the ability to run Drools Grid locally  using the same APIs that we can use in distributed environments. This  will give us the possibility to move our implementations from one  environment (Local) to more distributed ones (Remote or Distributed).

Inside this project  you will find the local implementation of the services that will  included inside the Execution Nodes and Directory Nodes. Note that we didn't  include the HumanTask node here because we don't have a local  implementation for the Human Task service.

## Remote Environments

Remote Environments  will let us run our knowledge sessions in different JVM instances  distributed across a network of computers. Based on the requirements of  each situations we will be able to choose the underlaying implementation  that it’s used to communicate different runtimes hosted in different  JVMs/Machines/Nodes.

### Drools Grid Remote API  (drools-grid-remote-api):

This module provides the API that needs to be  implemented by Remote Environment providers. Right now the two planned  implementation for these APIs will be HornetQ and Apache Mina. The idea  behind this two implementation is provide the guidelines to create new  and more robust implementations that suits different  situations/requirements.

### Drools Grid Remote Node Mina  (drools-grid-remote-mina):

This module provides the implementation of  the internal services required to establish a remote connection. This  module  can also be executed from the command line to execute a new Mina  Remote Server that can host and execution remote knowledge sessions.  This module provide the specific connector required by a client  that  wants to create remote sessions that will be hosted inside a Mina  Execution Node Server.

### Drools Grid Remote Directory Mina  (drools-grid-remote-dir-mina):

This module provide the implementation of the  internal services required to establish a connection with a remote  directory service. This module can also be executed from the console to  start a new directory node that will keep track of the Execution Nodes,  Knowledge Sessions, Knowledge Bases and other Directory Nodes that are  running inside our grid.

## Distributed Environments

Distributed  environments provide a more robust solution and more services around the  topology of machines that we will in our network. In distributed  environments we will have services that will let us automatically  deploy, fork and manage all the services across the grid. We will not  need to manage or start different services in different machines, we  will have a full distributed environment that will be in charge of these  tasks. One of the main characteristics of this kind of environments is  that the environment itself will know when and how we need to create new  services instances, because the demand is too high.

### Drools Grid  Distributed API (drools-grid-distributed-api)

This module provide  some of the extensions needed for Distributed environments. It only adds  some internal classes that are used for the services that will run in  this kind of environments.

### Drools Grid Distributed Node Rio  (drools-grid-distributed-rio):

This module provides the implementation of a  Rio service that will capable to host knowledge sessions. When we  compile and package this module we will get a OAR (rio deployable  archive), that we can distribute/deploy in a Rio environment. Take a look at this  post to see how you can configure and deploy this Rio Service (I will  add this soon).

### Drools  Grid Distribtued Directory Rio (drools-grid-distributed-dir-rio):

This module provides  the implementation of a Rio service that will be capable to host  information about the grid environment. It will store information  related with our knowledge sessions, kbases and other services running  across the grid. It’s important to note that Rio itself store and  maintain low level information about the grid usage, and this  information will not be part of the directory service.

## Drools Grid Tasks  (drools-grid-task) (Work in progress, need refactoring)

This module will be  split in the following sub modules: drools-grid-task-api,  drools-grid-remote-task-mina, drools-grid-remote-task-hornetQ and  probably drools-grid-distributed-task-rio. Right now, the project only  contains the interfaces to hook up the currently two supported  implementations Apache Mina and HornetQ. But to move forward with this  refactorings, we need to do first some core refactorings in  drools-process/drools-process-task, to split implementations and  interfaces.

## Drools Grid Service  (drools-grid-services):

This  module brings the user the APIs to build Applications. The main idea  behind this project is to provide a High Level API to abstract the low  level details that are required to build a Grid Environment. Using this module you  can describe your grid topology and then use this definition in order to  run your application on top of it. Inside the Drools Grid Services APIs  you will have the following concepts to describe and use your Grid  Topology:

**GridTopology:** a GridTopology will represent the  topology itself. It will be composed with ExecutionEnvironments, DirectoryInstances and TaskServerInstances. You as client user,  will define your topology (where are your ExecutionEnvironments, DirectoryInstances and TaskServerInstance) and then we will  create a new GridTopology instance using this  definition. Once we get the GridTopology object we can start using it for our  applications executions.

**ExecutionEnvironment:** it will represent a  Node/Machine that will be able to host more than one knowledge session.  Inside this node/machine the ksession will run and we can interact with  it remotely (or locally). **DirectoryInstance:** it will represent a  node that will keep track about the other nodes in the grid and it will  let us register, and lookup this services and it’s contents. **TaskServerInstance:** it will present a  human task server node, that will be able to execute and maintain all  the information about human tasks for business processes.

If you want to create  an application that uses Drools Grid, this is the module that you want  to use. We will be analyzing how to use this module in future posts.

## In brief

Basically I’ve  introduced the modules inside Drools Grid. I will be working hard in  some refactorings during the next two weeks, so feedback is really  appreciated. I will publish in another blog post my current TODO list,  if you want to help I will be here trying to answering questions.
