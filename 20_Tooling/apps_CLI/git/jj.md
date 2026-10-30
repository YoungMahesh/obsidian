[[jj architecture]]

`git`:  file-changes -> commit message -> create commit
`jj`:  (working commit) set commit message -> file-changes -> create new commit (commit), this will commit changes to previous working commit

Commands:
```bash
# check status
jj st

# set commit commit message for changes we are going to make
jj describe
# create env for new commit; add current changes to working-commit
jj new

# view changes
jj diff

jj log
# first id in log is 'change ID' - this remains same when commit re-written
# second id in log is 'commit ID' - this is git commit id

# show only the current revision
jj log -r @
# show all revisions
jj log -r 'all()'
# show the current revision and its ancestors
jj log -r 'ancestors(@)'
# show heads of the revision graph
jj log -r 'heads(all())'
# show the patch/diff associated with each revision
jj log -p

# log of all operations
jj op log
# undo last operation
jj undo
# redo operation
jj redo

# To untrack a path, add it to your .gitignore and run:
jj file untrack <path>

jj resolve <confilt-commit-id>

# add changes to previous/parent commit, like `git commit --amend`
jj squash

# remove middle commit, descendents of abandoned commit will get connected to parent of abandoned commit
jj abandon <commit-id>
```

Less used commands:
```bash
# see each recorded change for current commit
jj evolog
```


Configuration:
```bash
jj config set --user user.name "Martin von Zweigbergk"
jj config set --user user.email "martinvonz@google.com"
```


Installation:
```bash
# download antigravity from: https://github.com/jj-vcs/jj/releases

# Extract antigravity directory 
tar -xzf jj-v0.44.0-x86_64-unknown-linux-musl.tar.gz 
# you will get 3 files - jj , LICENCE, README.md; rm LICENCE README.md

# move jj binary to ~/.local/bin
mv jj ~/.local/bin/

# open new terminal and verify installation
jj --version
```