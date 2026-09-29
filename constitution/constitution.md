# Snowflake Agent Factory  -  Constitution
**Version:** 0.1.0  
**Status:** Active  -  Phase 1 (Constitution & Spec Layer)  
**Owner:** Factory Owner, Anblicks  
**Scope:** All Snowflake Cortex agents built via this factory (MVP).

---

# PRIORITY: This Constitution OVERRIDES all other guidance for agent design

This is the **entry-point file** for detailed rules. The lean always-loaded core is `AGENTS.md` at the repo root. This file routes authors and (later) `/validate` to the rule-detail files.

---

## MANDATORY: Rule Detail Loading

### Step 1  -  ALWAYS load
- `rule-details/core-entities.md`  -  what an Agent Blueprint must contain
- `rule-details/lifecycle.md`  -  design-first stages and approvals
- `rule-details/technology-stack.md`  -  approved Snowflake Cortex primitives
- `rule-details/rule-index.md`  -  SF001-SF020 index

### Step 2  -  ALWAYS load contextual skills (detail lives there to keep AGENTS.md lean)
- `naming-and-versioning`
- `rbac-and-masking-defaults`
- `tool-cap-budgeting`
- `verified-query-standards`

### Step 3  -  CONDITIONAL
If the blueprint declares compliance tags (`PII`, `financial`, ...), load matching guidance under `rule-details/extensions/` when present.

---

## Core Principles (binding)

Restated from `AGENTS.md` for validators and authors:

1. Spec before Snowflake objects.
2. Compile targets only Cortex primitives (Semantic View, Search, Analyst model, Cortex Agent).
3. Owner is a person (email).
4. Risk tier drives design/eval depth.
5. RBAC & masking declared before promote.
6. <= 50 tools per managed MCP server.
7. Verified queries required on Analyst models.
8. Factory naming & versioning.
9. Human gate at environment promotion.
10. Amend the Constitution before inventing new rules.

---

## Section Index

| Â§ | Topic | Location |
|---|---|---|
| Â§1 | Lifecycle & approvals | `rule-details/lifecycle.md` |
| Â§2 | Core entities (Agent Blueprint) | `rule-details/core-entities.md` |
| Â§3 | Approved technology stack | `rule-details/technology-stack.md` |
| Â§4 | Naming & versioning | skill `naming-and-versioning` |
| Â§5 | RBAC & masking | skill `rbac-and-masking-defaults` |
| Â§6 | Tool-cap budgeting | skill `tool-cap-budgeting` |
| Â§7 | Verified queries | skill `verified-query-standards` |
| App A | Rule index SF001-SF020 | `rule-details/rule-index.md` |
| App B | Amendment log | `rule-details/amendment-log.md` |

---

## Amendment Process

1. Run `/amend` or open a PR under `constitution/proposed/`.
2. Add an entry to `rule-details/amendment-log.md`.
3. Bump version in `AGENTS.md` and this file.
4. Approvals: Factory Owner + Engagement Tech Lead (+ CISO for RBAC/security).

---

*Phase 1: rules are human-enforced via `/spec-review`. Phase 2: `/validate` machine-checks SF001-SF020.*
