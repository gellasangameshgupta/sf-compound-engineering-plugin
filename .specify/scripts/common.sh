#!/bin/bash
# Common utilities for SF Compound Engineering Plugin Spec-Kit scripts

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the root directory of the project
get_project_root() {
    git rev-parse --show-toplevel 2>/dev/null || pwd
}

PROJECT_ROOT=$(get_project_root)
SPECIFY_DIR="$PROJECT_ROOT/.specify"
SPECS_DIR="$SPECIFY_DIR/specs"
TEMPLATES_DIR="$SPECIFY_DIR/templates"
MEMORY_DIR="$SPECIFY_DIR/memory"

# Print colored output
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Get the next spec number
get_next_spec_number() {
    local max=0
    for dir in "$SPECS_DIR"/*/; do
        if [[ -d "$dir" ]]; then
            local num=$(basename "$dir" | grep -oE '^[0-9]+' || echo "0")
            if [[ $num -gt $max ]]; then
                max=$num
            fi
        fi
    done
    printf "%03d" $((max + 1))
}

# Validate spec directory structure
validate_spec_structure() {
    local spec_dir="$1"
    local valid=true

    if [[ ! -f "$spec_dir/spec.md" ]]; then
        print_error "Missing spec.md in $spec_dir"
        valid=false
    fi

    if [[ ! -f "$spec_dir/plan.md" ]]; then
        print_warning "Missing plan.md in $spec_dir"
    fi

    if [[ ! -f "$spec_dir/tasks.md" ]]; then
        print_warning "Missing tasks.md in $spec_dir"
    fi

    $valid
}

# Count completed tasks in a tasks.md file
count_tasks() {
    local tasks_file="$1"
    local total=$(grep -c '^\- \[' "$tasks_file" 2>/dev/null || echo "0")
    local completed=$(grep -c '^\- \[x\]' "$tasks_file" 2>/dev/null || echo "0")
    echo "$completed/$total"
}
