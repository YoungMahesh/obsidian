
```bash
docker login registry.example.com 
docker logout registry.example.com 

# push image to repository
docker tag myapp:latest registry.example.com/test/myapp:latest
docker push registry.example.com/myapp:latest

# list images from registry; 'v2' here represents HTTP API V2
# curl cannot use credentials stored by docker, hence we need to specify them inline
# list repositories/images
curl -u <username>:<password> https://registry.example.com/v2/_catalog
# list all tags of specific repository/image
curl -u <username>:<password> https://registry.example.com/v2/<repository>/tags/list

# pull image from repository
docker pull registry.example.com/myapp:latest
```


docker compose file: 
```yml
services:
  registry:
    image: registry:3.1.1
    container_name: cRegistry
    restart: always
    # ports:
    #   - "5000:5000"
    volumes:
      # use a named volume to ensure your images survive container recreation, updates, and system reboots
      - registry-data:/var/lib/registry
    networks:
      - caddy_net

volumes:
  registry-data:
    name: registry-data

networks:
  caddy_net:
    external: true
```


Setup [[caddy]]  and [[caddy#Basic Authentication]]
```Caddyfile
registry.example.com {
    basic_auth {
        admin $2a$14$...
    }
    reverse_proxy cRegistry:5000
}
```
