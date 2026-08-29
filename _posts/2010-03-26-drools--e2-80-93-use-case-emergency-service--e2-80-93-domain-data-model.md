---
title: "Drools – Use Case: Emergency Service – Domain Data Model"
date: 2010-03-26 18:42:09 +0000
permalink: /2010/03/26/drools--e2-80-93-use-case-emergency-service--e2-80-93-domain-data-model/
description: "This post will describe the data model used in the Emergency Service scenario (previously described in Emegency Service Scenario Definition)."
tags:
  - "English"
  - "Java"
  - "JBoss"
  - "JBoss Drools"
  - "PlugTree"
  - "business"
  - "Drools"
  - "process"
  - "rules"
  - "Salaboy"
original_url: https://www.salaboy.com/2010/03/26/drools--e2-80-93-use-case-emergency-service--e2-80-93-domain-data-model/
---

This post will describe the data model used in the Emergency Service scenario (previously described in [Emegency Service Scenario Definition](/2010/03/19/drools-use-case-emergency-service/)). It will be also important to understand that this model will be highly related with the business process described in [Emergency Service Business Process Implementation](/2010/03/23/drools-%E2%80%93-use-case-emergency-service-%E2%80%93-business-process-implementation-part-2/). We will just analyze the important information stored inside the model to understand how in the future we can use this information to make inferences about it.

[Please read  the disclaimer  first](/disclaimer/)

## Required information

As I've already mention in [the first post](/2010/03/19/drools-use-case-emergency-service/) we have a set of participants in our Emergency Service scenario. We will start using this list to define the important information that will be needed in order to manage each of the participants involved. The first piece of information that we create/receive is the one about the Emergency Call.

We want to store, for each Call, the following information:

- Emergency Location,
- Emergency Type,
- Approximate time when the emergency happened,
- Patient Information (approx. age, gender, etc)
- Exact time when the call was made

All this information will be stored in two POJOs (Plain Old Java Object) called Call and Emergency. The Emergency class will contain the location, the type, the patient info and a reference to the Call class. The Call class will contain the exact time when the call happened and probably a voice recording of the entire call.

Once we get all the information from the Emergency we need to create an Ambulance object that will describe all the information that we need to maintain about each Ambulance. Remember that based on the Emergency Type, we need to "configure" each Ambulance differently. The Ambulance class will contain the following information: Ambulance ID, the medic on board and a list of features/kits needed for that specific Emergency. All this information is needed to dispatch an ambulance to the emergency location. When we have the ambulance ready to dispatch, we need to link this specific ambulance with the Emergency  (Ambulance field in the Emergency class).

Once we dispatch the Ambulance to the Emergency Location, we will start receiving some important events sent from the ambulance to the central offices. These events will be modeled using different classes, because each event will carry different information. **PatientPickUpEvent**, **PatientAtTheHospitalEvent**, **PatientVitalSignEvent**, **HospitalReportEvent**, etc will be events/notifications that the central offices will be receive as they monitor each ambulance.

When the central offices receive the **PatientPickUpEvent**, they must update the information they already have on the Emergency and Patient. Once we have an updated status of the situation, a calculation will be triggered to select the best Hospital. In other words, we need to have a predefined set of Hospitals to be able to decide which is best for each Emergency. These calculations will be done by rules that will use all the information available to rank the Hospitals that we know. The Hospital class will contain information about the specific kind of injuries that the hospital is ready to treat, the location of the hospital and the number of available beds. The number of available beds will change based on online notifications sent by the Hospitals to the central offices.

## Model in action

You can see this model in action inside the rules that we will create. All the rules that we will define will be based on the Concepts described in this model, so we need to know all the model relationships in order to know the inferences that we can do with it.

The following class diagram shows us how our model looks like:

![Classdiagramsemergencyservice](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2010/03/classdiagramsemergencyservice.png "ClassDiagramsEmergencyService")

We will also see instances of this model inside and flowing throughout the business process. Almost all the business process variables will be domain specific information.

## Wrapping Up

Once we get the model done, we can start writing rules. Prepare yourself for the incredible world of Business Rules! We will use this model everywhere in our application. That's why I choose to create a new maven module to make it easy to change and maintain. In a couple of days I will be uploading a alpha version of the code to the google repos.

See you all in the next post!
