#!/bin/bash

# Uninstall global OpenCode multi-agent toolkit

set -e

GLOBAL_AGENTS_DIR="$HOME/.config/opencode/agents"

echo "🗑️  Uninstalling OpenCode Multi-Agent Toolkit..."
echo ""

# Remove specific agents
for agent in ask.md multi.md side.md; do
  if [ -f "$GLOBAL_AGENTS_DIR/$agent" ]; then
    rm "$GLOBAL_AGENTS_DIR/$agent"
    echo "  ✓ Removed $agent"
  else
    echo "  ○ $agent not found (already removed)"
  fi
done

echo ""
echo "✅ Uninstallation Complete!"
echo ""
echo "Note: Project-level agents in .opencode/agents/ are not affected."
echo "To remove those, simply delete the .opencode directory from your project."