#domain 

- [Install](https://caddyserver.com/docs/install#docker)

---

Execute changes made in configuration using:

Access `caddy` command from running caddy docker container
```sh
docker exec -it caddy caddy --version
```

```bash
# Reload caddy
caddy reload

# ---------- if runnning caddy through docker-container --------
# reload caddy
docker compose exec -w /etc/caddy caddy caddy reload
# or
docker compse down && docker compose up -d


# format caddyFile
docker exec -it caddy caddy fmt --overwrite
# docker run --rm	    Start temporary container and delete it after
# -v $(pwd)/conf:/conf	Mount host conf folder into container
# caddy:2.11-alpine	    Use official Caddy image
# caddy fmt -w /conf/Caddyfile	  Format file and overwrite
docker run --rm -v $(pwd)/conf:/conf caddy:2.11-alpine caddy fmt -w /conf/Caddyfile
```

---

## Basic Authentication

You can protect a domain (or any path) in **Caddy reverse proxy** using **Basic Authentication** with the `basicauth` directive.
Useful in protecting **internal dashboards** (Grafana, admin panels, etc.)

### 1. Generate a Password Hash

Caddy does **not store plain passwords**.
You must generate a hash first.

Run:

```bash
caddy hash-password

# if caddy is running as docker container
docker exec -it caddy caddy hash-password
```

It will ask for a password and output something like:

```
$2a$14$7Q9r8....
```

Copy this hash.

---

### 2. Add `basicauth` in Caddyfile

Example:

```caddyfile
example.com {

    basic_auth {
        admin $2a$14$7Q9r8....
    }

    reverse_proxy localhost:3000
}
```

Explanation:

| Directive         | Meaning                           |
| ----------------- | --------------------------------- |
| `basic_auth`      | Enables HTTP Basic Authentication |
| `admin`           | Username                          |
| `$2a$14$7Q9r8...` | Password hash                     |
| `reverse_proxy`   | Backend service                   |

When someone visits **example.com**, the browser will show a **username/password prompt**.

---

### 3. Protect Only a Path (optional)

Instead of the whole domain:

```caddyfile
example.com {

    route /admin/* {
        basic_auth {
            admin $2a$14$7Q9r8....
        }

        reverse_proxy localhost:3000
    }

    reverse_proxy localhost:3001
}
```

Now:

| URL         | Behaviour         |
| ----------- | ----------------- |
| `/admin/*`  | Requires password |
| other paths | public            |

---

### 4. Protect a Subdomain

```caddyfile
private.example.com {

    basic_auth {
        user $2a$14$7Q9r8....
    }

    reverse_proxy localhost:8080
}
```

---

### 5. Multiple Users

```caddyfile
basic_auth {
    alice $2a$14$hash1
    bob   $2a$14$hash2
}
```

---

### 6. Reload Caddy

```bash
caddy reload
# for docker
docker compose exec -w /etc/caddy caddy caddy reload
```

