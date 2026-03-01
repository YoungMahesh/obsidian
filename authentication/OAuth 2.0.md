## 🔐 What Is OAuth 2.0?

![Image](https://miro.medium.com/1%2AULF38OTiNJNQZ4lHQZqRwQ.png)

![Image](https://mintlify.s3.us-west-1.amazonaws.com/auth0/docs/images/cdy7uua7fh8z/7mWk9No612EefC8uBidCqr/821eb60b0aa953b0d8e4afe897228844/Auth-code-flow-diagram.png)

![Image](https://docs.oracle.com/cd/E55956_01/doc.11123/oauth_guide/content/images/oauth/oauth_overview.png)

![Image](https://jenkov.com/images/oauth2/overview-roles.png)

**OAuth 2.0** (Open Authorization 2.0) is an **authorization framework** that allows a user to grant a third-party application limited access to their resources **without sharing their password**.

Example:
When you click **“Login with Google”**, the app doesn’t get your Google password. Instead, it receives a temporary access token from Google that allows limited access.

It is defined in **RFC 6749 (2012)** and is maintained by the IETF.

---

# 🏛 History of OAuth

## 1️⃣ Before OAuth (The Password Sharing Problem)

In the mid-2000s, users had to give their usernames and passwords to third-party apps to access APIs (e.g., Twitter clients).
This caused:

* Security risks
* Password leaks
* No fine-grained permission control
* No way to revoke access without changing password

There was a need for **delegated authorization**.

---

## 2️⃣ OAuth 1.0 (2007–2010)

* First developed in 2007
* Finalized as **OAuth 1.0a (RFC 5849)** in 2010
* Used cryptographic signatures for every request
* Complex to implement correctly

Used by:

* Early versions of Twitter API
* Flickr
* LinkedIn

### Problems:

* Complicated signing process
* Hard to implement securely
* Not mobile-friendly

---

## 3️⃣ OAuth 2.0 (2012)

Published as **RFC 6749** in October 2012.

Major redesign — not backward compatible with OAuth 1.0.

### Key Improvements:

* Simpler than OAuth 1.0
* Token-based instead of signature-heavy
* Designed for:
  * Web apps
  * Mobile apps
  * Single Page Applications
  * APIs
  * Microservices

OAuth 2.0 separates concerns into four roles:

| Role                 | Description               |
| -------------------- | ------------------------- |
| Resource Owner       | The user                  |
| Client               | The app requesting access |
| Authorization Server | Issues tokens             |
| Resource Server      | API server hosting data   |

---

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

[[OAuth2 - auth code + PKCE]]

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

# 🔑 Important Concepts in OAuth 2.0

### Access Token

Short-lived token used to call APIs.

### Refresh Token

Used to get new access tokens without re-login.

### Scopes

Define what permissions are granted:

* `read:user`
* `write:posts`

### PKCE (Proof Key for Code Exchange)

Security extension for public clients (SPAs/mobile apps).

---

# 🔒 OAuth 2.0 vs Authentication

OAuth 2.0 is **authorization**, not authentication.

Authentication layer built on top:

* **OpenID Connect**

OpenID Connect (OIDC) adds:

* ID Token (JWT)
* User identity claims
* Login standardization

---

# 🌍 Who Uses OAuth 2.0?

Almost all major platforms:

* Google
* Facebook
* GitHub
* Microsoft
* Spotify

When you see:

* “Sign in with Google”
* “Login with GitHub”

That’s OAuth 2.0 (usually with OpenID Connect).

---

# ⚠️ Criticism & Evolution

OAuth 2.0 was criticized because:

* Spec left security decisions flexible
* Many developers implemented it incorrectly
* Confusion between authentication and authorization

To fix this:

* OAuth 2.1 (in progress) simplifies and removes insecure flows
* PKCE is becoming mandatory
* Implicit flow removed
* Security BCPs published

---

# 📌 OAuth 2.1 (Upcoming)

OAuth 2.1 aims to:

* Remove implicit flow
* Require PKCE
* Enforce best practices
* Simplify implementation

---

# 🧠 Why OAuth 2.0 Became Dominant

1. Simpler than OAuth 1.0
2. API economy explosion (2010s)
3. Mobile-first internet
4. Rise of SaaS & microservices
5. Need for delegated access

---

# 🏁 Summary Timeline

| Year  | Event                |
| ----- | -------------------- |
| 2007  | OAuth 1.0 created    |
| 2010  | OAuth 1.0a finalized |
| 2012  | OAuth 2.0 (RFC 6749) |
| 2014  | OpenID Connect 1.0   |
| 2020s | OAuth 2.1 draft      |

---

