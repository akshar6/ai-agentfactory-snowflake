#!/usr/bin/env bash
# Reminder on Stop: unfinished Phase 1 specs should go through /spec-review
set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  exit 0
fi

# Best-effort: if agent-blueprint.md exists as draft somewhere under cwd, nudge.
if find . -name 'agent-blueprint.md' 2>/dev/null | head -1 | grep -q .; then
  if grep -Rql --include='agent-blueprint.md' 'Status:\*\* draft\|status: draft\|\*\*Status:\*\* draft' . 2>/dev/null \
     || grep -Rql --include='agent-blueprint.md' 'Status: draft' . 2>/dev/null; then
    MSG="snowflake-agent-factory: draft agent-blueprint.md detected. Finish with /spec-review before compile/deploy (Phase 2)."
    jq -cn --arg m "$MSG" '{priority:"INFO", message:$m}'
  fi
fi
exit 0
