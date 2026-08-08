- VPS means *virtual private server* here

- [connect to vps with ssh](ssh.md)
- [[kitty#kitty on remote server]]

```bash
# connect to vps with username and passowd
ssh username@<ip-address>
# ssh username@<ip-address> -o IdentitiesOnly=yes
```

Transfer files to VPS: [[scp]]


# publish files on server to internet
```bash
# go to the directory which you want to publish to the server
cd ~/public files

# start http server
# python3 -m http.server <port>
python3 -m http.server 8000

# view files from internet
# visit: http://<vps-server-ip-address>:<port>
```

