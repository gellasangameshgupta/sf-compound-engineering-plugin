# Salesforce Compound Engineering Plugin - Development Guide

This repository is a Claude Code plugin designed specifically for Salesforce development workflows.

## Repository Structure

```
salesforce-compound-engineering/
├── .claude-plugin/
│   └── marketplace.json          # Marketplace catalog
├── plugins/
│   └── sf-compound/              # The main plugin
│       ├── .claude-plugin/
│       │   └── plugin.json       # Plugin metadata
│       ├── agents/               # Specialized AI agents
│       │   ├── apex/            # Apex-specific reviewers
│       │   ├── lwc/             # LWC-specific reviewers
│       │   ├── flow/            # Flow-specific reviewers
│       │   ├── integration/     # Integration reviewers
│       │   └── architecture/    # Architecture reviewers
│       ├── commands/             # Slash commands
│       ├── skills/               # Reusable skills
│       │   ├── governor-limits/
│       │   ├── bulkification/
│       │   ├── security/
│       │   └── testing/
│       ├── templates/            # Code templates
│       ├── mcp-servers/          # MCP server configs
│       ├── README.md
│       └── CHANGELOG.md
├── docs/                         # Documentation site
├── examples/                     # Example implementations
├── CLAUDE.md                     # This file
└── README.md                     # Main documentation
```

## Compounding Engineering Philosophy

Each unit of engineering work should make subsequent units of work easier—not harder.

When working on this repository, follow the compounding engineering process:
1. **Plan** → Understand the change needed and its impact
2. **Build** → Implement with Salesforce best practices
3. **Review** → Verify quality and identify learnings
4. **Codify** → Document insights for future work

## Adding New Components

### Adding a New Agent

1. Create the agent file:
   ```
   plugins/sf-compound/agents/[category]/[agent-name].md
   ```

2. Follow the agent template:
   ```markdown
   ---
   name: agent-name
   description: Brief description
   category: apex|lwc|flow|integration|architecture
   triggers:
     - "keyword patterns"
   ---

   # Agent Name

   ## Role
   Describe the agent's purpose

   ## Expertise
   - Area 1
   - Area 2

   ## Review Checklist
   - [ ] Check 1
   - [ ] Check 2

   ## Common Issues
   ### Issue 1
   **Problem**: Description
   **Solution**: How to fix

   ## Code Examples
   ### Good Pattern
   ```apex
   // Good code
   ```

   ### Anti-Pattern
   ```apex
   // Bad code - explain why
   ```
   ```

3. Update `plugin.json` agent count
4. Update `README.md` agent list
5. Test with: `claude agent [agent-name] "test input"`

### Adding a New Command

1. Create the command file:
   ```
   plugins/sf-compound/commands/[command-name].md
   ```

2. Follow the command template:
   ```markdown
   ---
   name: sf:[command-name]
   description: What the command does
   arguments:
     - name: arg1
       description: Argument description
       required: true
   ---

   # Command Name

   ## Purpose
   Describe what this command accomplishes

   ## Workflow
   1. Step 1
   2. Step 2
   3. Step 3

   ## Usage Examples
   ```bash
   claude /sf:[command-name] "example input"
   ```

   ## Output
   Describe expected output
   ```

3. Update `plugin.json` command count
4. Update `README.md` command list
5. Test with: `claude /sf:[command-name]`

### Adding a New Skill

1. Create skill directory:
   ```
   plugins/sf-compound/skills/[skill-name]/
   ├── SKILL.md
   ├── patterns/           # Code patterns
   ├── checklists/        # Review checklists
   └── examples/          # Example implementations
   ```

2. Create SKILL.md with frontmatter:
   ```markdown
   ---
   name: skill-name
   description: Brief description of the skill
   triggers:
     - "trigger phrase 1"
     - "trigger phrase 2"
   ---

   # Skill Name

   ## Overview
   Detailed description

   ## Patterns
   Reference files in patterns/

   ## Checklists
   Reference files in checklists/
   ```

3. Update `plugin.json` skill count
4. Update `README.md` skill list

## Verification Commands

Before committing changes, verify counts match:

```bash
# Count agents
find plugins/sf-compound/agents -name "*.md" | wc -l

# Count commands
ls plugins/sf-compound/commands/*.md | wc -l

# Count skills
ls -d plugins/sf-compound/skills/*/ 2>/dev/null | wc -l

# Validate JSON files
cat .claude-plugin/marketplace.json | jq .
cat plugins/sf-compound/.claude-plugin/plugin.json | jq .
```

## Salesforce-Specific Guidelines

### Governor Limit Awareness

All agents and skills should consider:
- **SOQL Queries**: Max 100 per transaction
- **DML Statements**: Max 150 per transaction
- **CPU Time**: Max 10,000ms synchronous, 60,000ms async
- **Heap Size**: Max 6MB synchronous, 12MB async
- **Callouts**: Max 100 per transaction

### Security Requirements

All code reviews must check:
- CRUD/FLS enforcement using `WITH SECURITY_ENFORCED` or Schema methods
- No dynamic SOQL with user input (SOQL injection)
- Sharing rules respected (`with sharing` keyword)
- No hardcoded credentials or IDs

### Testing Standards

- Minimum 85% code coverage
- Positive and negative test scenarios
- Bulk testing (200+ records)
- User context testing (different profiles)
- Data factory patterns (no hardcoded data)

## Commit Message Format

```
🤖 Generated with [Claude Code](https://claude.com/claude-code)
Co-Authored-By: Claude <noreply@anthropic.com>
```

## Learnings Log

### 2024-12-29: Initial Structure
Created the initial plugin structure based on the compound-engineering-plugin pattern, adapted for Salesforce-specific needs.

**Learning**: Salesforce has unique constraints (governor limits, metadata-driven architecture) that require specialized agents beyond traditional code review.

### Template for Future Learnings
```
### YYYY-MM-DD: Title
Description of what happened and what was learned.

**Learning**: Key takeaway that should inform future work.
```

## MCP Server Configuration

The plugin includes MCP servers for enhanced functionality:

```json
{
  "mcpServers": {
    "salesforce-cli": {
      "type": "stdio",
      "command": "sf",
      "args": ["--help"],
      "description": "Salesforce CLI integration"
    },
    "context7": {
      "type": "http",
      "url": "https://mcp.context7.com/mcp",
      "description": "Framework documentation lookup"
    }
  }
}
```

## Testing the Plugin

1. Install locally:
   ```bash
   /plugin install ./plugins/sf-compound
   ```

2. Test commands:
   ```bash
   claude /sf:plan "Add account scoring feature"
   claude /sf:review
   claude /sf:analyze
   ```

3. Test agents:
   ```bash
   claude agent apex-governor-guardian "Review this trigger"
   claude agent lwc-architecture-reviewer "Review this component"
   ```

## Resources

- [Salesforce Apex Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)
- [Lightning Web Components Guide](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)
- [Salesforce Flow Documentation](https://help.salesforce.com/s/articleView?id=sf.flow.htm)
- [Platform Events Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/)