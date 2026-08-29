---
title: "Knative OSS Weekly #36"
date: 2022-04-23 10:02:17 +0000
permalink: /2022/04/23/knative-oss-weekly-36/
description: "Another very productive week went by and the Knative community keeps rocking as always. It is kinda amazing how every Friday afternoon the feeling of…"
tags:
  - "CD"
  - "CDF"
  - "cdfoundation"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "English"
  - "event"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "spring cloud"
  - "spring-native"
  - "tutorial"
  - "cloudnative"
  - "docker"
  - "eventing"
  - "functions"
  - "knative"
original_url: https://www.salaboy.com/2022/04/23/knative-oss-weekly-36/
---

Another very productive week went by and the Knative community keeps rocking as always. It is kinda amazing how every Friday afternoon the feeling of looking back at the week and writing about the initiatives where I am directly involved makes me realize all the amazing things that are going on.

I am expecting from now on to be focused on preparing for DevoxxUK, KnativeCon, CDEventsCon and KubeCon. Feel free to reach out if you wanna get involved with some of these projects/demos, I think it is a pretty fun way to learn new technologies.

### Knative Eventing Implementation

This week I had the pleasure to had a session with [Iliia Khaprov](https://github.com/ikvmw) from the Knative Eventing RabbitMQ team about a [PR that adds metrics to the Knative Eventing RabbitMQ Broker](https://github.com/knative-sandbox/eventing-rabbitmq/pull/582#pullrequestreview-950184202) implementation which spawned very interesting conversations about how different Broker implementations can share some common logic and currently that is not the case, mostly because sharing code and creating shared libraries is hard and takes a lot of time. It is also interesting to see how a topic like metrics impacts multiple projects for example the CloudEvents Go SDK. It does feel like we can grow as a community by sharing lessons learned and also influence other communities by providing concrete use cases about how in this case Knative Eventing is using the CloudEvents SDK.

This same week I had a very interesting talk about the Knative Eveneting Kafka Broker & Channel implementations and how they have evolved over time. Here when a different tech stack is used to build these implementations, shared libraries will not help, but clear documentation on the internals of the component will.

Related, but more focused on the documentation I've created [the following issue](https://github.com/knative/eventing/issues/6345) to see if we can try to align documentation pages and repositories from different implementations to follow the same structure, so users comparing options can get the information that they need.

### Knative Functions

On the Knative Functions side, there is a lot going on. I've been personally focused on moving forward with a demo using functions written in different languages with Redis as the persistent storage for the state.

Game Frontend project: <https://github.com/salaboy/fmtok8s-game-frontend>

Documentation (Draft): <https://github.com/salaboy/from-monolith-to-k8s/tree/main/game>

It is kinda fun when you try to write a demo that uses WebSockets or any kind of bidirectional connection with a client-side application how things get messy. Such a simple requirement makes every hello world example complicated, if you take a managed Kubernetes running on a Cloud Provider you quickly realize that to make an example like this work you really need to know what you are doing.

[![Game architecture](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2022/04/game-architecture-2.png)](/content/images/2022/04/game-architecture-2.png)

For the example, we will be using RSocket over WebSockets, the Spring Boot integration around these technologies is amazing and it goes way beyond opening a WebSocket and sending data manually. It really feels like using @RequestMappings with routes and @PathVariables but for Websockets. The support for sending CloudEvents via Websockets is pretty solid too. But, once again, when you sort out the server-side, you need to sort the client-side, in this case, a React application. Luckily, creating an RSocket over Websockets client on Javascript is pretty straightforward:

rsocketClient = new RSocketClient({ serializers: { data: JsonSerializer, metadata: IdentitySerializer }, setup: { keepAlive: 60000, lifetime: 180000, dataMimeType: 'application/json', metadataMimeType: 'message/x.rsocket.routing.v0', }, transport: new RSocketWebSocketClient({ url: 'ws://'+externalIP+':9000' }), }); // Open an RSocket connection to the server rsocketClient.connect().subscribe({ onComplete: socket => { socket .requestStream({ metadata: route('infinite-stream') }).subscribe({ onComplete: () => console.log('complete'), onError: error => { console.log("Connection has been closed due to: " + error); }, onNext: payload => { console.log(payload); setMessage(message + "-> " + JSON.stringify(payload)); }, onSubscribe: subscription => { subscription.request(1000000); }, }); }, onError: error => { console.log("RSocket connection refused due to: " + error); }, onSubscribe: cancel => { /* call cancel() to abort */ }

The initialization is pretty much what you would expect from a WebSocket library, but notice that now we subscribe to "routes"

.requestStream({ metadata: route('infinite-stream') })

These routes allow us to use path-based routing which can include variables like `sessionIds` or parameters as if we were using HTTP requests. This highly simplifies the client-side and the server-side logic and saves a lot of time by avoiding us to create these mechanisms for our applications.

One thing that is still open for investigation on my side is if I can make RSocket share the same Netty port as the Netty port open for HTTP. The main reason to try to reuse the same port is just to make it simple to expose outside the Kubernetes Cluster. Right now, RSocket is starting a different port and that is basically stopping me to use a Knative Service. I have the feeling that RSocket needs a separate port for its own server as this might be important to be able to scale this independently from the HTTP server.

In order to work around the two ports issue with Knative Serving, I've switched to using a plain Kubernetes Service + Deployment only for the FrontEnd Service. Because my workloads are running on GKE (Google Cloud Platform managed Kubernetes Engines) I had to make two non-trivial decisions. Maybe non-trivial because I am not building frontends most of the time, and also because I've encountered similar situations in the past, I quickly arrived at the conclusion that using GCE (Google Cloud managed Ingress Controller)  wouldn't work, as the RSocket Websocket connection needs to go straight to the Service or the Ingress Controller needs to support Websockets. For simplicity, I've just used `serviceType: Loadbalancer` it for the `game-frontend` service, this creates a Loadbalancer with a public IP, hence the client-side code can access directly the RSocket exposed port (check `externalIP` variable in the code above).

Now, how to get that `externalIP` propagated to the client-side code, is a story for another day :)

One more thing that I needed for Google Cloud to avoid dropping connections is a `BackendConfig` resource:

apiVersion: cloud.google.com/v1beta1 kind: BackendConfig metadata: name: frontend-backendconfig spec: timeoutSec: 1800 connectionDraining: drainingTimeoutSec: 1800

See you all next week with another community and personal update!
