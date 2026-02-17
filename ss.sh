#!/bin/bash
# screenshot-to-claude: Take a screenshot and copy the file path to clipboard
# so you can paste it directly into Claude Code (or any terminal AI tool).

SAVE_DIR="${SS_SAVE_DIR:-$HOME/Desktop}"
FILE="$SAVE_DIR/ss-$(date +%s).png"

screencapture -i "$FILE"

if [ -f "$FILE" ]; then
  echo -n "$FILE" | pbcopy
  osascript -e 'display notification "Screenshot path copied to clipboard!" with title "Screenshot to Claude"' 2>/dev/null
fi
