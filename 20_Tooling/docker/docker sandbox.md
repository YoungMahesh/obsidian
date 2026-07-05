```bash
sbx ls
sbx rm <sandbox-name>
# Create or run-existing sandbox with claude in current directory
sbx run claude
# Re-attach to an existing sandbox by name (agent read from its spec)
sbx run --name existing-sandbox

# --------- start claude project with existing anthropic credentials & pnpm -------------
# sbx run claude <workspace> <additional-workspace>
# ~/.claude will mount existing .claude directory to sandbox (use :ro for read-only, e.g. ~/.claude:ro)
sbx run claude . ~/.claude
# make symlink so sandbox-claude will credentails from .claude mountend directory
sbx exec -it <sandbox-name> bash
ln -s /home/xyz/.claude/.credentials.json $HOME/.claude/.credentials.json
# ask claude:
#   1. make node version same as local-computer
#   2. enable pnpm (if you are using it), match version same as local-computer
```
