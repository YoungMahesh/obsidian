```bash
# login to docker mysql intance 
docker exec -it mysql mysql -u root -p
```

```sql
-- create mysql user and give him access to certain database
CREATE USER 'app_user'@'%' IDENTIFIED BY 'strong_password';
-- <database-name>.* = All objects inside that database
--   . → Separator between database and object
--   * → Wildcard meaning all tables, views, routines, etc.
GRANT ALL PRIVILEGES ON <database-name>.* TO 'app_user'@'%';
FLUSH PRIVILEGES;
```

```sql
-- list user and host from my
SELECT user, host FROM mysql.user;

-- list all users with all details related to them 
-- \G = formatted output
-- prints a lot of data, avoid using this
SELECT * FROM mysql.user\G;
```

```sql
-- reset password of existing user
ALTER USER 'app_user'@'%' IDENTIFIED BY 'new_password';
FLUSH PRIVILEGES;
```

```sql
show grants for 'app_user'@'%';
```