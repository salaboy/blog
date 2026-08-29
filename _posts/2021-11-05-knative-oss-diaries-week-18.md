---
title: "Knative OSS Diaries – week #18"
date: 2021-11-05 19:11:29 +0000
permalink: /2021/11/05/knative-oss-diaries-week-18/
description: "Another super exciting week went by, with the Knative 1.0 GA release and Devoxx UK happening here in London."
tags:
  - "book"
  - "CD"
  - "ci/cd"
  - "cloud"
  - "cloud native"
  - "cloudevents"
  - "community"
  - "English"
  - "eventing"
  - "func"
  - "go"
  - "kubernetes"
  - "microservices"
  - "open source"
  - "oss"
  - "serving"
  - "cloudnative"
  - "knative"
  - "release"
original_url: https://www.salaboy.com/2021/11/05/knative-oss-diaries-week-18/
---

Another super exciting week went by, with the [Knative 1.0 GA](https://knative.dev/blog/articles/knative-1.0/) release and [Devoxx UK](https://www.devoxx.co.uk/) happening here in London. To my surprise, there were a lot of Knative mentions at the conference and even `func` had a session. I totally recommend you to check out the following Knative related sessions:

- [Next Generation Microservices using Knative and `func`](https://www.devoxx.co.uk/talk/?id=16702)
- [Cloud Native with Spring Boot and Kubernetes](https://www.devoxx.co.uk/talk/?id=5502)
- [Crossing the Platform Gap](https://www.devoxx.co.uk/talk/?id=12626)

Following the 1.0 GA release, there were a bunch of blog posts that are worth reading regarnding the release, the history of the project and commercial offerings around it:

[![Screenshot 2021 11 05 at 12.09.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/screenshot-2021-11-05-at-12.09.36.png)](https://twitter.com/e_k_anderson/status/1456493509536464899?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1456493509536464899%7Ctwgr%5E%7Ctwcon%5Es1_c10&ref_url=https%3A%2F%2Fpublish.twitter.com%2F%3Fquery%3Dhttps3A2F2Ftwitter.com2Fe_k_anderson2Fstatus2F1456493509536464899widget%3DTweet)


[![Screenshot 2021 11 05 at 12.41.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/screenshot-2021-11-05-at-12.41.10.png)](https://twitter.com/KubernetesPod/status/1455556044885614593?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1455556044885614593%7Ctwgr%5E%7Ctwcon%5Es1_c10&ref_url=https%3A%2F%2Fpublish.twitter.com%2F%3Fquery%3Dhttps3A2F2Ftwitter.com2FKubernetesPod2Fstatus2F1455556044885614593widget%3DTweet)
[![Screenshot 2021 11 05 at 12.43.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/screenshot-2021-11-05-at-12.43.56.png)](https://twitter.com/csantanapr/status/1456436369576845312?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1456436369576845312%7Ctwgr%5E%7Ctwcon%5Es1_c10&ref_url=https%3A%2F%2Fpublish.twitter.com%2F%3Fquery%3Dhttps3A2F2Ftwitter.com2Fcsantanapr2Fstatus2F1456436369576845312widget%3DTweet)


[![Screenshot 2021 11 05 at 17.00.](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/screenshot-2021-11-05-at-17.00.24.png)](https://twitter.com/triggermesh/status/1456392429993709571?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1456392429993709571%7Ctwgr%5E%7Ctwcon%5Es1_c10&ref_url=https%3A%2F%2Fpublish.twitter.com%2F%3Fquery%3Dhttps3A2F2Ftwitter.com2Ftriggermesh2Fstatus2F1456392429993709571widget%3DTweet)

Now that the release is out, I've started playing with Spring Native and Knative `func` and I will building a small demo understand how all the pieces fit together to make sure that developers looking into the project have a simple and awesome experience. I am excited about this project because it should simplify the development experience of function-based workloads hiding the complexity of Kubernetes, Docker and even Knative.

Also because I like to have good  read before going to sleep, I got a couple of books at Devoxx from authors that I consider my friends: Practical Process Automation from Bernd Ruecker and Knative Cookbook by Burr Sutter.

[![Knative OSS Diaries – week #18](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/img_5373-1.jpg)](/content/images/2021/11/img_5373-1.jpg)

Also recomended by @PaulaLKennedy a more serious reading about a topic that I am getting more insterested lately: **Te[am Topologies](https://teamtopologies.com/)** by Matthew Skelton and Manuel Pais

[![Knative OSS Diaries – week #18](https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2021/11/img_5374.jpg)](/content/images/2021/11/img_5374.jpg)

### Notes from Devoxx UK

- **[dbt -> Centralised meta data stores](https://www.devoxx.co.uk/talk/?id=10164)** (experience from [autotrader.co.uk](https://www.autotrader.co.uk/))
  - Datahub (from LinkedIn?)
  - Amundsen (from lift)
  - marquez (from wework)
  - Google catalog ?
  - [Open-medatadata.org](http://Open-medatadata.org)
  - [open-lineage.io](http://open-lineage.io)
- **[Apache Kafka vs Apache Pulsar](https://www.devoxx.co.uk/talk/?id=9709)**
  - Producer stream-> put data in a place so other applications can consume
    - Kafka and Pulsar store the data locally (as a database)
    - Consumer can also ask for all the data that Kafka or Pulsar (reply log, back in time)
      - This is not easy to do with message systems
    - Kafka and Pulsar can isolate consumers, so if consumers have problems, they don’t bother to each other
  - Kafka  (from LinkedIn)is much more mature than Pulsar, Pulsar (yahoo) is just starting (<https://pulsar.apache.org>) designed to solve Kafka problems
    - The adoption of Pulsar is much slower
    - Pulsar is being adopted by large companies but not as Kafka
    - Alternatives: Redmonk, [nats.io](http://nats.io)
  - Differences
    - Kafka
      - Limitations:
        - Kafka is HA system, it runs in more than one machine (Kafka nodes/ brokers)
        - Producer sends data to all brokers (3), so if one broker fail others can work
        - Kafka uses Zookeeper?? Still? It is used to decide which broker is the leader
        - Each broker has its own storage (of course) Kafka has partitions (in a file) Kafka write messages in the order that they arrive
        - Partitions are the ways of scaling for scaling, more partitions more throughput, if we have more consumers than partitions, the consumer will not be able to read from Kafka (in parallel I guess)
        - It is key to understand how to define the number of partitions, not easy to decrease the number of partitions
        - Too many partitions is too costly, more partitions means more problems, more coordination in the consumer and broker side
        - Scale up and down the number of brokers is hard because, new brokers will be empty, so you need to populate data to these new empty brokers (you need to do this)
        - Brokers needs to replicate data so if the broker brakes consumers can go to another broker
          - This increase a lot the traffic in the cluster
    - Pulsar
      - Same concept of Broker, same as zookeeper
      - Brokers doesn’t keep the data locally, they send the data to a book keeper (bookie)
        - Brokers send data to all book keepers, this basically removes the need for partitions
        - Scaling storage is much easier with Pulsar because book keepers are easy to scale
        - Brokers are stateless
        - Consumers are also easy to scale
    - Kafka already have a version without zookeeper
    - Pulsar is more Kubernetes friendly, provides more features to scale up and down in Kube
      - More consuming pattern
      - In Kafka patterns:
        - Shared and key-shared
      - In Pulsar
        - Exclusive (just only one consumer)
        - Failover (only one consumer, if the consumer fail, then another consumer can take its place)
        - Shared and Key-shared
    - Tired Storage and geo replication
      - Kafka
        - Geo replication features are only comercial
        - tiered storage (comercial)
      - Pulsar
        - geo replication (replicate data across different clusters)
        - namespaces (isolation, similar to Kubernetes namespaces, to organise data and the traffic)
        - tiered storage (for cloud providers)
    - Message Size
      - Kafka optimum message size is 1 KB, until 1MB, more than 1MB it sucks, and doesn’t work by default
      - Performance reasons
      - Pulsar, 5 MB limit
    - Performacne-wise are super close, so there is no reason to choose one or the other based on performance
      - There is a proxy for bridging from Kafka to Pulsar
- **[Crossing the Platform Gap by Laura (syntasso):](https://github.com/syntasso/kratix)**
  - **Platform teams and application teams**
  - Collaboration .. shared responsibility,
    - “As a service” boundaries
    - “Continue with lightweight collaboration to validate”
  - XaaS: deliniate responsabilities
  - Platform as a Product
  - [https://github.com/syntasso/kratix](https://github.com/syntasso/kratix?trk=products_details_guest_primary_call_to_action)
- **[Stream and SQL @morsapaes](https://medium.com/@morsapaes/hey-materialize-whats-streaming-on-twitch-f90426b6ed9?source=user_profile---------0-------------------------------)** ([link to the blog post explaining how materialize works](https://medium.com/@morsapaes/hey-materialize-whats-streaming-on-twitch-f90426b6ed9?source=user_profile---------0-------------------------------))
  - [Materialize](https://materialize.com/) is pretty cool, as it allows you to stream data to it and then ask questions about it. It does create aggregations and materialized views in memory for efficient querying
  - OLTP -> OLAP (off load analytics workflows to a second DB)
  - OLTP -> row based
  - OLAP -> Columnar based (attribute oriented way)
  - OLVM -> Push based (online view maintenance over streaming data) Pre compute queries
  - [Metabase](https://www.metabase.com/docs/latest/users-guide/07-dashboards.html) dashboards
  - You create queries in materialise for things that you want to get answers for in a repeated way on top of online data
  - Timely data flow write in RUST
- **[Schemas for events, structured data in Kafka](https://www.devoxx.co.uk/talk/?id=12617)**
  - Async api for describing your event producers and consumers <https://www.asyncapi.com>
  - registries:
  - Apicurio registry: [github.com/apicurio/apicurio-registry](http://github.com/apicurio/apicurio-registry)
    - Kafka, posrgresSQL
  - Formats: JSON, AVRO, PROTOBUF
