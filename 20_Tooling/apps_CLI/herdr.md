
Default prefix mode keymap: `ctrl+b`

```bash
# start herdr on local computer
herdr
# start herdr on remote server
# instead of `ssh <server-name>` use `herdr --remote <server-name>`
herdr --remote <server-name>
prefix-mode q # detach; processes will continue run in background

# after config change, you must stop herdr server and then launch herdr again
herdr server stop

# list keymaps
prefix-mode ?
# switch workspaces(tabs)
prefix-mode <tab> # <tab> = 1 or 2 or 3 ...

```