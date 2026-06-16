[[10_Foundations/vpn/ws-easy|ws-easy]]

```yml
volumes:
  etc_wireguard:

services:
  wg-easy:
    environment:
      - PORT=80
    image: ghcr.io/wg-easy/wg-easy:15.3.0
    container_name: wg-easy
    networks:
      wg:
        ipv4_address: 10.42.42.42
        ipv6_address: fdcc:ad94:bacf:61a3::2a
    volumes:
      - etc_wireguard:/etc/wireguard
      - /lib/modules:/lib/modules:ro
    ports:
      - "51820:51820/udp"
      - "51821:51821/tcp"
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
      # - NET_RAW # ⚠️ Uncomment if using Podman
    sysctls:
      - net.ipv4.ip_forward=1
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv6.conf.all.disable_ipv6=0
      - net.ipv6.conf.all.forwarding=1
      - net.ipv6.conf.default.forwarding=1

networks:
# do not place other networks like 'caddy_net' here, it may create problems like:
#     ws-easy_client cannot access internet because multiple network will create multiple interfaces (e.g. eth0, eth1, etc), and ws-easy server trying to connect with Internet using wrong network-interface
#     for more info, check [[ws-easy_troubleshoot]]
  wg:
    name: wg
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
        - subnet: 10.42.42.0/24
        - subnet: fdcc:ad94:bacf:61a3::/64

```


### Domain setup

Caddy compose file:
```
networks:
	...
    wg:
      external: true
```

Caddyfile:
```
vpn.example.com {
    reverse_proxy wg-easy:80
    # tls internal
}
```