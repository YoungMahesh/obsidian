
Default prefix mode keymap: `ctrl+b`

```bash
# start herdr on local computer
herdr
# start herdr on remote server
# instead of `ssh <server-name>` use `herdr --remote <server-name>`
herdr --remote <server-name>

# set prefix mode to `ctrl+space`, as we use default `ctrl+b` to move backward in terminal
prefix-mode q # detach; processes will continue run in background
prefix-mode v # split tab veritically
prefix-mode - # split tab horizontally

# after config change, you must stop herdr server and then launch herdr again
herdr server stop

# list keymaps
prefix-mode ?
# switch workspaces(tabs)
prefix-mode <tab> # <tab> = 1 or 2 or 3 ...
```

My config:
To reload config, execute: `herdr server reload-config`
```toml
# ~/.config/herdr/config.toml 
onboarding = false

[keys]
prefix = "ctrl+space"
new_tab = "prefix+t"

[keys.indexed]
tabs = "ctrl"       # e.g. "ctrl" makes ctrl+1..9 switch tabs directly
```
