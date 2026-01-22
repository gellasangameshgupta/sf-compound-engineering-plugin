# Salesforce Agents Index

This index helps you find the right agent for your task. Read only the agents relevant to what you're building.

---

## CRITICAL: Routing Validation

**Before reading any agent files, confirm your task classification from the command.**

| Your Classification | Read ONLY This Section | DO NOT Read |
|--------------------|------------------------|-------------|
| AUTOMATION | Flow & Automation | Apex Development, LWC |
| APEX | Apex Development | Flow & Automation |
| LWC | Lightning Web Components | Flow & Automation (unless Apex controller needed) |
| INTEGRATION | Integration | Flow & Automation |
| ARCHITECTURE | Architecture & Data Model | N/A (applies broadly) |

**STOP: If your task is about Flows/Automation, skip directly to "Flow & Automation" section. Do NOT read Apex agents.**

---

## How to Use This Index

1. **CONFIRM** your task classification from the command
2. **NAVIGATE** directly to the matching category below
3. **READ ONLY** the agents in that category
4. **DO NOT** read agents from other categories

---

## Apex Development

**SCOPE: APEX_ONLY** - Use these agents ONLY when building Apex classes, triggers, or batch jobs.
**DO NOT** use these agents for Flows, LWC frontend-only work, or declarative automation.

Use these agents when building Apex classes, triggers, or batch jobs.

| Agent | File | Use When |
|-------|------|----------|
| Trigger Architect | `apex/apex-trigger-architect.md` | Designing trigger logic, handler patterns |
| Governor Guardian | `apex/apex-governor-guardian.md` | Checking SOQL/DML usage, limit compliance |
| Bulkification Reviewer | `apex/apex-bulkification-reviewer.md` | Ensuring code handles 200+ records |
| Security Sentinel | `apex/apex-security-sentinel.md` | CRUD/FLS checks, SOQL injection prevention |
| Exception Handler | `apex/apex-exception-handler.md` | Error handling patterns, custom exceptions |
| Test Coverage Analyst | `apex/apex-test-coverage-analyst.md` | Test class design, coverage strategy |

---

## Flow & Automation

**SCOPE: AUTOMATION_ONLY** - Use these agents ONLY when building Flows, Process Builder, or declarative automation.
**DO NOT** use these agents for Apex code, LWC components, or custom integrations.

**If you came here but your task is Apex → STOP. Go back to "Apex Development" section.**

| Agent | File | Use When |
|-------|------|----------|
| Flow Governor Monitor | `automation/flow-governor-monitor.md` | Checking Flow limits, DML/SOQL in Flows |
| Flow Complexity Analyzer | `automation/flow-complexity-analyzer.md` | Evaluating Flow maintainability, refactoring |
| Process Automation Strategist | `automation/process-automation-strategist.md` | Choosing between Flow, Apex, or triggers |
| Validation Rule Reviewer | `automation/validation-rule-reviewer.md` | Validation rule logic, error messages |

---

## Lightning Web Components (LWC)

**SCOPE: LWC_ONLY** - Use these agents ONLY when building LWC components or migrating from Aura.
**DO NOT** use these agents for Flows or backend-only Apex.

**Exception:** If your LWC needs an Apex controller, you may ALSO read Apex agents for the controller portion only.

| Agent | File | Use When |
|-------|------|----------|
| LWC Architecture Strategist | `lwc/lwc-architecture-strategist.md` | Component hierarchy, state management |
| LWC Performance Oracle | `lwc/lwc-performance-oracle.md` | Wire vs imperative, rendering optimization |
| LWC Security Reviewer | `lwc/lwc-security-reviewer.md` | XSS prevention, secure data handling |
| LWC Accessibility Guardian | `lwc/lwc-accessibility-guardian.md` | ARIA, keyboard navigation, screen readers |
| Aura Migration Advisor | `lwc/aura-migration-advisor.md` | Converting Aura components to LWC |

---

## Integration

**SCOPE: INTEGRATION_ONLY** - Use these agents ONLY when building APIs, callouts, Platform Events, or external system connections.
**DO NOT** use these agents for Flows, LWC frontend, or internal Apex logic.

| Agent | File | Use When |
|-------|------|----------|
| REST API Architect | `integration/rest-api-architect.md` | Building REST endpoints, API design |
| Callout Pattern Reviewer | `integration/callout-pattern-reviewer.md` | HTTP callouts, Named Credentials, mocking |
| Platform Event Strategist | `integration/platform-event-strategist.md` | Event-driven architecture, pub/sub |
| Integration Security Sentinel | `integration/integration-security-sentinel.md` | Auth, certificates, secure data transfer |

---

## Architecture & Data Model

**SCOPE: UNIVERSAL** - These agents apply to org-wide design decisions and can be used alongside other categories.
Use for data modeling, sharing configuration, and cross-cutting architectural concerns.

| Agent | File | Use When |
|-------|------|----------|
| Data Model Architect | `architecture/data-model-architect.md` | Object relationships, field design |
| Sharing Security Analyst | `architecture/sharing-security-analyst.md` | OWD, sharing rules, permission sets |
| Pattern Recognition Specialist | `architecture/pattern-recognition-specialist.md` | Identifying reusable patterns in codebase |
| Metadata Consistency Checker | `architecture/metadata-consistency-checker.md` | Naming conventions, API versions |

---

## Quick Reference: Which Agents for Which Task?

**VALIDATION**: Confirm your task classification matches the row you're using.

| If you're building... | Classification | Use these agents | DO NOT Use |
|-----------------------|----------------|------------------|------------|
| Apex Trigger | APEX | `apex-trigger-architect`, `apex-bulkification-reviewer`, `apex-governor-guardian` | Flow agents |
| Apex Service Class | APEX | `apex-governor-guardian`, `apex-security-sentinel`, `apex-exception-handler` | Flow agents |
| Apex Test Class | APEX | `apex-test-coverage-analyst` | Flow agents |
| Record-Triggered Flow | AUTOMATION | `flow-governor-monitor`, `flow-complexity-analyzer` | Apex agents |
| Screen Flow | AUTOMATION | `flow-complexity-analyzer`, `process-automation-strategist` | Apex agents |
| LWC Component | LWC | `lwc-architecture-strategist`, `lwc-performance-oracle` | Flow agents |
| REST API | INTEGRATION | `rest-api-architect`, `integration-security-sentinel` | Flow agents |
| External Callout | INTEGRATION | `callout-pattern-reviewer`, `integration-security-sentinel` | Flow agents |
| Platform Event | INTEGRATION | `platform-event-strategist` | Flow agents |
| Custom Object | ARCHITECTURE | `data-model-architect`, `sharing-security-analyst` | N/A |
