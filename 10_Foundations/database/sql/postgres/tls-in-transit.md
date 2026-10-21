In PostgreSQL connection string, `sslmode` controls whether TLS encryption is used and how strictly the client verifies the server's identity.

Example:

```
postgresql://user:password@db.example.com:5432/mydb?sslmode=verify-full
```

## PostgreSQL `sslmode` options

| Mode        | Encrypts connection?    | Verifies server certificate? | Verifies hostname? |
| ----------- | ----------------------- | ---------------------------- | ------------------ |
| disable     | No                      | No                           | No                 |
| allow       | Tries unencrypted first | No                           | No                 |
| prefer      | Tries encrypted first   | No                           | No                 |
| require     | Yes                     | Usually no*                  | No                 |
| verify-ca   | Yes                     | Yes                          | No                 |
| verify-full | Yes                     | Yes                          | Yes                |

If you want to use self-signed certificate for TLS on postgres, use `sslmode=verify-full` and configure the client to use your self-signed certicate as its trusted root certificate.

### Hostname verification

Hostname is the server's name that your client connects to, such as `db.example.com` or `localhost`. It is the host part of your PostgreSQL connection string.
e.g `db.example.com` is hostname in `postgresql://user:password@db.example.com:5432/mydb?sslmode=verify-full`

Hostname verification checks whether the hostname in your PostgreSQL connection string matches a hostname listed in the server's TLS certificate.

The client performs these checks:

1. extract hostname (e.g `db.example.com`) from the the connection string
2. reads the certificate's **Subject Alternative Name (SAN)** field
3. checks whether `db.example.com` matches one of the DNS names in the SAN
4. if the hostname matches and the certificate chains to a trusted certificate, verification succeeds.
   - If you connect using IP address (e.g. `192.168.1.10`), the certificate should contain that address as an **IP SAN**, not merely as DNS SAN
