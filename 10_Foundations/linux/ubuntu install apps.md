## `.tar.gz` files

### 1. Extract the archive


```bash
cd ~/Downloads
# -x = extract; extract files from archives
# -z = gzip; specify that archive is compressed using gzip
# -f = filename; next argument is the filename of the archive
tar -xzf postman-linux-x64.tar.gz
```

This will create a folder named `Postman`.

---

### 2. Move it to a system location (optional but recommended)

Move it to `/opt` so it behaves like a proper installed app:

```bash
sudo mv Postman /opt/Postman
```

---

### 3. Create a symlink (so you can run it easily)

```bash
sudo ln -s /opt/Postman/Postman /usr/bin/postman
```

Now you can launch it just by running:

```bash
postman
```

---

### 4. (Optional) Add it to your app menu

Create a desktop entry:

```bash
nano ~/.local/share/applications/postman.desktop
```

Paste this:

```ini
[Desktop Entry]
Name=Postman
Exec=/opt/Postman/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Type=Application
Categories=Development;
```

Save and exit.

Then refresh:

```bash
update-desktop-database ~/.local/share/applications
```

Now Postman should appear in your applications menu.

---

### 5. Run it

Either:

```bash
postman
```

or open it from your app launcher.

---
