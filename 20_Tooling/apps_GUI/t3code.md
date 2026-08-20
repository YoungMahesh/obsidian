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
