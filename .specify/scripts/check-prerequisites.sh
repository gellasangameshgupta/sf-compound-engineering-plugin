#!/bin/bash
# Check prerequisites for SF Compound Engineering Plugin

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

print_info "Checking prerequisites for SF Compound Engineering Plugin..."
echo ""

# Check Git
if command_exists git; then
    GIT_VERSION=$(git --version | cut -d' ' -f3)
    print_success "Git installed: v$GIT_VERSION"
else
    print_error "Git is not installed"
    exit 1
fi

# Check if we're in a git repository
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    print_success "Inside a Git repository"
else
    print_warning "Not inside a Git repository"
fi

# Check .specify directory structure
if [[ -d "$SPECIFY_DIR" ]]; then
    print_success ".specify directory exists"
else
    print_error ".specify directory not found"
    exit 1
fi

# Check required subdirectories
for dir in memory scripts specs templates; do
    if [[ -d "$SPECIFY_DIR/$dir" ]]; then
        print_success ".specify/$dir directory exists"
    else
        print_warning ".specify/$dir directory missing"
    fi
done

# Check constitution
if [[ -f "$MEMORY_DIR/constitution.md" ]]; then
    print_success "Constitution document exists"
else
    print_warning "Constitution document missing (.specify/memory/constitution.md)"
fi

# Check templates
TEMPLATES_COUNT=$(ls -1 "$TEMPLATES_DIR"/*.md 2>/dev/null | wc -l || echo "0")
if [[ $TEMPLATES_COUNT -gt 0 ]]; then
    print_success "Found $TEMPLATES_COUNT template(s)"
else
    print_warning "No templates found in .specify/templates/"
fi

# Check specs
SPECS_COUNT=$(ls -1d "$SPECS_DIR"/*/ 2>/dev/null | wc -l || echo "0")
if [[ $SPECS_COUNT -gt 0 ]]; then
    print_success "Found $SPECS_COUNT specification(s)"
    echo ""
    print_info "Specifications:"
    for spec in "$SPECS_DIR"/*/; do
        if [[ -d "$spec" ]]; then
            spec_name=$(basename "$spec")
            if [[ -f "$spec/tasks.md" ]]; then
                progress=$(count_tasks "$spec/tasks.md")
                echo "  - $spec_name (Tasks: $progress)"
            else
                echo "  - $spec_name"
            fi
        fi
    done
else
    print_warning "No specifications found in .specify/specs/"
fi

# Check plugin structure
PLUGIN_DIR="$PROJECT_ROOT/plugins/sf-compound-engineering"
if [[ -d "$PLUGIN_DIR" ]]; then
    print_success "Plugin directory exists"

    # Count agents
    AGENTS_COUNT=$(find "$PLUGIN_DIR/agents" -name "*.md" 2>/dev/null | wc -l || echo "0")
    print_success "Found $AGENTS_COUNT agent(s)"

    # Count commands
    COMMANDS_COUNT=$(find "$PLUGIN_DIR/commands" -name "*.md" 2>/dev/null | wc -l || echo "0")
    print_success "Found $COMMANDS_COUNT command(s)"

    # Count skills
    SKILLS_COUNT=$(find "$PLUGIN_DIR/skills" -name "*.md" 2>/dev/null | wc -l || echo "0")
    print_success "Found $SKILLS_COUNT skill(s)"
else
    print_error "Plugin directory not found at $PLUGIN_DIR"
fi

echo ""
print_success "Prerequisites check complete!"
