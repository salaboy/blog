---
title: "Knative OSS Diaries – week #19"
date: 2021-11-13 13:41:05 +0000
permalink: /2021/11/13/knative-oss-diaries-week-19/
description: "This week was all about func, the more I work on the project the more I can see the the potential."
tags:
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "docker"
  - "English"
  - "eventing"
  - "func"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "spring cloud"
  - "cloudnative"
  - "functions"
  - "knative"
  - "spring"
original_url: https://www.salaboy.com/2021/11/13/knative-oss-diaries-week-19/
---

This week was all about `func`, the more I work on the project the more I can see the the potential. This week was all about making sure that Spring Boot users can have a decent experience building SpringNative functions. I spent some time researching and reaching out to the [Spring Cloud Functions](https://spring.io/projects/spring-cloud-function) team to see if some uses cases were supported.

Another big milestone for the Continuous Delivery Book for Kubernetes happened this week. [Chapter 4: Multi-Cloud Infrastructure](http://mng.bz/jjKP) which covers [Crossplane](http://crossplane.io) entered the [MEAP (Early Access) program](http://mng.bz/jjKP). If you are part of the Program you can have access to the draft of the chapter. As usual, feedback is more than welcome! 🥳

Let's dig deeper on some of the topics that I've been working this week.

### `func` => Spring Cloud Functions + SpringNative + Buildpacks

While none of these things are new, I believe the combination and providing an experience on top of these tools is a big step forward to be able to simplify how Developers build, distribute and deploy function based workloads.

`func` was already supporting Spring Boot functions, but I wanted to make sure that [SpringNative](https://docs.spring.io/spring-native/docs/current/reference/htmlsingle/) using GraalVM was also provided to have natively compiled images that have under a second start up. While this might look as a small gain (from 3 seconds startup with Spring Boot to 0.06 seconds with SpringNative) the mechanisms to produce a GraalVM native image are still under active development, this means that there is not much alignment or defacto standard.

#### Builders

This is exactly where [buildpacks](https://buildpacks.io/) comes really handy. The goal here is to have a buildpack that allows us to switch from buildinga JVM based container to a GraalVM based container by just setting a flag.

Currently there are two Java Based frameworks supported by `func` which can be compiled using GraalVM, and these are Quarkus (from Red Hat) and Spring Native from the Spring Community. It will be ideal to share the same buildpack for building these two kind of projects. Fortunately we have [Packeto Builders](https://paketo.io/docs/concepts/builders/) which provides this functionality out of the box. Looking at the Quarkus templates in `func` they have their [own specialized buildpacks](https://github.com/knative-sandbox/kn-plugin-func/blob/main/templates/quarkus/manifest.yaml#L4) for JVM based and Native images, which of course, don't work with SpringNative. At the end of the day a tool like Maven or Graddle will generate a Jar file that needs to be packaged as a container or compiled using GraalVM, where a binary is the end result that end up inside a container.

So I've started the journey to unify these builders using the Packeto Builder (Tiny) for Java and Go. Hence I've submitted the following PRs with some ground work that is needed to get this done:

- (PR) Support BuildEnvs inside `manifest.yaml` file: <https://github.com/knative-sandbox/kn-plugin-func/pull/646> This PR is required to be able to se the flag that allows you to define if we want to produce a JVM based continaer or a GraalVM one. By setting up a single Environment Variable we can then choose for each function what is the builder that we want to use.
- (PR) SpringNative by default when using Spring Boot: <https://github.com/knative-sandbox/kn-plugin-func/pull/649> I wanted to make sure that developers building functions have SpringNative at the tip of their fingers. Building GraalVM based containers shouldn't be a pain.
- (Issue) [Packeto Buildpack](https://paketo.io/) should support Quarkus: <https://github.com/paketo-buildpacks/native-image/issues/109> If we want to standardize on the Packeto Buildpack we need to support Quarkus and other frameworks that look at different metadata and might produce more than a single artifact. I will be looking at this issue with a new friend that I made this week from the Quarkus and Buildpacks community. 🙏

### Coding Functions

If you have build functions before you know that sooner or later the idea of having a Function per container is not always great. If you create a Spring Boot based template with `func` you get [Spring Cloud Functions](https://spring.io/projects/spring-cloud-function) built-in.

You can find the source code of this example here: <https://github.com/salaboy/dad-vibes-functions> I encourage you to clone it and run the functions locally on in your Kubernetes Clusters.

I've used `func` templates to create the project, and I've tried to modify the template as little as possible to just implement the functions for this example. You can use the following command to create a project like this one:

func create -l springboot -t cloudevents

Spring Cloud Functions allows us to define functions by using Spring Beans with simple method signatures like the following:

```
public Function<Message<Input>, Output> addTODO(CloudEventHeaderEnricher enricher)
public Function<Message<Input>, Output> addMeetingReminder(CloudEventHeaderEnricher enricher)
public Function<Message<Input>, Output> dysfunction(CloudEventHeaderEnricher enricher)
```

These three functions are [CloudEvents](http://cloudevents.io) ready and take a CloudEvent as the input and produce a CloudEvent as output.

Because I wanted to show the nature of short-lived functions, two of these functions keeps some data in memory. This data is short-lived because it relies on the container to be running. If the function is downscaled/stopped all data will be lost.

These two functions (*addTODO* and *AddMeetingReminder*) work in a similar way, but what I wanted to highlight is that multiple functions can live inside the same project and we can use Spring Cloud Functions CloudEvent filters to route events to different functions. We are coupling the lifecycle of these functions together in the same project, which means that they will share the same versioning reducing the flexibility of releasing them independently, but real life implementations have shown us that this coupling is fine for functions that are logically related.

The third function (dysfunction) is just a joke from the .com era 🤘, but it helps us to test the CloudEvent Type based routing.

If you want to run the project locally, you only need Maven, as you will need to compile and package the project as a Spring Boot Jar file.

To start the project you can run:

mvn spring-boot:run

In my laptop this usually takes 1.5 seconds: Started SpringCloudEventsApplication in 1.256 seconds (JVM running for 1.581)

Once the project is up, Spring Boot exposes the functions for us to use in `localhost:8080`

We can start sending CloudEvents to our functions to see how they work. You can export `URL` to be `localhost:8080` (just run: `export URL=localhost:8080`)

curl -v "$URL/" \ -H "Content-Type:application/json" \ -H "Ce-Id:1" \ -H "Ce-Subject:AddMeetingReminder" \ -H "Ce-Source:curl" \  **-H "Ce-Type:addMeetingReminder" \**  -H "Ce-Specversion:1.0" \ -d "{\"input\": \"9:00 am - This meeting could have been an email.\"}\""

Here the Ce-Type HTTP Header is going to be used by Spring Cloud Functions to route this CloudEvent to the [addMeetingReminder](https://github.com/salaboy/dad-vibes-functions/blob/main/src/main/java/functions/SpringCloudEventsApplication.java#L57) function. The output from this function should be all the meeting reminders that we have been collecting from similar CloudEvents. Of course, if we just started the function, the output will be just this last meeting:

{"input":"9:00 am - This meeting could have been an email.","operation":"AddMeetingReminder-ACK","output":"**[9:00 am - This meeting could have been an email.]**","error":null}

Send more CloudEvents changing the **input**, and see how the output keeps adding on reminders.

Now if you want to add a TODO item, the only thing that you need to do is to change the **Ce-Type** attribute.

curl -v "$URL/" \ -H "Content-Type:application/json" \ -H "Ce-Id:1" \ -H "Ce-Subject:AddTODO" \ -H "Ce-Source:curl" \  **-H "Ce-Type:addTODO" \**  -H "Ce-Specversion:1.0" \  **-d "{\"input\": \"Buy some medicine\"}\""**

This CloudEvent will be routed to the [addTODO](https://github.com/salaboy/dad-vibes-functions/blob/main/src/main/java/functions/SpringCloudEventsApplication.java#L37) function as expected. This function also keeps data in memory, and you should observe that if you send several TODOs the output will keep adding the items into an array. After several calls you should see something like this:

{"input":"Order some LPs","operation":"AddTODO-ACK",**"output":"[Buy some medicine, Buy some groceries, Order some LPs]"**,"error":null}

You can keep improving these functions until you are happy with their functionality, but running them locally with Spring Boot will not take us too far with delivering business value, so let's look at how to run this in a real cluster using `func` and Knative.

### Building your Functions

The next step is to build these functions, as I mentioned at the beginning of the post, you can build this project using GraalVM native images or JVM based container images. Because I've created the project using `func` templates a `func.yaml` file is created which contain information about the builders that will be used to build and deploy the project.

If you have `func` installed and you have cloned the project you can run the following command to build the project:

salaboy> **func build -v** A registry for Function images is required. For example, 'docker.io/tigerteam'. **? Registry for Function images:** salaboy **Note: building a Function the first time will take longer than subsequent builds**

This is going to use Buildpacks to, by default, build our functions project using GraalVM. The registry question is basically asking you where do you want to store the produced container image. In this case, "salaboy" is my DockerHub username and the registry where I want `func` to push the container image at the end of the process. This step is needed because you will probably want to run this container in a remote cluster that needs to be able to access and fetch this container image. You probably need to run `docker login` before running `func build -v`, so func has the correct credentials to push the image.

On my laptop, this takes quite a while (8 minutes the first build) , as the previous Note mention, the first time that the function is built using buildpacks all the maven dependencies are going to be downloaded and the native compilation takes between 2 or 3 minutes. The second build took me around 2 minutes, as all Maven dependencies and builder images were being cached by the buildpacks.

At the end you should see something like this: 🙌 Function image built: docker.io/salaboy/dad-vibes-functions:latest

If you want to build a JVM Based container (instead of a GraalVM native image), maybe because you are experimenting and you want to have faster feedback loops you can edit the `func.yaml` and turn off the native build by changing the `buildEnvs` as follows: buildEnvs: - name: BP_NATIVE_IMAGE value: "false"

The JVM Based compilation takes less than 1 minute in my environment.

If you haven't notice, no Dockerfile was written for this example, in other words, one less thing to worry about. Thanks buildpacks! 🥳

### Deploying your functions to Kubernetes

If you have a Kubernetes Cluster, to leverage `func` you need to have Knative Installed. I recommend you to check out the getting started and installation guides in the [Knative site,](https://knative.dev/docs/install/) because they are awesome. Once you have Knative installed in the cluster you can use `func deploy -v` to run the functions that we just built in the previous section, you should see something like this:

Deploying function to the cluster Waiting for Knative Service to become ready Function deployed at URL: http://dad-vibes-functions.default.x.x.x.x.sslip.io

In my laptop `func deploy` takes around 10 seconds max the first time that I run it. And here you go, you have the function deployed in a Kubernetes Cluster using Knative and the URL ready to start using it. Now you can export once again the URL env variable to use the remote one:

export URL=http://dad-vibes-functions.default.x.x.x.x.sslip.io

And then just send a CloudEvent:

curl -v "$URL/" \ -H "Content-Type:application/json" \ -H "Ce-Id:1" \ -H "Ce-Subject:AddTODO" \ -H "Ce-Source:curl" \ **-H "Ce-Type:addTODO" \** -H "Ce-Specversion:1.0" \   **-d "{\"input\": \"Buy some medicine\"}\""**

Now if you check the logs (`kubectl logs -f dad-vibes-functions-00001-deployment-XXXX user-container`) of the pod that is running the function (which was created by a Knative Service) you will see that the startup time of the application is way faster:

2021-11-13 13:17:01.920  INFO 1 --- [           main] functions.SpringCloudEventsApplication   : Started **SpringCloudEventsApplication in 0.094 seconds (JVM running for 0.096)**

This super fast startup time allows us to be good Cloud Native citizens and allows Knative to downscale the function while it is not being used. When a new request arrive, it will only take 0.096 seconds to boot and answer that request.

If you don't send requests to the function, Knative by default will downscale it (unschedule the container) after 90 seconds. At that point your memory is gone, so TODOs and MeetingReminders will be gone, proving you a valuable lesson my youngster friends, **To be a nice Seververless citizen you need to be Stateless** 🤐. For real life applications, these functions will be storing data in a Bucket or a Database.

**Note:** not a single YAML file was written to get this functions up and running inside a Kubernetes Cluster 🤓

If you are interested in `func` or the projects that I've mentioned in this blog post, get in touch. There is a lot of work to do to make sure that all these projects work together, so we can be more efficient delivering awesome features that brings value to our orgs. As always, stay tuned, more examples are coming!
