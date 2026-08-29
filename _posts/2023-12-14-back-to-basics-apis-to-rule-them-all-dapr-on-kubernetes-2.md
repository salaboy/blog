---
title: "Back to basics: APIs to rule them all (Dapr on Kubernetes) #2"
date: 2023-12-14 09:26:47 +0000
permalink: /2023/12/14/back-to-basics-apis-to-rule-them-all-dapr-on-kubernetes-2/
description: "In this blog post, we will package and deploy the application we coded in the previous blog post to Kubernetes."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2023/12/shanghai.png
tags:
  - "cloud-native"
  - "kubernetes"
  - "dapr"
  - "apis"
  - "spring-boot"
  - "developers"
  - "tutorial"
  - "hands-on"
  - "diagrid"
  - "example"
  - "Java"
  - "devex"
  - "kind"
  - "cluster"
  - "deploy"
  - "apps"
  - "appdev"
original_url: https://www.salaboy.com/2023/12/14/back-to-basics-apis-to-rule-them-all-dapr-on-kubernetes-2/
---

In my [previous blog post](/2023/12/07/back-to-basics-dapr-statestore-and-spring-boot/)and, I created a small application using the Dapr Statestore APIs. We created some tests using the [Dapr](https://dapr.io) + [Spring Boot](https://spring.io/projects/spring-boot) + [Testcontainers](https://testcontainers.com/) integrations. This allowed developers to use the [Dapr](https://dapr.io) APIs to code their applications without running the Spring Boot application inside a Kubernetes Cluster.

In this blog post, we will package and deploy the application we coded in the previous blog post to Kubernetes. To do this, we will create a local Kubernetes Cluster with [Kubernetes KinD](https://kind.sigs.k8s.io/), install and configure [Dapr](https://dapr.io), and finally, to deploy our application, we will containerize it using the Spring Boot Maven plugin.

In the following video, you can see me running all the steps below to run the application we wrote in the previous blog post into a local Kubernetes Cluster with Dapr configured and using Redis as the Statestore APIs backing implementation.

<div class="video-embed" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;margin:1.5rem 0;"><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" loading="lazy" src="https://www.youtube.com/embed/NPxFJIlXolg?feature=oembed" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Back to basics: APIs to rule them all (Dapr on Kubernetes) #2"></iframe></div>

### Setting up our Environment

As mentioned in the introduction, we will start by creating a local KinD Cluster.

```term
kind create cluster
```

Then, we will install the [Dapr Control Plane using Helm](https://docs.dapr.io/operations/hosting/kubernetes/kubernetes-deploy/) as instructed in the documentation:

```term
helm repo add dapr https://dapr.github.io/helm-charts/
helm repo update
helm upgrade --install dapr dapr/dapr \
--version=1.12.0 \
--namespace dapr-system \
--create-namespace \
--wait
```

Once we have Dapr installed, we will create a new instance of Redis to serve as the actual implementation for the Dapr StateStore APIs used by the application.

```term
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install redis bitnami/redis --set image.tag=6.2 --set architecture=standalone
```

> Note: Check out the output of the previous command, as when you create a new Redis Helm release (a new Redis Instance) the output will show you important details about how to connect to the freshly created instance.

Once we have Redis and Dapr installed we just need one more thing, we need to create a Dapr Statestore Component that connects the Dapr StateStore APIs with our Redis instance that we just created. To do so we need to create a new Kubernetes Resource called `Component`, in this case a Statestore component that will look like this:

```yaml
apiVersion: dapr.io/v1alpha1
kind: Component
metadata:
  name: kvstore
spec:
  type: state.redis
  version: v1
  metadata:
  - name: keyPrefix
    value: name
  - name: redisHost
    value: redis-master.default.svc.cluster.local:6379
  - name: redisPassword
    secretKeyRef:
      name: redis
      key: redis-password
auth:
  secretStore: kubernetes
```

*https://github.com/salaboy/dapr-spring-boot-basics/blob/main/kubernetes/statestore.yaml*

This `Component` resource specify the type of component that we are trying to configure in this case the `state.redis` implementation which takes as metadata all the configurations parameters that Dapr will need to connect to a Redis instance. Both the `redisHost` and `redisPassword` Kubernetes Secret are provided when we install the Redis Helm chart.

Once you have the resource definition, make sure you apply it to your Kubernetes cluster by running:

```term
kubectl apply -f statestore.yaml
```

Ok, we have our environment ready! Time to look into our Spring Boot Application.

### Package and configuring our application to run on Kubernetes

Ok, so we must do two things to run our application in our Kubernetes cluster. First, we need to create a container, and we will do this by running the following command from inside the application directory:

```term
mvn spring-boot:build-image
```

This will create a container using [buildpacks](https://buildpacks.io/). The, the output is quite long, but when the build process finishes, you should see something like this:

```term
[INFO] Successfully built image 'docker.io/library/customer-catalog:0.0.1-SNAPSHOT'
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:02 min
[INFO] Finished at: XXXXXX
[INFO] ------------------------------------------------------------------------
```

To deploy this to our Kubernetes cluster, we can [load this image into our KinD cluster](https://kind.sigs.k8s.io/docs/user/quick-start/#loading-an-image-into-your-cluster) or push this to Docker Hub so our cluster can fetch it from there.

If you want to push to Docker Hub, you need to tag the image to include your Docker Hub user/org and the right version tag by running:

```term
docker tag customer-catalog:0.0.1-SNAPSHOT salaboy/customers-service:v0.1.0
```

Where `salaboy` is my Docker Hub user. Then you can push this if you are logged in to Docker Hub (run `docker login`):

```term
docker push salaboy/customers-service:v0.1.0
```

I've decided to push this image, so you can use it without the need to build it from source.

The next step is to configure the application to run in our cluster, and for that we will create a Kubernetes Deployment and a Kubernetes Service resources.

There is nothing Dapr specific in these Kubernetes resources, except three annotations that you can find in the Deployment resource:

```term
spec:
  selector:
    matchLabels:
      app: customers-service
  template:
    metadata:
      annotations:  
        dapr.io/app-id: customers-service
        dapr.io/app-port: "8080"
        dapr.io/enabled: "true"
```

*https://github.com/salaboy/dapr-spring-boot-basics/blob/main/kubernetes/customers-service.yaml*

As you can see, three annotations are added to let the Dapr Control Plane know that this application is interested in using the Dapr APIs. These annotations will be used by the Dapr Control plane to inject the Dapr Sidecar that previously was configured transparently by Testcontainers when running the application locally.

Finally, if we want to test if our service is working, we can use port forwarding to send requests to our customer service:

```term
kubectl port-forward svc/customers-service 8080:80
```

And then use `httpie` or `curl` to send requests, for example:

```term
http :8080/ < customer.json
```

*https://github.com/salaboy/dapr-spring-boot-basics/blob/main/customer-catalog/customer.json*

This will create a new customer inside the service, and you can retrieve it by calling the GET endpoint by running:

```term
http ":8080/?customerId=123"
```

### Sum Up

On this blog post we took the Spring Boot application that we built locally in the previous blog post and deployed it to Kubernetes without changing any application code. We installed Dapr in our local Kubernetes Cluster and then packaged and deploy the application to the cluster. Finally we checked that the application was correctly using the Dapr Statestore APIs persisting and reading data from the Redis instance that we installed in our Cluster.

By taking the application from a local development experience to a run on a Kubernetes cluster we can identify all the steps needed to configure an environment and run Dapr-enabled applications.

With this journey out of the way, now we can start exploring other Dapr APIs and tools like the ones we are building at Diagrid, where we are trying to reduce the configuration and operation overhead to be able to consume application-level APIs like the ones provided by the Dapr project. If you are interested in testing what the engineering team at Diagrid is cooking up, please drop me a message or join the Early Access program at our website: <https://pages.diagrid.io/catalyst-early-access-waitlist>

See you in the next one!
