
#llm
### context
- [AGENTS.md file in project root](https://opencode.ai/docs/rules/)

### commands
```bash
opencode stats
opencode stats --days <last N days>
# split usage model-wise
opencode stats --models
opencode stats --days 3 --models
```



###  opencode remote connect
https://opencode.ai/docs/server/

[[ssh#Create tunnel using `LocalForward` in ssh-config]]

```bash
# ------------------- on server -------------------
# opencode serve [--port <number>] [--hostname <string>] [--cors <origin>]
opencode serve --port 4096

# ------------------- on client -------------------
# 1. connect to port 4096 on vps using [[ssh#Create tunnel using `LocalForward` in ssh-config]]
# 2. connect client to server; considering we forwarded 4097 local port to server's 4096
opencode attach http://localhost:4097
```


#### inside TUI

- ctrl+p = commands
	- move through select: n = next; p = previous
- escape: stop current request
- `/connect` - connect with provider
- `/models` - switch model
- `/new` - start new session
- `/sessions` - view history
	- delete-session: hover on session and press `ctrl+d`
- `win+a` = select all text

### MCPs
- https://context7.com/
- https://exa.ai/
### configuration
Stored at `~/.config/opencode/opencode.jsonc`

### API keys
Stored at `~/.local/share/opencode/auth.json`
