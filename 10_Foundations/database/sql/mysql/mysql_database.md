```sql
SHOW DATABASES;

DROP DATABASE database_name;
DROP DATABASE IF EXISTS my_app_db;

CREATE DATABASE database_name;
CREATE DATABASE IF NOT EXISTS my_app_db;

-- select database (next queries will be executed in this database)
USE my_app_db;
```