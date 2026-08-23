`docker inspect` displays detailed low-level information about Docker objects such as containers, images, networks, volumes and more in JSON format.

Syntax: ``
```bash
# docker inspect [OPTIONS] [NAME | ID... ]

# inspect a container by name
docker inspect my-container
# inspect a container by id
docker inspect 4d3c2f1a8b9e
# inspect an image
docker inspect nginx:latest
# inspect a volume
docker inspect my-volume
# inspect a network
docker inspect bridge
```


Pretty-print specific fields using Go templates:
```bash
# get containers ip address
docker inspect -f '{{json .NetworkSettings.IPAddress }}' my-network | jq
```