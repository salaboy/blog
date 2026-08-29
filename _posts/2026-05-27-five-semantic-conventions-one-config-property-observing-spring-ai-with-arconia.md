---
title: "Five semantic conventions, one config property (Observing Spring AI with Arconia)"
date: 2026-05-27 12:44:46 +0000
permalink: /2026/05/27/five-semantic-conventions-one-config-property-observing-spring-ai-with-arconia/
description: "I don't think semantic convention fragmentation in the GenAI observability space is going away soon."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2026/05/arconia-blue-horizontal.png
tags:
  - "2026"
  - "arconia"
  - "spring boot"
  - "spring ai"
  - "opentelemetry"
  - "arize"
  - "langsmith"
  - "agentic"
  - "agents"
  - "observability"
  - "llm"
original_url: https://www.salaboy.com/2026/05/27/five-semantic-conventions-one-config-property-observing-spring-ai-with-arconia/
---

I've been going deeper into Spring AI observability lately, and after publishing [a walkthrough of the Spring AI observability with the spring-boot-starter-opentelemetry setup](https://www.dash0.com/blog/observing-spring-ai-applications-with-opentelemetry-and-dash0), I kept running into the same question from people trying to ship telemetry to different backends: "Which semantic conventions should I use?"

That question has no clean answer right now. And I think that's worth talking about.

### The fragmentation problem

When you instrument a Spring AI application with `spring-boot-starter-opentelemetry`, you get spans decorated partially decorated with OpenTelemetry's GenAI semantic conventions: `gen_ai.request.model`, `gen_ai.usage.input_tokens`, `gen_ai.system`, and so on. These are vendor-neutral, CNCF-backed, and the right default if you're running a general-purpose observability stack like [Dash0](https://www.dash0.com/), [Grafana](https://grafana.com/), or Honeycomb that support OpenTelemetry.

But the moment you start evaluating your AI application — looking at retrieval quality, latency by prompt type, model comparison — you'll discover that the popular evaluation platforms don't speak OTel natively. [Arize Phoenix](https://docs.arize.com/phoenix) expects [OpenInference](https://arize-ai.github.io/openinference/spec/) attributes like llm.model_name and llm.token_count.prompt. OpenLIT and [Traceloop's OpenLLMetry](https://www.traceloop.com/docs/openllmetry) each have their own naming schemes. LangSmith has yet another one.

[Miguel Luna comparison of these schemas](https://mlunadia.github.io/observing-ai/genai-observability-compared.html) is the clearest breakdown I've seen of how deep this split goes. Take just the model attribute:

| What you want to express | OTel SemConv | OpenInference | OpenLLMetry | Langfuse |
| --- | --- | --- | --- | --- |
| Model name | `gen_ai.request.model` | `llm.model_name` | `gen_ai.request.model` | `model` |
| Provider | `gen_ai.provider.name` | `llm.provider` | `gen_ai.system` | `model.provider` |
| Input tokens | `gen_ai.usage.input_tokens` | `llm.token_count.prompt` | `gen_ai.usage.input_tokens` | `usage.input` |
| Span taxonomy | operation name | `span.kind` attribute | operation name | observation type |

With these naming differences, creating a dashboard becomes a nightmare. These schemas reflect genuinely different philosophies about how AI operations should be categorized. OpenInference has a strict `span.kind` taxonomy (`LLM`, `EMBEDDING`, `RETRIEVER`, `TOOL`, etc.). OTel uses operation names and leaves categorization to consumers. Langfuse adds its own observation types (`GENERATION`, `EVENT`). While I see some convergence slowly happening towards OTel, these different conventions are definitely locking you in to a specific vendor.

So if you're building a Spring AI application today and you want to send traces to both [Dash0](https://www.dash0.com/) and [Arize Phoenix](https://arize.com/phoenix/), you have a problem. With the standard Spring Boot starter, you'd need to write a custom [ChatModelObservationConvention](https://github.com/salaboy/observing-ai/blob/main/java/spring-ai/spring-merch-store/src/main/java/com/example/store/tracing/ChatObservationConventionConfig.java) to emit different attributes per backend, and maintain it yourself as each upstream spec evolves. There is also no support for capturing LLM `input/output`,  and tool calls parameters and results which can be very useful for debugging and understanding sessions.

### Enter Arconia

[Arconia](https://docs.arconia.io) is a framework built by [Thomas Vitale](https://github.com/ThomasVitale) that sits on top of Spring Boot and Spring AI. I've been watching it closely, and its approach to semantic conventions is the most practical solution I've seen to this fragmentation.

The core idea: [Arconia](https://docs.arconia.io) decouples your instrumentation code from the semantic convention schema. You write your Spring AI application once. You choose a convention by setting one property.

Pick any of: `opentelemetry`, `openlit,` `openllmetry`, `langsmith`

`arconia.observations.conventions.opentelemetry.ai.flavor=opentelemetry`

***Note that to use `openinference` you need a separate dependency, as OpenInference don’t share any properties with Otel semantic conventions.***

That's it. No custom beans. No overriding `getHighCardinalityKeyValues()`. No convention adapter classes. The same application, five different schemas, zero code changes.

### Setting it up

The dependency swap from `spring-boot-starter-opentelemetry` to Arconia is straightforward. In your `pom.xml`:

```XML
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>io.arconia</groupId>
            <artifactId>arconia-bom</artifactId>
            <version>0.27.1</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
...
<dependencies>
    <dependency>
        <groupId>io.arconia</groupId>
        <artifactId>arconia-opentelemetry-spring-boot-starter</artifactId>
    </dependency>
    <dependency>
        <groupId>io.arconia</groupId>
        <artifactId>arconia-opentelemetry-semantic-conventions</artifactId>
    </dependency>
</dependencies>
```

Check the [Arconia recipe to migrate from Spring Boot OpenTelemetry to Arconia](https://docs.arconia.io/arconia/latest/opentelemetry/migration/migration-spring-boot/).

Arconia's starter replaces `spring-boot-starter-opentelemetry`. It wraps the same OpenTelemetry SDK and Micrometer integration but adds a pluggable convention layer on top, unified configuration for different semantic conventions and expand the support for OpenTelemetry Metrics and logs instrumentation, not provided by the Spring Boot OpenTelemetry starter.

Where Spring Boot requires you to set `spring.ai.chat.observations.log-prompt=true` and write a custom observation convention bean to get prompt/completion content into spans, [Arconia](https://arconia.io/) handles it through configuration:

[`arconia.observations.conventions.opentelemetry.ai`](http://arconia.observations.conventions.opentelemetry.ai)`.capture-content=none|span-events|span-attributes  
arconia.observations.conventions.opentelemetry.ai.include-tool-definitions=true  
arconia.observations.conventions.opentelemetry.ai.include-tool-call-content=true`

These three properties replace the custom [`ChatModelObservationConvention` I described in the previous post](https://www.dash0.com/blog/observing-spring-ai-applications-with-opentelemetry-and-dash0). That's a real improvement. Custom beans that override framework internals are fragile. They break silently when upstream changes the API. A config property is a contract.

### Five apps, five conventions

I've set up five variants of the Spring Merch Store application in the [observing-ai GitHub repository](https://github.com/salaboy/observing-ai/tree/main/java/spring-ai-with-arconia). Each one is the same application (same tools, same chat client, same Anthropic model), differentiated only by which semantic convention it emits.

| Directory | Convention | Target backend |
| --- | --- | --- |
| `spring-merch-store-arconia` | OpenTelemetry | Dash0 or any Otel backend |
| `spring-merch-store-arconia-openinference` | OpenInference | Arize Phoenix |
| `spring-merch-store-arconia-openlit` | OpenLIT | OpenLIT dashboard |
| `spring-merch-store-arconia-openllmetry` | OpenLLMetry | Traceloop |
| `spring-merch-store-arconia-langsmith` | LangSmith | LangSmith |

To run any of them:

`git clone https://github.com/salaboy/observing-ai.git  
cd observing-ai/java/spring-ai-with-arconia/spring-merch-store-arconia  
export ANTHROPIC_API_KEY=sk-ant-...  
./mvnw spring-boot:run`

Swap the directory name to switch conventions. That's exactly how thin the difference is.

### What changes between conventions

Switching from `opentelemetry` to `openinference` doesn't change the span hierarchy you saw in [the previous post](https://www.dash0.com/blog/observing-spring-ai-applications-with-opentelemetry-and-dash0). You still get an HTTP span at the top, a ChatClient span, the advisor chain, the LLM call spans, and the tool call spans. What changes is the attributes on those spans.

Under OpenTelemetry conventions, a chat span looks like this:

```properties
gen_ai.system           = anthropic
gen_ai.request.model    = claude-haiku-4-5
gen_ai.usage.input_tokens  = 1308
gen_ai.usage.output_tokens = 58
gen_ai.response.finish_reasons = ["end_turn"]
Under OpenInference, the same span emits:
llm.provider            = anthropic
llm.model_name          = claude-haiku-4-5
llm.token_count.prompt  = 1308
llm.token_count.completion = 58
span.kind               = LLM
```

Both express the same information. But if you point your OTLP exporter at Arize Phoenix and your spans carry gen_ai.* attributes, Phoenix won't know what to do with them. It expects llm.* and a span.kind label from its taxonomy. Without span.kind, Phoenix can't categorize the span as an LLM call, and your evaluation dashboards break.

The `OpenLLMetry` flavor aligns closely with OTel's naming but enables content capture by default, matching the behavior of the official `OpenLLMetry SDK` instrumentation. `LangSmith` defaults to `span-events` rather than `span-attributes` for content capture, which affects how prompt and completion text surfaces in the trace.

### What Arconia adds

The standard `spring-boot-starter-opentelemetry` approach gives you auto-configured OTLP exporter for traces and logs (via the OpenTelemetry SDK) and metrics (via Micrometer), however, there is no instrumentation for logs, so no logs are actually exported. Spring AI's built-in `gen_ai.*` span attributes, and `ChatModelObservationConvention` beans you can extend or override.

[Arconia](https://arconia.io/) gives you all of that plus convention portability (switch backends without touching application code), built-in content capture without a custom observation bean, and convention isolation so upstream spec changes get absorbed by the [Arconia](https://arconia.io/) dependency rather than landing in your code.

### A word about convergence

I'll be honest: I don't think semantic convention fragmentation in the GenAI observability space is going away soon. OTel optimizes for vendor neutrality. OpenInference optimizes for evaluation workflows. OpenLLMetry optimizes for developer ergonomics. LangSmith optimizes for the LangChain ecosystem. These are legitimate differences, not just naming preferences.

The practical recommendation from Miguel's comparison is to emit OTel SemConv as your baseline — every backend reads it — and layer on convention-specific attributes where your evaluation tooling needs them. Arconia puts this into practice: emit OTel to your primary observability backend, point an evaluation pipeline at the same app running with OpenInference conventions.

In my opinion, what we actually need is a clearer separation between operational observability (where OTel wins) and AI evaluation observability (where none of the schemas is good enough yet). I expect that separation to become clearer over the next 6 months as the OTel GenAI working group moves these conventions out of experimental status.

Until then, tools like Arconia that abstract the convention layer are doing genuinely useful work. Clone the [observing-ai repository](https://github.com/salaboy/observing-ai/tree/main/java/spring-ai-with-arconia), run the five variants side by side, and see what the same application looks like through each backend's eyes.

As always, if you have questions, opinions, or build something on top of this, find me on [X/Twitter](https://twitter.com/salaboy) or [LinkedIn](https://www.linkedin.com/in/salaboy/). I'd love to see what you're building.
