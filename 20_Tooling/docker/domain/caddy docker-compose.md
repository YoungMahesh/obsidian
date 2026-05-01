```yml
services:
  caddy:
    container_name: caddy
    image: caddy:2.11-alpine
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    extra_hosts:
	# give caddy-server access to host machine from inside the container to access port like - localhost:3001
      - "host.docker.internal:host-gateway"
    volumes:
      - ./conf:/etc/caddy
      - ./site:/srv
      - caddy_data:/data
      - caddy_config:/config
    networks:
      - caddy_net
    
volumes:
  caddy_data:
  caddy_config:

networks:
  caddy_net:
    external: true

```