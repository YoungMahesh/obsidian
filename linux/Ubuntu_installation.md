
#install #ubuntu/app-store 
## app installation
### install from apt
```bash
# flameshot (#screeshot), pass (password-store), i3 (i3wm manager), 
# blueman (bluetooth manager), # pavucontrol (audio output management)
# fzf (command line fuzzy-finder)
sudo apt install flameshot pass i3 blueman pavucontrol curl fzf
```

### install using scrips
- setup kanata, kitty, nvim,  by referring to their config-files in dotfiles
- restore backed up data of timewarrior, taskwarrior and setup backup
### install from snap-store
- obsidian, telegram, chromium, brave, vlc, vscode

Pre-installed #app-store
- [snap-store](https://snapcraft.io/store) (for snap packages) and `gnome-software` (for Debian, Snap, Flatpak packages)


### upgrade specific package

**Debian**
```bash
sudo apt --only-upgrade install google-chrome-stable
```

### gpg
- create new sub-key for gpg, store only sub-key on computer, keep master-key offline

### check architecture
- execute `uname -m`
	- If the output is x86_64, your system is 64-bit (x64 or amd64 or x86_64).
	- If the output is i686, i386, or similar, your system is 32-bit (x86).

### make usb-drive compatible for image-flash on ubuntu
- format usb disk -> create partition on whole drive of type FAT 
- use balena-etcher with gnome UI (do not use i3wm interface as it creates problem for sudo password input which leads to error)
---