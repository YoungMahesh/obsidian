#domain 

- [Install](https://caddyserver.com/docs/install#docker)

---

Execute changes made in configuration using:

Reload caddy
```bash
docker compose exec -w /etc/caddy caddy caddy reload
```

OR Restart container
```bash
docker compse down && docker compose up -d
```

---