# Requirements — support-intelligence

**Status:** draft  
**Owner:** replace.me@anblicks.com  
**Risk tier:** medium

## Structured data path (Semantic View / Cortex Analyst)

1. The agent shall answer ticket volume and status questions from the Semantic View.
2. When a user asks for counts by priority or status, the agent shall use Cortex Analyst over `sv_support_tickets`.
3. If the question cannot be answered from the semantic model, then the agent shall say so and not invent numbers.

## Unstructured knowledge path (Cortex Search)

1. The agent shall retrieve relevant policy/KB passages via `cs_support_kb`.
2. When answering from the KB, the agent shall cite the source document title.

## Non-functional

1. The agent shall respect RBAC and masking on underlying objects.
2. The agent shall not expose secrets or raw connection strings.
3. The agent shall stay within the declared MCP tool budget.

## Open questions

- Confirm real table/stage names in the target Snowflake account
- Confirm service role name and masking policies
