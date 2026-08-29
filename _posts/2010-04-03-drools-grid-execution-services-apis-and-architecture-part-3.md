---
title: "Drools Grid: Execution Services APIs and Architecture (Part 3)"
date: 2010-04-03 21:20:39 +0000
permalink: /2010/04/03/drools-grid-execution-services-apis-and-architecture-part-3/
description: "This post is a continuation and an updated version of two of my previous posts (the first one and the second one) where I introduce the current effort of…"
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "distributed"
  - "Drools"
  - "knowledge"
  - "services"
original_url: https://www.salaboy.com/2010/04/03/drools-grid-execution-services-apis-and-architecture-part-3/
---

This post is a continuation and an updated version of two of my previous posts ([the first one](/2010/03/27/drools-execution-services-apis-and-architecture-part-1/) and the [second one](/2010/03/27/drools-execution-services-apis-and-architecture-part-2/)) where I introduce the current effort of deploying Drools into a grid environment. After a few refactorings, I get new version that uses the same API to conform  a simple distributed grid using the Mina Implementation or a full featured grid using the RIO implementation.

During the following sections I will describe how to start using these APIs to interact no matter the underlying implementation  you choose.

[Please   read  the disclaimer  first](/disclaimer/)

Note: all the topics discussed in this post are just proposals, all the code is written and working but is not merged into the Drools Project trunk repository. We hope to include these new features in the next Drools releases.

## Architectural Terminology Overview

Here we will use the word **"GRID"** to represent a set of distributed nodes (across different machines) where we can create and execute remote Knowledge Sessions. The main idea behind this distribution is to be able to distribute our application load in different machines, letting us scale transparently with out adding complexity to our development phases.

The following figure describe the new Architectural components that will interact in a grid environment.

![Unifiedarchitecture droolsgrid](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/04/unifiedarchitecture-droolsgrid.png "unifiedArchitecture-DroolsGrid")

This figure is pretty similar to the one introduced before for grid environments, but it also includes the Local (same JVM) and Remote (Apache Mina implementation right now, we will provide more implementations soon).

As you may notice, one of the core components here is the **GenericConnection**. Right now I provide 3 implementations: **Local**, **Remote** and **Grid** Connections. Our client applications will need to choose between these implementations to define the underlying mechanisms that will be used to interact with our grid. No matter which implementation you choose, the APIs will be always the same, the only changes will be the features provided by each configured environment.

## Execution and Directory Nodes

In the previous figure we see the relationship between a **GenericConnection** and a set of **ExecutionNodes** and **DirectoryNodes**.

**ExecutionNodes** will host our knowledge sessions, letting us sending commands to them, and they will be in charge of execute the commands in the server side and return to our clients the response.

**DirectoryNodes** will be responsible for maintaining a list of our distributed Knowledge Sessions across all the grid. In other words, each **DirectoryNode** will contain a Map, that we can query to know in which **ExecutionNode** is hosted a particular Knowledge Session.

As we see in the [previous post](/2010/03/27/drools-execution-services-apis-and-architecture-part-2/) when we want to interact with a **ExecutionNode** we call the method *getExecutionNode(NodeSelectionStrategy strategy)* over our Local/Remote/Grid Connection, to get one instance that will use the provided GenericConnector to contact the concrete ExecutionNode.

Once we get the **ExecutionNode** instace, we can use the method *public &lt;T&gt; T get(Class&lt;T&gt; interfaceClass)* to obtain different factory services that we can register to use.

Let's check the proposed APIs to see how we will use them in our applications.

## Proposed APIs

Once again I just want to show how to use the proposed APIs. Now they are unified for all the environments that we can choose, and the APIs are extensible to plug your own services inside them and create new implementations using different transports.

```java
KnowledgeBuilder kbuilder = node.get(KnowledgeBuilderFactoryService.class).newKnowledgeBuilder();
kbuilder.add( ResourceFactory.newByteArrayResource( str.getBytes() ),
ResourceType.DRL );
if ( kbuilder.hasErrors() ) {
System.out.println( "Errors: " + kbuilder.getErrors() );
}
KnowledgeBase kbase = node.get(KnowledgeBaseFactoryService.class).newKnowledgeBase();
kbase.addKnowledgePackages( kbuilder.getKnowledgePackages() );
StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
node.get(DirectoryLookupFactoryService.class).register( "ksession1",
ksession );
ExecutionResults results = node.get(DirectoryLookupFactoryService.class).lookup( "ksession1" ).execute( new FireAllRulesCommand( "fired" ) );
```

As you can see we still using the same API's for creating a Knowledge Builder, a Knowledge Base and our Knowledge Session. In this code Snippet we also see how we can use the DirectoryLookupFactoryService to register and lookup our Knowledge Sessions.

The following snippet show how we can configure the **RemoteConnection** in this case, add the **NodeConnectors** and get one **ExecutionNode** to use.

```java
GenericConnection connection = new RemoteConnection();
// Create a new MinaConnector, and add it to the
// NodeConnectors List inside the RemoteConnection
// You can create as many Connectors as Mina Servers that you want
...
connection.addNodeConnector(minaClient);
node = connection.getExecutionNode(null);
```

## In Brief

This is just an updated version of my previous posts. The most important thing to have in mind is the new Component interaction layout. My next posts will be focused in the Grid/RIO implementation and also in the project distribution and naming. I've already been playing with dynamic scale up and down of the Grid based on the **ExecutionNode** load, and it's impressive. Stay tuned!
