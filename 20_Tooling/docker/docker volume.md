```bash
docker volume ls
docker volume create my-vol
docker volume inspect my-vol
docker volume rm my-vol
# Remove unused local volumes (removes volumes which are not attacked to 
#   running or stopped container)
# Run this first to see what will be removed: docker volume ls -f dangling=true
docker volume prune 

# get volume-name of container
docker container inspect <container-name> | grep volume 
```


```yml
services:
  app:
    volumes:
      - my_data:/data

volumes:
  my_data:
	# without 'name', docker will generate name as <folder-name>_my_data
    name: my_data
	# without 'external: true', docker will create new volume
	external: true
```


> Get location of volume on host: check "Mountpoint" in output of `docker volume inspect`
