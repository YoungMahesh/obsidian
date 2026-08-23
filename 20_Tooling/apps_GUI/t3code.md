Run on remote server:
```bash
npx t3@latest service install
npx t3@latest service status
npx t3@latest pair
npx t3@latest service update
npx t3@latest service uninstall
# t3code does not officially support service start and stop

# verify t3code server is live on remote server by running this command inside vps shell
curl -v http://127.0.0.1:3773

# verify t3code is not available to public internet by running this command from anywhere
#   you should get connection refusal
curl -v http://YOUR_VPS_PUBLIC_IP:3773
```

1. install service: `npx t3@latest service install`
2. setup wireguard vpn [[20_Tooling/docker/compose-files/ws-easy|ws-easy]]
3. find wireguard container gateway to host machine - [[20_Tooling/docker/compose-files/ws-easy#Connect local app with wireguard network|ws-easy]]
4. connect t3-code port to wireguard container gateway
	1. find service-name of t3-code: `systemctl --user list-units --type=service | grep -i t3`
	2. create systemd drop-in with t3-code service name, eg. If service name is `t3code.service`,  then create drop-in as:
		1. `mkdir -p ~/.config/systemd/user/t3code.service.d`
		2. `vi ~/.config/systemd/user/t3code.service.d/host.conf`
		3. put in host.conf:
			```
			[Service]
			Environment=T3CODE_HOST=10.42.42.1
			```
		4. reload t3code service:
			```bash
			systemctl --user daemon-reload
			systemctl --user restart t3code
			```
5. Get device pair code: `npx t3@latest pair`
	- Your pairing URL must show our newly connected ip-address, e.g. `http://10.42.42.1:3773/pair#token=<token-code>`
6. Connect your android to wireguard network, then scan QR code of t3 from t3-code android app.


### Errors

If you `npx t3@latest` shows loading and nothing happens, then try to install t3 directlry with `npm install t3 -g`
If you get **Error**:
```bash
npm error path /root/.nvm/versions/node/v24.19.0/lib/node_modules/t3/node_modules/node-pty
npm error command failed
```
Then, `node-pty` needs to compile a native module, but your system doesn't have make installed.
**Fix**:
```bash
sudo apt update
sudo apt install build-essential
```
`build-essential` gives you `make`, `gcc`, `g++`, etc.
