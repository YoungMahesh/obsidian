```bash
# docker-network
docker network ls
docker network create <network-name>
docker network rm <network-name1> <network-name2> ...

# check containers attached to the network
docker network inspect <network-name>
#  under "Containers" section you will see list of containers on this network

# check networks to which container is attached
docker inspect <container-name> --format '{{json .NetworkSettings.Networks}}' | jq
```


```yml
services:
  app:
    image: nginx
    networks:
      - my_network

networks:
  my_network:
	  # use 'external: true' if network with name (here - my_network) is already created, 
	  # without this docker will automatically create network with name
	  external: true
	  # by default, Docker Compose prefixes resource names with the project name to avoid collisions
	  # without setting name, name of the network will be <folder_name>_my_network
	  name: my_network
```