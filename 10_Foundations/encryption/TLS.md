TLS (Transport Layer Security) is a protocol that encrypts data while it travels between two computers

Without TLS:
```
Your computer ────────► Server
              plaintext
```
Someone who can intercept the network traffic could potentially see things like:
```
username: myuser
password: secret123
SQL: SELECT * FROM users
```
With TLS:
```
Your computer ────────► Server
             encrypted
```
An attacker might see that data is being transmitted, but not the contents.

**TLS provides 3 important things**
1. Encryption 🔒
	Prevents others from reading the transmitted data.
2. Authentication 🪪
	Helps your computer verify that it's actually talking to the intended server.
3. Integrity 🛡️
	Prevents someone from secretly modifying data while it's being transmitted.


**HTTPS is TLS + HTTP**

When you visit: `https://example.com`, the S essentially means HTTP is being transported over a TLS-protected connection.

TLS isn't a proxy or firewall. It's an encryption/security layer for a network connection.
