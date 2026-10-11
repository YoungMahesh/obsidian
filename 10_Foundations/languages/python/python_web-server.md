## share files on your Wi-Fi network using python's built in HTTP server

1. Start the file server.
On Ubuntu, open a terminal in the directory you want to share:
```sh
cd ~/Documents
python3 -m http.server 8000 --bind 0.0.0.0
```

2. Find your local IP address. 
In another terminal, run:
```sh
hostname -I
```

Suppose your IP address is `192.168.1.10`. From another device connected to the same Wi-Fi, open:

[http://192.168.1.10:8000](http://192.168.1.10:8000)

You can browse and download files in the shared directory using your phone, tablet, or another computer.

### Important details

- Port: `8000` — change it to another port if needed.
- Directory: The directory where you run the command becomes the web root.
- Access: `0.0.0.0` makes the server listen on all network interfaces.
- Stop: Press `Ctrl+C` in the terminal.
- Security: Python's built-in server has no authentication and allows visitors to download accessible files. Don't expose it to the internet or run it in a directory containing private files.

If Ubuntu's firewall is enabled, you may need to allow the port on your local network.
```sh
sudo ufw allow from 192.168.1.0/24 to any port 8000 proto tcp
```

Replace `192.168.1.0/24` with your actual Wi-Fi subnet if different.

Note: This is a read-only file server for browsing and downloading, not uploading or editing files through a browser.
