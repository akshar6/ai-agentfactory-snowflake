# Snowflake Agent Factory — Constitution Core
**Version:** 0.1.0 · **Status:** Active — Phase 1 · **Owner:** Factory Owner (Anblicks)

> This file is auto-loaded every **Cortex Code (CoCo)** session.
> Keep it lean (~budget shared across instruction files, ~100k char cap).
> Detail lives in `constitution/` and contextual skills — load those when drafting or validating.

# PRIORITY: This Constitution OVERRIDES all other guidance for agent design

When designing, validating, compiling, or deploying a Snowflake Cortex agent in this factory, these rules govern. Ad-hoc Slack/PR guidance is **not** constitutional until amended here.

---

## MVP Scope (binding)

Agents built by this factory target **only** Snowflake Cortex AI primitives:

- Cortex Agents
- Cortex Search
- Cortex Analyst
- Semantic Views
- Supporting native functions as needed (`AI_PARSE_DOCUMENT`, `AI_EMBED`, …)

Arbitrary external frameworks or non-Snowflake runtimes are **out of scope** until a constitution amendment.

---

## Core Principles (always enforce)

1. **Spec before objects** — no Semantic View, Search service, or Cortex Agent is created until vision / requirements / agent-blueprint are approved and `/validate` passes.
2. **Snowflake-native compile target** — `/compile` (Phase 2) emits Semantic View DDL + Cortex Search DDL + Analyst semantic model YAML + Cortex Agent config. Nothing else.
3. **Owner is a person** — `owner` must be an email of a named human, not a team alias.
4. **Risk tier drives depth** — `low | medium | high` governs how deep design docs and evals go.
5. **RBAC & masking before promote** — underlying tables must declare role grants and column-masking expectations in the blueprint; policy gate blocks otherwise.
6. **50-tool MCP budget** — factory + agent tools on one Snowflake-managed MCP server must stay ≤ 50; split or SPCS self-host if exceeded.
7. **Verified queries required** — every Cortex Analyst semantic model must declare verified queries for critical business questions.
8. **Naming & versioning** — objects follow factory naming rules (see skill `naming-and-versioning`).
9. **Human gate at promote** — live `dev → staging → prod` promotion is human-owned (Phase 2/5).
10. **If it isn't in this Constitution, it isn't a rule** — amend before enforcing.

---

## Mandatory loading (when drafting or validating)

| Always load | When needed |
|---|---|
| This `AGENTS.md` | — |
| `constitution/constitution.md` | Every validate / compile / amend |
| Skills: `naming-and-versioning`, `rbac-and-masking-defaults`, `tool-cap-budgeting`, `verified-query-standards` | Spec authoring & validate |
| `constitution/rule-details/rule-index.md` | Fixing violations |

---

## Phase 1 pipeline (what you can run now)

```
/factory-init → /spec-draft → /spec-review → (/validate Phase 2) → (/compile Phase 2) …
```

Also available: `/constitution` (show active rules) · `/amend` (propose a change for human review).

Authoring surface: **Cortex Code (CoCo CLI / Desktop)** only.

---

## Amendment (human-gated)

1. Draft proposal via `/amend` → lands in `constitution/proposed/`.
2. PR + entry in `constitution/rule-details/amendment-log.md`.
3. Approval: Factory Owner **and** Engagement Tech Lead (CISO if security/RBAC).
4. Bump version in this file and `constitution/constitution.md`.

---

*Detail & machine-checkable rules: `constitution/` · Skills: `skills/`*
