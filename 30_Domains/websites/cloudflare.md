#domain/email-forwarding #email

# email-forwarding
- supports single rule which will send all aliases to desired email

# cloudflare tunnel

#publish-localhost
## publish localhost to public using cloudflare domain

---

### ⚙️ Step 1: Install `cloudflared`

### Linux (you’re on Linux)

```bash
pnpm add -g cloudflared
```

### 🔐 Step 2: Login to Cloudflare

```bash
cloudflared tunnel login
```

* Browser will open
* Select your domain

---

### 🚇 Step 3: Create a tunnel

```bash
cloudflared tunnel create my-tunnel
```

👉 This gives you:

* Tunnel ID
* Credentials file stored locally

---

### 🌐 Step 4: Create subdomain routing

Example: `api.yourdomain.com`

```bash
cloudflared tunnel route dns my-tunnel api.yourdomain.com
```

👉 This automatically:

* Creates a DNS record in Cloudflare
* Points it to your tunnel

---

### ⚙️ Step 5: Create config file

Create:

```bash
~/.cloudflared/config.yml
```

Example config:

```yaml
tunnel: my-tunnel
credentials-file: /home/mahesh/.cloudflared/<TUNNEL_ID>.json

ingress:
  - hostname: api.yourdomain.com
    service: http://localhost:3000
  - service: http_status:404
```

---

### ▶️ Step 6: Run the tunnel

```bash
cloudflared tunnel run my-tunnel
```

Now open:

```
https://api.yourdomain.com
```

👉 Your localhost is live 🚀

---

### 🔁 Optional: Multiple services

You can route multiple subdomains:

```yaml
ingress:
  - hostname: api.yourdomain.com
    service: http://localhost:3000
  - hostname: app.yourdomain.com
    service: http://localhost:3001
  - service: http_status:404
```

---


