# [Feature Name] - Tasks

> **Status:** Not Started | In Progress | Completed
> **Spec Reference:** [spec.md](./spec.md)
> **Plan Reference:** [plan.md](./plan.md)

## Task Legend

- `[x]` - Completed
- `[ ]` - Pending
- `[P]` - Can be executed in parallel with other `[P]` tasks

---

## Phase 1: Implement (`/sf:work`)

### US-XXX: [User Story Title]

- [ ] [P] [Create Apex class/trigger]
- [ ] [P] [Create LWC component]
- [ ] [Sequential task - depends on above]
- [ ] [Final task for this story]

### US-XXX: [User Story Title]

- [ ] [P] [Task description]
- [ ] [Task description]

---

## Phase 2: Review (`/sf:review`)

- [ ] Run multi-agent review
- [ ] Address CRITICAL findings
- [ ] Address HIGH findings
- [ ] Re-review if significant changes

---

## Phase 3: Triage & Resolve (`/sf:triage` → `/sf:resolve`)

- [ ] Triage all findings
- [ ] Fix accepted issues
- [ ] Document deferred items
- [ ] Verify fixes don't introduce new issues

---

## Phase 4: Test (`/sf:test`)

- [ ] Generate unit tests
- [ ] Generate bulk tests (200+ records)
- [ ] Generate negative tests
- [ ] Generate mock classes for callouts
- [ ] Verify 90%+ coverage

---

## Phase 5: Document (`/sf:document`)

- [ ] Generate ApexDoc comments
- [ ] Update README if needed
- [ ] Document architecture decisions

---

## Phase 6: Ship (`/sf:health` → `/sf:deploy`)

- [ ] Run health assessment
- [ ] Address any blockers
- [ ] Generate deployment checklist
- [ ] Execute deployment
- [ ] Post-deployment validation

---

## Summary

| Phase | Tasks | Completed | Remaining |
|-------|-------|-----------|-----------|
| Implement | X | X | X |
| Review | X | X | X |
| Triage/Resolve | X | X | X |
| Test | X | X | X |
| Document | X | X | X |
| Ship | X | X | X |
| **Total** | **X** | **X** | **X** |

---

*Tasks follow the SF Compound Engineering workflow. See [constitution.md](../../memory/constitution.md) for project principles.*
