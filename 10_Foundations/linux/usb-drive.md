
Layers of usb drive from hardware(top) to software(bottom)
```txt
Hardware        → USB device
Block device    → /dev/sda
Partition       → /dev/sda1
LUKS mapping    → /dev/mapper/luks-XXXX
Filesystem      → /media/mahesh/USB
```


List USB drives
```bash
# list devices
lsblk -p

# output
/dev/sda      # block-device path
└─/dev/sda1   # partion path
  └─/dev/mapper/luks-aa8a-a358-...  # LUKS-mapping path
```

> Do not unlock USB drive using nautilus/file-manager, as I experienced issues to locking drive which was unlocked with nautilus

Unmount USB drive
```bash
# unmount with LUKS-mapping path
udisksctl unmount -b dev/mapper/luks-aa8a-a358-...
# lock with partion path
udisksctl lock -b /dev/sda1

# Optional
# power-off with block-device name
# after power-off, you need to unplug and plug device again, there is no
#   command to power-on again
udisksctl power-off -b /dev/sda
```


Mount encrypted USB drive
```bash
# unlock using partion-name
udisksctl unlock -b /dev/sda1
# mount using mapper-name (for luks encrypted drive)
udisksctl mount -b /dev/mapper/luks-XXXX
```

