# PLAYBOOK — Build an agent (Phase 1)

How to author a governed Snowflake Cortex agent spec with this factory in **Cortex Code (CoCo)**.

## Prerequisites

- Cortex Code (CoCo CLI or Desktop) with this plugin installed
- Read [AGENTS.md](AGENTS.md) once
- Know your target Snowflake database/schemas (even if objects are not created yet)

## Steps

### 1. Initialize a project

```
/factory-init my-agent-name
```

Creates an agent folder (default `projects/my-agent-name/` or the path you choose) with templates from `templates/spec/`.  
(`agents/` is reserved for CoCo subagent definitions such as `requirements.md`.)

Owner must be a **person email** (SF002). Agent name must be **kebab-case** (SF009).

### 2. Draft the spec

```
/spec-draft
```

Or invoke the **requirements** subagent for a structured interview.

Produce:

- `vision.md`
- `requirements.md` (EARS)
- `agent-blueprint.md` (Semantic View + Search + Analyst + Agent + RBAC + MCP budget)
- `audit.md` (open questions)

Load these skills while drafting:

- `naming-and-versioning`
- `rbac-and-masking-defaults`
- `tool-cap-budgeting`
- `verified-query-standards`

### 3. Human review gate

```
/spec-review
```

Reviewer walks SF001–SF020. On approval, `/spec-review` writes an **Approval** block into `audit.md`.

Do **not** self-approve in chat without writing `audit.md`.

### 4. Stop (Phase 1 boundary)

You now have an approved blueprint. Phase 2 will add:

```
/validate -> /compile -> /test-generate -> /test-run -> /deploy -> /register
```

Until then, do not manually create production Snowflake objects outside the factory unless the engagement explicitly allows a parallel path.

## Using the example

`examples/support-intelligence/` is a filled draft for the plan's showcase (tickets + KB).

1. Copy it to a working agent folder
2. Replace `replace.me@anblicks.com` and object names
3. Run `/spec-review`

## Amending rules

```
/constitution          # show active rules
/amend                 # propose a change -> constitution/proposed/
```

## Checklist before calling Phase 1 "done" for an agent

- [ ] Vision approved in `audit.md`
- [ ] Requirements approved in `audit.md`
- [ ] Blueprint has owner, risk tier, env targets
- [ ] Structured and/or unstructured tools declared
- [ ] RBAC (+ masking if PII/confidential)
- [ ] MCP budget <= 50 or split_plan set
- [ ] Verified query present if Analyst is used
- [ ] No secrets in any markdown file
