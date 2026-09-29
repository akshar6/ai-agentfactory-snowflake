# Snowflake Agent Factory

Constitution-governed **build-time** factory for Snowflake Cortex agents.
Same lifecycle pattern as Anblicks' Agent Factory (`spec -> validate -> compile -> deploy -> learn`), implemented on **Snowflake-native** primitives and authored in **Cortex Code (CoCo)**.

> **Phase 1 (this release):** Constitution & Spec Layer — CoCo plugin + `AGENTS.md` + spec authoring commands.  
> **Not yet:** `/validate` machine gate, `/compile` DDL generation, MCP front door, deploy gates (Phases 2–3).

```
/factory-init -> /spec-draft -> /spec-review
     scaffold      vision +          human gate
                   requirements +
                   agent-blueprint
```

- **One-pager:** [docs/ONE-PAGER.md](docs/ONE-PAGER.md)
- **Developer playbook:** [PLAYBOOK.md](PLAYBOOK.md)
- **Constitution (lean):** [AGENTS.md](AGENTS.md)
- **Constitution (detail):** [constitution/](constitution/)

---

## Snowflake-only stack (binding)

| Concern | Snowflake feature |
|---|---|
| Authoring IDE / CLI | Cortex Code (CoCo) |
| Plugin packaging | `.cortex-plugin/plugin.json` |
| Hosted agents | Cortex Agents |
| Structured Q&A | Semantic Views + Cortex Analyst |
| Unstructured Q&A | Cortex Search |
| MCP (Phase 3) | Snowflake-managed MCP Server |
| Eval (Phase 2) | Cortex Agent Evaluations / TruLens |
| Knowledge / learnings (Phase 3) | Snowflake tables + Cortex Search |

Authoring and runtime targets are Snowflake-only (Cortex Code + Cortex AI).

---

## What Phase 1 delivers (plan D01–D03)

| ID | Deliverable | Location |
|---|---|---|
| D01 | Constitution set | `AGENTS.md`, `constitution/`, skills, `/constitution`, `/amend` |
| D02 | Spec templates & commands | `templates/spec/`, `/factory-init`, `/spec-draft`, `/spec-review`, requirements subagent |
| D03 | Installable CoCo plugin | `.cortex-plugin/plugin.json` + root `commands/` `skills/` `agents/` `hooks/` |

**Exit criteria:** Constitution + spec authoring installable as a static asset bundle.

---

## MVP compile target (author toward this)

Even though `/compile` is Phase 2, blueprints describe:

1. Semantic View DDL  
2. Cortex Search service DDL  
3. Cortex Analyst semantic model YAML (+ verified queries)  
4. Cortex Agent config  

---

## Install (Cortex Code only)

```text
cortex plugin install <path-or-git-url-to-this-repo>
```

Or in CoCo Desktop: Agent Settings → Plugins → add this folder / Git URL.

Then run `/factory-init`.

### Local copy into a consumer project

```bash
cp -r ai-agentfactory-snowflake/.cortex-plugin \
      ai-agentfactory-snowflake/commands \
      ai-agentfactory-snowflake/skills \
      ai-agentfactory-snowflake/agents \
      ai-agentfactory-snowflake/hooks \
      ai-agentfactory-snowflake/constitution \
      ai-agentfactory-snowflake/AGENTS.md \
      ai-agentfactory-snowflake/templates \
      your-project/
```

---

## Quick start

1. `/factory-init support-intelligence`  (creates `projects/support-intelligence/`)
2. `/spec-draft` (or edit `examples/support-intelligence/`)
3. `/spec-review` — human approves into `audit.md`
4. Stop here until Phase 2 ships `/validate` + `/compile`

---

## Repo layout (native CoCo plugin)

```
AGENTS.md                 lean always-loaded constitution core
.cortex-plugin/           Cortex Code plugin manifest
commands/                 /factory-init /spec-draft /spec-review /constitution /amend
agents/                   CoCo subagents (requirements)
skills/                   naming | rbac | tool-cap | verified-query | spec-authoring
constitution/             detail rules SF001-SF020
hooks/                    SessionStart | Stop | PostToolUse
templates/spec/           vision | requirements | agent-blueprint | audit
projects/                 (created by /factory-init — agent specs live here)
examples/support-intelligence/   Phase 4 showcase shape (spec only)
docs/                     ONE-PAGER
PLAYBOOK.md
```

Matches Snowflake's documented plugin layout:
https://docs.snowflake.com/en/user-guide/cortex-code/cortex-code-plugins

---

## Phased roadmap (from build-time plan)

| Phase | Focus | Status |
|---|---|---|
| **1** | Constitution & Spec Layer | **Done (this repo)** |
| 2 | `/validate` · `/compile` · eval · 6-gate `/deploy` | Not started |
| 3 | FACTORY_LEARNINGS · Snowflake MCP · registry | Not started |
| 4 | Pilot agent through full pipeline | Not started |
| 5 | Deploy runbook / ACCOUNTADMIN workflow | Not started |

---

*Anblicks — Enterprise AI & Decision Intelligence · Snowflake Cortex*
