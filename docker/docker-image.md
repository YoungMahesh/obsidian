## commands
```bash
### image-management
docker image ls  # list all docker-image commands

## create docker image using `Dockerfile` (https://docs.docker.com/engine/reference/builder)
docker build -f <path-of-Dockerfile> -t <name:tag> . # don't forget "." at the end
docker images ls # list all images

# While deleting image:
# 1. Using **IMAGE ID prefix** instead of full image-id will work
docker image rm <image-id>
# 2. Using only TAG or TAG-prefix does not work, need to use both tag with repository in format - <repository>:<tag>
docker image rm <repository>:<tag>
```
