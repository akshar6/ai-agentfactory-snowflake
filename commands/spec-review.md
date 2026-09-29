# /spec-review

Human-in-the-loop review gate for Phase 1 specs. Survives restarts by writing approvals into `audit.md`.

## What it does

1. **Load** `vision.md`, `requirements.md`, `agent-blueprint.md`, `audit.md`.
2. **Checklist against SF001-SF020** (see `constitution/rule-details/rule-index.md` and the four constitution skills).
3. **Present** a pass/fail table to the human reviewer with concrete gaps (missing owner, no verified queries, no masking, MCP budget overrun, etc.).
4. **On human approval**, append to `audit.md`:

```markdown
## Approval
- date: <ISO date>
- reviewer: <person email>
- vision: approved
- requirements: approved
- agent-blueprint: approved
- notes: <optional>
```

5. Set blueprint status to `approved` only after explicit human confirmation in chat.
6. **On rejection**, list required edits; do not approve partially without recording which sections remain open.

## Behavior

- Never invent approval  -  the human must say approve / LGTM / equivalent.
- Block "approved" status if ENFORCED rules fail (SF002, SF006-SF014, SF016-SF019 as applicable).
- Remind that Phase 2 `/validate` will machine-check the same rules.

## Exit

Print next steps:

```
Phase 1 complete for this agent -> Phase 2: /validate -> /compile -> /deploy
```

## See also

- `/spec-draft` | `/constitution` | `/amend`
