# §1 — Lifecycle & Approvals

## Design-first sequence (Phase 1)

```
/factory-init
    → /spec-draft   (vision.md, requirements.md, agent-blueprint.md)
    → /spec-review  (human approval recorded in audit.md)
    → [/validate]   (Phase 2)
    → [/compile]    (Phase 2)
```

## Required documents

| File | Purpose | Approval |
|---|---|---|
| `vision.md` | Mission, users, in/out of scope, success measures | Required before finalize |
| `requirements.md` | EARS-style requirements | Required before finalize |
| `agent-blueprint.md` | Compile-ready shape (views, search, agent, RBAC) | Required before validate |
| `audit.md` | Decisions, approvals, assumptions | Updated continuously |

## Approval rules

- **SF004 / SF005:** `/spec-review` must record explicit human approval of vision and requirements in `audit.md` before the blueprint is marked `status: approved`.
- Approvals survive restarts — write them to `audit.md`, do not rely on chat memory.
- **SF017:** Specs must never contain passwords, PATs, private keys, or connection strings with embedded secrets. Reference Snowflake secrets / roles by name only.

## Depth by risk tier

| Tier | Vision | Requirements | Blueprint | Eval (Phase 2) |
|---|---|---|---|---|
| low | short | core EARS | minimal sections | light |
| medium | standard | full EARS | all required sections | standard golden set |
| high | full | full + edge cases | all + HITL + masking detail | comprehensive |

## Forbidden in Phase 1

- Creating Semantic Views, Search services, or Cortex Agents directly in Snowflake without an approved blueprint.
- Skipping `/spec-review` for any agent intended for shared environments.
