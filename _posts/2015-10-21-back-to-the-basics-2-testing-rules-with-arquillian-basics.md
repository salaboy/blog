---
title: "Back to the Basics #2: Testing Rules With Arquillian"
date: 2015-10-21 12:55:02 +0000
permalink: /2015/10/21/back-to-the-basics-2-testing-rules-with-arquillian-basics/
description: "As a follow up from my previous post, this tutorial will show how to add the correct Arquillian dependencies to test our rules."
tags:
  - "community"
  - "English"
  - "Java"
  - "Drools"
  - "rule engine"
  - "tutorial"
original_url: https://www.salaboy.com/2015/10/21/back-to-the-basics-2-testing-rules-with-arquillian-basics/
---

[As a follow up from my previous post](/2015/10/20/back-to-the-basics-getting-started-with-drools-6-3-0-final/), this tutorial will show how to add the correct [Arquillian](http://arquillian.org) dependencies to test our rules. This will serve as the basics to following tutorials where we will increase the complexity of our environment. By using Arquillian we will be able to test our rules to running in different environments such a Weld, in a Container that is started up by arquillian such as Wildfly or even into a remote running Wildfly Application Server. Check the following link for learning more about Arquillian's features: <http://arquillian.org/features/>. I will keep this post as short as possible and straight to the point to be able to move on with more advanced rules and projects.

## Adding Arquillian to our project

***(You can find the sources of this project here: <https://github.com/Salaboy/drools-workshop/>)***

In order to be able to use Arquillian in our project we need to add the correct dependencies to the ***pom.xml*** file. First of all we will add the Arquillian Bill of Materials (BOM) so all the things required for Arquillian to work are included with the correct versions. Then in the Dependencies section right after JUnit, we will add the arquillian core container: "arquillian-junit-container" plus our desired container implementation/provider, in this case we just want to use weld-se-embedded. In the future we might want to change this to Wildfly, Tomcat, Glassfish or any other supported container. Notice that the dependencyManagement section needs to be outside of the dependencies block.

```xml
...
 <dependencyManagement>
   <dependencies>
     <dependency>
       <groupId>org.jboss.arquillian</groupId>
       <artifactId>arquillian-bom</artifactId>
       <version>1.1.10.Final</version>
       <scope>import</scope>
       <type>pom</type>
     </dependency>
   </dependencies>
 </dependencyManagement>
...
 <dependencies>
...
  <dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>${junit.version}</version>
    <scope>test</scope>
  </dependency>
  <dependency>
    <groupId>org.jboss.arquillian.junit</groupId>
    <artifactId>arquillian-junit-container</artifactId>
    <scope>test</scope>
  </dependency>
  <dependency>
    <groupId>org.jboss.arquillian.container</groupId>
    <artifactId>arquillian-weld-se-embedded-1.1</artifactId>
    <version>1.0.0.CR9</version>
    <scope>test</scope>
  </dependency>
 </dependencies>
```

We are now ready to write our first test.

## Writing our first Arquillian test for our Rules

First of all we need to create a new JUnit Test, plain and simple. Then we will decorate our test with some Arquillian magic:

```java
package org.drools.workshop;
import javax.inject.Inject;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.kie.api.cdi.KSession;
import org.kie.api.runtime.KieSession;
/**
*

@author salaboy
*/

package org.drools.workshop;
import javax.inject.Inject;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.kie.api.cdi.KSession;
import org.kie.api.runtime.KieSession;
/**
*

@author salaboy
*/
<strong>@RunWith(Arquillian.class)</strong>
public class RulesJUnitTest {

public RulesJUnitTest() {
}
<strong>&nbsp; @Deployment</strong>
public static JavaArchive createDeployment() {
JavaArchive jar = ShrinkWrap.create(JavaArchive.class)
.addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml");
return jar;
}
<strong>&nbsp; @Inject</strong>
<strong>&nbsp; @KSession</strong>
<strong>&nbsp; private KieSession kSession;</strong>
@Test
public void hello() {
Assert.assertNotNull(kSession);
kSession.insert("Hi There From Test!");
Assert.assertEquals(1, kSession.fireAllRules());
}
}
```

No matter how your rules look like, now you can automate the tests, so if you make a change in the logic inside the rules, you can quickly identify what the problem is. The more tests that you have the more quickly you will find what the issue was.
