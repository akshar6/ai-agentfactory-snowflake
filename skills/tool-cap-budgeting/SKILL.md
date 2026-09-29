---
name: tool-cap-budgeting
description: Keep factory + agent MCP tools under Snowflake's 50-tool-per-managed-server cap (SF013).
---

# Tool-Cap Budgeting

Snowflake-managed MCP servers enforce a **50-tool maximum** per server.

## Budget model (SF013)

```yaml
mcp_budget:
  server: factory-managed-mcp   # or split name
  factory_tools_reserved: 12    # constitution/validate/compile/learnings/…
  agent_tools_planned: 6
  headroom: 32
  split_plan: null              # or "spcs-self-hosted" / "second-managed-server"
```

Formula:

```
factory_tools_reserved + agent_tools_planned ≤ 50
```

If not:

1. Document `split_plan` in the blueprint, **or**
2. Reduce agent tools (prefer composing Cortex Search + Analyst over many micro-tools), **or**
3. Raise an Open Item — do not silently exceed the cap.

## Counting guidance

Count each distinct MCP tool the agent or factory exposes, not each SQL statement.
Cortex Agent tool bindings that call Search / Analyst each count as tools toward the agent side.

## Phase 1 expectation

Authors must fill `mcp_budget` even before the factory MCP server exists (Phase 3), so Phase 2/3 wiring has a contract.
