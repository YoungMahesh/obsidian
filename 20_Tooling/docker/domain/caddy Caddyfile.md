

```Caddyfile

# 'pa.example.com' domain assigned to docker container 'phpmyadmin' with port '80'
pa.example.com {
	reverse_proxy phpmyadmin:80
}

# 'app.example.com' domain assigned locahost port 3001
# docker container can access localhost using 'host.docker.internal'
# IMPORTANT: the app running should be on "host 0.0.0.0", e.g. for nextjs app - `next dev -H 0.0.0.0`
app.example.com {
 	reverse_proxy host.docker.internal:3001
}

# password protected docs
docs.example.com {
    basic_auth {
        user $2a$14$7Q9r8
    }
    reverse_proxy localhost:8080
}
```