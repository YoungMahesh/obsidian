#cli/file-manipulation 

The `tar` CLI (Tape ARchive) is used to **create, extract, compress, and view archives** of files and directories. 

---

## Create/Extract archive with **no compression**

```bash
# Create a `.tar` archive (no compression)
# `-c` → create; `-v` → verbose (show files being processed)
# `-f` → filename (archive name comes next)
tar -cvf archive.tar file1.txt file2.txt folder/
tar -cvf project.tar project/
# Append files to existing archive (for uncompressed archives only)
# -r == --append
tar -rvf archive.tar newfile.txt

# Extract a `.tar` archive
# `-x` → extract; `-v` → verbose; `-f` → file
tar -xvf archive.tar
# Extract to specific directory; -C = change to directory
tar -xvf archive.tar -C /path/to/destination/
# ️Extract only specific files
tar -xvf archive.tar file1.txt

# List contents without extracting; -t == --list
tar -tvf archive.tar
```

---

## Create/Extract archive **with compression**: 

1. gzip compression (`.tar.gz` or `.tgz`)
```bash
# gzip (`.tar.gz` or `.tgz`)
# `-z` → gzip compression
tar -czvf archive.tar.gz folder/
# Exclude files when creating archive
tar -czvf archive.tar.gz folder/ --exclude="node_modules"
# Multiple excludes; useful for your Node.js/Docker projects.
tar -czvf archive.tar.gz folder/ \
  --exclude="node_modules" \
  --exclude=".git"
  
# Extract:
tar -xzvf archive.tar.gz
# Extract preserving permissions (Useful for server backups)
# `-p` → preserve permissions
tar -xzvpf backup.tar.gz
# Example for home directory:
tar -czvpf backup-$(date +%F).tar.gz /home/mahesh

# List contents without extracting 
tar -tzvf archive.tar.gz
```

2. bzip compression (`.tar.bz2`)
```bash
# `-j` → bzip2 compression
tar -cjvf archive.tar.bz2 folder/

# Extract:
tar -xjvf archive.tar.bz2
```

3.  xz compression (`.tar.xz`) — best compression
```bash
# `-J` → xz compression
tar -cJvf archive.tar.xz folder/

# Extract:
tar -xJvf archive.tar.xz
```

---


## Incremental Backups 
#backup 

**What Is Incremental Backup?**
- Instead of backing up everything every time, copy only files changed since last backup
- `tar` supports this using a **snapshot file**.

---

# 🧠 How `tar` Incremental Works

It uses:

```bash
--listed-incremental=SNAPSHOT_FILE
```

This snapshot file stores:

* file metadata
* modification times
* inode info

On next run, `tar` checks snapshot and only archives changed files.

---

# 🟢 Step 1 — Create First Full Backup

```bash
tar -czvpf backup-0.tar.gz \
  --listed-incremental=snapshot.file \
  /your/data/directory
```

Example (for your VPS):

```bash
tar -czvpf backup-0.tar.gz \
  --listed-incremental=/root/backup.snar \
  /var/www
```

* `backup-0.tar.gz` → full backup
* `backup.snar` → snapshot metadata file

⚠️ **Do NOT delete the snapshot file**.

---

# 🟡 Step 2 — Create Incremental Backup

Run the same command again:

```bash
tar -czvpf backup-1.tar.gz \
  --listed-incremental=/root/backup.snar \
  /var/www
```

Now:

* Only changed files since last run are saved
* Snapshot file updates automatically

Repeat daily:

```bash
backup-2.tar.gz
backup-3.tar.gz
```

Each contains only changes since previous run.

---

# 📦 Backup Strategy Example (Production VPS)

Day 1 → Full
Day 2 → Incremental
Day 3 → Incremental
Day 4 → Incremental
Day 5 → Full (reset cycle)

To force new full backup:

```bash
rm backup.snar
```

Then run backup again.

---

# 🔄 Restoring Incremental Backups

This is VERY important.

You must restore in order:

### 1️⃣ Extract full backup first:

```bash
tar -xzvpf backup-0.tar.gz -C /restore/location
```

### 2️⃣ Then apply each incremental in order:

```bash
tar -xzvpf backup-1.tar.gz -C /restore/location
tar -xzvpf backup-2.tar.gz -C /restore/location
tar -xzvpf backup-3.tar.gz -C /restore/location
```

Each one layers changes on top.

---

# 🧨 Important Limitations

### ❌ You cannot restore only backup-3 alone

You MUST restore all previous ones.

### ❌ Snapshot file must be preserved

If lost → next run becomes full backup again.

### ⚠️ Deletions are tracked

If a file was deleted, tar records it.

---

# 🛠️ Practical VPS Script Example

```bash
#!/bin/bash

DATE=$(date +%F)
BACKUP_DIR="/root/backups"
SNAPSHOT="$BACKUP_DIR/backup.snar"
SOURCE="/var/www"

tar -czvpf $BACKUP_DIR/backup-$DATE.tar.gz \
  --listed-incremental=$SNAPSHOT \
  $SOURCE
```

Add to cron:

```bash
0 2 * * * /root/backup-script.sh
```

Runs daily at 2 AM.

---

# 🗄️ MySQL + Incremental tar?

⚠️ Important for you:

If backing up MySQL data directory directly → unsafe unless MySQL stopped.

Better approach:

```bash
mysqldump > dump.sql
tar -czf backup.tar.gz dump.sql /var/www
```

For your GitHub Actions backup system, this is safer.

---

# 🆚 Incremental vs Rsync

For servers, many prefer:

```bash
rsync --link-dest
```

Because:

* Easier restore
* Faster
* Better space efficiency

If you're building a serious backup system on your VPS, I’d recommend rsync over tar incremental.

---

# 🚀 When Should You Use tar Incremental?

Good for:

* Local backups
* Simple cron backups
* Archiving projects

Not ideal for:

* Large production infra
* Complex restore scenarios

---

If you want, I can now:

* Design a **production-grade VPS backup strategy** for your Docker + MySQL setup
* Show how to push incremental tar backups to GitHub Releases
* Or explain how rsync incremental backups work (better approach for your case)

What direction do you want to go?
