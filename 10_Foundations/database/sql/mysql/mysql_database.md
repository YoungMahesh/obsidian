```sql
SHOW DATABASES;

DROP DATABASE database_name;
DROP DATABASE IF EXISTS my_app_db;

CREATE DATABASE database_name;
CREATE DATABASE IF NOT EXISTS my_app_db;

-- select database (next queries will be executed in this database)
USE my_app_db;
```

### check all tables in database

```sql
-- confirm you get all tables in database
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'your_database_name';
```

### clear all rows from database

```sql
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE table1;
TRUNCATE TABLE table2;
TRUNCATE TABLE table3;
...

SET FOREIGN_KEY_CHECKS = 1;
```

```sql
-- generate 'TRUNCATE TABLE <table-name>' for all tables
SELECT CONCAT('TRUNCATE TABLE `', table_name, '`;') AS stmt
FROM information_schema.tables
WHERE table_schema = 'your_database_name';
```
