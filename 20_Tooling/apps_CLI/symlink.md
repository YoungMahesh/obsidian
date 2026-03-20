#linux/cli

On Linux, you create symbolic links (symlinks) using the `ln` command

---
## Basic syntax

```bash
ln -s TARGET LINK_NAME
```

* **TARGET** → the real file or directory
* **LINK_NAME** → the symlink you’re creating

---

## Create a symlink to a file

```bash
ln -s /home/mahesh/projects/app/config.yaml ~/config-link.yaml
```

This creates `config-link.yaml` in your home directory that points to the real file.

---

## Create a symlink to a directory

```bash
ln -s /mnt/data/photos ~/photos

# DO NOT use trailing slash
ln -s /path/to/dir/ link   # may behave differently
```

Now `~/photos` behaves like the original directory.

---

## Overwrite an existing symlink

If the link already exists:

```bash
ln -sf TARGET LINK_NAME
```

Example:

```bash
ln -sf /new/path ~/photos
```

⚠️ `-f` force-removes the old link first.

---

## Use relative symlinks (recommended)

Relative links are more portable:

```bash
cd ~/projects
ln -s ../shared/lib lib
```

This still works even if you move the whole `projects` folder.

---

## Check a symlink

```bash
ls -l LINK_NAME
```

Output example:

```
photos -> /mnt/data/photos
```

---

## Remove a symlink (safe)

```bash
rm LINK_NAME
```

❗ This **does NOT delete the original file or directory**.


