---
title: "jBPM5 Community Training – Module #5: Domain Specific Processes"
date: 2011-03-09 20:02:37 +0000
permalink: /2011/03/09/jbpm5-community-training--e2-80-93-module-5-domain-specific-processes/
description: "Hi there, I’m here again with a new module for the jBPM5 Community Training. Now it's time to take a look at the features provided by jBPM5 to support…"
tags:
  - "community training"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "jbpm training"
  - "jbpm5 training"
  - "jbug"
  - "PlugTree"
  - "BPMS"
  - "business"
  - "community"
  - "jBPM"
  - "jBPM5"
  - "management"
  - "process"
  - "rules"
  - "Salaboy"
  - "training"
original_url: https://www.salaboy.com/2011/03/09/jbpm5-community-training--e2-80-93-module-5-domain-specific-processes/
---

Hi there, I’m here again with a new module for the [jBPM5 Community Training](/2011/01/24/announcing-jbpm5-community-training/). Now it's time to take a look at the features provided by jBPM5 to support extension points that allow us to create our domain specific behaviors. This module covers the concepts required to extend and plug your own implementations with external systems. The notion of synchronous and asynchronous interactions and some recommendations about how to deal with them are also included. Check it out and please send me feedback or questions that you might have!

![Jbpm5 fix1](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2011/01/jbpm5-fix1.png "jBPM5")

Module #5: Domain Specific ProcessesThis modules covers two different aspects that we need to understand to customize our business processes to specific business situations. The first concept that we need to understand is the Service Task activity defined in the BPMN v2 specification. Once we understand the nature of external system interactions we need to understand the mechanisms implemented in jBPM5 to provide these extension points.

The following topics are covered in this module:

- Domain Specific Processes
  - Introduction
    - BPMN2 Service Tasks
    - Work Item Concept inside jBPM5
- Work Items characteristics
- Work Item Handlers
  - Implementing Custom Handlers
  - Controlling Flow Execution
- Examples

## Slides

<div class="video-embed" style="position:relative;padding-bottom:80%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allowfullscreen="" loading="lazy" src="https://www.slideshare.net/slideshow/embed_code/7207338" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="SlideShare presentation"></iframe></div>

Future revisions of this module will include:

- Speaker notes for each slide
- Video / Webinar
- Improved tests using jbpm-test-framework -> <https://github.com/Salaboy/JBPM5-Test-Framework> -> <https://github.com/Salaboy/JBPM5-Test-Framework/blob/master/jbpm-test-framework/src/test/java/org/jbpm/test/matchers/SimpleEmergencyProcessTestWithHelper.java>Feel free to suggest more material that helps you to understand the content of this module!

## Useful LinksCheck out the training source code example projects: <https://github.com/Salaboy/Drools_jBPM5-Training-Examples>

GIT on IntelliJ -> <http://wiki.jetbrains.net/intellij/Using_Git_Locally>

GIT on Netbeans -> <http://netbeans.org/kb/docs/ide/git.html?intcmp=925655>

## FeedbackYou can take a look at the [“Contact Me”](/contactme) section for more information about this training course, suggestions, questions, feature requests, etc. Don’t be shy, your feedback helps to improve the quality of the material and to discover the important topics that needs to be addresses to reduce the learning hype.

PS: this module will be also published in: <http://ilesteban.wordpress.com> -> Thanks for the Support!

## Special ThanksSpecial thanks to [www.plugtree.com](http://www.plugtree.com/) to support the jBPM5 community.

Special thanks to Alejandro “ivcoti” Ramirez for the jBPM5 Logo!
