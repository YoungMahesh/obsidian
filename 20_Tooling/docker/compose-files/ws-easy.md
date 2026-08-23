[[10_Foundations/linux/vpn/ws-easy|ws-easy]]

```yml
volumes:
  etc_wireguard:

services:
  wg-easy:
    environment:
      - PORT=80
    #  - HOST=0.0.0.0
    #  - INSECURE=false
    # which network interface on the host should be used for forwarding/NATing VPN traffic to the internet
    #  - WG_DEVICE=eth0
    image: ghcr.io/wg-easy/wg-easy:15.4.0
    container_name: cWgEasy
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
```yml
# attach network to caddy-service
services:
  caddy:
    networks:
      - wg

# define network in network-section
networks:
	...
    wg:
      external: true
```

Caddyfile:
```
vpn.example.com {
    reverse_proxy wg-easy:80
}
```


### Connect local app with wireguard network
If we connect local app with wireguard network in ws-easy container then we can access that app from any device which is connected to this network.

#### 1. Find the network used by ws-easy
```bash
docker inspect cWgEasy --format '{{.HostConfig.NetworkMode}}'
```
Most probably you will get: `wg` as that is the network we created in docker compose file setup

#### 2. Find that docker network's subnet/gateway
```bash
docker network inspect wg

# check 
docker inspect -f '{{json .IPAM}}' wg | jq
```
You will see two gateways - one IPv4 and another in IPv6 format. We will go with IPv4 gateway, as it is simple and sufficient in this case.
Suppose we got: `10.42.42.1` as gateway

#### 3. Confirm the host actually owns that IP

`ip addr` shows addresses belonging to the network namespace in which you run it.
When you run `ip addr` on VPS, you see the VPS host's interfaces.
When you run `docker exec <container-name> ip addr` you see the docker container's interfaces

As we are running t3-code on host machine, we will check if ip-address we are going to connect is i) gateway of wg-network and ii)  owned by host
So, check if you have gateway of wg-network in list of IP addresses owned by host  `ip addr | grep '10.42.42.1'`
If you get an output, then IP is part addresses owned by host.

```
WireGuard container
       │
       │ Docker network
       ▼
Docker host gateway
       │
       ▼
T3 Code
```
