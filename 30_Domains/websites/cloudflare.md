#domain/email-routing #email

# Email Routing
- Search and select 'email routing' in your cloudflare dashboard
- Select domain and setup routing
- In Email Routing dashboard
	- Go to 'Destination Addresses' tab -> Add email on which you want to receive email
	- Go to 'Routing rules' -> Edit 'Catch-all' rule
		- Action: Send to an Email
		- Destination: `<select email to which you want to receive emails>`
	- Toggle 'Status' to 'Active'
- Supports single rule which will send all aliases to desired email
- Test by sending and email to `<anything>@<domain you registered>`

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


