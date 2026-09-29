---
name: rbac-and-masking-defaults
description: Default RBAC grants and column-masking expectations for Snowflake Agent Factory blueprints (SF011, SF012).
---

# RBAC & Masking Defaults

## RBAC (SF011)

Every blueprint `rbac` section must declare:

```yaml
rbac:
  underlying_objects:
    - object: DB.SCHEMA.TABLE
      grants:
        - role: ROLE_SUPPORT_ANALYST
          privileges: [SELECT]
        - role: ROLE_SUPPORT_AGENT_SVC
          privileges: [SELECT]
  agent_service_role: ROLE_SUPPORT_AGENT_SVC
```

Rules:
- List **every** base table/view the Semantic View or Search service reads.
- Prefer least privilege: service role gets SELECT only unless write-back is explicitly in scope (and justified).
- Prod promotion (Phase 2/5) is blocked if grants are missing or use ACCOUNTADMIN as the runtime role.

## Masking (SF012)

When `compliance.tags` includes `PII` / `financial` / data_classification is `confidential` or `restricted`:

```yaml
rbac:
  masking:
    - column: DB.SCHEMA.TABLE.EMAIL
      policy: MASK_EMAIL
    - column: DB.SCHEMA.TABLE.PHONE
      policy: MASK_PHONE
```

Rules:
- Name the **policy expectation** even if the policy object already exists.
- Do not put raw PII examples in the blueprint.
- High-risk agents without masking declarations fail `/spec-review` / later `/validate`.

## Defaults

| Classification | Masking | Notes |
|---|---|---|
| public / internal | optional | Still declare roles |
| confidential | required for PII cols | SF012 |
| restricted | required + HITL for exports | SF019 |
