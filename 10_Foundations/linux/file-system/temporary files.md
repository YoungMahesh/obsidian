
The `/tmp` directory in Linux is a standard location for **temporary files**. Programs use it to store data that is only needed for a short time, such as temporary downloads, intermediate processing files, sockets, and lock files.

### Characteristics

* **World-writable**: Any user can create files in `/tmp`.
* **Sticky bit enabled**: Users can only delete files they own (unless they are root).
* **Usually cleared automatically**: Many Linux distributions remove old files from `/tmp` during boot or periodically using `systemd-tmpfiles`.
* **Not meant for permanent storage**: Files may disappear without warning.

### Common uses

Programs often store:

* Installation scripts
* Downloaded archives
* Temporary build files
* Image/video processing intermediates
* Database temporary files
* UNIX domain sockets
* Lock files

Example:

```bash
mktemp
# /tmp/tmp.aBc123Xyz
```

### `/tmp` vs `/var/tmp`

| Feature     | `/tmp`                            | `/var/tmp`                                 |
| ----------- | --------------------------------- | ------------------------------------------ |
| Purpose     | Short-lived temporary files       | Temporary files that should survive longer |
| Cleared     | Often at boot or after a few days | Usually preserved across reboots           |
| Lifetime    | Short                             | Longer                                     |
| Typical use | Installers, compilers, browsers   | Large caches, editors recovering sessions  |

For example:

* A compiler stores intermediate object files in `/tmp`.
* An application that may need to resume work after a reboot may use `/var/tmp`.

### Security considerations

Because everyone can write to `/tmp`:

* Use `mktemp` instead of creating predictable filenames.
* Avoid creating files like `/tmp/myfile` directly in scripts, as another user could exploit predictable names.
* The sticky bit prevents users from deleting each other's files but does not prevent everyone from creating files.

Good:

```bash
tmpfile=$(mktemp)
```

Bad:

```bash
echo "data" > /tmp/output.txt
```

