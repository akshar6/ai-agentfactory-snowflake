---
name: naming-and-versioning
description: Snowflake Agent Factory naming and SemVer rules for agents, semantic views, search services, and analyst models (SF009, SF010).
---

# Naming & Versioning

## Object naming (SF009)

| Object | Pattern | Example |
|---|---|---|
| Agent | `agt_<domain>_<purpose>` | `agt_support_intelligence` |
| Semantic View | `sv_<domain>_<entity>` | `sv_support_tickets` |
| Cortex Search | `cs_<domain>_<corpus>` | `cs_support_kb` |
| Analyst model file | `<agent>-semantic-model.yaml` | `support-intelligence-semantic-model.yaml` |
| Database / schema | org convention; blueprint must declare all three envs | `ANALYTICS.SUPPORT_DEV` |

Rules:
- lowercase + underscores for Snowflake object identifiers in blueprints.
- Agent `name` in blueprint front matter is **kebab-case** (`support-intelligence`).
- No spaces, no environment suffixes inside the logical name (`_dev` belongs on schema, not agent name).

## Versioning (SF010)

- Agent `version` and Analyst semantic model version use **SemVer** `MAJOR.MINOR.PATCH`.
- Breaking schema / verified-query removals → MAJOR.
- New metrics/dimensions/queries → MINOR.
- Doc/typo fixes → PATCH.

## Checklist for authors

- [ ] Agent name kebab-case; Snowflake objects snake_case with prefixes above
- [ ] SemVer present on agent and (if used) semantic model
- [ ] No env embedded in object logical names
