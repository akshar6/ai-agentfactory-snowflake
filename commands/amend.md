# /amend

Draft a **constitution amendment proposal** for human review. Does not change active rules.

## What it does

1. Interview for: problem, proposed change, affected SF### IDs (or NEW), evidence, requester email.
2. Write `constitution/proposed/YYYY-MM-DD-<slug>.md` with:

```markdown
# Amendment Proposal  -  <title>
- date:
- requester:
- status: proposed
- affects: SF### / NEW

## Problem
## Proposed rule text
## Why now
## Evidence / examples
## Rollout impact (specs, compile, deploy)
## Approvals needed
- [ ] Factory Owner
- [ ] Engagement Tech Lead
- [ ] CISO (if RBAC/security)
```

3. Remind: merge only after approvals; then update `rule-details/`, `amendment-log.md`, and bump versions in `AGENTS.md` + `constitution.md`.

## Behavior

- Never silently edit active rule-details.
- If the change is actually a one-off project exception, recommend `override` notes in the agent `audit.md` instead of a global amendment  -  unless the requester insists on a global rule.

## See also

- `/constitution` | SF020
