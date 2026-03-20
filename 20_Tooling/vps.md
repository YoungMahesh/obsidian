- VPS means *virtual private server* here

- [connect to vps with ssh](ssh.md)

```bash
# connect to vps with username and passowd
ssh username@<ip-address>
# ssh username@<ip-address> -o IdentitiesOnly=yes

# transfer file using ssh
scp <source> <destination>
scp /path/to/file username@<ip-address>:/path/to/destination
scp /path/to/file <"host" name from ~/.ssh/config file>:/path/to/destination
```


### publish files on server to internet
```bash
# go to the directory which you want to publish to the server
cd ~/public files

# start http server
# python3 -m http.server <port>
python3 -m http.server 8000

# view files from internet
# visit: http://<vps-server-ip-address>:<port>
```

### setup errors

1. `Error opening terminal: xterm-kitty` during execution of `htop`
	This means your VPS does not have the terminfo entry for kitty, so `htop` doesn’t know how to handle the terminal type xterm-kitty.
	
	**Solution**: Install the terminfo on the remote server using: `kitty +kitten ssh user@yourvps`
	You will see creation of `~/.terminfo` directory on vps server
	This need to be done only first time, after that you can use normal `ssh user@vps`
	