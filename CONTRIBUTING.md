# Contributing to Salesforce Compound Engineering Plugin

Thank you for your interest in contributing! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Issues

- Check existing issues before creating a new one
- Use the issue templates when available
- Provide detailed reproduction steps
- Include relevant Salesforce version information

### Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run validation (`cat .claude-plugin/marketplace.json | jq .`)
5. Commit with a descriptive message
6. Push to your branch
7. Open a Pull Request

## Adding New Components

### Adding an Agent

1. Create a new `.md` file in the appropriate category under `plugins/sf-compound-engineering/agents/`
2. Use the frontmatter template:
   ```yaml
   ---
   name: agent-name
   description: Brief description of what the agent does
   ---
   ```
3. Include:
   - Expertise section
   - Review checklist
   - Response format
   - Example findings
   - Anti-patterns to flag

4. Update component counts in:
   - `plugins/sf-compound-engineering/.claude-plugin/plugin.json`
   - `.claude-plugin/marketplace.json`

### Adding a Command

1. Create a new `.md` file in `plugins/sf-compound-engineering/commands/`
2. Use the frontmatter template:
   ```yaml
   ---
   name: sf:command-name
   description: What the command does
   arguments:
     - name: arg1
       description: Argument description
       required: true/false
   ---
   ```
3. Include workflow steps and examples
4. Update component counts

### Adding a Skill

1. Create a new directory in `plugins/sf-compound-engineering/skills/`
2. Add a `SKILL.md` file with frontmatter:
   ```yaml
   ---
   name: skill-name
   description: Brief description
   ---
   ```
3. Add reference documentation
4. Update component counts

## Code Style

### Markdown
- Use ATX-style headers (`#`, `##`, `###`)
- Include code examples with proper syntax highlighting
- Keep lines under 100 characters when possible

### Apex Examples
- Follow Salesforce naming conventions
- Include proper error handling
- Show bulk-safe patterns

### LWC Examples
- Use modern ES6+ syntax
- Follow LWC best practices
- Include accessibility considerations

## Testing

Before submitting:

1. Validate JSON files:
   ```bash
   cat .claude-plugin/marketplace.json | jq .
   cat plugins/sf-compound-engineering/.claude-plugin/plugin.json | jq .
   ```

2. Verify component counts match:
   ```bash
   find plugins/sf-compound-engineering/agents -name "*.md" | wc -l
   find plugins/sf-compound-engineering/commands -name "*.md" | wc -l
   find plugins/sf-compound-engineering/skills -mindepth 1 -maxdepth 1 -type d | wc -l
   ```

## Questions?

Feel free to open an issue for any questions about contributing.
