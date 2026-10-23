### Metro / Expo: `ENOSPC: System limit for number of file watchers reached`

#### Problem
When running `npx expo start` or `npx react-native start` on Linux, the bundler crashes during startup:

```text
Error: ENOSPC: System limit for number of file watchers reached, watch '.../node_modules/...'
    at FSWatcher.<computed> (node:internal/fs/watchers:323:19)
    at #watchdir (.../@expo/metro-file-map/.../FallbackWatcher.js)
```
*(Or Watchman fails with: `The user limit on the total number of inotify watches was reached; increase the fs.inotify.max_user_watches sysctl`)*

---

#### Cause
1. **Low Linux Default**: Linux kernels default `fs.inotify.max_user_watches` to **`8,192`**.
2. **1 Watch per Directory**: Linux `inotify` requires 1 watch descriptor per watched directory.
3. **Metro Must Watch `node_modules`**: Unlike a backend Node server or VS Code, Metro bundles third-party dependencies (`react`, `react-native`, `expo`, etc.) directly into the client bundle. In monorepos (especially using `pnpm`), `config.watchFolders` contains over 10,000+ directories in `node_modules/.pnpm`.
4. **Both Watchers Use Inotify on Linux**: Both Meta's `watchman` and Metro's Node fallback (`FallbackWatcher`) rely on `inotify` under the hood on Linux. Once the directory count exceeds 8,192, both fail with `ENOSPC`.

> **Note**: You **cannot** fix this by adding `node_modules` to `config.resolver.blockList` in `metro.config.js`. Metro's `blockList` acts as a module resolver filter; blocking `node_modules` prevents Metro from importing `react` and your app will fail to compile.

---

#### Solution (Recommended)

Increase the Linux inotify limit to **`524,288`** (the official standard recommended by React Native and Meta). 
```bash
sysctl -w fs.inotify.max_user_watches=524288
```
Each active watch only uses ~1 KB of kernel RAM on-demand (~12–15 MB for large monorepos).

---

#### Best Practice for Linux Environments
Install `watchman` alongside the increased sysctl limit for faster file indexing and lower CPU usage during development:

```bash
apt install -y watchman
```
