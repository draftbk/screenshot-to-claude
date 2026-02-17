#!/bin/bash
# Install screenshot-to-claude

set -e

INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing screenshot-to-claude..."

# Create install directory
mkdir -p "$INSTALL_DIR"

# Copy script
cp "$SCRIPT_DIR/ss.sh" "$INSTALL_DIR/ss.sh"
chmod +x "$INSTALL_DIR/ss.sh"

echo ""
echo "Installed to $INSTALL_DIR/ss.sh"
echo ""
echo "Next steps:"
echo "  1. Create an Automator Quick Action (see README.md)"
echo "  2. Assign a keyboard shortcut"
echo "  3. Take a screenshot, then Cmd+V the path into Claude Code"
echo ""
echo "You can also run it directly: $INSTALL_DIR/ss.sh"
