#!/bin/bash

# Install OpenCode multi-agent toolkit globally
# This makes agents available in all OpenCode projects

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
GLOBAL_AGENTS_DIR="$HOME/.config/opencode/agents"

echo "🚀 Installing OpenCode Multi-Agent Toolkit Globally..."
echo ""

# Create global agents directory
mkdir -p "$GLOBAL_AGENTS_DIR"

# Copy agents
echo "📦 Copying agents to $GLOBAL_AGENTS_DIR..."
cp "$PROJECT_ROOT/global-setup/agents/"*.md "$GLOBAL_AGENTS_DIR/"

# Verify installation
echo ""
echo "✅ Installation Complete!"
echo ""
echo "Installed agents:"
ls -1 "$GLOBAL_AGENTS_DIR"/*.md 2>/dev/null | xargs -n1 basename | sed 's/.md$/  • /' | sed 's/^/  /' || echo "  No agents found"
echo ""
echo "📖 Next Steps:"
echo "  1. Reload OpenCode: /reload"
echo "  2. Test an agent: use the ask agent to explain how this works"
echo "  3. View documentation: cat $PROJECT_ROOT/README.md"
echo ""
echo "📚 Full guide: $PROJECT_ROOT/docs/AGENTS_GUIDE.md"
echo ""
echo "🎉 Ready to boost your productivity!"