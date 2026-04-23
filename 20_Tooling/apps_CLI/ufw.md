UFW (Uncomplicated Firewall) is the default, user-friendly command-line firewall configuration tool for Ubuntu and other Linux distributions. 
It acts as a frontend for iptables, allowing users to manage network traffic, such as allowing or blocking specific ports, services, or IP addresses (IPv4 and IPv6). It is disabled by default.

```bash
sudo apt install ufw
sudo ufw status verbose 
```

#### FIRST RULE (don’t lock yourself out)
```bash
# Before enabling on a remote server:
sudo ufw allow ssh
# or explicitly:
sudo ufw allow 22/tcp

# 👉 If you skip this, you can lose SSH access.
```

### basic commands
```bash
# allow a service
sudo ufw allow 80        # HTTP
sudo ufw allow 443       # HTTPS
sudo ufw allow ssh

# deny a port
sudo ufw deny 3000

# delete a rule
sudo ufw delete allow 3000

# see numbered rules
sudo ufw status numbered

# allow only your ip for ssh
sudo ufw allow from 192.168.1.10 to any port 22

# block a specific ip
sudo ufw deny from 1.2.3.4

# ------------- default policies --------------
# Nobody can connect unless allowed
sudo ufw default deny incoming
# Your server can make outbound requests freely
sudo ufw default allow outgoing

# ----------- common real world setup -----------------
sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443

sudo ufw enable

# ------------ cheatsheet ------------------------
ufw enable
ufw disable
ufw status
ufw status verbose

ufw allow <port/service>
# Allow Port Range: sudo ufw allow 2000:3000/tcp

ufw deny <port>
# Deny Traffic: sudo ufw deny http

ufw delete <rule>
# Delete Rules: sudo ufw delete allow 80 or sudo ufw delete [rule number]

ufw reset
ufw limit ssh
```

### ufw profiles
```bash
# check available profiles
sudo ufw app list

# allow profile
sudo ufw allow "Nginx Full"
sudo ufw allow "OpenSSH"
```
