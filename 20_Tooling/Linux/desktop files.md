Desktop files are application launcher/configuration files used by Linux desktop environments like GNOME, KDE Plasma, and others.

They usually have a `.desktop` extension and define:

* app name
* icon
* executable command
* categories/menu placement
* MIME/file associations
* comments/descriptions
* startup behavior

Example:

```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=Firefox
Comment=Web Browser
Exec=firefox %u
Icon=firefox
Terminal=false
Categories=Network;WebBrowser;
MimeType=text/html;x-scheme-handler/http;x-scheme-handler/https;
```

Common fields:

| Field            | Meaning                            |
| ---------------- | ---------------------------------- |
| `Name`           | Display name                       |
| `Comment`        | Short description/tooltips         |
| `Exec`           | Command to run                     |
| `Icon`           | Icon name or path                  |
| `Terminal`       | Run inside terminal (`true/false`) |
| `Type`           | Usually `Application`              |
| `Categories`     | Menu grouping                      |
| `MimeType`       | File types/URL schemes handled     |
| `StartupWMClass` | Window matching for docks/taskbars |

Common locations:

| Location                       | Purpose                 |
| ------------------------------ | ----------------------- |
| `~/.local/share/applications/` | User-specific launchers |
| `/usr/share/applications/`     | System-wide launchers   |
| `/etc/xdg/autostart/`          | Auto-start apps         |

Useful commands:

```bash
# Validate desktop file
desktop-file-validate myapp.desktop

# Install desktop file system-wide
# desktop-file-install myapp.desktop

# Update desktop database
update-desktop-database ~/.local/share/applications
```

Make executable if needed:

```bash
chmod +x myapp.desktop
```

To launch manually:

```bash
gtk-launch app-id
```
