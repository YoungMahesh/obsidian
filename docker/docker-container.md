[[docker-nodejs]]

## inspect
```bash
# check the configuration of the container
docker inspect <container-id> | <container-name>
docker inspect <container-id> | grep project.working  # get docker-compose file which started the container
```
Inspect output
- Config
	- Labels
		- com.docker.compose.project.config_files: path of compose-file which started the container 
		- com.docker.compose.project.working_dir: directory of config-file


## logs
```bash
# get last 20 lines of logs
docker logs --tail 20 <container_name_or_id>
# -f = real time logs
docker logs --tail 20 -f <container_name_or_id>
# -t = Include timestamps
docker logs --tail 20 -t <container_name_or_id>

# Docker doesn’t have a built-in “head” option for logs, but you can easily view the first 20 lines by piping the output to head
docker logs <container_name_or_id> | head -n 20
```

```bash
## create container
docker container run -d -p 4306:3306 --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql
# here `mysql` is name of image, `db` will be the name of newly-created container
# -e  == --env, -d == --detach (run container in background)
# -p == --publish, here `3306` is the port inside docker-container, `4306` is port from where we can access 3306
# environment variables will be shown in logs whenever you start the container

# interact with container file-system
docker container run -it <image-id> bash # interact with conatiner using bash
docker container exec -it <container-name> bash
# run == create new container, exec == interact with already running container
# keep CMD = ["bash"] on last line of Dockerfile, if you want access image using bash

# manage containers
docker containr ls # list all running containers
docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"
docker containr ls -a # list all containers
docker container stop <container-id> <container-id2>
docker container start <container-id>
docker container rm <container-id1> <container-id2> # remove stopped containers
docker container rename curr_name new_name
docker container stats  # check cpu and memory usage of all running containers
docker container logs <container-name>
docker container top <container-name> # list processes running by the container
```

