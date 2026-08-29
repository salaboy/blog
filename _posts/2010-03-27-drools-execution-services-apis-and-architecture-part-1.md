---
title: "Drools Execution Services APIs and Architecture (Part 1)"
date: 2010-03-27 14:31:47 +0000
permalink: /2010/03/27/drools-execution-services-apis-and-architecture-part-1/
description: "This post will be about the work that I'm doing inside the Drools Project. I'm focused right now in high distributed and scalable Knowledge Session…"
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "api"
  - "Drools"
original_url: https://www.salaboy.com/2010/03/27/drools-execution-services-apis-and-architecture-part-1/
---

This post will be about the work that I'm doing inside the Drools Project. I'm focused right now in high distributed and scalable Knowledge Session deployments. For that reason,  I became interested in the [Rio Project](http://www.rio-project.org/), that uses [Apache River](http://incubator.apache.org/river/RIVER/index.html) (Jini implementation) and let us easily build a highly scalable grid of services. This post will show the basic components that comes into play to understand the [next post](/2010/03/27/drools-execution-services-apis-and-architecture-part-2/) that will explain how the Rio project can be used to support distributed and dynamic environment of services.

[Please  read  the disclaimer  first](/disclaimer/)

Note: all the topics discussed in this post are just proposals, all the code is written and working but is not merged into the Drools Project trunk repository. We hope to include these new features in the next Drools releases.

## New API and Architecture Proposal - High Level Overview

The idea of this section is to describe the current semantic of the new APIs that we propose (Mark Proctor and I). We will see the main components that will interact in order to have a high scalable grid of distributed knowledge session.

The following image show the Client side components of the proposed architecture, this is very important to understand how we will use the API and to understand all the components interactions.

![Drools services](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/drools-services.png "drools-services")

This figure represent the Drools Execution Node architecture proposed. Right now this work is represented in a project badly called **drools-services** (we are looking an appropriate name for it, feel free to suggest one. Other names that we have in the list: drools-executions, drools-execution-services, drools-cluster).

We will have the **ExecutionNode** as a central concept in this architecture. This **ExecutionNode** will contain a **NodeConnector** that will let us to plug different implementations of services that can execute Drools Commands.

Currently the **drools-services** project let us choose between the Local and Remote implementations. The local implementation is exactly the same if that we use the normal Drools APIs, all the executions will happen in the same local thread where we do the calls. The remote implementations (currently using Apache Mina) let us decouple the drools session execution to a remote server. This is awesome when we have huge applications and have multiple machines to use and to distribute the application load over them.

As you can see, we can attach different service factories to each execution node that we create. Using this factories we can instantiate each one of this services without being interested where the execution will take place. The common factories that we will always have are:

- **KnowledgeBuilderFactoryService**: this factory will allow us to create a new Knowledge Builder. If we are using the remote implementation, the Knowledge Builder that we will obtain will be just a simple client, but the real Knowledge Builder will be created on the server side.
- **KnowledgeBaseFactoryService**: this factory will allow us to create a new Knowledge Base to attach our Knowledge Packages. Once again, if we are using the remote implementation, the kbase will be stored in the server side and we will get just a client to access it in our code.
- **DirectoryFactoryService**: this factory will let us create a client of the Directory Service. If we use the remote implementation, we will obtain an instance of the **DirectoryLookupService** that will contain a list of all the ksession (command executors) that can be distributed across multiple remote servers.
- **HumanTaskFactoryService**: this factory let us a create a new **HumanTaskService** that will allow us to interact with the human related activities inside our business processes. This Factory is surrounded with a dotted square because it is separated in another project that was specially created to handle all the topics related with Human Tasks. The project right now is called **drools-services-task**, but when we choose another name it will include **-task** to recognize these features.
- Of course you can plug your own service in this architecture. You only need to create the Factory that builds the client and know how to communicate with the real remote service implementation.

## API preview

How can I use this in my applications? how can I interact with the remote knowledge sessions? nothing more easy to understand that simple Java code right?

```java
KnowledgeBuilder kbuilder =
                 node.get(KnowledgeBuilderFactoryService.class)
                 .newKnowledgeBuilder();
kbuilder.add(
             ResourceFactory.newByteArrayResource( str.getBytes() ),
             ResourceType.DRL
            );
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

Note that in this code we don't know if we are running all the drools internals in the current thread or if our execution is happening decoupled in a remote machine or in another thread. That will basically depends on the type of node that we decide to create, making easy to change where the execution take place, without changing a single line of our functional code.

If we want to use the Remote implementation, we need to create a a **RemoteNodeConnector**, that will know how to connect to the remote service. When the **RemoteNodeConnector** connects it successfully with the remote server, it will return a new **NodeExecution** object that we can use as we saw in the previous code snippet.

Take a look at the following snippet that is used to create this **RemoteNodeConnector** using a **ServiceConnector** implementation (in this case the Apache Mina implementation):

```java
// setup Client
NioSocketConnector clientConnector = new NioSocketConnector();
clientConnector
      .setHandler( new MinaIoHandler(
                          SystemEventListenerFactory
                          .getSystemEventListener()
                   )
                 );
GenericServiceConnector minaClient =
              new MinaServiceConnector( "client 1",
                                        clientConnector,
                                        address,
                                        SystemEventListenerFactory
                                           .getSystemEventListener()
                                       );
nodeConnection = new RemoteNodeConnector("client 1", minaClient);
node = nodeConnection.connect();
```

The only thing missing here is the server where the **RemoteNodeConnector** is trying to connect. We need to set up and run our remote execution server depending the implementation that we want to use. The following code snippet start up a Mina Server that will host and execute drools sessions (command executors):

```java
SocketAddress address = new InetSocketAddress( "127.0.0.1", 9123 );
NodeData nodeData = new NodeData();
// setup Server
SocketAcceptor acceptor = new NioSocketAcceptor();
acceptor.setHandler(new MinaIoHandler(
SystemEventListenerFactory
.getSystemEventListener(),
new GenericMessageHandlerImpl( nodeData,
SystemEventListenerFactory
.getSystemEventListener()
)
)
);
this.server = new MinaAcceptor( acceptor, address );
this.server.start();
```

## Wrapping Up

If you are familiar with the current Drools Virtual Service Manager  (drools-vsm) project, all the things that we already discussed are familiar to you. This is basically a semantically evolution of the VSM APIs that will allow us fit better in the grid architecture. If you are not familiar with the Drools VSM project, now you are! and you know all the components that interacts in order to execute drools in a remote environment. The [next post](/2010/03/27/drools-execution-services-apis-and-architecture-part-2/) will describe how the RIO project can be used as the underlying grid implementation and which other components appear in order to scale to a complex architecture (compared with the server/client architecture proposed by the Apache Mina implementation).

[Updated: Part 2](/2010/03/27/drools-execution-services-apis-and-architecture-part-2/)
