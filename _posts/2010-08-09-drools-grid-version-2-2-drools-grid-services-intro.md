---
title: "Drools Grid (version 2) - #2 Drools Grid Services Intro"
date: 2010-08-09 16:53:38 +0000
permalink: /2010/08/09/drools-grid-version-2-2-drools-grid-services-intro/
description: "I'm back with another blog post about how to start using Drools Grid. I will write a set of post with a top down approach."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "jbug"
  - "PlugTree"
  - "Drools"
  - "rules"
  - "Salaboy"
  - "services"
original_url: https://www.salaboy.com/2010/08/09/drools-grid-version-2-2-drools-grid-services-intro/
---

I'm back with another blog post about how to start using Drools Grid. I will write a set of post with a top down approach. With this I mean that I will write all the articles focused on the User Perspective of the project. That's why I will start writing about Drools Grid Service (drools-grid-services). This project gives to the user a high level abstraction about how a grid is conformed and how we can start using it. During this blog post I will be showing how you can start using the APIs and the LocalProviders. On following post we will dive into Remote and Distributed Environments.

## Starting with Drools Grid Services

First of all we need to start adding the Drools Grid Services project dependency to our project. That's the easiest part:

```xml
<dependency>
  <groupId>org.drools</groupId>
  <artifactId>drools-grid-services</artifactId>
  <version>5.2.0.SNAPSHOT</version>
</dependency>
```

Once we get this dependency, we can start using the drools-grid-services API. The next step, as usual, is to create a simple application with it.

## Your First Drools Grid project

As may know, when you want to use drools in your applications you need to be able to create a *KnowledgeBuilder* that will be used to compile your business assets, a *KnowledgeBase* that will contain all the knowledge that you want to use in your application and at the end a *KnowledgeSession* that will represent the runtime status of your knowledge. Here in Drools Grid we will do exactly the same, but before we need to define the distribution topology that we want to use in our application. In other words, we need to create a high level definition of how our runtime environment will look like (machines/nodes/servers/etc). We will start simple here, we will define our first grid topology using *LocalProviders*. This means that our application will run entirely in the same Java Virtual Machine that is running our application. In following post we will see that chaining this definition we can move our application to different environments.

## Defining your first Grid Topology

The first that we need in order to define a Grid Topology its a *GridTopologyConfiguration* that will represent all the configurations that we need to define how our topology looks like. As I mention before, I will describe here just how to use *LocalProviders* to describe our node distributions. So, our grid topology configuration will looks like:

```java
GridTopologyConfiguration gtc = new GridTopologyConfiguration("MyTopology");
gtc.addExecutionEnvironment(
          new ExecutionEnvironmentConfiguration("MyLocalEnv",
                                                new LocalProvider())
          );
gtc.addDirectoryInstance(
          new DirectoryInstanceConfiguration("MyLocalDir",
                                             new LocalProvider())
          );
```

Our topology will include two nodes: One *ExecutionEnvironment* that will let us host knowledge bases and knowledge sessions and a *DirectoryInstance* that will host information about the topology (where the ksessions are, where the kbases are, etc).

Once we configure our topology, we can build the *GridTopology* that will represent the running definition that we will use in our applications:

```java
GridTopology grid = GridTopologyFactory.build(gridTopologyConfiguration);
```

## Using a Grid Topology in our applications

Basically we have two aspects of our topology: 1) The static aspects that we configure in the *GridTopologyConfiguration*. In this example we are only defining two local nodes. But, you will see in following post how this configuration will contain all the necessary information to establish connections with different environments. 2) The dynamic aspects required by our application to interact with the defined environments. When we obtain the *GridTopology* object we have an access to this dynamic environment.

Let's use our Grid Topology! As you can see in the configurations we will be able to access to an *ExecutionEnvironment* and to a *DirectoryInstance*. Let's start with a simple *ExecutionEnvironment* test.

```java
ExecutionNode node = grid.getExecutionEnvironment().getExecutionNode();
```

With the previous line we access to a running *ExecutionEnvironment* and we ask for a reference to an *ExecutionNode*. Remember that one *ExecutionEnvironment* can contain a set of *ExecutionNodes*. If we are using *LocalProviders*, there is no reason to have multiple *ExecutionNodes* in the same JVM, but if we are running in a highly distributed environment an *ExecutionEnvironment* could represent more than one JVM instance, more than one virtual machine or more than one physical machine.

Once we get the *ExecutionNode* we can start creating as usual (with minor differences) our knowledge builders, knowledge bases and knowledge sessions. Please remember, all this code will be running inside the configured providers, in this case the same JVM instance.

```java
String rules = getStringFromRulesFiles("simplerules.drl");
KnowledgeBuilder kbuilder = node.get(KnowledgeBuilderFactoryService.class).newKnowledgeBuilder();
kbuilder.add(ResourceFactory.newByteArrayResource(rules.getBytes()), ResourceType.DRL);
if (kbuilder.hasErrors()) {
System.out.println("Errors: " + kbuilder.getErrors());
}
KnowledgeBase kbase = node.get(KnowledgeBaseFactoryService.class).newKnowledgeBase();
kbase.addKnowledgePackages(kbuilder.getKnowledgePackages());
StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
```

As you can see, we use the node and some internal services in order to create the knowledge builder and the knowledge base. Nothing strange here, and now you can move the place where the things will run only changing the grid topology configuration.

Once we get this session, we can use it as usual.

```java
StatefulKnowledgeSession ksession = initializeSession(node);
ksession.insert(new Person("",27,Gender.MALE,null));
ksession.fireAllRules();
grid.dispose();
```

The *grid.dispose()* method it's only used to clean up all the connections and all the reference to the services. If you want to continue using the grid object (*GridTopology* instance) you can use *grid.disconnect()* to only clean up the connections.

## Using the *DirectoryInstance* node

As you can see, we can create and use knowledge sessions as usual with *ExecutionEnvironments*. Now let's see how we can use the *DirectoryInstances* in our topology. Because we already configure the *DirectoryInstance* inside our *GridTopology* we can ask for it:

```java
DirectoryNode directory = grid.getDirectoryInstance().getDirectoryNode();
```

Once again, if we are using *LocalProviders* we will have just one *DirectoryNode* per *DirectoryInstance*. So, we go and get it. But, what can we do with a *DirectoryNode*? Basically each directory node will contain a registry (map) where we can lookup and register different resources. Right now the basic functionality that a *DirectoryNode* will give us is:

- register a ksession associated with a name: the directory instance will register the information where the ksession is hosted to be able to locate the session across multiple *ExecutionEnvironments*.
- register a kbase associated with a name: the directory instance will register where the kbase is hosted to be able to restore it if we need to create a new ksession from a different *ExecutionEnvironment*.
- lookup a ksession by name: it will retrieve a generic node connector to be able to get the ksession reference.
- lookup a kbase by name: it will retrieve the kbase client to be able to create new ksessions from it.

Take a look at the following code snippet that shows all the interaction:

```java
//We can retrieve the knowledge base using the DirectoryNodeService
KnowledgeBase kbase = directory.get(DirectoryNodeService.class)
                                 .lookupKBase("simpleValidationKbase");
//From the directory we get a connector to the environment that contains the
//session that we are looking for
GenericNodeConnector ksessionConnector = directory.get(DirectoryNodeService.class)
                                                      .lookup("validationKsession");
//Using the connector we can establish the connection with the ExecutionNode
node = grid.getExecutionEnvironment(ksessionConnector).getExecutionNode();
//When we get the ExecutionNode we can lookup in its internal map of registered sessions.
StatefulKnowledgeSession ksession =  (StatefulKnowledgeSession) node
                                            .get(DirectoryLookupFactoryService.class)
                                            .lookup("validationKsession");
```

We can do these lookups because I have do some tricks in the session initialization:

1. If we have one or more directoryInstance node(s) running we can do:

```java
KnowledgeBase kbase = node.get(KnowledgeBaseFactoryService.class)
                             .newKnowledgeBase("simpleValidationKbase");
```

and the kbase will be registered in all the running *DirectoryInstances* using the name "simpleValidationKbase".

2. To register a knowledge session we can use a service that lives inside our *ExecutionNodes*:

```java
node.get(DirectoryLookupFactoryService.class)
                    .register("validationKsession", ksession);
```

This will do two important things: a) It will register internally in the node a reference to the ksession with the name "validationKsession" b) It will register in all the available *DirectoryInstance* nodes the name and a reference to the *ExecutionNode* that is hosting the ksession.

In a highly distributed environment you will need to know at all times where you have all the ksessions and kbases in order to create interactions between them.

## In Brief

In this post we have being playing with some of the Drools Grid Services API. You can found [here an example project](http://www.plugtree.com/downloads/drools-grid-mini-demo.zip) that you can use to play with. On following posts we will be reviewing how to configure remote and distributed environments. The good news is that the APIs will be the same!
