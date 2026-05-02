> This command only works with docker swarm

https://docs.docker.com/reference/cli/docker/secret/


### create secret
```bash
# store password
echo "myStrongPassword123" | docker secret create mysql_root_password -

# list secrets
docker secret ls

# view secret
# 1. go inside container to which secret is attached
docker exec -it <container_id> sh
# 2. read the secrets file
cat /run/secrets/mysql_root_password

# delete secret
docker secret rm mysql_root_password
```

### use secret

```yml
services:
  mysql:
    image: mysql:8
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD_FILE: /run/secrets/mysql_root_password
    secrets:
      - mysql_root_password
    volumes:
      - mysql_data:/var/lib/mysql

# This tells docker: There is already a secret named mysql_root_password in Docker (Swarm), just attach it to this service.
secrets:
  mysql_root_password:
    external: true

volumes:
  mysql_data:
```


