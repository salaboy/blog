---
title: "KubeCon '19: my impressions"
date: 2019-05-23 20:48:47 +0000
permalink: /2019/05/23/kubecon-19-my-impressions/
description: "KubeCon is finished and it is quite clear to me that it is one of these conferences where you must attend at least once a year to understand what is…"
tags:
  - "cloud"
  - "community"
  - "docker"
  - "English"
  - "event"
  - "Jenkins X"
  - "knative"
  - "kubernetes"
  - "open source"
  - "Trips"
  - "CD"
  - "CDF"
  - "ci/cd"
  - "cloud native"
  - "containers"
  - "k8s"
  - "kubecon"
  - "microservices"
  - "tekton"
original_url: https://www.salaboy.com/2019/05/23/kubecon-19-my-impressions/
---

KubeCon is finished and it is quite clear to me that it is one of these conferences where you must attend at least once a year to understand what is happening in the industry. The conference is clearly about zero BS, a lot of Open Source, collaboration between the major players and a lot of community diversity and engagement.

![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2468.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2471.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2476.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2479.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2493.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2495.png)![Kubeflow](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/kubeflow.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2520.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2521.png)![KubeCon '19: my impressions](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2019/05/img_2522.png)

There were tons of interesting announcements and the conversations in the corridors were quite deep and always promoting collaboration instead of competing. Here is the list of highlights that got my attention and are going to definitely change the way that we use Kubernetes, this list is from the graduation process from the Kubernetes community:

- **Staging**
  - **OpenEBS** -> storage management, storage in a container, provided by OpenEBS, single experience for exposing storage
- **Incubating**
  - **LinkerD**, lightweight service mesh. Servicemesh benchmark harness, kinvolk report. Automatic MTLs for service to service by default with provisioned identity. Zero config solutions
  - **HELM 3** Alpha
    - client side only, (Tiller removal)
    - push charts to OCI registries
    - validate chart configuration with json schema.
    - Release socked with namespace
    - Declare dependencies in chart/s yaml instead of req.
    - Libraries chart
    - HELM summit Sept 11-12
  - **Harbor**: cloud native registry for containers 1.8. OpenID Connect support, robot accounts, replication enhancement. Swagger UI integration
  - **Rook**: block and cloud storage.
  - **CRI-o** , CRI implementation to use OCI compatible runtimes. We are not stuck with containerD we can replace the runtime
    - Open container initiatives
    - storage/containers management and networking abstraction so they can evolve at their own pace
    - Make and running containers in production as boring and secure as possible
  - **Open Census / Open Tracing**
    - how well you can understand the system giving only the telemetry data that is coming out (no redeploying/change)
    - It must become a built-in feature for Cloud Native Software
    - Telemetry= traces/logs/traces, etc
    - **Open Telemetry** created (open census + open tracing)
      - Same APIs
      - Implementations
      - Agents
- **Graduated**
  - **fluentD** just graduated
    - Logging -> data analysis
    - Challenges
      - Applications distributed
      - streams of data
      - multiple formats
    - Unified Logging Layer (ULL)
    - v1.5
      - Performance: forward protocol + keep alive feature
      - Security
      - part of docker hub: docker run fluentD
      - Support for arm architecture
      - partnership with gitlab
      - fluent bit + stream processing (edge computing)

Regarding announcements from the Big Players in the industry, here is my top list:

- **Microsoft**: Service Mesh Interface, this is definitely something that will help the industry to adopt and trust service meshes. It will provide standardisation enabling different providers to expose a single and unified API while they can expand on their strengths.
- **Cisco**: Network Service Mesh, the modernisation of the network infrastructure, to be abstracted of concepts of the past to move forward software and hardware to build more efficient networks.
- **IBM**: talked about Razee.io which is a multi-cluster continuous delivery tool for Kubernetes
- **Oracle**: was very strong on making sure that we have tools to cover the basic principles of modern cloud such as: DevOps,  Open Source, Public and Hybrid Cloud
- **CDF**: The continuos Delivery Foundation is coming strong, it was quite clear to me that Tekton is becoming the standard for CI/CD and that projects such as Jenkins X and Spinnaker have won in the battle of modernising CI/CD for all of us in K8s.

It is quite clear for the industry at this stage that **K8s is a platform for creating platforms** and for that reason we need to enable the community to succeed in that challenge.

*Kubecon I will be back!*
