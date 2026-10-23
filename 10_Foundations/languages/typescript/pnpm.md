[[node]] [[npm]]

### basic commands

```bash
# install in dependencies
pnpm add <pkg>

# install in dev-dependencies
pnpm add <pkg> --save-dev

# move from dev-dependencies to dependencies
pnpm add <pkg> --save-prod

# Check what would be updated
pnpm outdated

# run package installed in current project
pnpm exec <pkg> <pkg-command>

# equivalent of `npx` in npm
# downalod (if not already available) package, execute it, store it in cache to use it later on or remove automatically from cache in  during future cleanup
pnpm dlx <pkg> <pkg-command>
```

### install

```bash
# https://pnpm.io/installation#using-npm
npm install -g pnpm@latest-10
which pnpm
```

### switch version

```bash
# do this inside repository, if you do it in ~/, package.json mentioning pnpm version will get created in ~/
corepack use pnpm@<version>
pnpm -v
```

## move project from npm to pnpm

1. remove `package-lock.json` and `node_modules`

```bash
rm -rf node_modules package-lock.json

# https://pnpm.io/package_json#engines
# set pnpm version in package.json.engines.pnpm
```

2.  set version of pnpm in `package.json`

```json
{
  "engines": {
    "node": "24.11.1",
    "pnpm": "10.29.2"
  }
}
```

3. use pnpm while executing scripts

```bash
pnpm run dev
# instead of - npm run dev
```

## additional

```bash
pnpm store path
```

## problems

### File Watcher Limit Exceeded (`ENOSPC`) in VS Code & Forks

#### Cause

Linux restricts inotify watch descriptors via `fs.inotify.max_user_watches` (kernel default: **8,192**). Sandboxes, Docker containers, and VMs typically inherit this default.

In **pnpm** projects, dependencies live in `node_modules/.pnpm/`. VS Code's default exclude (`**/node_modules/*/**`) only skips subdirectories of top-level packages. Because `.pnpm` is a single top-level folder, the watcher traverses its entire nested dependency tree—instantly consuming all 8,192 watches.

---

#### Fix 1: Strictly Exclude `node_modules` (Recommended)

Add or update `.vscode/settings.json` to prevent watching generated and dependency folders:

```json
{
  "files.watcherExclude": {
    "**/node_modules/**": true,
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/.next/**": true
  }
}
```

---

#### Fix 2: Raise Linux Inotify Limit (System-wide)

**524,288** is the official standard recommended by Microsoft, JetBrains, and Meta (watches allocate ~1 KB kernel RAM on-demand, consuming ~10–15 MB for typical projects).

```sh
sysctl -w fs.inotify.max_user_watches=524288
```

#### Verify if problem is fixed:

Check maximum watches allowed, in use watches and available watches.

```sh
bash -c 'max=$(cat /proc/sys/fs/inotify/max_user_watches); used=$(grep -h "inotify wd" /proc/*/fdinfo/* 2>/dev/null | wc -l); echo "Max: $max | In Use: $used | Available: $((max - used))"'
```
