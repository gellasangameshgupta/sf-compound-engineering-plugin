# Salesforce Skills Index

This index helps you find the right skill (domain knowledge) for your task. Read only the skills relevant to what you're building.

---

## CRITICAL: Routing Validation

**Before reading any skill files, confirm your task classification from the command.**

| Your Classification | Read These Skills | DO NOT Read |
|--------------------|-------------------|-------------|
| AUTOMATION | `governor-limits`, `flow-patterns`, `security-guide` | `apex-patterns`, `lwc-patterns` |
| APEX | `governor-limits`, `apex-patterns`, `security-guide`, `test-factory` | `flow-patterns`, `lwc-patterns` |
| LWC | `governor-limits`, `lwc-patterns`, `security-guide` | `flow-patterns`, `apex-patterns` (unless Apex controller) |
| INTEGRATION | `governor-limits`, `integration-patterns`, `security-guide` | `flow-patterns`, `lwc-patterns` |
| ARCHITECTURE | `governor-limits`, `security-guide` | Context-dependent |

**STOP: If your task is about Flows, do NOT read `apex-patterns`. If your task is about Apex, do NOT read `flow-patterns`.**

---

## How to Use This Index

1. **CONFIRM** your task classification from the command
2. **READ** `governor-limits` (applies to ALL classifications)
3. **READ ONLY** the skills matching your classification
4. **DO NOT** read skills for other classifications

---

## Available Skills

| Skill | File | Scope | Use When |
|-------|------|-------|----------|
| Governor Limits | `governor-limits/SKILL.md` | **UNIVERSAL** | **Always** - Any Apex, Flow, or trigger work |
| Apex Patterns | `apex-patterns/SKILL.md` | **APEX_ONLY** | Writing Apex classes, triggers, services. **NOT for Flows.** |
| Flow Patterns | `flow-patterns/SKILL.md` | **AUTOMATION_ONLY** | Building any type of Flow. **NOT for Apex.** |
| LWC Patterns | `lwc-patterns/SKILL.md` | **LWC_ONLY** | Building Lightning Web Components |
| Security Guide | `security-guide/SKILL.md` | **UNIVERSAL** | CRUD/FLS, sharing, permissions, AppExchange |
| Integration Patterns | `integration-patterns/SKILL.md` | **INTEGRATION_ONLY** | Callouts, APIs, Platform Events |
| Test Factory | `test-factory/SKILL.md` | **APEX_ONLY** | Writing Apex test classes, test data factories |

---

## Quick Reference: Which Skills for Which Task?

**VALIDATION**: Match your task classification to the correct row. Do NOT cross-load skills.

| If you're building... | Classification | Read these skills | DO NOT Read |
|-----------------------|----------------|-------------------|-------------|
| Apex Trigger | APEX | `governor-limits`, `apex-patterns`, `security-guide` | `flow-patterns` |
| Apex Service Class | APEX | `governor-limits`, `apex-patterns` | `flow-patterns` |
| Apex Test Class | APEX | `test-factory`, `governor-limits` | `flow-patterns` |
| Record-Triggered Flow | AUTOMATION | `governor-limits`, `flow-patterns` | `apex-patterns` |
| Screen Flow | AUTOMATION | `flow-patterns` | `apex-patterns` |
| Scheduled Flow | AUTOMATION | `governor-limits`, `flow-patterns` | `apex-patterns` |
| LWC Component | LWC | `lwc-patterns`, `security-guide` | `flow-patterns`, `apex-patterns` |
| LWC with Apex | LWC + APEX | `lwc-patterns`, `apex-patterns`, `governor-limits` | `flow-patterns` |
| REST API | INTEGRATION | `integration-patterns`, `security-guide`, `governor-limits` | `flow-patterns` |
| External Callout | INTEGRATION | `integration-patterns`, `governor-limits` | `flow-patterns` |
| Platform Event | INTEGRATION | `integration-patterns`, `governor-limits` | `flow-patterns` |
| AppExchange Package | UNIVERSAL | `security-guide`, `governor-limits` | Context-dependent |

---

## Skill Summaries

### Governor Limits
The most critical skill. Contains all Salesforce limits (SOQL, DML, CPU, Heap) and patterns to avoid limit exceptions. **Read this for any backend work.**

### Apex Patterns
Trigger handler frameworks, service layer patterns, selector patterns, domain patterns. Use when designing Apex class structure.

### Flow Patterns
Flow design patterns, bulkification in Flows, subflows, invocable actions. Use when building declarative automation.

### LWC Patterns
Component architecture, wire vs imperative, event handling, state management. Use when building frontend components.

### Security Guide
CRUD/FLS enforcement, sharing model, permission sets, secure coding. **Required for AppExchange or any security review.**

### Integration Patterns
Named Credentials, callout patterns, retry logic, Platform Events, Change Data Capture. Use for any external system integration.

### Test Factory
TestDataFactory patterns, mock patterns, bulk test strategies. Use when writing test classes.

---

## When to Use WebSearch Instead

Use WebSearch when:
- The skill doesn't cover your specific scenario
- You need the latest Salesforce release notes
- You're working with a newer feature not in the skills
- You need community solutions from Salesforce Stack Exchange

Search these sites:
- `site:developer.salesforce.com` - Official documentation
- `site:salesforce.stackexchange.com` - Community solutions
- `site:help.salesforce.com` - Admin documentation
