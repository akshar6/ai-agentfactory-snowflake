# /constitution

Show the active Snowflake Agent Factory constitution for this session.

## What it does

1. Print version and status from root `AGENTS.md` and `constitution/constitution.md`.
2. Summarize the 10 core principles.
3. List SF001-SF020 from `rule-details/rule-index.md` (ID, one-line rule, severity).
4. Point to contextual skills for detail:
   - `naming-and-versioning`
   - `rbac-and-masking-defaults`
   - `tool-cap-budgeting`
   - `verified-query-standards`
5. List any files under `constitution/proposed/` awaiting approval.

## Usage

```
/constitution
/constitution SF014
```

If a rule ID is given, open and explain that rule's detail file/skill and how to satisfy it in `agent-blueprint.md`.

## See also

- `/amend` | `/spec-review`
