A **cookie** is a small piece of data stored by the browser and automatically sent with HTTP requests to the server.

Example:

```http
Set-Cookie: sessionId=abc123
```

### Key points:

* Can persist (via `Expires` / `Max-Age`)
* Shared across tabs (same domain)
* Sent automatically with every request to the domain
* Size ~4KB
* Can be made **secure** with flags
* Stored in the browser
* Accessible via JavaScript:

  ```js
  document.cookie
  ```


### Security features:

Cookies can be secured with following flags:

* `HttpOnly` → JS cannot access (protects from XSS) [[httpOnly cookie]]
* `Secure` → sent only over HTTPS
* `SameSite` → prevents CSRF

