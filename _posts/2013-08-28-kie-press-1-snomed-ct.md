---
title: "KIE Press #1: SNOMED CT Ontology Quality Assurance"
date: 2013-08-28 08:48:00 +0000
permalink: /2013/08/28/kie-press-1-snomed-ct/
description: "Welcome to the first article of KIE (Knowledge Is Everything) Press. Under the KIE Press title we will be publishing a set of articles and blog post to…"
tags:
  - "Drools"
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "JBoss JBPM"
  - "community"
  - "jBPM"
  - "knowledge"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2013/08/28/kie-press-1-snomed-ct/
---

Welcome to the first article of KIE (Knowledge Is Everything) Press. Under the KIE Press title we will be publishing  a set of articles and blog post to share with the community where the Drools, jBPM, Opta Planner and other related projects are being used by our community members.

In this situation we wanted to share a really interesting use case of Drools in the Health Care Industry. The International Health Terminology Standards Development Organization (IHTSDO - [www.ihtsdo.org](http://www.ihtsdo.org)) is in charge of maintain the SNOMED CT which is an ontology composed of 400,000 concepts and uses Description Logic based definitions. SNOMED CT is a standard for representing clinical knowledge in electronic medical records, widely adopted as a national standard in many countries (see <http://www.ihtsdo.org/members/>).

A new version of SNOMED CT is published every 6 month, in a time oriented, relational database structure. The IHTSDO manages an authoring team that makes any necessary changes in the ontology for each release, adding new concepts, descriptions, relationships, etc. It’s important to notice that every change must be coherent and a set of checks must be done in order to guarantee that the editor is not leaving the ontology in an inconsistent state. That’s where Drools kicks in.

The IHTSDO is using Drools to do real time validation of SNOMED CT. These validations are based on rules which are defined using Guvnor and exposed via the Knowledge Repository. These validations operates on the changes that are being introduced in the authoring process before saving the changes. If the validation process succeed the changes are applied, if not the user is notified.

The IHTSDO has developed the IHTSDO Terminology Workbench (terminology IDE), which is the tool used by the organization members to update and maintain the SNOMED ontology.  This tool has an integration with the Drools based QA System, so it can submit content for a real time check using the rules stored in Guvnor. The IHTSDO Workbench is the first example of an integration with the Drools Knowledge Bases and models represented in the Guvnor server, and potentially this can be extended to any other tool, as SNOMED CT content is represented in a generic way in the knowledge repository, independent of the tooling. The Drools Knowledge Bases are versioned in Maven, so they are readily accessible as dependencies for any tool development environment.

The IHTSDO is also running checkings on the full ontology in batch processes everyday, which guarantees that the changes introduced by one person doesn’t conflict with the changes introduced by another. In this case the batch process operates on the full ontology that is 400,000 concepts and 1.5 million relationships between them.

## The IHTSDO Workbench integration

The Workbench is a desktop application (Swing), which is downloaded by each of the organization members with the rights of updating the ontology. The application allows the users to inspect the ontology, make queries to it and propose changes.

![KIE Press #1: SNOMED CT Ontology Quality Assurance](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/_ce-bbayolat8dedo7trquwrwucq148fgn7huyk73iz3j5knokfdstk7brr7vsk9snn3zrgttveuafegkj8_paofb_xzymrgrziixkmuk7i5-mqoje9qi9m27a.png)

The previous figure shows how the tool notifies the user about the validation errors found by the execution of the rules that verify the changes consistency. Notice that the validation in this case failed because there are two Fully Specified Names for the same concept, and only one active FSN is allowed at a given time. The Desktop application runs the rules locally, but they are defined and compiled inside Guvnor and its Knowledge Repository.

![KIE Press #1: SNOMED CT Ontology Quality Assurance](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/btx0cqg6akvtjew-r7jysbbkqmqmuqgjga9z_0ubhbegz7satrcxhbmvhdhvfnpinjxz4ci4f2ifgjjr8asreuncyhkp93drprfv5_tcxkpotjbeaj89cy8toa.png)

Here we can see a rule that was defined using the Business Rule Editor, inside Guvnor, which is also used to compile the Rules Packages and provide the Desktop clients the rules to perform the validations.

Finally, because the IHTSDO requires to release the ontology every 6 months, a report is generated based on the daily batch validations executed on the full ontology. This report is verified by all the authors and is used to measure the quality of the released ontology.

![KIE Press #1: SNOMED CT Ontology Quality Assurance](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/zmn3zlvjvi807l727aglgwb216pnubmiri3tnfzj4xm_jm1kthecb_qde9xzkystso2hvurbyw2j0sdwchbrtitttkinrulctf2mr6_vw9exs7xygkoi7zuo-w.png)

This Drools integration has been in production for 2 years now, and it has provided great benefits and flexibility, the check of one concept, including model conversion is around 20 milliseconds for a random check, and it can be as low as 3 milliseconds when is run in batch over a collection iterated in a natural order, reducing data access delays.

One of the main benefits has been the simplified maintenance of the business rules base compared to the previous environment, that was based on hard coded Java if-then conditions. Drools also allows for thinking on how to write each of the rules independently, leaving the complexity of deciding how the rules run to the rules engine. And also has provided easy updates of the knowledge bases without the need of updating actual software libraries or the version of the application itself, when a rules managed in the IHTSDO updates a rule, the author only needs to run a rules "refresh" function in the workbench and the latest updates are immediately effective.

## Join KIE Press

If you want to share your own implementations and use cases of Drools, jBPM, Opta Planner or other related projects feel free to contact us, and we can help you to share your experiences with the community. If you don’t have time to write an article about what you are doing, we can also help you out on that. I’ve wrote this article because I personally know one of the maintainers of the tool (Alejandro Lopez Osornio, working for termMed), but if you are interested in sharing your experiences here, we can do a Google Hangout to define how to share your story.

If your use case is confidential, you can a more generic version of what you are doing, the problems that you found or more generic architectural patterns that you have used in your implementations.

Some of the benefits of sharing what you are doing with the KIE community are:

Keep everyone else informed about what you are doing, share experiences and improve your implementations based on the community feedback

Save research time in your implementations by staying in contact with people that is implementing similar tools

Most of the time, similar solutions can be implemented for different industries

Serve as inspirations for new implementations

- Build confidence on the tools provided by the projects and be part of the community members that are actively creating tools using these technologies
