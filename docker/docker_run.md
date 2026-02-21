#cli/mysql

Docker run is the command used to create and start a new container from a Docker image.


Use [[mysql]] CLI from docker image to connect to a remote mysql instance
```bash
# -it → interactive terminal
# --rm → container auto-deletes after exit
docker run -it --rm mysql:8 \
  mysql -h 203.0.113.10 -P 3306 -u root -p
```
