# /spec-draft

Draft the Phase 1 spec set for a Snowflake Cortex agent: `vision.md`, `requirements.md`, and `agent-blueprint.md`.

## What it produces

In the agent project directory (created by `/factory-init` or specified by the user):

| File | Content |
|---|---|
| `vision.md` | Mission, users, in/out of scope, success measures |
| `requirements.md` | EARS requirements for structured + unstructured paths |
| `agent-blueprint.md` | Compile-ready blueprint (Semantic View, Search, Analyst, Agent, RBAC, MCP budget) |
| `audit.md` | Assumptions, open questions, pending approvals |

## How it works

0. **Load constitution context**  -  `AGENTS.md`, `constitution/constitution.md`, rule-index, and skills:
   `naming-and-versioning`, `rbac-and-masking-defaults`, `tool-cap-budgeting`, `verified-query-standards`, `spec-authoring`.
1. **Prefer the Requirements subagent** (`agents/requirements.md`) for structured interviewing when the ask is vague.
2. **Confirm MVP fit (SF001)**  -  Cortex Agent + Semantic View/Analyst and/or Cortex Search only. If not, stop and propose an amendment or a non-factory path.
3. **Classify risk tier (SF003)**  -  surface signals (PII, customer-facing, write-back) and get user confirmation.
4. **Draft vision** -> pause for feedback (do not invent approvals).
5. **Draft requirements** in EARS  -  cover structured questions and unstructured KB questions when both tools are in scope.
6. **Draft agent-blueprint** with all required sections from `core-entities.md`, including:
   - `semantic_views` / `cortex_search` / `cortex_analyst.verified_queries`
   - `rbac` grants + masking expectations
   - `mcp_budget`
   - env targets (SF016)
7. **List open questions** in `audit.md` (do not silently guess table names or roles).

## Behavior

- Uses templates under `templates/spec/` as the starting point.
- Refuses secrets in documents (SF017).
- Owner must be a person email (SF002).
- Does **not** mark docs approved  -  that is `/spec-review`.

## See also

- `/factory-init` | `/spec-review` | `/constitution` | `/amend`
