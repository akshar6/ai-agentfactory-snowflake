#!/usr/bin/env bash
# Snowflake Agent Factory — SessionStart priming (Phase 1) for Cortex Code
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$SCRIPT_DIR")"
CONSTITUTION="$ROOT/constitution/constitution.md"
AGENTS="$ROOT/AGENTS.md"

if ! command -v jq >/dev/null 2>&1; then
  echo '{"priority":"INFO","message":"snowflake-agent-factory: jq not found — session priming skipped. Run /constitution manually."}'
  exit 0
fi

VERSION=$(grep -m1 -i 'Version:' "$AGENTS" 2>/dev/null | head -1 | sed 's/[*]//g' || true)
[[ -z "${VERSION:-}" ]] && VERSION=$(grep -m1 -i '^\*\*Version:\*\*' "$CONSTITUTION" 2>/dev/null | sed 's/[*]//g' || echo "0.1.0")

MSG="snowflake-agent-factory Phase 1 loaded (Cortex Code). The Constitution governs every Cortex agent spec.

CONSTITUTION: ${VERSION} (SF001–SF020)
FLOW: /factory-init → /spec-draft → /spec-review
ALSO: /constitution · /amend
NOTE: /validate · /compile · /deploy arrive in Phase 2 — do not create Snowflake objects from an unapproved blueprint.

Keep AGENTS.md lean; detail is in constitution/ and skills/."

jq -cn --arg m "$MSG" '{priority:"IMPORTANT", message:$m}'
