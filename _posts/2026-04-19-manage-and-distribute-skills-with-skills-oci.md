---
title: "Manage and distribute skills with `skills-oci`"
date: 2026-04-19 07:25:18 +0000
permalink: /2026/04/19/manage-and-distribute-skills-with-skills-oci/
description: "Manage and distribute agent skills with OCI-compliant images, enabling versioning, distribution, reuse of existing infrastructure, and leveraging the OCI…"
tags:
  - "oci"
  - "skills"
  - "spec"
  - "open"
  - "skills-oci"
  - "community"
  - "agentic"
  - "containers"
  - "registries"
  - "2026"
original_url: https://www.salaboy.com/2026/04/19/manage-and-distribute-skills-with-skills-oci/
---

I've seen this movie before. A new ecosystem explodes, adoption moves faster than anyone expected, and then everyone hits the same wall: how do we actually share this stuff in a reliable, secure, versioned way? In 2014, Docker images were distributed as tarballs. In 2016, Helm charts were floating around as zip files on Slack. Today, in 2026, it's Agent Skills — and the distribution story is, once again, "clone a repo and hope for the best."

I'm not saying this to be critical of the [Agent Skills specification](https://agentskills.io/specification). The spec, which Anthropic published in December 2025 and is now stewarded at [agentskills/agentskills](https://github.com/agentskills/agentskills), does something important: it defines a shared format for knowledge assets that coding agents — Claude Code, Cursor, GitHub Copilot, Codex, and others — can discover and use to do their work more accurately. That's genuinely useful. But the spec stops there. It says nothing about how to distribute skills, version them, verify their integrity, or consume them from inside a corporate firewall. And in my opinion, that gap needs to be closed, the sooner the faster we can move on to other more interesting topics.

### We've Been Here Before

The cloud-native ecosystem spent years learning hard lessons about artifact distribution. Helm charts were shared as files attached to GitHub releases. WebAssembly modules were uploaded to ad-hoc buckets. Configuration bundles were copied between teams via Slack DMs. Each of these approaches had the same failure modes: no canonical discovery mechanism, no integrity guarantees, no reproducibility, and no supply chain security story.

The solution the community eventually converged on wasn't a new protocol or a new registry format. It was [OCI — the Open Container Initiative](https://opencontainers.org/) standards that most people associate with container images, but which are actually a general-purpose artifact store. Today, Helm charts live in OCI registries. WebAssembly components are distributed via OCI. [FluxCD](https://fluxcd.io/) manifests, SBOM files, Sigstore attestations — all OCI. The lesson the cloud-native world learned is that you don't need to reinvent infrastructure when battle-tested infrastructure already exists and runs at every major cloud provider, in every enterprise, and even on your laptop via Docker Desktop.

I strongly believe the same lesson applies directly to Agent Skills and other knowledge assets (that influence your coding agent and AI-infused applications’ contexts).

### Distributing Artifacts using OCI

I’ve been talking with a bunch of people about this topic, including [Thomas Vitale, who finally published a detailed proposal](https://www.thomasvitale.com/agent-skills-as-oci-artifacts/) for packaging Agent Skills as OCI artifacts, covering the spec proposal and why this matter. He did a great job at going over the gap that the spec is trying to fill, for example having a OCI Image Manifest with a custom `artifactType` (`application/vnd.agent-skills.skill.v1`), and its contents — the `SKILL.md`, scripts, and resources already defined by the spec — are packaged as the artifact's layers.

On the consumer side, a `skills.json` declares which skills a project depends on by OCI reference, and a `skills.lock.json` pins the exact digest of each skill at install time. This is the same model Go modules, npm, and Cargo use — and it works. You get reproducible installs across your whole team, clear upgrade paths, and a paper trail.

Because these are standard OCI artifacts, any compliant registry works. Docker Hub, [GitHub Container Registry](https://ghcr.io), [Harbor](https://goharbor.io/), [Zot](https://zotregistry.dev/), your company's internal registry — it doesn't matter. No new infrastructure to run, no new accounts to create, no vendor lock-in on the registry side.

### Packaging and Sharing a Skill with `skills-oci`

Ok, but specs are hard to evaluate and understand, they require consensus, which is already very difficult but then adoption that can only be driven by people fully understanding the problem space.

For that reason, I've been building [`skills-oci`](https://github.com/salaboy/skills-oci), a CLI built on the [ORAS Go client](https://github.com/oras-project/oras) that implements the spec proposed by Thomas, and it shows an end-to-end experience to manage (package and publish) and consume skills. I am a practical guy, so I wanted a clean experience that integrates with the tools you are already using.

The core workflow — four commands to go from a local skill to a shared, versioned artifact on Docker Hub:

#### Package and push your skill:

To package and publish a skill to a container registry (in this case Docker Hub):

```bash
cd my-skill/
skills-oci push docker.io/salaboy/my-skill:1.0.0
```

#### Adding Skills to your Projects

From any project where you want to use the skill:

Inside your project directory, where you want to add a managed skill. Add it as a dependency to your project:

```bash
skills-oci add docker.io/salaboy/my-skill:1.0.0
```

Adding skills will create the `skills.json` and `skills.lock.json` file.

#### Cosign,

Install (re-fetch) all declared skills (resolves and locks digests):

```bash
skills-oci install
```

#### Verifying Skills signature and provenance

Using Cosign, you can check the container image signature and SLSA provenance:

```bash
skills-oci verify
```

That last command is not just cosmetic. Because the artifact is content-addressed via digest and can be signed with [Cosign](https://github.com/sigstore/cosign), verification is a real guarantee—not a checkbox. The full source and examples are at [github.com/salaboy/skills-oci](https://github.com/salaboy/skills-oci).

#### Registering the skills with your coding agent

Notice that I wanted to hook into the existing coding agent ecosystems, so I’ve included a command that automatically registers a startup hook with your coding agent, which will install (fetch and download) your skills when starting a new session.

```bash
skills-oci register
```

If we can distribute versioned skills that can be verified and dynamically loaded into our coding agents, we don’t need to push them to our git repositories, where they will diverge across projects and be hard to maintain. By default, the `skills-oci` CLI will add the `.agents/skills/` directory to your `.gitignore` file so you don’t need to worry about stale copies of your skills. If you want to upgrade your skills for a given project, all you need to do is update the version in the `skills.json` file.

### Free Supply Chain Security — No Extra Work

This is the part that genuinely excites me, and I think it's undersold in most conversations about OCI for non-container artifacts. Because a skill packaged as an OCI artifact is just an artifact like any other, the entire cloud-native supply chain security toolchain applies immediately — with zero additional format work.

You can sign a skill with [Cosign](https://docs.sigstore.dev/) and attach [a SLSA provenance attestation](https://slsa.dev/) so consumers can cryptographically verify who built it and from which source commit. You can generate an SBOM with [Syft](https://github.com/anchore/syft) and attach it as a referrer via the [OCI Referrers API](https://github.com/opencontainers/distribution-spec/blob/main/spec.md#listing-referrers). You can run a vulnerability scan with [Grype](https://github.com/anchore/grype) and attach the results so downstream teams can make informed decisions about which skills to adopt. None of this requires any new tooling — it all already works against any OCI-compliant registry.

For enterprises, this is the difference between ***"we allow skills"*** and ***"we have a governed, auditable skills pipeline".*** That distinction matters as agent-assisted development moves from hobby projects into regulated industries.

### What Still Needs to Happen

Let’s be honest, standardization takes time and it is really hard, companies want to own the space to control the ecosystem and to drive business their way. Companies like [Vercel with skills.sh](https://skills.sh/), [Tessl](https://tessl.io/), and other communities (for example, the [skillsjar project)](https://www.skillsjars.com/) are pushing for their own solutions, their own packaging formats, and targeting audiences that are not particularly interested in reusing existing infrastructure at this point.

On the other hand, any seasoned engineers can point out, this is just the begining, as packaging skills only solves distribution, but not dependency management and relationships between skills and other artifacts, hence it feel like there will be a long journey ahead.

Regarding, the `skills-oci` CLI, I wanted to show the experience I want as a user when working with skills, but the tools aren't important here; the spec is. The `skills-oci` CLI is written in Go and it can be also consumed as a Go library.

I feel quite optimistic about where this is heading — but optimism doesn't write specs. If you're building in this space, come help shape it. Try `skills-oci`, open issues, push back on the proposal if you think something's wrong. The cloud-native ecosystem emerged through open debate, and I expect the agent skills ecosystem will need to do the same.

Drop me a message on [Linkedin](https://linkedin.com/in/salaboy), [X](https://x.com/salaboy) or open an issue at [github.com/salaboy/skills-oci](https://github.com/salaboy/skills-oci) if you want to collaborate on this.
