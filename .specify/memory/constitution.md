# SF Compound Engineering Plugin - Constitution

> This document contains the immutable principles and architectural decisions that govern all development within this project.

## Core Philosophy

### Compound Engineering Principle
Every unit of work must make subsequent work easier. Code should compound in value, not complexity.

### Salesforce-First Design
All patterns, agents, and workflows are optimized for the Salesforce platform's unique constraints (governor limits, sharing model, metadata architecture).

---

## Development Workflow

This project uses a **Spec-Driven Development** workflow powered by the plugin's own commands:

```
/sf:plan → /sf:work → /sf:review → /sf:triage → /sf:resolve → /sf:test → /sf:document → /sf:health → /sf:deploy
```

### Phase 1: Specify (`/sf:plan`)
- Define WHAT and WHY before HOW
- Output: Implementation plan saved to `.specify/specs/NNN-feature-name/`
- Must identify governor limit concerns upfront
- Must reference existing org patterns

### Phase 2: Implement (`/sf:work`)
- Execute the plan with best practices
- Follow patterns from constitution
- Generate bulk-safe, secure code

### Phase 3: Validate (`/sf:review` → `/sf:triage` → `/sf:resolve`)
- Multi-agent review for quality gates
- Prioritize and fix issues before proceeding
- Iterate until review is clean

### Phase 4: Test & Document (`/sf:test` → `/sf:document`)
- Generate comprehensive tests (bulk, negative, edge cases)
- Auto-generate documentation

### Phase 5: Ship (`/sf:health` → `/sf:deploy`)
- Final health assessment with Go/No-Go
- Deployment checklists and rollback procedures

---

## Immutable Principles

### 1. Governor Limit Awareness
- **Every agent MUST consider governor limits** in its analysis and recommendations
- No pattern or suggestion shall knowingly violate governor limits
- All code patterns must include bulk-safe implementations
- Query and DML operations must be optimized for limits

### 2. Security by Default
- **CRUD/FLS enforcement is mandatory**, not optional
- All agents must flag security vulnerabilities as CRITICAL
- No code suggestions shall bypass security checks without explicit documentation
- Sensitive data patterns must follow platform encryption standards

### 3. Separation of Concerns
- **Trigger logic belongs in handlers**, not triggers
- Business logic lives in Service classes
- Data access lives in Selector classes
- UI logic stays in Lightning components
- Each layer has clear responsibilities

### 4. Testability First
- **All code must be designed for testability**
- Minimum 80% code coverage is a baseline, not a goal
- Test methods must verify behavior, not just coverage
- Bulk testing (200+ records) is mandatory for DML operations

### 5. Automation Hierarchy
- **Declarative before programmatic** when functionality is equivalent
- Flows for simple automation
- Apex for complex business logic
- Integration patterns for external systems

---

## Architectural Standards

### Agent Design Standards
- Each agent must have a single, focused responsibility
- Agents provide checklists, not opinions
- Examples must be production-ready code
- Anti-patterns must include remediation paths

### Command Workflow Standards
- Commands follow a sequential, gated workflow
- Each command produces structured output
- Commands can be run independently or in sequence
- Output from one command feeds into the next

### Skill Documentation Standards
- Skills provide reference material, not tutorials
- Code examples are copy-paste ready
- Governor limit thresholds are explicitly stated
- Patterns include both happy path and error handling

---

## Quality Gates

### Code Review Requirements
- All changes must pass multi-agent review (`/sf:review`)
- CRITICAL issues block deployment
- HIGH issues require explicit approval
- Security findings have zero tolerance

### Documentation Requirements
- All public methods require ApexDoc comments
- Complex logic requires inline explanations
- Architecture decisions require ADR documentation
- User-facing changes require README updates

### Testing Requirements
- Unit tests for all business logic
- Integration tests for callouts
- Bulk tests for trigger handlers
- Negative tests for error paths

---

## Compatibility Commitments

### Backward Compatibility
- Major version changes may break compatibility
- Minor versions add features without breaking changes
- Patch versions fix bugs only
- Deprecation requires one major version notice

### Platform Compatibility
- Support current Salesforce API version and two prior
- LWC patterns follow Web Component standards
- Apex patterns follow latest syntax support
- Flow patterns support current Flow Builder

---

## Governance

### Change Process
1. Create spec with `/sf:plan`
2. Implement with `/sf:work`
3. Validate with `/sf:review`
4. Document changes
5. Submit PR with spec files and implementation

### Conflict Resolution
- Constitution principles take precedence
- Security concerns override convenience
- Performance concerns override elegance
- User safety overrides all other concerns

---

*This constitution was established with the initial release and governs all subsequent development. Changes require explicit version bumps and migration documentation.*
