## Setup wireguard on server using wg-easy
1. https://wg-easy.github.io/wg-easy/latest/examples/tutorials/basic-installation/
2. https://wg-easy.github.io/wg-easy/latest/examples/tutorials/caddy/
3. Set `WG_DEVICE=eth0` under environment of wg-easy docker-compose file, (this is not mentioned in official-doc but for connecting [internet to docker-container](https://www.reddit.com/r/WireGuard/comments/1ezre4w/no_internet_with_wgeasy/))`
4. In signup form: 
	1. for host: use domain which points to ip-address of server or ip-address of server
	2. for port: keep default
5. after login: create client and download configuration

## Connect to wireguard on server from ubuntu

```bash
# connect
sudo wg-quick up wg0
# disconnect
sudo wg-quick down wg0


# ------------ setup -------------------
sudo apt install wireguard

# copy client-configuration download from wg-easy dashboard to /etc/wireguard
sudo cp my-laptop.conf /etc/wireguard/wg0.conf
sudo chmod 600 /etc/wireguard/wg0.conf

# check status
sudo wg

# test connectivity
ip addr show wg0
curl ifconfig.me
# If wg-easy generated a full-tunnel configuration (`AllowedIPs = 0.0.0.0/0, ::/0`), the IP returned by `curl` should be your VPS's public IP.
```
