# [Feature Name] - Technical Plan

> **Status:** Draft | In Review | Approved | Implemented
> **Version:** X.X.X
> **Spec Reference:** [spec.md](./spec.md)
> **Last Updated:** YYYY-MM-DD
> **Generated with:** `/sf:plan`

## Technical Context

### Salesforce Environment
- **API Version:** [e.g., v59.0]
- **Edition:** [e.g., Enterprise, Unlimited]
- **Features Required:** [e.g., Platform Events, External Services]

### Components to Build
- **Apex Classes:** [List]
- **Triggers:** [List]
- **LWC Components:** [List]
- **Flows:** [List]

### Dependencies
| Dependency | Version | Purpose |
|------------|---------|---------|
| [Dependency] | [Version] | [Purpose] |

## Architecture Overview

```
[ASCII diagram or description of component structure]
```

## Component Design

### [Component 1 Name]

[Description of component purpose and structure]

```
[Code structure or pseudo-code]
```

### [Component 2 Name]

[Description of component purpose and structure]

## Implementation Decisions

### Decision 1: [Decision Title]

**Context:** [What led to this decision]

**Decision:** [What was decided]

**Rationale:**
- [Reason 1]
- [Reason 2]
- [Reason 3]

**Trade-offs:**
- [Trade-off 1]
- [Trade-off 2]

### Decision 2: [Decision Title]

[Repeat structure for each significant decision]

## Security Considerations

### [Security Area 1]
- [Security consideration]
- [Mitigation approach]

### [Security Area 2]
- [Security consideration]
- [Mitigation approach]

## Governor Limit Analysis

| Limit | Budget | This Feature | Remaining | Risk |
|-------|--------|--------------|-----------|------|
| SOQL Queries | 100 | [X] | [100-X] | Low/Medium/High |
| DML Statements | 150 | [Y] | [150-Y] | Low/Medium/High |
| CPU Time (ms) | 10,000 | [Z] | [10,000-Z] | Low/Medium/High |
| Heap Size (MB) | 6 | [W] | [6-W] | Low/Medium/High |

### Bulk Scenario (200 records)
- [ ] Verified SOQL not in loops
- [ ] Verified DML not in loops
- [ ] Collections used for bulkification
- [ ] Maps used for efficient lookups

## Performance Considerations

### [Performance Area 1]
- Target: [Performance target]
- Approach: [How achieved]

### [Performance Area 2]
- Target: [Performance target]
- Approach: [How achieved]

## Testing Strategy

### [Test Type 1]
- [What is tested]
- [How it's tested]

### [Test Type 2]
- [What is tested]
- [How it's tested]

## Rollout Plan

### Phase 1: [Phase Name]
- [Deliverable 1]
- [Deliverable 2]

### Phase 2: [Phase Name]
- [Deliverable 1]
- [Deliverable 2]

## Risk Mitigation

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk] | Low/Medium/High | Low/Medium/High | [Mitigation] |

---

## Workflow Commands

Execute in order:
1. `/sf:work` - Implement components from this plan
2. `/sf:review` - Multi-agent code review (23 agents)
3. `/sf:triage` - Prioritize findings
4. `/sf:resolve` - Fix issues
5. `/sf:test` - Generate tests
6. `/sf:document` - Generate documentation
7. `/sf:health` - Final health check
8. `/sf:deploy` - Deployment checklist

---

*This plan implements the [specification](./spec.md) while respecting [constitution](../../memory/constitution.md) principles.*
