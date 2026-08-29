---
title: "Drools Flow and BPMN2 - #1 Simple Validation Flow"
date: 2010-03-18 18:02:13 +0000
permalink: /2010/03/18/drools-flow-and-bpmn2-1-simple-validation-flow/
description: "For the following posts I would like to show the behavior and the new features provided by the BPMN2 specification implementation in Drools Flow."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "BPM"
  - "bpmn"
  - "business"
  - "Drools"
  - "example"
  - "process"
original_url: https://www.salaboy.com/2010/03/18/drools-flow-and-bpmn2-1-simple-validation-flow/
---

For the following posts I would like to show the behavior and the new features provided by the BPMN2 specification implementation in Drools Flow. I also would like to show the interaction between the execution of our Business Processes and the Rule Engine, how they work together to represent real business situations.

This first simple example will show you the main components that we will use in the following posts, this is not rocket science, but I think that you need to know the basic pieces that will interact in future examples.

 Please read the disclaimer first

## Simple Example using BPMN2

OK, if we want to start using the BPMN2 implementation provided by Drools Flow we need to add the correspondent dependency to our project.

Remember that using Drools Flow is pretty straight forward, so in our POM file (pom.xml) we will see the common dependencies that we use in our Drools Projects plus the BPMN2 module.

```
<!-- Drools Runtime -->
 <dependency>
   <groupId>org.drools</groupId>
   <artifactId>drools-api</artifactId>
   <version>5.1.0.SNAPSHOT</version>
 </dependency>
<dependency>
<groupId>org.drools</groupId>
<artifactId>drools-core</artifactId>
<version>5.1.0.SNAPSHOT</version>
</dependency>
<dependency>
<groupId>org.drools</groupId>
<artifactId>drools-compiler</artifactId>
<version>5.1.0.SNAPSHOT</version>
</dependency>
<!-- BPMN 2 Module -->
<dependency>
<groupId>org.drools</groupId>
<artifactId>drools-bpmn2</artifactId>
<version>5.1.0.SNAPSHOT</version>
<type>jar</type>
</dependency>
```

Pretty simple, right?

## BPMN2 Process Representation

Let's start with the simplest BPMN2 process out there:

![Simplestbpmn2flow](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/simplestbpmn2flow.png "simplestBPMN2Flow")

The BPMN2 specification defines the Elements that we see in the figure as:

1. Start Event
2. Business Rule Task
3. End Event

It's important for us to know how this simple process is formally represented in the XML syntax, that if you use Eclipse it will be automatically generated in the background. These XML files that represent our business processes also comply to the specification, so it gives you freedom to author your business processes with any tool. Of course, you can always create those files by hand, with a text editor or VI :).

Take a look at this process XML representation:

```
<process processType="executable" id="org.plugtree.training.simpleflow" name="simpleflow" tns:packageName="org.plugtree.training" >
<!-- nodes -->
<startEvent id="_1" name="StartProcess"/>
<businessRuleTask id="_3" name="Validation" g:ruleFlowGroup="datavalidation" />
<endEvent id="_4" name="End">
<terminateEventDefinition/>
</endEvent>
<!-- connections -->
<sequenceFlow sourceRef="_1" targetRef="_3" />
<sequenceFlow sourceRef="_3" targetRef="_4" />
</process>
```

Once again, pretty simple! And remember: All of our process will have Nodes and Connections.

## Running our Business Processes

If you are familiar with Drools Expert, you don't need to learn anything new. You will use the same APIs to load and run your business processes. Take a look at the following code snippet:

```
KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
 kbuilder.add(new ClassPathResource("SimpleFlow.bpmn"), ResourceType.BPMN2);
 kbuilder.add(new ClassPathResource("Validation.drl"), ResourceType.DRL);
 if (kbuilder.hasErrors()){
   for (KnowledgeBuilderError error : kbuilder.getErrors()) {
     System.out.println(error);
   }
   throw new IllegalStateException("Error building kbase!");
 }
 KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
 kbase.addKnowledgePackages(kbuilder.getKnowledgePackages());
StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
```

With these few lines we have a Knowledge Session, with two Knowledge Resources (SimpleFlow.bpmn and Validation.drl), which is ready to create and start new Business Process instances. Note the **ResourceType** used by the business process:

**ResourceType.BPMN2**

When we have the Knowledge Session ready we can call the method **startProcess(String, Map<String, Object>)** to create and start a new instance of our defined process:

```
RuleFlowProcessInstance processInstance = (RuleFlowProcessInstance) ksession.startProcess("org.plugtree.training.simpleflow", null);
```

## Testing our Business Process Execution

As you may notice, we have a Business Rule Task activity in our process.  It sets up the "**datavalidation**" ruleflow group. This means that some rules will be evaluated when the process execution reaches the "Validation" activity. In this case the rules defined will evaluate a "Fact" inside the working memory (ksession) to validate if it meets some restrictions.

```
global java.util.ArrayList errors;
rule "Person Name Validation"
ruleflow-group "datavalidation"
when
Person(name == "")
then
errors.add("You must enter a Person Name");
end
rule "Person Phone Number Validation"
ruleflow-group "datavalidation"
when
Person(telephoneNumber == "")
then
errors.add("You must enter a Telephone Number");
end
```

To make this process work as it is intended, you need to have at least one Person instance inside the Knowledge Session as a Fact (ksession.insert(new Person());). This will trigger the defined rules.

At the end of the execution you can check the list of errors to know if the Person instance matches with some of the validations.

## Conclusions

I hope this post helps you to understand all the pieces that interact in order to run a Business Process using the BPMN2 implementation provided by Drools Flow. In future posts, I will start using these same principles, so if you have doubts about the content of this post, feel free to post me a comment.

Quick brief about what we have seen in this post:

- Dependencies needed to use Drools Expert and Drools Flow with the BPMN2 spec implementation
- How we define our business processes (both: graphically and using the XML syntax)
- How we set up the environment that uses the Drools APIs to run our Business Processes
- How the process behaves when we test it and how the Business Rules Task is executed

Any feedback is appreciated and try the code examples to see how the entire project works.

[Project Code: Download!](http://www.plugtree.com/downloads/01-DroolsFlowSimpleFlow.zip)
