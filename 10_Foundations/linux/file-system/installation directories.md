## package installations

### `~/.local`

Use when:
You don't have root access.
The software is only for your account.
You're testing or developing tools.
You're installing language-specific tools (Python, Rust, etc.).


### `/usr/local`:

Use when:
The software should be available to all users.
You're administering the machine.
You're compiling software from source for system-wide use.
You're installing shared CLI tools on a server.


### `/usr/bin`  or  `/usr/lib`

These directories are managed by your distribution's package manager (e.g., `apt`, `dnf`, `pacman`).
You generally shouldn't manually copy files there, because package updates may overwrite them or create conflicts.


## Optional, Third-pary application software - `/opt`

The `/opt` directory is intended for **optional, third-party application software** that is not part of the core operating system.

It is defined by the Filesystem Hierarchy Standard (FHS).

### Purpose

Unlike `/usr`, which is primarily managed by your Linux distribution's package manager (`apt`, `dnf`, etc.), `/opt` is commonly used for software that is:

* Installed manually
* Distributed as a standalone package
* Self-contained (includes most of its own libraries and files)
* Installed without interfering with system files

Typical examples:

```
/opt/
├── google/
│   └── chrome/
/opt/
├── jetbrains/
│   └── idea/
/opt/
├── vscode/
/opt/
├── postman/
/opt/
└── my-company-app/
```

Each application generally gets its own directory.

---

### Typical layout

An application installed in `/opt` might look like:

```
/opt/myapp/
├── bin/
├── lib/
├── share/
├── plugins/
├── config/
└── myapp
```

Everything needed by the application stays together.

---

### Why not `/usr/local`?

A good rule of thumb is:

| Directory    | Intended for                                                             |
| ------------ | ------------------------------------------------------------------------ |
| `/usr`       | Files managed by the distribution                                        |
| `/usr/local` | Software installed locally following the normal Unix directory structure |
| `/opt`       | Large, self-contained third-party applications                           |
| `~/.local`   | Software installed only for a single user                                |

For example:

```
/usr/local/bin/mytool
/usr/local/lib/libmytool.so
```

is split across multiple directories.

Whereas:

```
/opt/mytool/
    bin/
    lib/
    plugins/
```

keeps everything together.

---

### PATH

Executables inside `/opt` are **not automatically on your `PATH`**.

You usually either:

Create a symlink:

```bash
sudo ln -s /opt/myapp/bin/myapp /usr/local/bin/myapp
```

or add the directory to your `PATH`:

```bash
export PATH="/opt/myapp/bin:$PATH"
```

---

### Permissions

Like most system directories:

```
drwxr-xr-x root root
```

Only root can modify its contents.

---

### Common software installed in `/opt`

Many vendors choose `/opt` because it avoids conflicts with distribution packages.

Examples include:

* Google Chrome
* PyCharm
* IntelliJ IDEA
* Android Studio
* Postman
* MATLAB

Some distributions also install proprietary software there by default.

---
