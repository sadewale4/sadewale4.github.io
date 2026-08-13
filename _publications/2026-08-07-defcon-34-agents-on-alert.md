---
title: "Agents on Alert: Building an AI-Powered Threat Investigation Framework"
type: "presentation"
date: 2026-08-07
venue: "DEF CON 34"
location: "Las Vegas, NV"
description: "An AI investigation framework for a SOC alert, defined end to end as code. Three Tines agents orchestrate four Snowflake Cortex domain agents to work a live case — and the lesson is that the bottleneck was never the model, it's the data foundation underneath it."
tags: [Agentic AI, Detection Engineering, DFIR, Snowflake Cortex, Tines]
youtube: ""
github: "https://github.com/sadewale4/agents-on-alert"
slides_url: "/publications/agents-on-alert-defcon34.pdf"
paper_url: ""
external_url: "https://hackertracker.app/defcon34/content/67658"
status: "published"
---

# Agents on Alert: Building an AI-Powered Threat Investigation Framework

**Presentation at DEF CON 34, Las Vegas, August 7, 2026**

## Abstract

An AI investigation framework for a SOC alert, defined end to end as code. A GuardDuty finding reports EC2 instance-role credentials being used from outside AWS. Three principals show that exact pattern today; two are legitimate. The real breach is an SSRF in an internet-facing renderer that reaches the instance metadata service, steals the instance-profile credentials, and pivots across cloud, source control, and DNS.

Three Tines agents — triage, investigator, case updater — orchestrate four Snowflake Cortex domain agents plus threat intel and a knowledge base. No specialist can see another plane, so cross-plane correlation is the investigator's job by construction. Every agent is read-only; the human decides.

Thesis: AI is strong at the **Understand** stage of SUDA and weak on either side of it — and the bottleneck was never the model. It was the data foundation underneath it.

## Key Topics

- The capacity gap: detection coverage scales, human capacity doesn't
- SUDA (See / Understand / Decide / Act) — a report card for where agents actually belong
- The data foundation: telemetry breadth, retention depth, organizational knowledge, and the semantic model
- "No query, no claim" — the grounding guard that rejects unretrieved answers
- Agentic infrastructure as code: prompts, tools, roles, and schemas, versioned and reviewable
- The live case: SSRF → IMDS credential theft → cross-plane pivot, worked by agent and audience in parallel

## Takeaways

1. **Start with the data** — agents only reason over what you collected and declared.
2. **Make it prove it looked** — an answer with no query behind it is fiction, however well it reads.
3. **Agentic infrastructure as code** — one unintended prompt change shows up in the verdict, not the output.
4. **Stay accountable for your agents** — they propose. You answer for it.

## Artifacts

- **Slides:** [agents-on-alert-defcon34.pdf](/publications/agents-on-alert-defcon34.pdf) (16 slides)
- **Code:** [github.com/sadewale4/agents-on-alert](https://github.com/sadewale4/agents-on-alert) — the framework as code: scenario generator with a ground-truth answer key, nine source-tool table definitions, four semantic views with a Cortex agent each, the Tines agent instructions and output schemas, and ten saved SQL worksheets for working the case by hand.

The demo environment has been torn down; everything is reproducible from the repo against your own Snowflake and Tines accounts.
