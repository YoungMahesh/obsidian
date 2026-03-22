# 🔄 OAuth 2.0 Grant Types (Flows)

OAuth 2.0 defines multiple authorization flows.

### 1️⃣ Authorization Code Flow (Most Secure)

Used by backend web apps.

Flow:

1. Redirect user to authorization server
2. User logs in and consents
3. App receives authorization code
4. Backend exchanges code for access token

👉 Recommended flow today.

---

### 2️⃣ Implicit Flow (Now Deprecated)

Originally for SPAs.
Tokens were returned directly in browser.

Problem:

* Tokens exposed in URL
* Security risks

Now replaced by **Authorization Code + PKCE**.

---

### 3️⃣ Resource Owner Password Credentials (ROPC)

User gives username/password directly to client.

⚠️ Not recommended anymore.

---

### 4️⃣ Client Credentials Flow

Used for machine-to-machine communication (no user).

Example:

* Microservice calling another microservice

---

### 5️⃣ Device Authorization Flow

For:

* Smart TVs
* CLI tools
* IoT devices

User logs in on another device and authorizes.

---

