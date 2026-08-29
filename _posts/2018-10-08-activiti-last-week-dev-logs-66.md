---
title: "Activiti: Last week Dev Logs #66"
date: 2018-10-08 08:12:12 +0000
permalink: /2018/10/08/activiti-last-week-dev-logs-66/
description: "Last week we manage to import to, our new CI/CD pipelines in Jenkins X, our Cloud Repositories."
tags:
  - "activiti7"
  - "BPM"
  - "bpmn2"
  - "cloud"
  - "docker"
  - "engine"
  - "English"
  - "Java"
  - "Jenkins X"
  - "knowledge engineering"
  - "kubernetes"
  - "process"
  - "roadmap"
  - "spring cloud"
  - "workflow"
  - "activiti"
  - "activiti cloud"
  - "bpmn"
  - "cloud native"
  - "community"
  - "microservices"
  - "open source"
  - "transparency"
  - "weekly"
original_url: https://www.salaboy.com/2018/10/08/activiti-last-week-dev-logs-66/
---

Last week we manage to import to, our new CI/CD pipelines in [Jenkins X](http://jenkinsx.io), our Cloud Repositories. Now each repository is being build, checked and released by these pipelines. The resultant artifacts are published to a public [Alfresco Nexus Activiti Releases repository](https://artifacts.alfresco.com/nexus/content/repositories/activiti-releases/org/activiti/). We are currently testing our [Scripts](http://github.com/activiti/activiti-scripts/) for milestone releases (labeled releases once a month) which will go to [Maven Central](http://search.maven.org). I am extremely happy with the results, this will improve the reliability of each service and allow us to evolve them independently. We are now full speed trying to finalize the last bits of Beta2, which should be available in the next couple of weeks.

[@balsarori](https://github.com/balsarori) Working on process variable extensions [#2049](https://github.com/Activiti/Activiti/issues/2049)

[@lucianoprea](https://github.com/https://github.com/lucianoprea) worked on improving the consistency of update operations across core services.

[@daisuke-yoshimoto](https://github.com/daisuke-yoshimoto) worked on reviewing core engine reported issues and updating the MongoDB audit implementation for Beta1/Beta2 conformance.

[@igdianov](https://github.com/igdianov) worked on jx updatebot extensions to facilitate version convergence in builds

[@constantin-ciobotaru](https://github.com/constantin-ciobotaru) worked for new zip structure for exported applications from the activiti modeler application

[@miguelruizdev](https://github.com/miguelruizdev) started experimenting with the Reactive stack for our core services.

[@ryandawsonuk](https://github.com/ryandawsonuk) modified the scripts in activiti-scripts to support replacing fixed versions from Jenkins-X. Ran the scripts to perform a mock release on the non-cloud repositories.

[@erdemedeiros](https://github.com/erdemedeiros) kept working with @ryandawsonuk and @salaboy to get our CI/CD pipelines working. We went from automatic merge to manual merge for generated PRs in order to get a better control on versions changes.

[@salaboy](http://twitter.com/salaboy) worked on CI/CD configurations, testing and releasing different artifacts via our new Pipelines. A blog post about our experience on migrating from a mono repo to distributed services and CI/CD pipelines is on the making and you can check the draft here: <https://docs.google.com/document/d/1yJKKJISVEs27OrEUdiS-sIQsLX5jhpGF1vwEgKaPZgE/edit?usp=sharing>

Get in touch if you want to contribute: <https://gitter.im/Activiti/Activiti7>

We are looking forward to mentor people on the technologies that we are using to submit their first Pull Request ;)
