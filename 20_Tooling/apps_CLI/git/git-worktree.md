**Git Worktree** lets you **checkout multiple branches at the same time** in different folders — all from the same Git repository.

```bash
# create worktree for repo: ~/projects/app
# from inside root directory of repository, create worktree outside
# worktree will be created at ~/projects/app_feature1
git worktree add ../app_feature1

# install dependencies for worktree, as each worktree is a seperate working directory
# for nextjs workteree define PORT (e.g. PORT=3001) in .env to run app in worktree on different port
cd ../app_feature1
npm install

# after merging, remove worktree and branch
git worktree remove ../app-feature-x
git branch -d feature-x
```

---

👉 Advantages of Git Worktree:

- Compare UI across branches instantly
- No branch switching
- multiple AI agents will work multiple tasks at the same time
    
