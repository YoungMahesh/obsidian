
### connection URI

MySQL database URI:
```bash
# mysql://USER:PASSWORD@HOST:PORT/DATABASE
mysql://root:secret123@localhost:3306/myapp
```

### Connect to remote mysql server
```bash
# mysql -h <ip-addres> -P <port> -u <username> -p
# -h = host; -P = port; -u = username; -p = password; 
mysql -h 127.0.0.1 -P 3306 -u root -p
# -pMyPassword = to include password in command line
mysql -h 127.0.0.1 -P 3306 -u root -pMyPassword

# instead of installing mysql CLI, you can mysql-CLI from local docker image
# docker run -it --rm --network host <docker-image-name> \
#   mysql -h <ip-address> -P 3306 -u <USERNAME> -p
docker run -it --rm --network host mysql:8.3.0 \
  mysql -h 127.0.0.1 -P 3306 -u root -p
```

### connect to docker container app on same docker network

1. create mysql user for app
```bash
# login to docker mysql intance 
docker exec -it mysql mysql -u root -p
```
```sql
-- create mysql user and give him access to certain database
CREATE USER 'app_user'@'%' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON <database-name>.* TO 'app_user'@'%';
FLUSH PRIVILEGES;
```

2. create `DATABASE_URL` string for `.env` file of app
```
mysql://app_user:strong_password@<mysql-container-name>:3306/<database-name>
```

3. restart app container
```bash
docker compose down
docker compose up -d
```


### Private connection using ssh 
In example below, we are going to connect to mysql docker container port on vps to localhost port using ssh

1. In docker-compose file of mysql container, open it's port for localhost of vps, in this way it is not exposed to public internet but exposed internally inside vps
```yml
services:
  mysql:
    container_name: mysql
    ports:
      - "127.0.0.1:3306:3306"
```

2. From local computer, create ssh tunnel which will connect port on VPS to port on local computer. 
```bash
# after this command, if you get logged-in into vps then tunnel is estiblished
# once you logout from ssh-connection this tunnel will be closed
ssh -L 3310:localhost:3306 vps-user@vps-ip 
# here, port on left side - 3310 is port on local-computer
# port on right side - locahost:3306 is port on vps-server
```

3. Connect to remote mysql using `localhost:<tunnel-port>`
```bash
# -h = host; -P = port; -u = username; -p = password; 
# -pMyPassword = to include password in command line
# 127.0.0.1 reprsents localhost
mysql -h 127.0.0.1 -P 3310 -u root -p
```


### manage databases
```sql
-- create a mysql table with name 'articles'
create database articles;

-- list all database
show databases;

-- delete database
drop database articles;
```

