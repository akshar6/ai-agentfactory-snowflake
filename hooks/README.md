# Hooks (Cortex Code)

Lifecycle hooks for the Snowflake Agent Factory plugin.

Configured in `hooks.json` and referenced from `.cortex-plugin/plugin.json`.

| Event | Script | Purpose |
|---|---|---|
| SessionStart | `session-start.sh` | Prime constitution + Phase 1 flow |
| Stop | `spec-reminder.sh` | Nudge unfinished draft blueprints toward `/spec-review` |
| PostToolUse | `post-edit-guard.sh` | Spec / constitution / secret guardrails |

`CLAUDE_PLUGIN_ROOT` in hook commands is the **plugin-engine** path variable injected by Cortex Code's plugin runtime when a plugin hook runs (same extensibility engine CoCo documents for hooks). It is not an authoring dependency on a non-Snowflake IDE.
