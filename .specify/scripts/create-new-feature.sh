#!/bin/bash
# Create a new feature specification from templates

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Usage
usage() {
    echo "Usage: $0 <feature-name>"
    echo ""
    echo "Creates a new feature specification directory with templates."
    echo ""
    echo "Arguments:"
    echo "  feature-name    Name of the feature (lowercase, hyphen-separated)"
    echo ""
    echo "Example:"
    echo "  $0 add-bulk-processing"
    exit 1
}

# Validate feature name
validate_feature_name() {
    local name="$1"
    if [[ ! "$name" =~ ^[a-z][a-z0-9-]*$ ]]; then
        print_error "Feature name must be lowercase, start with a letter, and contain only letters, numbers, and hyphens"
        exit 1
    fi
}

# Main
main() {
    if [[ $# -lt 1 ]]; then
        usage
    fi

    local feature_name="$1"
    validate_feature_name "$feature_name"

    local spec_number=$(get_next_spec_number)
    local spec_dir="$SPECS_DIR/${spec_number}-${feature_name}"

    print_info "Creating new feature specification: $spec_number-$feature_name"

    # Create directory
    mkdir -p "$spec_dir"

    # Copy templates
    if [[ -f "$TEMPLATES_DIR/spec-template.md" ]]; then
        cp "$TEMPLATES_DIR/spec-template.md" "$spec_dir/spec.md"
        # Replace placeholder with feature name
        sed -i.bak "s/\[Feature Name\]/${feature_name}/g" "$spec_dir/spec.md"
        rm -f "$spec_dir/spec.md.bak"
        print_success "Created spec.md"
    else
        print_warning "Template spec-template.md not found"
    fi

    if [[ -f "$TEMPLATES_DIR/plan-template.md" ]]; then
        cp "$TEMPLATES_DIR/plan-template.md" "$spec_dir/plan.md"
        sed -i.bak "s/\[Feature Name\]/${feature_name}/g" "$spec_dir/plan.md"
        rm -f "$spec_dir/plan.md.bak"
        print_success "Created plan.md"
    else
        print_warning "Template plan-template.md not found"
    fi

    if [[ -f "$TEMPLATES_DIR/tasks-template.md" ]]; then
        cp "$TEMPLATES_DIR/tasks-template.md" "$spec_dir/tasks.md"
        sed -i.bak "s/\[Feature Name\]/${feature_name}/g" "$spec_dir/tasks.md"
        rm -f "$spec_dir/tasks.md.bak"
        print_success "Created tasks.md"
    else
        print_warning "Template tasks-template.md not found"
    fi

    print_success "Feature specification created at: $spec_dir"
    echo ""
    print_info "SF Compound Engineering Workflow:"
    echo ""
    echo "  1. /sf:plan    → Generate spec.md and plan.md"
    echo "  2. /sf:work    → Implement the feature"
    echo "  3. /sf:review  → Multi-agent code review"
    echo "  4. /sf:triage  → Prioritize findings"
    echo "  5. /sf:resolve → Fix issues"
    echo "  6. /sf:test    → Generate tests"
    echo "  7. /sf:document→ Generate documentation"
    echo "  8. /sf:health  → Final health check"
    echo "  9. /sf:deploy  → Deployment checklist"
    echo ""
    echo "Start with: /sf:plan \"$feature_name\""
}

main "$@"
