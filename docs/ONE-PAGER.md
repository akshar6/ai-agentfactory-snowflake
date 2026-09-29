# Snowflake Agent Factory — Phase 1 One-Pager

## Purpose

Build-time factory for **Snowflake Cortex** agents: design-first specs governed by a constitution, authored in **Cortex Code (CoCo)**, targeting Semantic Views, Cortex Search, Cortex Analyst, and Cortex Agents.

## Phase 1 in one line

**Install constitution + author vision / requirements / agent-blueprint; human-approve via `/spec-review`.**

## Commands

| Command | Does |
|---|---|
| `/factory-init` | Scaffold agent project from templates |
| `/spec-draft` | Draft vision, requirements, blueprint |
| `/spec-review` | Human gate; write approvals to `audit.md` |
| `/constitution` | Show SF001–SF020 + skills |
| `/amend` | Propose constitution change (human-gated) |

## Constitution

- **Lean core:** `AGENTS.md` (session-loaded by CoCo)
- **Detail:** `constitution/` + skills (naming, RBAC/masking, tool-cap, verified queries)
- **Rules:** SF001–SF020 in `constitution/rule-details/rule-index.md`

## Compile target (Phase 2 — author toward it)

Semantic View DDL · Cortex Search DDL · Analyst semantic model YAML · Cortex Agent config

## Snowflake surfaces used

Cortex Code plugin · Cortex Agents · Semantic Views · Cortex Analyst · Cortex Search · (later) Snowflake-managed MCP · Cortex Evaluations

## What is intentionally missing (later phases)

| Phase | Missing now |
|---|---|
| 2 | `/validate`, `/compile`, eval framework, 6-gate `/deploy` |
| 3 | FACTORY_LEARNINGS, managed MCP factory tools, registry |
| 4 | End-to-end pilot deploy |
| 5 | ACCOUNTADMIN deploy runbook |

## Showcase shape

`examples/support-intelligence/` — Cortex Agent + Semantic View/Analyst + Cortex Search (spec only).
