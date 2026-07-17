### kitty on remote server

1. `Error opening terminal: xterm-kitty` during execution of `htop`
	This means your VPS does not have the terminfo entry for kitty, so `htop` doesn’t know how to handle the terminal type xterm-kitty.
	
	**Solution**: Install the terminfo on the remote server using: `kitty +kitten ssh user@yourvps`
	You will see creation of `~/.terminfo` directory on vps server
	This need to be done only first time, after that you can use normal `ssh user@vps`
	