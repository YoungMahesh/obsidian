
Default prefix mode keymap: `ctrl+b`

```bash
# start herdr on local computer
herdr
# start herdr on remote server
# instead of `ssh <server-name>` use `herdr --remote <server-name>`
herdr --remote <server-name>
prefix-mode q # detach; processes will continue run in background

herdr server stop

# list keymaps
prefix-mode ?
# switch workspaces(tabs)
prefix-mode <tab> # <tab> = 1 or 2 or 3 ...

```