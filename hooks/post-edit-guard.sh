#!/usr/bin/env bash
# PostToolUse guard — blueprint / constitution / secret nudges (Phase 1)
payload="$(cat 2>/dev/null)"

if command -v jq >/dev/null 2>&1; then
  path="$(printf '%s' "$payload" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null)"
else
  path="$(printf '%s' "$payload" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]+"' | head -1 | sed -E 's/.*"file_path"[^"]*"([^"]+)"/\1/')"
fi
[ -z "$path" ] && exit 0

msgs=""

case "$path" in
  *agent-blueprint.md|*vision.md|*requirements.md)
    msgs="${msgs}• Spec doc changed → run /spec-review before treating it as approved (SF004/SF005).\n" ;;
esac

case "$path" in
  */constitution/*|constitution/*|*/AGENTS.md|AGENTS.md)
    msgs="${msgs}• Constitution edited → use /amend + amendment-log + version bump + Owner/Tech Lead approval (SF020). Out-of-band edits are not constitutional.\n" ;;
esac

case "$path" in
  *.md|*.yml|*.yaml|*.sql|*.env*|*.json)
    if [ -f "$path" ] && grep -nEi \
        'sk_live_[0-9a-z]+|AKIA[0-9A-Z]{12,}|ghp_[0-9A-Za-z]{20,}|-----BEGIN (RSA |EC )?PRIVATE KEY-----|(password|passwd|secret|api[_-]?key|token|pat)[[:space:]]*[:=][[:space:]]*["'"'"'][^"'"'"']{8,}' \
        "$path" >/dev/null 2>&1; then
      msgs="${msgs}• Possible secret in ${path##*/} — remove it (SF017). Use Snowflake secrets / roles by name only.\n"
    fi ;;
esac

[ -z "$msgs" ] && exit 0

full="$(printf 'snowflake-agent-factory guard:\n%b' "$msgs")"
if command -v jq >/dev/null 2>&1; then
  jq -cn --arg m "$full" '{priority:"IMPORTANT", message:$m}'
else
  printf '%s\n' "$full"
fi
