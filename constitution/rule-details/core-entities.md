# §2 — Core Entities (Agent Blueprint)

The **Agent Blueprint** (`agent-blueprint.md`) is the Phase 1 equivalent of the AWS factory's `harness.yaml`. Phase 2 `/compile` will turn it into DDL + YAML + agent config.

## Required front matter / sections

Every blueprint MUST include:

```yaml
agent:
  name: <kebab-case>           # SF009
  version: <semver>            # SF010
  description: <one paragraph>
  owner: <person@company.com>  # SF002
  pattern: cortex-agent

compliance:
  risk_tier: low|medium|high   # SF003
  tags: []                     # SF018 when applicable
  data_classification: public|internal|confidential|restricted

targets:
  database: <DB>
  schema_dev: <SCHEMA>_DEV
  schema_staging: <SCHEMA>_STG
  schema_prod: <SCHEMA>        # SF016

tools:                         # SF007 / SF008
  structured: []               # Semantic View / Analyst
  unstructured: []             # Cortex Search

semantic_views: []
cortex_search: []
cortex_analyst: {}             # optional; required if structured Q&A
cortex_agent: {}
rbac: {}                       # SF011 / SF012
mcp_budget: {}                 # SF013
hitl: {}                       # SF019 if high
```

## Tool rules

- **SF007:** Each structured capability names the Semantic View (and Analyst model if used).
- **SF008:** Each unstructured capability names the Cortex Search service and source stage/table.
- Do not invent tools outside Cortex (custom external runtimes) without a constitution amendment (SF001).

## High-risk extras (SF019)

When `risk_tier: high`, blueprint must declare:

- Human approval / escalation path
- What actions are blocked without approval
- Audit expectations (who / what is logged)

## Owner (SF002)

Valid: `jane.doe@anblicks.com`  
Invalid: `ai-team@anblicks.com`, `Platform Team`, `#agent-factory`
