---
name: verified-query-standards
description: Verified-query requirements for Cortex Analyst semantic models (SF014, SF015).
---

# Verified Query Standards

## When required (SF014)

If the blueprint uses Cortex Analyst (structured Q&A over a Semantic View / semantic model), the blueprint **must** include at least one **verified query**.

```yaml
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
```

## Coverage (SF015 — advisory → enforced for high risk)

- Cover the top business questions called out in `requirements.md`.
- Prefer deterministic aggregations; avoid `SELECT *`.
- SQL must reference entities/metrics defined in the semantic model — no ad-hoc tables.

## Authoring checklist

- [ ] ≥ 1 verified query when Analyst is in scope (SF014)
- [ ] Each verified query has `name`, `question`, and `sql`
- [ ] Questions map to requirements / success measures
- [ ] No secrets in SQL; use role-appropriate objects only
