
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


#### inside TUI

- ctrl+p = commands
	- move through select: n = next; p = previous
- escape: stop current request
- `/connect` - connect with provider
- `/models` - switch model
- `/new` - start new session
- `/sessions` - view history
	- delete-session: hover on session and press `ctrl+d`

### configuration
Stored at `~/.config/opencode/opencode.jsonc`

### API keys
Stored at `~/.local/share/opencode/auth.json`