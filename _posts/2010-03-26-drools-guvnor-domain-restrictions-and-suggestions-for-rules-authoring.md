---
title: "Drools Guvnor: Domain Restrictions and Suggestions for Rules Authoring"
date: 2010-03-26 14:17:43 +0000
permalink: /2010/03/26/drools-guvnor-domain-restrictions-and-suggestions-for-rules-authoring/
description: "In this post I would like to introduce the current effort that two good friends are doing inside Drools Guvnor."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "Drools"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/03/26/drools-guvnor-domain-restrictions-and-suggestions-for-rules-authoring/
---

In this post I would like to introduce the current effort that two good friends are doing inside Drools Guvnor. [Esteban](http://www.twitter.com/ilesteban) and [Bauna](http://twitter.com/baunax) are both working to implement Domain Restrictions and Suggestion mechanism inside the Drools Guvnor rule authoring widget. The main idea behind this new functionality is to be able to add restrictions based on the Object Model that we use to construct our business rules.

## Main Goal

The main goal of this new feature inside Drools Guvnor is to help and guide the business users to author rules about a domain that they understand. In other words, if we have different business users with different roles, we can assist them in different ways restricting and suggesting values related specifically with the information related with that role or to that business user context.

In the following sections I will try to describe our (Plug Tree) roadmap and vision towards achieving this goal.

## Filtering Contextual Information

The first thing that we need in order to not confuse different users in a big business domain is to filter the information that we present to each one of them. We need to restrict the information based on the business perspective that each role that is able to create/express knowledge for a specific domain view and use. In this case, filtering or restricting information to the user is not a bad thing, it just helps the user to be focused only in the business domain that he/she understand.

This filtering will be achieved using a meta-model that needs to be created for each specific role. This meta-model will include all the facts that are relevant of a specific role and field restrictions that can be applied for a specific business case.

Our current goal in this field is letting the users inside Guvnor to create this meta-model and then be able to select between different **Working Sets** (working set == meta model for restrictions and suggestions) when a rule for a specific domain is authored.

One example of this, could be inside the Emergency Service scenario, the users that create rules for equip an ambulance probably will be a different business user that the ones that decide how to calculate the best hospital for a specific situation. In such cases, where our people that can define a set of rules knows very different parts of the same domain, we need a way to divide in different perspectives the information that each of them can handle.

## Data suggestion and validation

It would be nice also have assistance mechanisms to author rules, that helps the user based on contextual information. Some of the features that I have in mind are:

- Dictionary service based on contextual information of the business domain: the users can query data dictionaries based on the rules that he/she is authoring. This will help the user to know values that can be used in the rules restrictions that are not part of the business model. For plugging these dictionaries inside the guided editors we need a way to register and lookup these dictionaries.
- Validation and verification mechanisms to assist the rule authoring and verify the end result. This is very important to give feedback to the user about the rule that he/she is authoring. Online and post verifications of the rule structure and values that they select are a way to confirm that the business user is creating well formed and semantically correct based on each user role (or the selected working set, to use the current Guvnor concepts).
- Contextual Help Service, to assist the user in the middle of the rule creation process. We can create a mechanism to detect the right piece of documentation needed in the authoring process. This documentation pieces will probably become a set of a separate knowledge base about how to author rules, and can be populated by experienced users, in a wiki fashion way. (Updated!)
- I will add more thought on this soon.

## Rules Templates and Frozen Areas (Updated!)

Sometimes when you have inexperienced users that doesn't have enough feedback to author rules you will want to help them using what we call Frozen Areas. With Frozen Areas you will be able to define certain sections inside the guided editor that will be frozen. This allows us to author or parametrize only the allowed areas. This also allow to create some Decision Table like structures to also support this widely used paradigm.

This kind of template mechanism also contribute to our Knowledge Base of assets about how to build rules for a specific domain. We can provide a palette of rules templates that helps the user to start with something already constructed instead of a blank rule. This will increase the speed of rule authoring when we have too many similar rules in our domain. Where normally the users just need to parametrize them when a new situation is added or modified.

## Don't forget the Business Processes and Events (Updated!)

It would be nice to create a guided editor that includes mechanisms to help the user to relate the rules authoring with business processes and event definitions. This guided editors needs to be designed to support Knowledge Authoring, that will let us continue adding new ways of expressing knowledge without the need of modifying the core mechanism used inside the widgets.

## Smart GUI

This is probably the most difficult thing for an open source project. We are trying to figure out how to give users the best rule authoring experience out there. For that, we need to define a new way to express rules. We already have all the backing mechanisms to support all the necessary things related with the rule language, model restrictions and suggestions. But the real problem is that the current guided editors were not designed to support all these features. We are trying to decouple all the widget logic to provide all the internal mechanisms to be able to create different front ends in different technologies. (These front ends are not part of the Drools Project roadmap). So, a lot of questions still remains in this area.  We have some ideas that we will share soon. Feel free to express your suggestion or your experience in rules  authoring to help us to decide which are the best steps to follow.

## In Brief

The points discussed here are part of our current effort to make Guvnor, or the widgets inside it clever enough to help the users to author rules, not to stop them with technical issues. We are open to new ideas and high level, less technical rules representations, so ideas from the community will be always a good start point for discussions.
