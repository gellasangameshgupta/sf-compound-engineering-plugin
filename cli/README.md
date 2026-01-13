# SF Compound Engineering CLI

A CLI tool to initialize **Spec-Driven Development** workflow for Salesforce projects.

Similar to GitHub's `specify init`, but uses the SF Compound Engineering commands.

## Quick Start

```bash
# Using uvx (recommended - no install needed)
uvx --from git+https://github.com/gellasangameshgupta/sf-compound-engineering-plugin.git#subdirectory=cli sfce init .

# Or install permanently
uv tool install --from git+https://github.com/gellasangameshgupta/sf-compound-engineering-plugin.git#subdirectory=cli sfce-cli
```

## Usage

```bash
# Initialize in current directory
sfce init .

# Create and initialize a new project
sfce init my-salesforce-project

# Initialize with AI agent setup
sfce init . --ai claude
sfce init . --ai copilot
sfce init . --ai cursor
sfce init . --ai gemini

# Force overwrite existing .specify
sfce init . --force
```

## What Gets Created

```
your-project/
├── .specify/
│   ├── memory/
│   │   └── constitution.md    # Project principles
│   ├── scripts/
│   │   ├── check-prerequisites.sh
│   │   ├── create-new-feature.sh
│   │   ├── list-specs.sh
│   │   └── common.sh
│   ├── specs/                 # Your feature specs
│   └── templates/
│       ├── spec-template.md
│       ├── plan-template.md
│       └── tasks-template.md
└── ... your code
```

## The Workflow

After initialization, use the SF Compound Engineering commands:

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

## Creating Features

```bash
# Create a new feature spec
.specify/scripts/create-new-feature.sh lead-scoring

# Then start the workflow
/sf:plan "Build a lead scoring system"
```

## Requirements

- Python 3.8+
- Git (recommended)

## License

MIT
