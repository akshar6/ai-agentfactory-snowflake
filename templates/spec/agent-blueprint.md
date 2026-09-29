# Agent Blueprint — {{agent_name}}

**Status:** draft  
**Constitution:** Snowflake Agent Factory 0.1.0

```yaml
agent:
  name: {{agent_name}}
  version: 0.1.0
  description: >
    {{description}}
  owner: {{owner_email}}
  pattern: cortex-agent

compliance:
  risk_tier: {{risk_tier}}
  tags: []
  data_classification: internal

targets:
  database: {{database}}
  schema_dev: {{schema}}_DEV
  schema_staging: {{schema}}_STG
  schema_prod: {{schema}}

tools:
  structured:
    - name: ask_structured
      kind: cortex-analyst
      semantic_view: sv_{{domain}}_main
      capability: structured-qa
  unstructured:
    - name: search_knowledge
      kind: cortex-search
      search_service: cs_{{domain}}_kb
      capability: unstructured-qa

semantic_views:
  - name: sv_{{domain}}_main
    base_objects:
      - {{database}}.{{schema}}.{{table_or_view}}
    dimensions: []
    metrics: []

cortex_search:
  - name: cs_{{domain}}_kb
    source: {{stage_or_table}}
    embedding: AI_EMBED   # confirm model at compile time

cortex_analyst:
  semantic_model: {{agent_name}}-semantic-model.yaml
  verified_queries:
    - name: example_metric
      question: "Replace with a real business question"
      sql: |
        SELECT 1 AS placeholder

cortex_agent:
  name: agt_{{domain}}_main
  tools:
    - ask_structured
    - search_knowledge
  instructions: >
    Answer using structured tools for metrics and search for policy/KB text.
    Never invent numbers. Cite sources when using search.

rbac:
  agent_service_role: ROLE_{{DOMAIN}}_AGENT_SVC
  underlying_objects:
    - object: {{database}}.{{schema}}.{{table_or_view}}
      grants:
        - role: ROLE_{{DOMAIN}}_AGENT_SVC
          privileges: [SELECT]
  masking: []

mcp_budget:
  server: factory-managed-mcp
  factory_tools_reserved: 12
  agent_tools_planned: 2
  headroom: 36
  split_plan: null

hitl:
  enabled: false
  # required when risk_tier: high
```

## Notes for compile (Phase 2)

- Replace placeholders before `/spec-review` approval.
- Verified queries must be real SQL against the semantic model (SF014).
