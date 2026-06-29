The **Filesystem Hierarchy Standard (FHS)** is a specification that defines **where files and directories should be located on Unix-like operating systems**, primarily Linux.

Its goal is to make Linux systems predictable. If every distribution placed files in different locations, software, scripts, and administrators would have a difficult time managing systems.

---

# Why does FHS exist?

Imagine if different Linux distributions stored:

* logs in `/logs`
* configuration in `/settings`
* user programs in `/apps`

Software would have to detect each layout.

Instead, FHS says things like:

* Configuration → `/etc`
* Logs → `/var/log`
* User home directories → `/home`
* Temporary files → `/tmp`

This consistency allows software to work across distributions such as Ubuntu, Debian, Fedora, and Arch Linux.

---

# Major directories

| Directory | Purpose                                                                   |
| --------- | ------------------------------------------------------------------------- |
| `/`       | Root of the entire filesystem                                             |
| `/bin`    | Essential user commands (often a symlink to `/usr/bin` on modern systems) |
| `/sbin`   | Essential system administration commands (often a symlink to `/usr/sbin`) |
| `/boot`   | Bootloader files and kernels                                              |
| `/dev`    | Device files                                                              |
| `/etc`    | System configuration                                                      |
| `/home`   | User home directories                                                     |
| `/lib`    | Essential shared libraries (often symlinked into `/usr/lib`)              |
| `/media`  | Automatically mounted removable devices                                   |
| `/mnt`    | Temporary mount points                                                    |
| `/opt`    | Optional third-party software                                             |
| `/proc`   | Virtual filesystem exposing kernel and process information                |
| `/root`   | Home directory of the root user                                           |
| `/run`    | Runtime state created after boot                                          |
| `/srv`    | Data served by services (web, FTP, etc.)                                  |
| `/sys`    | Virtual filesystem exposing kernel and hardware information               |
| `/tmp`    | Temporary files                                                           |
| `/usr`    | User applications, libraries, documentation, and shared data              |
| `/var`    | Variable data (logs, caches, mail, databases, spools)                     |

---

# Static vs Variable

One of the key ideas in FHS is the distinction between static and variable data.

**Static** files rarely change:

```
/usr/bin/bash
/usr/lib/libssl.so
```

**Variable** files change frequently:

```
/var/log/syslog
/var/cache/
```

---

# Shareable vs Unshareable

Another classification is whether files can be shared across multiple machines.

### Shareable

Can be placed on a network filesystem:

```
/usr
/opt
```

Example:

```
100 Linux servers
        │
        └── Shared /usr over NFS
```

---

### Unshareable

Machine-specific files:

```
/etc
/var
/dev
```

Each computer has different:

* hostname
* logs
* devices
* network configuration

---

# Modern changes

Modern Linux systems simplify some of the original hierarchy using the **usr merge**.

Instead of separate directories:

```
/bin
/sbin
/lib
/lib64
```

they are often symbolic links:

```
/bin  -> /usr/bin
/sbin -> /usr/sbin
/lib  -> /usr/lib
```

For example, on Ubuntu:

```bash
$ ls -l /bin

/bin -> usr/bin
```

This simplifies package management while remaining compatible with software that expects the traditional paths.

---

# What FHS does *not* specify

FHS does **not** define:

* Which package manager to use
* Which desktop environment to use
* Which init system to use
* Which filesystem type to use (ext4, Btrfs, XFS, etc.)

It only specifies **where different kinds of files belong**.

---

# Example: Installing an application

Suppose you install a hypothetical application called `myapp`.

A typical FHS-compliant installation might look like:

```
/usr/bin/myapp          # Executable
/usr/lib/myapp/         # Libraries
/usr/share/myapp/       # Icons, translations
/etc/myapp.conf         # System configuration
/var/log/myapp/         # Logs
/var/lib/myapp/         # Persistent application data
```

If it is a self-contained third-party application, it might instead be installed under:

```
/opt/myapp/
```

with a symlink from `/usr/local/bin` or `/usr/bin` to make the executable available on the `PATH`.

---

## Why it's worth learning

Understanding FHS makes it much easier to:

* troubleshoot Linux systems,
* know where applications store configuration and data,
* package software correctly,
* write installation scripts,
* administer servers across different Linux distributions.

Even though some distributions make minor adjustments (such as the `usr` merge), the FHS remains the foundation for the directory layout on most Linux systems.
