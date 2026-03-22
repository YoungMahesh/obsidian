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
