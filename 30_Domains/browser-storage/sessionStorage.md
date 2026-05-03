A Web Storage API that stores data per tab/session in the browser.

**Key characteristics:**

* Lives **only until the tab is closed**
* Not shared across tabs/windows
* Accessible via JavaScript (`window.sessionStorage`)
* Not automatically sent to server
* Size ~5MB (much larger than cookies)

**Example:**

```js
sessionStorage.setItem("token", "abc123");
const token = sessionStorage.getItem("token");
```

**Use cases:**

* Temporary UI state (forms, wizards)
* PKCE code verifier (very common in OAuth 2.0 PKCE)
* Non-sensitive short-lived data

**Security note:**

* Vulnerable to **XSS attacks** (because JS can access it)
* Safer than `localStorage` for session scope, but still not ideal for secrets

---

