# /factory-init

One-time setup for a **Snowflake agent project**  -  scaffolds the design-first folder layout and wires it to the Snowflake Agent Factory constitution.

## What it does

1. **Ask** for agent `name` (kebab-case), `owner` email, `risk_tier`, and target database/schema triad (dev/staging/prod).
2. **Create** project directory (default: `projects/<name>/` or path the user gives) with:
   - Note: do **not** put specs under `agents/` — that folder is reserved for CoCo subagent definitions.
   - `vision.md`, `requirements.md`, `agent-blueprint.md`, `audit.md` from `templates/spec/`
   - Placeholder sections filled with the answers above
3. **Confirm** constitution is reachable:
   - Root `AGENTS.md`
   - `constitution/constitution.md`
   - Skills: naming, RBAC/masking, tool-cap, verified-query
4. **Record** init in `audit.md` (timestamp, owner, risk tier).
5. **Print next steps:** `/spec-draft` -> `/spec-review` -> (Phase 2) `/validate` -> `/compile`.

## What it does NOT do

- Does not create Snowflake objects (no DDL, no Cortex Agent).
- Does not skip human approval  -  specs start as `status: draft`.
- Does not install Phase 2/3 pipeline commands as runnable engines (stubs may exist later).

## Usage

```
/factory-init
/factory-init support-intelligence
```

## Behavior

- Idempotent: if the agent folder exists, refresh missing template files only; never overwrite approved docs without confirmation.
- Refuse team-alias owners (SF002)  -  require a person email.
- Enforce kebab-case agent names (SF009).

## See also

- `/spec-draft` | `/spec-review` | `/constitution`
