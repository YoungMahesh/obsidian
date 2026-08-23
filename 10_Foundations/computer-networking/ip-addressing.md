
Three concepts are important:

1. IP address → identifies a device/interface
2. Subnet → defines which IP addresses are considered part of the same local network
3. Gateway → the device/interface you use to reach networks outside your local subnet

### IP address
Suppose you have IP address: `192.168.1.10`
An IP address itself isn't enough to know which other addresses are "nearby"
You also have a **subnet** mask, commonly represented using CIDR notaion: `192.168.1.10/24`
The `24` says: The first 24 bits identify the network; the remaining 8 bits identify hosts inside that network.
So  `Network: 192.168.1.0/24` contains:
```
192.168.1.0
192.168.1.1
192.168.1.2
...
192.168.1.254
```
More precisely:
```
11111111.11111111.11111111.00000000
   24 network bits         8 host bits
```


### Subnet
A subnet is a smaller logical network carved out of a larger IP network.


Suppose and organization has `192.168.1.0/24`
It could divide that into smaller networks:
```
192.168.1.0/26
192.168.1.64/26
192.168.1.128/26
192.168.1.192/26
```
Now you have four separate subnets
```
                 Organization
                      │
        ┌─────────────┼─────────────┐
        │             │             │
     Subnet A      Subnet B      Subnet C
  192.168.1.0/26 192.168.1.64/26 ...
```
This is called subnetting.

It's fundamental to networking and is used everywhere: home networks, enterprise networks, cloud networks, Kubernetes, Docker, VPNs, etc

### Gateway

The gateway is: The next-hop device/interface used to reach networks that aren't directly reachable through the local network.
Usually the gateway is a router.

Suppose your IP is: `192.168.1.10/24`
You want to send to: `192.168.1.20`
Your computer determines:
```
192.168.1.20
        ↓
same subnet?
        ↓
      YES
        ↓
send directly
```
But:
```
Your IP:
192.168.1.10/24

Destination:
10.0.0.50
```
It determines:
```
10.0.0.50
    ↓
same subnet?
    ↓
   NO
    ↓
send to gateway
192.168.1.1
```
This decision is made using computer's **routing table**.

For example:
```
Destination       Gateway        Interface
192.168.1.0/24    direct         eth0
0.0.0.0/0         192.168.1.1    eth0
```
The `0.0.0.0/0` route is the **default route**.
It basically means: If I don't have a more specific route, send the packet to this gateway.


### The key distinction

Think of it this way:

| Concept       | Meaning                                                |
| ------------- | ------------------------------------------------------ |
| IP address    | "Who am I?"                                            |
| Subnet        | "Which network am I part of?"                          |
| Gateway       | "Where do I send traffic destined for other networks?" |
| Routing table | "Where should I send this particular packet?"          |
| Interface     | "Through which network connection do I send it?"       |

For example:

```text
IP:       172.18.0.5
Subnet:   172.18.0.0/16
Gateway:  172.18.0.1
Interface: eth0
```

This tells you quite a lot about how that machine participates in networking.

### The mental model 

The networking flow:
```text
IP address
    ↓
Subnet / CIDR
    ↓
Same-subnet vs different-subnet
    ↓
Gateway
    ↓
Routing table
    ↓
ARP
    ↓
NAT
    ↓
DNS
    ↓
Firewalls
    ↓
Docker networking
    ↓
VPN networking (If you are running vpn inside a docker container)
```



```bash
# get IPv4 address of your computer; `&& echo` to put newline after output
curl ifconfig.me -4 && echo

# get IPv6 address of your computer
curl ifconfig.me -6 && echo
```

You can also visit https://api.ipify.org to check your ip-address