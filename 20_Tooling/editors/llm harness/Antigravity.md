### Antigravity IDE

Installation:
```bash
# download antigravity from: https://antigravity.google/download/

# Extract antigravity directory 
tar -xzf 'Antigravity IDE.tar.gz'

# rename extracted antigravity directory
mv 'Antigravity IDE' antigravity-ide-<version>

# move antigravity directory to /opt
mv antigravity-ide-v2.5.5 /opt/

# use antigravity-ide package at <antigravity-dir>/bin/antigravity-ide
# Create `/usr/bin/antigravity` with this content:
# --------- file content start -----------------------
#!/usr/bin/env bash
/opt/antigravity-ide-v2.5.5/bin/antigravity-ide --no-sandbox "$@"
# --------- file content end -----------------------

# check if command is available
which antigravity
```

#### Settings
### [Sandbox Mode](https://antigravity.google/docs/sandbox-mode)

Path: `settings -> Agent -> Terminal -> Enable Terminal Sandbox`

When sandboxing is enabled, the Agent's terminal commands are subject to the following restrictions:
- **File System**: Commands can only write to your designated workspace directory and essential system locations. This prevents the Agent from accidentally deleting or modifying files outside your project.

### Antigravity CLI

Start: `agy`

Start with allowing all permissions: `agy --dangerously-skip-permissions`

Commands inside TUI:
```bash
/resume # chat history
/plan # plan mode
/model # change model or thinking effor
<esc> # back
```

#### Keymaps
Add to `~/.gemini/antigravity-cli/keybindings.json`
```json
{
  "navigation.down": [
    "down",
    "ctrl+n"
  ],
  "navigation.up": [
    "up",
    "ctrl+p"
  ]
}
```

#### Config

Enable vim:
- in TUI, execute `/config` 
	- Editor mode: vim
	- Editor mode > insert first: on

