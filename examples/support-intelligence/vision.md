# Vision — support-intelligence

**Status:** draft  
**Owner:** replace.me@anblicks.com  
**Risk tier:** medium

## Mission (one sentence)

Help support analysts answer ticket/order metrics and policy questions using governed Snowflake data and the support knowledge base.

## Users

- Primary: Support analysts
- Secondary: Support managers (read-only metrics)

## In scope

- Structured Q&A over tickets and orders via Semantic View + Cortex Analyst
- Unstructured Q&A over support KB documents via Cortex Search
- Read-only answers with citations for KB hits

## Out of scope

- Writing back to ticketing systems
- Non-Snowflake runtimes
- Training custom LLMs

## Success measures

- Correct answers to verified metric questions (groundedness)
- KB answers cite source docs
- No PII leakage beyond masking policy

## Constraints

- Snowflake Cortex MVP only
- No credentials in this document
