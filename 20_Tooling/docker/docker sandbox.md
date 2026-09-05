
## setup [[Antigravity#Antigravity CLI]]

```bash
# cd into your project directory, create sandbox with:
sbx run shell
# exist sandbox

# give internet access to your sandbox
sbx ls
sbx policy allow network --sandbox <sandbox-name> "**"
# inside sandbox, you have to use `http://host.docker.internal` instead of `localhost`, e.g.
# `http://host.docker.internal:3000` instead of `localhost:3000`
# so update the database_url, s3_endpoint to use host.docker.internal instead of localhost

# go inside sandbox
sbx run shell

sudo apt install vim
# copy contents of ~/.vimrc on host and paste to sandbox
sbx cp ~/.vimrc shell-test1:/home/agent/.vimrc

# install antigravity through command given at: https://antigravity.google/download/
# set shortcut to run antigravity-cli in full permissions mode
echo "alias agyd='agy --dangerously-skip-permissions'" >> ~/.bashrc
# exit sandbox shell with `ctrl+d`

# path of oauth-token: ~/.gemini/antigravity-cli/antigravity-oauth-token
# copy your local host google-auth-token, settings, keymap to sandbox
sbx cp ~/.gemini/antigravity-cli/settings.json shell-test1:/home/agent/.gemini/antigravity-cli/settings.json
sbx cp ~/.gemini/antigravity-cli/keybindings.json shell-test1:/home/agent/.gemini/antigravity-cli/keybindings.json
sbx cp ~/.gemini/antigravity-cli/antigravity-oauth-token shell-test1:/home/agent/.gemini/antigravity-cli/antigravity-oauth-token

# enable pnpm
# check if it already work
pnpm --version
# if pnpm is failing do this:
corepack use pnpm@10.31.0 # you can use any version you require in project
mkdir -p ~/.local/bin
corepack enable --install-directory ~/.local/bin
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
pnpm --version
pnpm config set store-dir ~/.pnpm-store # set store path
pnpm store path # verify store path
pnpm i

# next time you can go to your project path, run:
sbx run shell
# inside sandbox, run:
agyd
# keep antigravity's own sandbox mode off, else it will get problems finding `pnpm`
/config -> sandbox mode -> off
```


## default
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

Policy
```bash
sbx policy ls

# check if sandbox can access internet
sbx policy check network --sandbox shell-test1 google.com

# allow internet access to sandbox
sbx policy allow network --sandbox shell-test1 "**"


# allow all certain port access to all sandboxes
# this will be added to policy named 'local-policy'
sbx policy allow network localhost:3306
# remove this certain port access from all sandboxes
sbx policy rm network --id <id>
# you will get networkId in:
sbx policy inspect local-policy
```


```bash
# check current version
sbx version

# upgrade version
sudo apt update
sudo apt install docker-sbx
```