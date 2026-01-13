#!/bin/bash
# List all specifications with their status

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

print_info "SF Compound Engineering Plugin - Specifications"
echo ""

if [[ ! -d "$SPECS_DIR" ]] || [[ -z "$(ls -A "$SPECS_DIR" 2>/dev/null)" ]]; then
    print_warning "No specifications found"
    echo ""
    echo "Create a new specification with:"
    echo "  .specify/scripts/create-new-feature.sh <feature-name>"
    exit 0
fi

printf "%-30s %-15s %-15s %-10s\n" "SPECIFICATION" "STATUS" "TASKS" "FILES"
printf "%-30s %-15s %-15s %-10s\n" "-------------" "------" "-----" "-----"

for spec_dir in "$SPECS_DIR"/*/; do
    if [[ -d "$spec_dir" ]]; then
        spec_name=$(basename "$spec_dir")

        # Determine status from spec.md
        status="Unknown"
        if [[ -f "$spec_dir/spec.md" ]]; then
            status=$(grep -m1 "Status:" "$spec_dir/spec.md" | sed 's/.*Status:[[:space:]]*//' | sed 's/[[:space:]]*$//' || echo "Unknown")
        fi

        # Count tasks
        tasks="-"
        if [[ -f "$spec_dir/tasks.md" ]]; then
            tasks=$(count_tasks "$spec_dir/tasks.md")
        fi

        # Count files
        file_count=$(ls -1 "$spec_dir"/*.md 2>/dev/null | wc -l || echo "0")

        printf "%-30s %-15s %-15s %-10s\n" "$spec_name" "$status" "$tasks" "$file_count"
    fi
done

echo ""
print_info "Use 'cat .specify/specs/<name>/spec.md' to view a specification"
