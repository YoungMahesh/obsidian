### bookmarks

In Jujustu `jj`, what git calls a branch is called a **bookmark**.

A bookmark is essentially a named pointer to a commit/change.

```bash
jj bookmark list

# create bookmark at the current change
# jj bookmark create <bookmark-name>
jj bookmark create main

# move bookmark to the current change
# jj bookmark set <bookmark-name>
jj bookmark set main

# move a bookmark to a specific revision
jj bookmark set main -r <revision>

jj bookmark delete main

# bookmarks also represent the names you push to remotes
jj git push --bookmark main
# after fetching, you'll commonly see names such as: main@origin
# This means the 'main' bookmark is known from the 'origin' remote, rather than your local 'main'
```


### revision

A revision is essentially a particular commit/change in the repository's history

Suppose your history looks like:
```
@  abc123  (working copy)
○  def456  Add login
○  789abc  Add database
○  123xyz  Initial commit
```

Each of these is a revision:
- `abc123` -> one revision
- `def456` -> another revision
- `789abc` -> another revision
- `123xyz` -> another revision

You can refer to them with commands such as: `jj show def456` or `jj log -r def456`

A useful model:
```
Repository history
       │
       ├── Revision A
       ├── Revision B
       ├── Revision C
       └── Revision D
```

A revision has information such as:
```
revision ID
parents
author
description
changes
```


#### `jj log`
`jj log` is the command you use in **Jujutsu (jj)** to view the revision history of your repository

In logs, you might see something like:
```
@  qpvxotls user@example.com 2026-09-02 09:50
│  Add login page
○  zzzzzzzz user@example.com 2026-09-02 09:20
│  Initial commit
◆  root()
```

What the symbols mean:
- `@` → **current working-copy revision**
- `○` → another revision
- `◆` → root revision
- `│` → relationship between revisions

