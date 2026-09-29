# §3 — Approved Technology Stack (MVP)

## In scope (SF001)

| Capability | Snowflake primitive | Notes |
|---|---|---|
| Hosted agent | Cortex Agents | Primary runtime |
| Structured Q&A | Semantic Views + Cortex Analyst | Business metadata + verified queries |
| Unstructured Q&A | Cortex Search | Over stages / tables / docs |
| Embeddings / parse | `AI_EMBED`, `AI_PARSE_DOCUMENT` | As needed by Search or ingest |
| MCP front door | Snowflake-managed MCP Server | ≤ 50 tools (SF013); SPCS fallback later |
| Guardrails | Cortex AI Guardrails | Runtime (mapped; Phase 2+ wiring) |
| Eval engine | Cortex Agent Evaluations / TruLens | Factory owns test cases (Phase 2) |
| Observability | AI_OBSERVABILITY_EVENTS / Snowflake Trail | Runtime |
| Identity | SERVICE_AGENT / Snowflake OAuth / WIF / PAT | Prefer WIF in prod |

## Out of scope until amendment

- LangGraph / Bedrock AgentCore / Azure Foundry as the agent host
- Arbitrary container agents not exposed as Cortex Agents
- Non-Snowflake vector DBs as the primary knowledge plane for factory-built agents

## Compile outputs (Phase 2 target — author specs toward these)

1. Semantic View DDL  
2. Cortex Search service DDL  
3. Cortex Analyst semantic model YAML  
4. Cortex Agent configuration  

Phase 1 authors must describe these in `agent-blueprint.md` even though `/compile` is not shipped yet.
