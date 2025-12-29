# Salesforce Compound Engineering - Claude Instructions

This file tells Claude how to automatically use agents, skills, and commands when working on Salesforce projects.

---

## 🚀 Auto-Dispatch Rules

### When Reviewing Apex Code (.cls, .trigger)

Automatically read and apply these agents:
- `agents/apex/apex-governor-guardian.md` - Check for limit violations
- `agents/apex/apex-security-sentinel.md` - Check CRUD/FLS, injection
- `agents/apex/apex-bulkification-reviewer.md` - Check bulk patterns
- `agents/apex/apex-trigger-architect.md` - For trigger files only

Reference this skill:
- `skills/governor-limits/SKILL.md` - For limit thresholds

### When Reviewing LWC Code (.js, .html in lwc/)

Automatically read and apply these agents:
- `agents/lwc/lwc-performance-oracle.md` - Wire adapters, rendering
- `agents/lwc/lwc-security-reviewer.md` - XSS, Locker compliance
- `agents/lwc/lwc-accessibility-guardian.md` - ARIA, keyboard nav

Reference this skill:
- `skills/lwc-patterns/SKILL.md` - For component patterns

### When Reviewing Flows (.flow-meta.xml)

Automatically read and apply these agents:
- `agents/automation/flow-complexity-analyzer.md` - Complexity scoring
- `agents/automation/flow-governor-monitor.md` - DML/SOQL in loops

### When Reviewing Integrations (callouts, REST, events)

Automatically read and apply these agents:
- `agents/integration/rest-api-architect.md` - API design
- `agents/integration/callout-pattern-reviewer.md` - HTTP patterns
- `agents/integration/integration-security-sentinel.md` - Credentials

Reference this skill:
- `skills/integration-patterns/SKILL.md` - For callout patterns

### When Writing Tests

Reference these:
- `skills/test-factory/SKILL.md` - TestDataFactory patterns
- `agents/apex/apex-test-coverage-analyst.md` - Test quality

### When Asked About Security

Reference:
- `skills/security-guide/SKILL.md` - Complete security reference
- `agents/apex/apex-security-sentinel.md` - Apex security
- `agents/lwc/lwc-security-reviewer.md` - LWC security

### When Asked About Patterns or Best Practices

Reference:
- `skills/apex-patterns/SKILL.md` - Trigger handler, selector, service patterns
- `skills/lwc-patterns/SKILL.md` - Component communication, state management

---

## 📋 Command Workflows

When a user invokes a command, read the command file and follow its workflow:

| Command | File | Purpose |
|---------|------|---------|
| `/sf:plan` | `commands/plan.md` | Create implementation plan |
| `/sf:work` | `commands/work.md` | Execute plan systematically |
| `/sf:review` | `commands/review.md` | Multi-agent code review |
| `/sf:test` | `commands/test.md` | Run and analyze tests |
| `/sf:deploy` | `commands/deploy.md` | Deployment checklist |
| `/sf:health` | `commands/health.md` | Org health analysis |
| `/sf:triage` | `commands/triage.md` | Process review findings |
| `/sf:resolve` | `commands/resolve.md` | Fix issues from triage |
| `/sf:document` | `commands/document.md` | Generate documentation |

---

## 🎯 Response Guidelines

### For Code Reviews

Always structure findings as:

```
### [SEVERITY]: [Issue Title]

**Location**: FileName.cls:LineNumber
**Category**: Security | Governor | Bulk | Pattern

**Issue**: 
What's wrong

**Risk**:
What could happen

**Current Code**:
[code block]

**Fixed Code**:
[code block]
```

Severity levels:
- **CRITICAL**: Security vulnerabilities, definite limit exceptions
- **HIGH**: Likely production issues, bad patterns
- **MEDIUM**: Code smells, maintenance concerns
- **LOW**: Style, minor optimizations
- **INFO**: Suggestions, alternatives

### For Apex Code

Always consider:
1. **Governor Limits**: Will this hit limits at 200 records?
2. **Bulkification**: Does it handle collections properly?
3. **Security**: CRUD/FLS enforced? Injection safe?
4. **Error Handling**: Exceptions caught and logged?
5. **Testability**: Can this be unit tested?

### For LWC Code

Always consider:
1. **Performance**: Wire vs imperative? Reactive properties?
2. **Security**: No innerHTML with user data? No eval()?
3. **Accessibility**: Labels? Keyboard nav? ARIA?
4. **Architecture**: Props down, events up?

---

## 📂 Directory Structure

```
plugins/sf-compound-engineering/
├── agents/
│   ├── apex/           # 6 Apex agents
│   ├── lwc/            # 5 LWC agents  
│   ├── automation/     # 4 Flow/automation agents
│   ├── integration/    # 4 Integration agents
│   └── architecture/   # 4 Architecture agents
├── commands/           # 9 slash commands
├── skills/             # 6 reference skills
│   ├── apex-patterns/
│   ├── lwc-patterns/
│   ├── governor-limits/
│   ├── security-guide/
│   ├── test-factory/
│   └── integration-patterns/
└── .claude-plugin/
    └── plugin.json
```

---

## ⚡ Quick Reference

### Governor Limits (Sync Context)
| Limit | Value |
|-------|-------|
| SOQL Queries | 100 |
| DML Statements | 150 |
| Query Rows | 50,000 |
| DML Rows | 10,000 |
| CPU Time | 10,000 ms |
| Heap Size | 6 MB |

### Security Checklist
- [ ] `WITH SECURITY_ENFORCED` or `Security.stripInaccessible()`
- [ ] No SOQL/SOSL injection (use bind variables)
- [ ] `with sharing` on user-facing classes
- [ ] No hardcoded credentials

### Bulk-Safe Patterns
- [ ] No SOQL in loops
- [ ] No DML in loops
- [ ] Use Maps for O(1) lookups
- [ ] Collect → Process → Execute

---

## 🔧 Extending the Plugin

### Adding an Agent

1. Create: `agents/{category}/agent-name.md`
2. Include frontmatter:
   ```yaml
   ---
   name: agent-name
   description: What it does
   ---
   ```
3. Define: Expertise, Checklist, Response Format, Examples

### Adding a Skill

1. Create: `skills/skill-name/SKILL.md`
2. Include frontmatter and comprehensive reference content

### Adding a Command

1. Create: `commands/command-name.md`
2. Include: Frontmatter, Workflow steps, Examples

---

## 💡 Usage Examples

**User says**: "Review my AccountTrigger.trigger"
**Claude does**: 
1. Reads `apex-trigger-architect.md`
2. Reads `apex-governor-guardian.md`
3. Reads `apex-security-sentinel.md`
4. Applies all checklists
5. Reports findings by severity

**User says**: "Help me fix this SOQL limit error"
**Claude does**:
1. Reads `skills/governor-limits/SKILL.md`
2. Identifies the pattern causing issues
3. Provides bulk-safe alternative

**User says**: "/sf:review force-app/"
**Claude does**:
1. Reads `commands/review.md`
2. Follows the workflow
3. Dispatches agents by file type
4. Consolidates findings

---

## 🏷️ Core Philosophy

**Each unit of Salesforce work should make subsequent work easier—not harder.**

Loop: **Plan (40%)** → **Work (20%)** → **Review (20%)** → **Compound (20%)**

Every review improves the codebase. Every pattern learned gets documented. Every fix prevents future bugs.
