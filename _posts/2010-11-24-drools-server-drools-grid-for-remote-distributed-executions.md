---
title: "Drools Server + Drools Grid for remote / distributed executions"
date: 2010-11-24 14:36:15 +0000
permalink: /2010/11/24/drools-server-drools-grid-for-remote-distributed-executions/
description: "In this post I will explain how to use the new features that were included in the Drools Trunk (5.2.0.SNAPSHOT) that provides the integration of the…"
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "Drools"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/11/24/drools-server-drools-grid-for-remote-distributed-executions/
---

In this post I will explain how to use the new features that were included in the Drools Trunk (5.2.0.SNAPSHOT) that provides the integration of the Drools Server with the Drools Grid features.

Both Drools Server and Drools Grid include several topics that need to be discussed to understand how they can work together and in which situations they should be used. For that reason we will also discuss some topics like Drools Spring integration and Drools Camel integration.

Let's start talking about sub project responsibilities:

Drools Camel: it's a sub project that integrates the features of Apache Camel to be able to interact with a Drools Component that will execute commands against Knowledge Sessions. Apache Camel lets you create pipelines that will get a message and transform it  to be delivered to the Drools Component. This component will be in charge of executing the command that is part of the message and return the results to the pipeline.

Drools Server: drools-server is a sub project inside drools that lets you host knowledge sessions inside a web(servlet) container. It uses Drools Camel to create  web services endpoints(Rest and Soap) that listen to commands(insert, retract,  update, startProcess, etc) and propagates them to the Drools Component in camel.

Drools Spring integration lets you define how to create a knowledge session using Spring beans definitions. Using these beans we will define statically  the sessions that will be created when the Drools Server starts.

Drools Grid: the main idea behind drools grid is to provide a simple API to be able to interact and create remote and distributed services in multiple machines. We will use Drools Grid here to be able to create dynamically knowledge sessions that will be hosted inside the Drools Server.

## Drools Server Configurations

First of all you need to have Drools Server working. Remember that Drools Server is just a Web Application (WAR file) that can be deployed in any Servlet Container. Inside it we can configure the sessions that will be create at initialization time. Using Drools Spring integration we can also define how our Grid will look like. Let's take a look at the *[knowlege-services.xml](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/main/resources/knowledge-services.xml)* file that describe the sessions that must be created and the Drools Grid configurations expressed as Spring beans.

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:drools="http://drools.org/schema/drools-spring"
xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.0.xsd
http://drools.org/schema/drools-spring org/drools/container/spring/drools-spring-1.2.0.xsd">
<drools:grid-node id="node1" />
<drools:kbase id="kbase1" node="node1">
<drools:resources>
<drools:resource  type="DRL" source="classpath:test.drl"/>
</drools:resources>
</drools:kbase>
<drools:ksession id="ksession1" type="stateless" kbase="kbase1" node="node1"/>
</beans>
```

This basic ksession definition is the one provided by default inside Drools Server. It will create a stateless knowledge session based on the kbase defined. This kbase will be created using a *[test.drl](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/main/resources/test.drl)* file that will contain our set of rules. As you can see we also define a ***drools:grid-node*** called ***node1***. This node is the one that will host our ksessions and kbases. In a grid we will have more than one node and each node will be able to host multiple kbases and ksessions.

## Using Drools Grid inside Drools Server

If you open the new file (*[knowledge-services-grid.xml](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/main/resources/knowledge-services-grid.xml)*) provided inside the Drools Server that shows how we can use the drools grid integration, you will see a couple of changes:

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:drools="http://drools.org/schema/drools-spring"
xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.0.xsd
http://drools.org/schema/drools-spring http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-container/drools-spring/src/main/resources/org/drools/container/spring/drools-spring-1.2.0.xsd">
<bean id="ds">
<!-- org.h2.jdbcx.JdbcDataSource -->
<property name="driverClassName" value="org.h2.Driver" />
<property name="url" value="jdbc:h2:mem:mydb" />
<property name="username" value="sa" />
<property name="password" value="" />
</bean>
<bean id="myEmf">
<property name="persistenceUnitName" value="org.drools.grid"/>
</bean>
<bean id="shared-map" />
<bean id="localWhitePages" />
<drools:grid id="grid1">
<drools:core-services ref="shared-map" />
<drools:whitepages>
<drools:jpa-persistence>
<drools:entity-manager-factory ref="myEmf" />
</drools:jpa-persistence>
</drools:whitepages>
<drools:socket-service acceptor="mina" ip="127.0.0.1">
<drools:service name="org.drools.grid.service.directory.WhitePages" port="8000" />
</drools:socket-service>
</drools:grid>
<drools:grid id="grid2">
<drools:core-services ref="shared-map" />
</drools:grid>
<drools:grid-node id="node1" grid="grid1">
<drools:socket-service port="8000" />
</drools:grid-node>
<drools:kbase id="kbase1" node="node1">
<drools:resources>
<drools:resource  type="DRL" source="classpath:test.drl"/>
</drools:resources>
</drools:kbase>
<drools:ksession id="ksession3" type="stateful" kbase="kbase1" node="node1"/>
</beans>
```

Here we also create a knowledge session, but in this case it is a stateful one. You should take into account  that our ***drools:grid-node*** belongs to a grid now. "***grid1***" is defined with the drools:grid bean and it contains a map of core services and a list of services. In this case we only need to configure the ***drools:whitepages*** services that it's a kind of directory of our grid services across multiple nodes. You will also see  the d**rools:socket-service** definition that will expose our services through a socket. Take a look also at the ***drools:grid-node*** that also states that the node can be accessed through the same socket. This will give us access to interact with the node allowing us to dynamically create remote sessions.

If you want to test this grid configuration you need to change the *[beans.xml](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/main/resources/beans.xml)* file to point the [knowlege-service-grid.xml](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/main/resources/knowledge-services-grid.xml) file instead of the default **knowledge-services.xml**.

You will see in future posts that we will continue adding distributed services into the grid definition to solve more complex situations. For now you can register the whitepages services and the node itself.

As you can notice we also create a second grid (grid2) but just for testing purposes.

## Camel Configuration

Now if you take a look at the camel-server.xml file you will find the definition of both endpoints and the camel route that is defined to receive our messages and to propagate them into the drools component.

```xml
<!--
!   Define the server end point.
!   Copy and paste this element, changing id and the address, to expose services on different urls.
!   Different Camel routes can handle different end point paths.
-->
<cxf:rsServer id="rsServer"
address="/rest"
serviceClass="org.drools.jax.rs.CommandExecutorImpl">
<cxf:providers>
<bean/>
</cxf:providers>
</cxf:rsServer>
<cxf:cxfEndpoint id="soapServer"
address="/soap"
serviceName="ns:CommandExecutor"
endpointName="ns:CommandExecutorPort"
wsdlURL="soap.wsdl"
xmlns:ns="http://soap.jax.drools.org/" >
<cxf:properties>
<entry key="dataFormat" value="MESSAGE"/>
<entry key="defaultOperationName" value="execute"/>
</cxf:properties>
</cxf:cxfEndpoint>
<!-- Leave this, as it's needed to make Camel "drools" aware -->
<bean id="droolsPolicy" />
<camelContext id="camel" xmlns="http://camel.apache.org/schema/spring">
<!--
! Routes incoming messages from end point id="rsServer".
! Example route unmarshals the messages with xstream and executes against ksession1.
! Copy and paste this element, changing marshallers and the 'to' uri, to target different sessions, as needed.
!-->
<route>
<from uri="cxfrs://bean://rsServer"/>
<policy ref="droolsPolicy">
<unmarshal ref="xstream" />
<to uri="drools:node1/ksession1" />
<marshal ref="xstream" />
</policy>
</route>
<route>
<from uri="cxf://bean://soapServer"/>
<policy ref="droolsPolicy">
<unmarshal ref="xstream" />
<to uri="drools:node1/ksession1" />
<marshal ref="xstream" />
</policy>
</route>
</camelContext>
```

This route clearly corresponds to the simple stateless ksession definition inside the **knowledge-services.xml.** As you can see two routes are defined. One for the Rest Endpoint and the other for the SoapEndpoint.

Both treat the message that arrives in the same way. We can see that a Drools Policy is defined and then an unmarshall and marshall processors are wrapping the drools component.

The URI inside the Drools Component represents the session that will be in charge of executing the message that arrives from the Rest or Soap Endpoint. In this case the message will be delivered to the ***kession1*** hosted inside the ***node1***.

## Automatic Look up for Ksessions

Now if you open the [camel-server-grid.xml](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/main/resources/camel-server-grid.xml) file you will find that the routes change a little bit.

&lt;route&gt;

&lt;from uri="cxfrs://bean://rsServer"/&gt;

&lt;policy ref="droolsPolicy"&gt;

&lt;unmarshal ref="xstream" /&gt;

&lt;to uri="drools:node1" /&gt;

&lt;marshal ref="xstream" /&gt;

&lt;/policy&gt;

&lt;/route&gt;

&lt;route&gt;

&lt;from uri="cxf://bean://soapServer"/&gt;

&lt;policy ref="droolsPolicy"&gt;

&lt;unmarshal ref="xstream" /&gt;

&lt;to uri="drools:node1" /&gt;

&lt;marshal ref="xstream" /&gt;

&lt;/policy&gt;

&lt;/route&gt;

As you can see the routes now don't contain the ***ksession*** reference. The ksession will be included in the message, so when the message arrives the Drools Policy will inspect the message and decide where to dispatch the message content. This will allow us to interact with dynamically created sessions that we didn't know at configuration time.

Once again if you want to use this configuration, you only need to change the **bean.xml** and the reference to the **camel-server.xml** to **camel-server-grid.xml**.

Inside Drools' trunk I provide a test that shows how we can use Drools Grid to create dynamically new ksessions that will be hosted in a remote location. You can browse the test called [CxfSoapClientServerGridTest.java](http://anonsvn.jboss.org/repos/labs/labs/jbossrules/trunk/drools-server/src/test/java/org/drools/server/CxfSoapClientServerGridTest.java) to see the basic usage. The first thing that you will see in the test is an interchange of  messages with the existing session. Take a look at the createMessageForKsession(String) method, which creates a Soap Message that will be sent to the CXFSoap Endpoint.

After checking that the first response works well, we get the "**grid2**" bean and look up (**lookup("node1")** method) for the remote node1 that is hosted inside drools-server. Because it's a remote node we need to connect to it first before we start interacting with it. After we were connected to the remote node we will create a kbuilder, kbase and ksession using quite similar APIs as the one that we generally use.

You will notice that we need to send our rules as a byte array to the remote server in order to have them available in the remote location. Remember that now the rules will be executed remotely.

Pay attention to the next important lines:

```java
KnowledgeBuilder kbuilder = remoteN1.get( KnowledgeBuilderFactoryService.class ).newKnowledgeBuilder();
KnowledgeBase kbase = remoteN1.get( KnowledgeBaseFactoryService.class ).newKnowledgeBase();
StatefulKnowledgeSession session = kbase.newStatefulKnowledgeSession();
```

Here **kbuilder**, **kbase** and **ksession** are remote clients that will let us interact with the remotely hosted instances. After we have our knowledge session created, the only thing that remains to be done is to register it inside the node with:

```java
remoteN1.set("ksession2", session);
```

Now the node will be aware of the new session and when a message needs to be executed inside the ksession2  the Drools Camel Routes will know how to dispatch it.

Now if you want to test the interactions with the real drools-server running you will probably want to use Soap UI or create your own custom client application that can create requests to interact with the remote sessions or create dynamically new ones.

I'm preparing right now a video that shows how to download drools-server, configure it and interact with it.

Stay tuned!
