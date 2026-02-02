## hooks
### post-commit hook

```bash
# 1. describe hook
# create-file-at .git/hooks/post-commit, this file will execute whenever you git-commit
#!/bin/sh
git push

# 2. make hook executable
chmod +x .git/hooks/post-commit
```


## config
```bash
# ------------------------ configuration ----------------------------------
# use --global flag, to update gobal-configuation file
git config -l   # list global and local git config
git config -e  # update local git-config file which is present at ".git/config"
git config user.name "John Doe" # update User/Author name
git config user.email johndoe@example.com
git config core.editor "code --wait"	# set vs-code default editor for git
git config core.editor "nano -w"       # set nano as default editor for git
```

## credentials
```bash
git clone <repository-http-url> # you will be prompted to put username and password
# set username
git config credential.username xyz
# set password/credintial
git pull # you will be prompted to submit credentials only if credential.helper = cache ('cache' is default)
git config credential.helper store # save remote repository credentials (username, password) permanently
# to change config values edit -> ./.git/config
# 'cache' stores credentials in memory, while 'store' stores it on  'disk'
# location of 'store' credentials: `cat ~/.git-credentials`

```