

### Configure domain provider

1. Visit your domain-provider e.g.  [Cloudflare Registrar](https://www.cloudflare.com/en-in/products/registrar/) 
2. Go to `DNS` -> `Default name servers` -> `Custom records` -> `Manage custom records`
3. point domain to your ip address


| Type | **Host / Name**                                                                                           | Data/Target                                     | TTL     |
| ---- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------- | ------- |
| A    | Name of subdomain (e.g. `whoami` for `whoami.example.com`, keep empty for main domain like `example.com`) | IP-address of your server (e.g. `203.0.113.10`) | default |

| Type | Host / Name | Target / Value |
| ---- | ----------- | -------------- |
| A    |             | `203.0.113.10` |
| AAAA |             | `2001:db8::1`  |

Meaning:

```text
abc.com → IPv4 → 203.0.113.10
abc.com → IPv6 → 2001:db8::1
```

Both records coexist without any conflict.


> You **can and should set both `A` and `AAAA` records for the same domain**. This is called a **dual-stack configuration** and is standard practice today. 🌐

> In DNS settings, **Host**, **Name**, and **Hostname** usually refer to the same concept, but the exact label depends on the DNS provider’s UI. They all indicate the domain label where the record applies.


---


### point all subdomains to your ip address

**Using A record**:

| **Host Name** | Type | Data/Target   | TTL     |
| ------------- | ---- | ------------- | ------- |
| `*`           | A    | `76.76.21.21` | default |

### point specific subdomain to your ip address

- Point docs.\<domain-name> and all subdomains of docs.\<domain-name> to server

| Type | Name     | Value         |
| ---- | -------- | ------------- |
| A    | `docs`   | `<SERVER_IP>` |
| A    | `*.docs` | `<SERVER_IP>` |


OR you can use CNAME to point to main or sub-domains

| Type      | Name          | Value             |
| --------- | ------------- | ----------------- |
| A         | `example.com` | `203.0.113.10`    |
| CNAME     | `docs`        | `example.com`     |
| CNAME<br> | `*.docs`      | `example.com`     |
| CNAME     | `dashboard`   | `app.example.com` |
| CNAME     | `*.dashboard` | `app.example.com` |


---

### What the Browser Does

When a user visits:

```
https://abc.com
```

The client asks DNS for **both records**:

```text
abc.com → A?
abc.com → AAAA?
```

DNS response:

```text
A     → 203.0.113.10
AAAA  → 2001:db8::1
```

The browser then tries connections using the **Happy Eyeballs** algorithm:

1. Try IPv6
2. If IPv6 fails or is slower → quickly fallback to IPv4

This ensures the **fastest working connection automatically**.
You can set both A and AAAA at the same time for subdomains also.


Advantages of Having Both
1. Maximum compatibility: Some networks still support **only IPv4**.
2. Future-proof: New networks are increasingly **IPv6-first** (especially mobile networks).
3. Automatic optimization: Clients choose the best protocol.


---


### Core rules

✅ **Valid**

| Record Type | Value Must Be           |
| ----------- | ----------------------- |
| **A**       | IPv4 address            |
| **AAAA**    | IPv6 address            |
| **CNAME**   | Another **domain name** |


A domain with CNAME cannot have other records
❌ **Invalid**:

| Type  | Name   | Value          |
| ----- | ------ | -------------- |
| CNAME | `docs` | `abc.com`      |
| A     | `docs` | `203.0.113.10` |

