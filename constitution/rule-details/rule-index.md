# Rule Index — Snowflake Agent Factory

Machine-oriented index. Phase 1: authors and `/spec-review` enforce these.
Phase 2: `/validate` will fail the build on ENFORCED violations.

| ID | Rule | Severity | Detail |
|---|---|---|---|
| SF001 | Agent targets only Cortex primitives (Agents, Search, Analyst, Semantic Views) | ENFORCED | technology-stack.md |
| SF002 | Owner must be a person email, not a team alias | ENFORCED | core-entities.md |
| SF003 | Risk tier `low\|medium\|high` declared | ENFORCED | core-entities.md |
| SF004 | Vision approved before blueprint finalize | ENFORCED | lifecycle.md |
| SF005 | Requirements approved before blueprint finalize | ENFORCED | lifecycle.md |
| SF006 | Agent blueprint present with required sections | ENFORCED | core-entities.md |
| SF007 | Every structured tool maps to a Semantic View (or justified Analyst model) | ENFORCED | core-entities.md |
| SF008 | Every unstructured tool maps to a Cortex Search service | ENFORCED | core-entities.md |
| SF009 | Object names follow factory naming convention | ENFORCED | naming-and-versioning skill |
| SF010 | Version string SemVer on agent + semantic model | ENFORCED | naming-and-versioning skill |
| SF011 | Underlying tables list intended roles / grants | ENFORCED | rbac-and-masking-defaults skill |
| SF012 | PII/sensitive columns declare masking policy expectation | ENFORCED | rbac-and-masking-defaults skill |
| SF013 | Total MCP tools (factory + agent) ≤ 50 or split plan documented | ENFORCED | tool-cap-budgeting skill |
| SF014 | Cortex Analyst model includes ≥ 1 verified query when Analyst is used | ENFORCED | verified-query-standards skill |
| SF015 | Critical business questions covered by verified queries | ADVISORY | verified-query-standards skill |
| SF016 | Dev / staging / prod database or schema targets declared | ENFORCED | core-entities.md |
| SF017 | No secrets or credentials in spec documents | ENFORCED | lifecycle.md |
| SF018 | Compliance tags listed when PII/financial/regulated data is in scope | ENFORCED | core-entities.md |
| SF019 | HITL / escalation path declared for `risk_tier: high` | ENFORCED | core-entities.md |
| SF020 | Amendments go through `/amend` + human approval | ENFORCED | amendment-log.md |
