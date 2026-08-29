---
title: "Drools Execution Services APIs and Architecture (Part 2)"
date: 2010-03-27 14:33:25 +0000
permalink: /2010/03/27/drools-execution-services-apis-and-architecture-part-2/
description: "This post will tackle down how the things will work using the API semantics proposed in the previous post but in a grid environment."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "distributed"
  - "Drools"
original_url: https://www.salaboy.com/2010/03/27/drools-execution-services-apis-and-architecture-part-2/
---

This post will tackle down how the things will work using the API semantics proposed in the [previous post](/2010/03/27/drools-execution-services-apis-and-architecture-part-1/) but in a grid environment. Here I will introduce the [Rio Project](http://www.rio-project.org/) and how this project works in conjunction with the previously proposed architecture. We will also analyze which modifications do we need to add to the proposed semantic in order to include some grid concept really needed to have full control over the services deployed inside a grid.

[Please  read  the disclaimer  first](/disclaimer/)

Note: all the topics discussed in this post are just proposals, all the code is written and working but is not merged into the Drools Project trunk repository. We hope to include these new features in the next Drools releases.

## The Rio Project

As you can see in the project [home page](http://www.rio-project.org/):

"Rio is an open source technology that provides a dynamic                     architecture for developing, deploying and managing                     distributed systems composed of services."

This really sounds interesting, but when I see the list of key features I felt in love with it:

Key features include:

- Dynamic architecture for distributed systems
- Built-in fault detection and recovery for your services
- Policy based SLA enforcement
- Support for external systems, encapsulate the control and monitoring of other frameworks
- Built-in support for Maven artifact resolution at deploy time
- Extensible service development & deployment support:
  - POJOs
  - Spring
  - Maven based artifact resolution

So, we basically can build up a dynamic grid of distributed services, writing simple POJO services and we get for free fault detection and policy based SLAs.

How can  this can be related with the Drools project? easy, imagine a simple way to have a grid of knowledge services with these characteristic: dynamic scaling, fault detection, and low level monitoring capabilities that allows us to scale up or down the grid based on requirements.

One important thing to notice here, is that Rio provides us a full execution environment, where we can deploy OAR packages that contains our services. This makes the deployment and the creation of new servers very easy with the possibility to add them dynamically to our networks.

## Drools Execution Services APIs and Architecture for Grid Environments

If you take a look at the following image, you will notice that we have 90% of the same components described in the previous post. We add a few new things and relationships to enable the architecture proposed to handle multiple instances of the same type of service.

![Drools services grid](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/drools-services-grid.png "drools-services-grid")

As you can see we still have the **ExecutionNode** and **NodeConnector** concepts, as well as all the **FactoryServices** too. But right now we have one more indirection to get the **ExecutionNode**. Here I introduce the **GridConnection** component, that will be in charge of sense the Grid in order to discover the available Services. Once the **GridConnection** get the list of available services, it creates one **ExecutionNode** for each Service found and establish a connection to it.

When we, in our code, want to interact with one of these created **ExecutionNodes** we ask to the **GridConnection** for just one ExecutionNode, that will be retrieved based on different strategies that we can define. These strategies will return us one ExecutionNode selected using previously defined policies. Some examples of these strategies can be:

- Give me the **ExecutionNode** that contain less active knowledge sessions
- Give me the **ExecutionNode** that is hosted in the less loaded machine
- Give me a random **ExecutionNode**
- Give me a an **ExecutionNode** that the following business rules select

Of course, that you can create a plug new strategies if you need something special for your situation.

All this code is inside a project called **drools-service-grid** that generates an OAR package (Rio Service Package) that can be deployed inside multiple Rio Execution Environments.

## How the APIs are modified to reflect these new features

Take a look at the following snippet of code, you will see a lot of familiar stuff:

```java
KnowledgeBuilder kbuilder =
                 node.get(KnowledgeBuilderFactoryService.class)
                  .newKnowledgeBuilder();
kbuilder.add( ResourceFactory
               .newByteArrayResource( str.getBytes() ),
              ResourceType.DRL );
if ( kbuilder.hasErrors() ) {
  System.out.println( "Errors: " + kbuilder.getErrors() );
}
KnowledgeBase kbase =
              node.get(KnowledgeBaseFactoryService.class)
               .newKnowledgeBase();
kbase.addKnowledgePackages( kbuilder.getKnowledgePackages() );
StatefulKnowledgeSession ksession =
                         kbase.newStatefulKnowledgeSession();
int fired = ksession.fireAllRules();
```

Notice that we didn't change anything here, in other words, when we want to interact with a single **ExecutionNode** everything remains the same. What will change is the way that we get this **ExecutionNode** and the way that we use to start up a **GridConnection**.

```java
GridConnection connection = new GridConnection();
connection.connect();
node = connection.getExecutionNode(null);
```

As you can see it's pretty simple to set up our environment in the client side. Each time that we want to switch to another node connection, this can be because we are creating a new knowledge session, we can ask for a new **ExecutionNode** to the connection. Using the following call:

```java
node = connection.getExecutionNode(null)
```

We get a new **ExecutionNode** created using the given strategy (in this case null means the default/round robin strategy) to select the underlying Service.

## The DirectoryService importance

In highly distributed scenarios the notion of a Directory becomes very important. In this service will be registered where are located all of our knowledge sessions to be able to find the one that we need in a particular moment. The following methods are available in both (Remote and Grid) environments, and helps us to register and lookup using a single string different knowledge sessions (Command Executors).

```java
//register a knowledge session using the name "ksession1",
// then we can retrieve the session for latter usage
node.get(DirectoryLookupFactoryService.class).register( "ksession1", ksession );
// we can lookup for already created and registered session using the lookup method
ExecutionResults results =
                 node.get(DirectoryLookupFactoryService.class)
                  .lookup( "ksession1" )
                  .execute( new FireAllRulesCommand( "fired" ) );
```

The directory service will be in charge of knowing how to locate a previously registered Knowledge Session. Doesn't matter the node that we have currently selected it will know where (in which **ExecutionNode**) the command needs to be executed.

## In Brief

We have seen how all the components will interact in a grid environment. In a next post I will describe the next steps toward this highly distributed scenarios, and the new ways of interaction that are planned for the next release.
