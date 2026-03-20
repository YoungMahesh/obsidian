
In Git, your files move through **distinct areas (states)** from editing to being safely stored in history. Understanding these areas explains *why* Git behaves the way it does.

---


![Image](./git-workflow.png)
## File state transitions (mental model)

```
Untracked
   ↓ git add
Staged
   ↓ git commit
Committed (Local Repo)
   ↓ git push
Remote Repo
```

---

## Key Git commands mapped to areas

| Command                | From → To                          |
| ---------------------- | ---------------------------------- |
| `git add`              | Working Directory → Staging Area   |
| `git commit`           | Staging Area → Local Repository    |
| `git checkout -- file` | Repository → Working Directory     |
| `git reset file`       | Staging Area → Working Directory   |
| `git push`             | Local Repository → Remote          |
| `git pull`             | Remote → Local → Working Directory |

---

## Why Git separates these areas (core idea)

Git assumes:

> **You want control over history**

So it separates:

* *Editing* (Working Directory)
* *Selecting* (Staging Area)
* *Recording* (Repository)

This is why Git is powerful for:

* Clean commits
* Partial changes
* Safe experimentation
