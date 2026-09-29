---
name: spec-authoring
description: How to draft vision.md, requirements.md, and agent-blueprint.md for the Snowflake Agent Factory.
---

# Spec Authoring

## Templates

Copy from `templates/spec/`:

- `vision.md`
- `requirements.md`
- `agent-blueprint.md`
- `audit.md`

## Order

1. Confirm the ask is agentic and fits Cortex MVP scope (SF001).
2. Draft `vision.md` → wait for approval (log in `audit.md`).
3. Draft `requirements.md` (EARS) → approval.
4. Draft `agent-blueprint.md` using core-entities + the four constitution skills.
5. Run `/spec-review` for human sign-off.

## EARS forms (requirements)

- Ubiquitous: The agent shall …
- Event-driven: When …, the agent shall …
- State-driven: While …, the agent shall …
- Optional: Where …, the agent shall …
- Unwanted: If …, then the agent shall …

## Do not

- Skip blueprint sections to "fill in later" for shared agents.
- Put credentials in any markdown file.
- Target non-Cortex runtimes without an amendment.
