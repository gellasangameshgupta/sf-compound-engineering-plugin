# Salesforce Compound Engineering Plugin

AI-powered Salesforce development tools for Claude Code. **23 agents, 9 commands, 6 skills** — all designed to work together in a sequential workflow.

> **Development Workflow:** This project uses [GitHub Spec-Kit](https://github.com/github/spec-kit) for Spec-Driven Development. See [Contributing](#-contributing) for details.

---

## 🎯 What Is This?

A plugin that gives Claude deep Salesforce expertise for:
- **Code reviews** that catch governor limits, security issues, and anti-patterns
- **Implementation** that follows best practices from the start
- **Testing** with proper bulk scenarios and assertions
- **Deployment** with checklists and validation

**Core Philosophy:** Each unit of work should make subsequent work easier—not harder.

---

## 📦 Installation

### Option 1: Initialize in Any Project (Recommended)

Use the CLI to add Spec-Driven Development workflow to any Salesforce project:

```bash
# Using uvx (no install required)
uvx --from git+https://github.com/gellasangameshgupta/sf-compound-engineering-plugin.git#subdirectory=cli sfce init .

# Or with AI agent setup
uvx --from git+https://github.com/gellasangameshgupta/sf-compound-engineering-plugin.git#subdirectory=cli sfce init . --ai claude
```

This creates the `.specify/` folder with templates and scripts — similar to `specify init` from [GitHub Spec-Kit](https://github.com/github/spec-kit).

### Option 2: Install as Claude Code Plugin

```bash
# Clone the repository
git clone https://github.com/gellasangameshgupta/sf-compound-engineering-plugin.git

# Install in Claude Code
/plugin install /path/to/sf-compound-engineering-plugin
```

---

## 🔄 The Compound Engineering Workflow

The real power is using commands **in sequence**. Here's a complete example:

### Example: Building a Lead Scoring System

**Requirement:**
> Build a Lead scoring system that calculates scores based on lead source, industry, and company size. Update scores on lead changes. Sync high-scoring leads (>80) to external marketing system via REST API. Send email alerts for hot leads.

---

### Step 1: `/sf:plan` — Understand & Plan

```
/sf:plan

I need to build a Lead scoring system that:
- Calculates a score based on lead source, industry, and company size
- Updates the score whenever a lead is modified
- Syncs high-scoring leads (>80) to an external marketing system via REST API
- Sends email alerts to sales reps for hot leads
```

**What Claude Does:**
- Breaks down into phases
- Identifies components needed (trigger, handler, service classes)
- Estimates complexity
- Lists dependencies

**Output:** Implementation plan you'll reference in next steps

---

### Step 2: `/sf:work` — Build It Right

```
/sf:work

Implement Phase 1 from the plan: Lead Score Calculation

Create:
1. Lead_Score__c field (Number)
2. LeadTrigger 
3. LeadTriggerHandler
4. LeadScoringService with calculateScore() method
```

**What Claude Does:**
- Writes bulk-safe Apex code
- Follows trigger handler pattern
- Includes CRUD/FLS checks
- References `apex-patterns` skill automatically

**Repeat for each phase:**
```
/sf:work
Implement Phase 2: External System Sync (MarketingSystemService, AsyncLeadSyncJob)

/sf:work  
Implement Phase 3: Email Alerts (LeadAlertService)
```

---

### Step 3: `/sf:review` — Catch Issues

```
/sf:review

Review all the Lead Scoring code:
- LeadTrigger.trigger
- LeadTriggerHandler.cls
- LeadScoringService.cls
- MarketingSystemService.cls
```

**What Claude Does:**
- Dispatches multiple agents automatically:
  - `apex-governor-guardian` → checks limits
  - `apex-security-sentinel` → checks CRUD/FLS, injection
  - `apex-bulkification-reviewer` → checks bulk patterns
  - `callout-pattern-reviewer` → checks HTTP patterns
- Consolidates findings by severity

**Output:**
```
### [CRITICAL] Missing CRUD Check
Location: LeadScoringService.cls:45
...

### [HIGH] Callout Missing Timeout
Location: MarketingSystemService.cls:23
...
```

---

### Step 4: `/sf:triage` — Prioritize Fixes

```
/sf:triage

Process the review findings. Help me decide what to fix now vs later.
```

**What Claude Does:**
- Presents each finding interactively
- Helps categorize: Fix Now / Defer / Skip
- Creates prioritized todo list

**Output:**
```
Accepted (Fix Now):
- [ ] CRITICAL: Add CRUD check in LeadScoringService
- [ ] HIGH: Add timeout to MarketingSystemService

Deferred (Backlog):
- [ ] MEDIUM: Add retry logic to callout

Skipped:
- LOW: Variable naming suggestion (existing pattern)
```

---

### Step 5: `/sf:resolve` — Fix Issues

```
/sf:resolve critical,high

Fix all critical and high priority issues from triage.
```

**What Claude Does:**
- Applies fixes to each issue
- Shows before/after code
- Validates fixes don't break other things

---

### Step 6: `/sf:test` — Comprehensive Testing

```
/sf:test

Generate tests for the Lead Scoring feature:
- LeadScoringService (unit tests)
- LeadTriggerHandler (bulk tests with 200+ records)
- MarketingSystemService (mock callout tests)

Target: 90% coverage
```

**What Claude Does:**
- Creates test classes using `test-factory` skill
- Includes bulk scenarios (200+ records)
- Adds mock classes for callouts
- Covers positive, negative, and edge cases

---

### Step 7: `/sf:document` — Generate Docs

```
/sf:document

Document the Lead Scoring feature:
- ApexDoc for all classes
- Feature README
```

**What Claude Does:**
- Adds ApexDoc comments to all methods
- Creates feature documentation
- Documents architecture decisions

---

### Step 8: `/sf:health` — Final Check

```
/sf:health

Analyze Lead Scoring codebase health before deployment.
```

**What Claude Does:**
- Reports code coverage
- Identifies remaining technical debt
- Scores pattern compliance
- Gives go/no-go recommendation

---

### Step 9: `/sf:deploy` — Ship It

```
/sf:deploy production

Deploy Lead Scoring feature:
- All Apex classes and triggers
- Lead_Score__c custom field
- Named Credential for Marketing API
```

**What Claude Does:**
- Generates pre-deployment checklist
- Provides SF CLI deployment commands
- Creates post-deployment verification steps
- Documents rollback procedure

---

## 📊 The Workflow Visualized

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│    /sf:plan                                                 │
│        │                                                    │
│        ▼                                                    │
│    /sf:work ◄─────────────────┐                             │
│        │                      │                             │
│        ▼                      │                             │
│    /sf:review                 │                             │
│        │                      │                             │
│        ▼                      │                             │
│    /sf:triage                 │  Iterate until              │
│        │                      │  review is clean            │
│        ▼                      │                             │
│    /sf:resolve ───────────────┘                             │
│        │                                                    │
│        ▼                                                    │
│    /sf:test                                                 │
│        │                                                    │
│        ▼                                                    │
│    /sf:document                                             │
│        │                                                    │
│        ▼                                                    │
│    /sf:health                                               │
│        │                                                    │
│        ▼                                                    │
│    /sf:deploy ──────────────────► PRODUCTION 🚀             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🤖 What's Included

### Agents (23)

Specialized AI personas that know Salesforce inside out:

| Category | Agents | What They Check |
|----------|--------|-----------------|
| **Apex** (6) | governor-guardian, security-sentinel, bulkification-reviewer, trigger-architect, test-coverage-analyst, exception-handler | Limits, CRUD/FLS, injection, bulk patterns, test quality |
| **LWC** (5) | performance-oracle, security-reviewer, accessibility-guardian, architecture-strategist, aura-migration-advisor | Wire adapters, XSS, ARIA, component patterns |
| **Automation** (4) | flow-complexity-analyzer, flow-governor-monitor, process-automation-strategist, validation-rule-reviewer | Flow design, DML in loops, Flow vs Apex decisions |
| **Integration** (4) | rest-api-architect, callout-pattern-reviewer, platform-event-strategist, integration-security-sentinel | API design, Named Credentials, retry patterns |
| **Architecture** (4) | data-model-architect, sharing-security-analyst, metadata-consistency-checker, pattern-recognition-specialist | Schema design, OWD, anti-patterns |

### Commands (9)

| Command | Purpose | When To Use |
|---------|---------|-------------|
| `/sf:plan` | Create implementation plan from requirements | Start of any new feature |
| `/sf:work` | Execute plan with best practices | Building components |
| `/sf:review` | Multi-agent code review | After writing code |
| `/sf:triage` | Prioritize review findings | After review |
| `/sf:resolve` | Fix prioritized issues | After triage |
| `/sf:test` | Generate comprehensive tests | Before deployment |
| `/sf:document` | Auto-generate documentation | After code is stable |
| `/sf:health` | Analyze codebase health | Before major deploys |
| `/sf:deploy` | Deployment checklists & commands | Ready to ship |

### Skills (6)

Reference documentation Claude consults automatically:

| Skill | What It Contains |
|-------|------------------|
| `governor-limits` | All Salesforce limits with thresholds |
| `security-guide` | CRUD/FLS patterns, injection prevention |
| `apex-patterns` | Trigger handler, selector, service patterns |
| `lwc-patterns` | Component communication, state management |
| `test-factory` | TestDataFactory patterns |
| `integration-patterns` | REST, callouts, platform events |

---

## ⚡ Quick Start Examples

### Quick Review (Single File)
```
/sf:review

public class MyService {
    public void process(List<Account> accs) {
        for (Account a : accs) {
            Contact c = [SELECT Id FROM Contact WHERE AccountId = :a.Id LIMIT 1];
            update a;
        }
    }
}
```

**Expected:** Claude flags SOQL in loop, DML in loop, missing CRUD check

---

### Quick Plan
```
/sf:plan

Add a "Convert to Customer" button on Account that:
- Creates an Opportunity
- Sends welcome email
- Updates Account type to "Customer"
```

---

### Quick Test Generation
```
/sf:test

Generate bulk tests for AccountTriggerHandler class.
Target 90% coverage.
```

---

## 🔧 How It Works

The plugin provides Claude with:

1. **Auto-Dispatch Rules** (in CLAUDE.md)
   - When Claude sees `.cls` files → automatically uses Apex agents
   - When Claude sees `.js` in lwc/ → automatically uses LWC agents
   - When asked about limits → automatically reads governor-limits skill

2. **Structured Prompts** (agents)
   - Each agent has expertise, checklists, response format
   - Claude adopts the agent's persona for specialized reviews

3. **Reference Knowledge** (skills)
   - Curated Salesforce best practices
   - Copy-paste ready code patterns
   - Limit thresholds and security guides

---

## 📁 Directory Structure

```
sf-compound-engineering-plugin/
├── .claude-plugin/
│   └── marketplace.json          # Plugin registry
├── .specify/                     # Development workflow (Spec-Kit)
├── plugins/
│   └── sf-compound-engineering/
│       ├── .claude-plugin/
│       │   └── plugin.json       # Plugin metadata
│       ├── agents/
│       │   ├── apex/             # 6 Apex agents
│       │   ├── lwc/              # 5 LWC agents
│       │   ├── automation/       # 4 Flow agents
│       │   ├── integration/      # 4 Integration agents
│       │   └── architecture/     # 4 Architecture agents
│       ├── commands/             # 9 slash commands
│       ├── skills/               # 6 reference skills
│       └── CLAUDE.md             # Auto-dispatch rules
├── README.md
├── CONTRIBUTING.md
└── LICENSE
```

---

## 🔄 Updating

```bash
cd /path/to/sf-compound-engineering-marketplace
git pull origin main

# If changes don't take effect:
/plugin uninstall sf-compound-engineering
/plugin install /path/to/sf-compound-engineering-marketplace
```

---

## 🤝 Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on adding new agents, commands, or skills.

### Spec-Driven Development

This project uses its own commands for Spec-Driven Development (inspired by [GitHub Spec-Kit](https://github.com/github/spec-kit)):

```bash
# Create a new feature specification
.specify/scripts/create-new-feature.sh your-feature-name
```

Then follow the workflow using the plugin's commands:

```
/sf:plan → /sf:work → /sf:review → /sf:triage → /sf:resolve → /sf:test → /sf:document → /sf:health → /sf:deploy
```

| Phase | Command | Purpose |
|-------|---------|---------|
| Specify | `/sf:plan` | Generate spec & plan from requirements |
| Implement | `/sf:work` | Build following the plan |
| Validate | `/sf:review` | 23-agent code review |
| Prioritize | `/sf:triage` | Triage findings |
| Fix | `/sf:resolve` | Fix prioritized issues |
| Test | `/sf:test` | Generate comprehensive tests |
| Document | `/sf:document` | Auto-generate docs |
| Assess | `/sf:health` | Go/No-Go decision |
| Ship | `/sf:deploy` | Deployment checklist |

See `.specify/memory/constitution.md` for project principles.

---

## 📄 License

MIT License - see [LICENSE](./LICENSE)

---

## 🙏 Credits

- Inspired by [Every.to's Compound Engineering](https://every.to/source-code/my-ai-had-already-fixed-the-code-before-i-saw-it)
- Built for the Salesforce developer community
- Powered by Claude Code

---

**Made with ❤️ for Salesforce Developers**