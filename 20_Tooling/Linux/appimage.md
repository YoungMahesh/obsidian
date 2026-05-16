#ubuntu/app-store 

### add app.AppImage to CLI and i3wm_dmenu
1. make appimage executable `chmod +x <name>.appimage`
2. move .appimage to `~/.local/appimages`
3. create symlink with `~/.local/bin`: `ln -s ~/.local/appimages/requestly.AppImage ~/.local/bin/requestly`

If you need `--no-sandbox`, then instead of creating symlink, add bash script as contents of `~/.local/bin/requestly` as:
```bash
#!/usr/bin/env bash
/home/mahesh/Apps/requestly.AppImage --no-sandbox "$@"
```

> `#!/usr/bin/env bash` informs system to use bash from your PATH

> "$@" in a shell script means: “all arguments passed to this script”

### add app.AppImage to GNOME application menu

1. make appimage executable `chmod +x <name>.appimage`
2. move .appimage to `~/.local/appimages`
3. create desktop entry
   - create .desktop file in `~/.local/share/applications`
   - set icon for appimage at `~/.local/share/icons`
   - write configuration in .desktop file
     ```desktop
     [Desktop Entry]
     Name=Your App Name
     Exec=/path/to/your/YourAppImage.AppImage
     Icon=/path/to/your/app-icon.png
     Type=Application
     Categories=Utility;TextEditor;Development;IDE
     Comment=Brief description of your app
	 # app can open: plain text files, JSON files
	 MimeType=text/plain;application/json;
     ```
   - make desktop entry file executable: `chmod +x .local/share/applications/yourapp.desktop`
   - update desktop-database: `update-desktop-database ~/.local/share/applications/`
1. check log file to view errors: `sudo tail -n 30 /var/log/syslog`
