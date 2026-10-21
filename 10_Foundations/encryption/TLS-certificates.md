TLS certificates are digital certificates that prove a server's identity to clients, such as browsers or PostgreSQL clients, during a TLS connection.

They contain the server's identity (such as a domain name), it's public key, an issuer's information, validity dates, and a digital signature from Certificate Authority (CA).

For example, when you visit https://example.com, you browser verifies the website's TLS certificate before establishing an encrypted connection.

---

Process of verification:
- The CA uses it's private key to digitally sign the server's certificate
- Your Browser has a list of trusted root Certificate Authority (CA) certificates in it's trust store
- The browser uses it's CA's public key to verify that signature
- The browser then uses the server's public key as part of verifying the server's identity and establishing the TLS connection

---

### Self-signed TLS cetificate

A self-signed TLS certificate is a certificate that is signed using it's own private key instead of being signed by a trusted Certificate Authority (CA)

With normal certificate:
- A CA signs the server's certificate using the CA's private key.
- The browser verifies the signature using the CA's public key

With a self-signed certificate:
- The server creates its own certificate and signs it using its own private key
- The certificate's public key is used to verify its signature
- The browser typically displays a security warning because it doesn't already trust that certificate.
- This is typically used for local development and private infrastructure
