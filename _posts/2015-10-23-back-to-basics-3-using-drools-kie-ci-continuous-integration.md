---
title: "Back to Basics #3: Using Drools KIE CI (Continuous Integration)"
date: 2015-10-23 20:04:05 +0000
permalink: /2015/10/23/back-to-basics-3-using-drools-kie-ci-continuous-integration/
description: "In my last two blog posts (first, second) I've showed you how to create a very simple project with just a single rule, a main method that creates a new…"
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/kie.png
tags:
  - "community"
  - "Drools"
  - "English"
  - "Java"
  - "basic"
  - "business"
  - "rules"
  - "tutorial"
original_url: https://www.salaboy.com/2015/10/23/back-to-basics-3-using-drools-kie-ci-continuous-integration/
---

In my last two blog posts ([first](/2015/10/20/back-to-the-basics-getting-started-with-drools-6-3-0-final/), [second](/2015/10/21/back-to-the-basics-2-testing-rules-with-arquillian-basics/)) I've showed you how to create a very simple project with just a single rule, a main method that creates a new Rule Engine session via injection and a test class that also interacts with an injected session by using Arquillian. Now it is time to separate the rules from our Java code, in this way we will be able to update the rules without the need of recompiling our entire application when the rule changes. On this tutorial we will look at the use of the Drools KIE CI module, which allows us to load rules located in the different maven artefact (jar file) by using Maven Resolution strategies. This opens the possibility of having our rules in a completely different lifecycle than our applications which is a very powerful and recommended thing to do.

## Introduction

For this example, we need to have two separate projects, one denominated KJAR (Knowledge Jar) which contains the kmodule.xml file and our rules and another project that contains the tests to simulate our application that consume our rules.

You can find the source code of these projects here: <https://github.com/Salaboy/drools-workshop/tree/master/drools-kie-ci-example>

In this way, later on, we will be able to have multiple applications all consuming different KJARS with different rules and configurations. We will be able to even create inside the same application different Rule Engine instances by using different versions of the same KJARs.

![Example Artefacts ](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2015/10/kie-ci-example.png)

*Example Artefacts*

In order to create the following projects, I've just copied the original project that I've created in my previous 2 posts and updated the pom.xml files accordingly. The two projects that we have now are:

- [my-first-drools-kjar](https://github.com/Salaboy/drools-workshop/tree/master/drools-kie-ci-example/my-first-drools-kjar) : This project contains just our rules, this is our KJAR project. You will see that the pom.xml file doesn't contain any dependency at all. The GAV (GroupId, ArtifactId, Version) for this artefact is: org.drools.workshop:my-first-drools-kjar:1.0-SNAPSHOT. We are going to use this GAV to make a reference to this KJAR
- [drools-kjar-ci-test](https://github.com/Salaboy/drools-workshop/tree/master/drools-kie-ci-example/drools-kjar-ci-test) : This project contain our simple test that loads the rules and create a new Rule Engine instance (KieSession). This project simulates our application which will be interested in consuming our rules. If you take a look at the pom.xml file you will see most of the same dependencies that we were using before. One natural thing to do when you split projects is to add the dependency of our rules artefact in the pom.xml file. In this case, the "Application" and the rules KJAR doesn't have an explicit dependency, the KIE-CI project will take care of resolving which artefacts are needed.

## KIE-CI in action

If we add the KIE-CI dependency in our application class path, our application will be able to look for the correct artefact based on its GAV and resolve it using Maven. The following dependency must be added to your pom.xml file for KIE-CI:

```xml
<dependency>
<groupId>org.kie</groupId>
<artifactId>kie-ci</artifactId>
<version>${kie.version}</version>
<exclusions>
<exclusion>
<groupId>com.google.guava</groupId>
<artifactId>guava</artifactId>
</exclusion>
</exclusions>
</dependency>
```

Notice that for getting KIE-CI working with Arquillian and Weld I needed to exclude the Guava library required by KIE-CI and add a direct dependency to com.google.guava:guava:14.0 in my pom.xml file. I've reported a Jira issue about this, because they might be another better solution.

Once we have KIE-CI in our application class path we can use the @KReleaseId annotation to load our KieSessions from an artefact that Maven will resolve.

```java
@Inject
@KSession
@KReleaseId(groupId = "org.drools.workshop",artifactId = "my-first-drools-kjar", version = "1.0-SNAPSHOT")
private KieSession kSession;
```

If you run this test project without having the KJAR artefact in a reachable Maven Repository, the test will fail to Inject the KieSession that you are requesting with the following exception:

```java
java.lang.RuntimeException: Cannot find KieModule: org.drools.workshop:my-first-drools-kjar:1.0-SNAPSHOT
at org.drools.compiler.kie.builder.impl.KieServicesImpl.newKieContainer(KieServicesImpl.java:117)
```

In other words, you need to make sure that you build, package and install your KJAR project into your local maven repository so KIE-CI can pick it up.

One more thing that I will mention here is the fact that the @KSession annotation is by default picking the default session configured in the ***kmodule.xml*** file. You can easily define more KieSessions and KieBases (look at the docs for understanding more about the configurations and KieBases) and then use the name parameter of the annotation to load the one that you are looking for. For Example ***@KSession(name = "myExampleKieSession")***

## Summary

On this blog post I've introduced the KIE-CI project that helps us to separate our rules (knowledge resources) into separate artefacts from our applications. This is recommend approach to decouple the rules lifecycle from the application lifecycle. At the end of the day rules and business knowledge in general is supposed to be changing faster than our application infrastructure.

I hope that you can get the idea about KIE-CI with this simple example. I encourage you to get the projects and give it a try, this  is one of the main components that you need to get to have an overall picture about the KIE Workbench and KIE Server, which we will tackle in future blog posts.

If you have any questions, don't hesitate to ask, I will do my best to answer.

Enjoy!
