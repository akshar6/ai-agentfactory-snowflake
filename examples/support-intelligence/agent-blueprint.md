# Agent Blueprint — support-intelligence

**Status:** draft  
**Constitution:** Snowflake Agent Factory 0.1.0

```yaml
agent:
  name: support-intelligence
  version: 0.1.0
  description: >
    Support intelligence agent combining Semantic View / Cortex Analyst for
    ticket metrics and Cortex Search over the support knowledge base.
  owner: replace.me@anblicks.com
  pattern: cortex-agent

compliance:
  risk_tier: medium
  tags: [PII]
  data_classification: confidential

targets:
  database: ANALYTICS
  schema_dev: SUPPORT_DEV
  schema_staging: SUPPORT_STG
  schema_prod: SUPPORT

tools:
  structured:
    - name: ask_structured
      kind: cortex-analyst
      semantic_view: sv_support_tickets
      capability: structured-qa
  unstructured:
    - name: search_knowledge
      kind: cortex-search
      search_service: cs_support_kb
      capability: unstructured-qa

semantic_views:
  - name: sv_support_tickets
    base_objects:
      - ANALYTICS.SUPPORT.TICKETS
      - ANALYTICS.SUPPORT.ORDERS
    dimensions:
      - name: status
      - name: priority
      - name: created_date
    metrics:
      - name: ticket_count
        expression: COUNT(*)

cortex_search:
  - name: cs_support_kb
    source: ANALYTICS.SUPPORT.KB_DOCS_STAGE
    embedding: AI_EMBED

cortex_analyst:
  semantic_model: support-intelligence-semantic-model.yaml
  verified_queries:
    - name: open_tickets_by_priority
      question: "How many open tickets are there by priority?"
      sql: |
        SELECT priority, COUNT(*) AS open_count
        FROM tickets
        WHERE status = 'OPEN'
        GROUP BY priority

cortex_agent:
  name: agt_support_intelligence
  tools:
    - ask_structured
    - search_knowledge
  instructions: >
    Use Analyst for metrics. Use Search for policy/KB text. Never invent numbers.
    Cite KB sources. Refuse write-back requests.

rbac:
  agent_service_role: ROLE_SUPPORT_AGENT_SVC
  underlying_objects:
    - object: ANALYTICS.SUPPORT.TICKETS
      grants:
        - role: ROLE_SUPPORT_AGENT_SVC
          privileges: [SELECT]
    - object: ANALYTICS.SUPPORT.ORDERS
      grants:
        - role: ROLE_SUPPORT_AGENT_SVC
          privileges: [SELECT]
  masking:
    - column: ANALYTICS.SUPPORT.TICKETS.CUSTOMER_EMAIL
      policy: MASK_EMAIL

mcp_budget:
  server: factory-managed-mcp
  factory_tools_reserved: 12
  agent_tools_planned: 2
  headroom: 36
  split_plan: null

hitl:
  enabled: false
```

## Notes

Replace `replace.me@anblicks.com` and object names before `/spec-review`.
This example is the Phase 4 showcase shape; Phase 1 only authors the spec.
