## 🔐 What Is OAuth 2.0?


![Image](https://jenkov.com/images/oauth2/overview-roles.png)

**OAuth 2.0** (Open Authorization 2.0) is an **authorization framework** that allows a user to grant a third-party application limited access to their resources **without sharing their password**.

Example:
When you click **“Login with Google”**, the app doesn’t get your Google password. Instead, it receives a temporary access token from Google that allows limited access.

It is defined in **RFC 6749 (2012)** and is maintained by the IETF.

---

[[OAuth History]]

---

[[OAuth 2.0 Flows]]  [[OAuth 2.0 - Authorization Flow]]

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



