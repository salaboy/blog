---
title: "Drools – Use Case: Emergency Service – Business Process Implementation  (Part 2)"
date: 2010-03-23 14:24:22 +0000
permalink: /2010/03/23/drools--e2-80-93-use-case-emergency-service--e2-80-93-business-process-implementation-part-2/
description: "This post will describe the implementation details from the scenario described in the previous post."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "bpmn"
  - "Drools"
original_url: https://www.salaboy.com/2010/03/23/drools--e2-80-93-use-case-emergency-service--e2-80-93-business-process-implementation-part-2/
---

This post will describe the implementation details from the scenario described in the previous [post](/2010/03/19/drools-use-case-emergency-service/). Based on the sequence of activities that we recognize in the Emergency Service scenario we will model our business process using the BPMN2 specification. Once we get the formal description of our process we will execute it using Drools Flow. This post will describe the main technical points needed to run our business processes.

[Please read the disclaimer first](/disclaimer/)

## Formalizing our Business Process

Our first step is to define the sequence of activities that we need in order to achieve the business goal. In this case the business goal is to pick up the patient that has suffered an injury and leave him/her in a hospital as quickly as possible. Based on our response time, our service can be qualified using different quality measurements. It's important for us to be able to measure how each instance of our business process performs in order to discover how we can improve our service. For the managers of our company, it will be important to see in realtime how the processes are being executed. This helps them to make decisions based

on the company st

atus; for example, if the number of emergencies per hour is higher than the number of ambulances that the company owns, they will have to buy more ambulances.

Based on the previous process graph, we can model this situation using the BPMN2 notation. I will show here some screenshots of my modeled process into Eclipse using the Drools plugins. You can try also the [Oryx Process Modeler](http://bpt.hpi.uni-potsdam.de/Oryx) to represent your business processes using the BPMN2 notation.

![Uc emergencyservice 07 businessprocess2](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/uc-emergencyservice-07-businessprocess2.png "UC-EmergencyService-07-BusinessProcess")

## Understanding our Business Process Behavior

Before modeling our business processes we need to understand each activity's behavior to know what will happen in runtime. If we don't understand when to use each of the activities provided in the palette, we can end up with a process badly described that will not represent correctly our business situation.

![Emergencyservicebpmn2droolsflow](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/emergencyservicebpmn2droolsflow.png "EmergencyServiceBPMN2DroolsFlow")

The following list will describe each activity used in this example. If you want a more detailed explanation please refer to the BPMN2 specification:

- **Start Event:** indicates that a particular Process will start.
- **User Task:** is a typical "workflow" task where a human performer performs the Task with the assistance of a software application, and where the Task is scheduled through a Task list manager of some sort.
- **Parallel Gateway:** is used to synchronize (combine) parallel flows and to create parallel flows (split/fork).
- Intermediate Catch Event: indicates when something happens (an Event) somewhere between the start and end of a Process.
- **Business Rule Task:** provide a mechanism for the process to provide input to a Business Rule Engine and get the output of calculations that the Business Rule Engine might provide.
- **Service Task:** is a Task that sues some sort of service, which could be a Web Service or an automated application
- **End Event:** indicates where a Process will end.

Once we understand these definitions, we will know what will happen when we run our processes.

## Drools Flow Implementation and Runtime

I will use the common Drools Flow APIs to implement this scenario. Here I will mention only the important stuff that you need to know plus the information that will travel along our business process. The following code snippet shows the basic stuff needed to load your processes and rules into a compiled knowledge package that will be used by a knowledge base to create new knowledge session.

```java
KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
 kbuilder.add(new ClassPathResource("EmergencyService.bpmn"), ResourceType.BPMN2);
 kbuilder.add(new ClassPathResource("rules.drl"), ResourceType.DRL);
 if (kbuilder.hasErrors()) {
   for (KnowledgeBuilderError error : kbuilder.getErrors()) {
     System.out.println(error);
   }
   throw new IllegalStateException("Error building kbase!");
 }
 kbase = KnowledgeBaseFactory.newKnowledgeBase();
 kbase.addKnowledgePackages(kbuilder.getKnowledgePackages());
 StatefulKnowledgeSession ksession = JPAKnowledgeService.newStatefulKnowledgeSession(kbase, null, env);
```

One important thing to notice here (that was not previously discussed in the previous [post](/2010/03/18/drools-flow-and-bpmn2-1-simple-validation-flow/)) is the use of the persistence features in the example. Most of the time, when we have short (in memory) running processes we don't need to persist their status into a database. But, for long running processes we need a way to keep the process information out of the main memory. For this reason, we use the **JPAKnowledgeService** to create a new "**Persistable**" knowledge session. This Knowledge Session will know how to persist all the necessary information in order to be restored in the future. Because the Process Instances live inside the Knowledge Session they will be persisted automatically when they reach a safe point.

As you can see, the **JPAKnowledgeService** receives an **Environment** as a third parameter. This Environment will provide everything needed to persist all the information internally. Take a look at a common configuration for this Environment:

```java
EntityManagerFactory emf = Persistence.createEntityManagerFactory("org.drools.persistence.jpa");
 env = KnowledgeBaseFactory.newEnvironment();
 env.set(EnvironmentName.ENTITY_MANAGER_FACTORY, emf);
 env.set(EnvironmentName.GLOBALS, new MapGlobalResolver());
 env.set(EnvironmentName.TRANSACTION_MANAGER, TransactionManagerServices.getTransactionManager());
```

As you can see, the **Environment** will include an **EntityManagerFactory** and a **TransactionManager**. Both will be used to handle all the process information automatically, so you won't need to worry about it.

As you may already know, the **EntityManagerFactory** will create a new **Persistence Unit** (in this case called: org.drools.persistence.jpa) that will be configured to use a JTA DataSource. Take a look at the following XML snippet:

```xml
<persistence-unit name="org.drools.persistence.jpa" transaction-type="JTA">
  <provider>org.hibernate.ejb.HibernatePersistence</provider>
  <jta-data-source>jdbc/testDS1</jta-data-source>
  <class>org.drools.persistence.session.SessionInfo</class>
  <class>org.drools.persistence.processinstance.ProcessInstanceInfo</class>
  <class>org.drools.persistence.processinstance.ProcessInstanceEventInfo</class>
  <class>org.drools.persistence.processinstance.WorkItemInfo</class>
  <class>org.drools.persistence.processinstance.variabletypes.VariableInstanceInfo</class>
  <class>org.drools.persistence.processinstance.variabletypes.JPAPersistedVariable</class>
<properties>
<property name="hibernate.dialect" value="org.hibernate.dialect.MySQL5Dialect"/>
<property name="hibernate.connection.autocommit" value="false" />
<property name="hibernate.max_fetch_depth" value="3"/>
<property name="hibernate.hbm2ddl.auto" value="create" />
<property name="hibernate.show_sql" value="true" />
<property name="hibernate.transaction.manager_lookup_class" value="org.hibernate.transaction.BTMTransactionManagerLookup"/>
</properties>
</persistence-unit>
```

Note that we use a JTA DataSource to handle all the internal transactions. We choose to use [Bitronix](http://docs.codehaus.org/display/BTM/Home) as our Transaction Manager, so we need to start a new Pooling DataSource with the following code snippet:

```java
ds1 = new PoolingDataSource();
 ds1.setUniqueName("jdbc/testDS1");
 ds1.setClassName("com.mysql.jdbc.jdbc2.optional.MysqlXADataSource");
 ds1.setMaxPoolSize(5);
 ds1.setAllowLocalTransactions(true);
 ds1.getDriverProperties().put("user","root");
 ds1.getDriverProperties().put("password","");
 ds1.getDriverProperties().put("databaseName", "droolsflow");
 ds1.getDriverProperties().put("serverName", "localhost");
```

## Wrapping up

Right now we are ready to execute our long running processes using the persistence mechanisms provided by Drools Flow. As you may notice there are some extra details needed to interact with our process instances. I will leave these details for a future post about human interactions and domain specific processes.  We need to understand in depth how our users will interact with their **User Tasks** and how we can notify our process about external events. Also we need to understand how we can model more expressive business processes using the flexibility provided by the specification (Service Tasks) and the flexibility provided by Drools Flow (Work Items).

PS: I've included the MySQL 5 configurations, and I also have the H2 and PostgreSQL configurations.  Post me a comment if you need them or if you have tried with another DB vendor. Please share the configurations with the community.
