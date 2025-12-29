# CLAUDE.md - Development Guidelines

This file contains instructions for Claude when working on this repository.

## Repository Purpose

This repository is a Claude Code plugin marketplace that distributes the sf-compound-engineering plugin to Salesforce developers building with AI-powered tools.

## Directory Structure

```
sf-compound-engineering-plugin/
├── .claude-plugin/
│   └── marketplace.json          # Marketplace catalog
├── docs/                         # Documentation site
├── plans/                        # Planning templates
└── plugins/
    └── sf-compound-engineering/  # The actual plugin
        ├── .claude-plugin/
        │   └── plugin.json       # Plugin metadata
        ├── agents/               # Specialized AI agents
        │   ├── apex/            # Apex review agents
        │   ├── lwc/             # LWC review agents
        │   ├── automation/      # Flow/Process review agents
        │   ├── integration/     # API/Callout agents
        │   └── architecture/    # Architecture review agents
        ├── commands/            # Slash commands
        ├── skills/              # Reusable knowledge modules
        └── mcp-servers/         # MCP server configurations
```

## Core Philosophy

**Each unit of Salesforce work should make subsequent units of work easier—not harder.**

When working on this repository, follow the compounding engineering process:

1. **Plan** → Understand the change needed and its impact
2. **Work** → Execute systematically with validation
3. **Review** → Ensure quality meets the bar
4. **Compound** → Document learnings for future work

## Adding New Components

### Adding a New Agent

1. Create the agent file:
   ```
   plugins/sf-compound-engineering/agents/{category}/agent-name.md
   ```

2. Use this template:
   ```markdown
   ---
   name: agent-name
   description: Brief description of what the agent does
   ---
   
   # Agent Title
   
   You are an expert in [expertise area]. Your role is to [primary function].
   
   ## Your Expertise
   - Skill 1
   - Skill 2
   
   ## Review Checklist
   - [ ] Check 1
   - [ ] Check 2
   
   ## Response Format
   [Define how findings should be structured]
   
   ## Example Findings
   [Provide example outputs]
   
   ## Anti-Patterns to Flag
   [List common problems to catch]
   ```

3. Update counts:
   - `plugins/sf-compound-engineering/.claude-plugin/plugin.json` → components.agents
   - `.claude-plugin/marketplace.json` → plugin description
   - `plugins/sf-compound-engineering/README.md` → agent list

4. Verify:
   ```bash
   ls plugins/sf-compound-engineering/agents/**/*.md | wc -l
   ```

### Adding a New Command

1. Create the command file:
   ```
   plugins/sf-compound-engineering/commands/command-name.md
   ```

2. Use this template:
   ```markdown
   ---
   name: sf:command-name
   description: What the command does
   arguments:
     - name: arg1
       description: Argument description
       required: true/false
   ---
   
   # Command Title
   
   [Description of what the command does]
   
   ## Workflow
   [Step-by-step execution process]
   
   ## Example Usage
   [Show example invocations and outputs]
   ```

3. Update counts in plugin.json, marketplace.json, and README.md

### Adding a New Skill

1. Create skill directory:
   ```
   plugins/sf-compound-engineering/skills/skill-name/
   ```

2. Add skill structure:
   ```
   skills/skill-name/
   ├── SKILL.md           # Skill definition with frontmatter
   ├── assets/            # Templates, examples (optional)
   └── scripts/           # Supporting scripts (optional)
   ```

3. SKILL.md template:
   ```markdown
   ---
   name: skill-name
   description: Brief description of what the skill provides
   ---
   
   # Skill Title
   
   [Comprehensive documentation/reference material]
   ```

4. Update counts in plugin.json, marketplace.json, and README.md

## Verification Commands

Before committing, verify:

```bash
# Validate JSON files
cat .claude-plugin/marketplace.json | jq .
cat plugins/sf-compound-engineering/.claude-plugin/plugin.json | jq .

# Count components
echo "Agents: $(find plugins/sf-compound-engineering/agents -name '*.md' | wc -l)"
echo "Commands: $(ls plugins/sf-compound-engineering/commands/*.md | wc -l)"
echo "Skills: $(ls -d plugins/sf-compound-engineering/skills/*/ 2>/dev/null | wc -l)"

# Verify counts match descriptions
grep -o "24 specialized agents" plugins/sf-compound-engineering/.claude-plugin/plugin.json
grep -o "13 commands" plugins/sf-compound-engineering/.claude-plugin/plugin.json
grep -o "12 skills" plugins/sf-compound-engineering/.claude-plugin/plugin.json
```

## Salesforce-Specific Guidelines

### Agent Quality Standards

All Salesforce agents must:

1. **Know Governor Limits**: Reference specific limits and thresholds
2. **Understand Bulk Context**: Always consider 200+ record scenarios
3. **Enforce Security**: CRUD/FLS, sharing, injection prevention
4. **Follow Patterns**: Reference Salesforce best practices (trigger handlers, selectors, etc.)
5. **Provide Code Examples**: Show before/after Apex, LWC, or Flow examples

### Code Examples Must

- Be syntactically correct Apex/JavaScript
- Include error handling
- Follow Salesforce naming conventions
- Be bulk-safe by default
- Include comments for complex logic

### Testing References

When discussing testing:
- Minimum 75% coverage (recommend 90%+)
- Positive, negative, and bulk test cases
- User context tests (different profiles)
- System.runAs() for sharing tests
- Test.startTest()/Test.stopTest() for async

## Commit Message Format

```
🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Tags

Use these tags for the plugin:

- `salesforce`
- `apex`
- `lwc`
- `lightning-web-components`
- `flows`
- `compound-engineering`
- `code-review`
- `ai-powered`
- `workflow-automation`

## Learnings Log

This section captures important learnings as we work on this repository.

### 2024-XX-XX: Initial Creation
Created the Salesforce Compound Engineering Plugin based on the Every.to compound-engineering pattern. Key Salesforce-specific adaptations:
- Agent categories aligned with Salesforce development areas (Apex, LWC, Flows, Integration)
- Skills focused on Salesforce-specific knowledge (governor limits, security, patterns)
- Commands tailored to Salesforce CLI and deployment workflows

---

## Resources

- [Salesforce Developer Docs](https://developer.salesforce.com/docs)
- [Apex Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)
- [LWC Developer Guide](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)
- [Compound Engineering Philosophy](https://every.to/source-code/my-ai-had-already-fixed-the-code-before-i-saw-it)
