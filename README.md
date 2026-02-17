# screenshot-to-claude

> **Quick tip:** You can just use **Cmd+Control+Shift+4** to take a screenshot, then **Ctrl+V** to paste the path directly into Claude Code. No extra setup needed. Try this first before setting up the script below. 

Take a screenshot on macOS and paste the file path directly into [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (or any terminal-based AI tool).

## The Problem

Claude Code runs in a terminal. Terminals only support pasting **text**, not images. So you can't `Cmd+V` a screenshot from your clipboard into Claude Code.

Dragging and dropping image files works, but it's clunky — you have to switch windows, find the file, and drag it in.

## The Solution

A simple script that:

1. Opens the macOS region selector (crosshair)
2. Saves the screenshot to your Desktop
3. Copies the **file path** to your clipboard

Then you just `Cmd+V` the path into Claude Code. Claude Code reads the image from the path.

## Install

```bash
git clone https://github.com/draftbk/screenshot-to-claude.git
cd screenshot-to-claude
./install.sh
```

Or manually copy `ss.sh` anywhere and make it executable:

```bash
cp ss.sh ~/.local/bin/ss.sh
chmod +x ~/.local/bin/ss.sh
```

## Setup: Bind to a Keyboard Shortcut

### Step 1: Create an Automator Quick Action

1. Open **Automator** (Spotlight → type "Automator")
2. Choose **Quick Action**
3. Set **"Workflow receives"** to **no input** in **any application**
4. Drag **"Run Shell Script"** from the left sidebar into the workflow area
5. Set Shell to **/bin/zsh**
6. Replace the script contents with:
   ```
   ~/.local/bin/ss.sh
   ```
7. **Save** as `Screenshot to Claude` (Cmd+S)

### Step 2: Assign a Keyboard Shortcut

1. Open **System Settings → Keyboard → Keyboard Shortcuts → Services**
2. Find **"Screenshot to Claude"** under **General**
3. Double-click to the right and press your desired shortcut (e.g. `Cmd+Option+Shift+4`)

### Step 3: Grant Screen Recording Permission

The first time you use it, macOS will ask for Screen Recording permission. If it doesn't and you get an error:

1. Open **System Settings → Privacy & Security → Screen Recording**
2. Enable permission for **Automator** (click **+** if it's not listed and add `/System/Applications/Automator.app`)

## Usage

1. Press your keyboard shortcut
2. Select a region of the screen
3. Switch to Claude Code
4. Type your question, then **Cmd+V** to paste the screenshot path
5. Claude Code reads and analyzes the image

Example prompt in Claude Code:

```
What does this error mean? /Users/you/Desktop/ss-1771303197.png
```

## Configuration

Set `SS_SAVE_DIR` to change where screenshots are saved (defaults to `~/Desktop`):

```bash
export SS_SAVE_DIR="$HOME/Screenshots"
```

## How It Works

The script is 6 lines of bash:

```bash
screencapture -i "$FILE"              # macOS built-in screenshot tool
echo -n "$FILE" | pbcopy              # copy file path to clipboard
```

That's it. The key insight is that terminals can paste **text** (file paths) but not **images** — so we bridge the gap by putting the path in the clipboard instead.

## Requirements

- macOS (uses `screencapture` and `pbcopy`)
- Claude Code (or any terminal tool that accepts image file paths)

## License

MIT
