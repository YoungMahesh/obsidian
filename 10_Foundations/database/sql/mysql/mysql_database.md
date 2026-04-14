```sql
SHOW DATABASES;

DROP DATABASE database_name;
DROP DATABASE IF EXISTS my_app_db;

CREATE DATABASE database_name;
CREATE DATABASE IF NOT EXISTS my_app_db;

-- select database (next queries will be executed in this database)
USE my_app_db;
```

### Check all tables in database

```sql
-- confirm you get all tables in database
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'your_database_name';
```

### Clear all rows from database

#### 1. Generate `TRUNCATE TABLE <table-name>` for all tables

> If you are using phpmyadmin, enable 'Full  Text' ('Row above output' -> 'Extra Options' -> 'Full Text') to get full table names

```sql
SELECT CONCAT(
  'TRUNCATE TABLE `', table_schema, '`.`', table_name, '`;'
) AS stmt
FROM information_schema.tables
WHERE table_schema = 'db-name';
```

#### 2. execute generated statement to delete all rows from all tables

Paste the list of generated statements in the format given below and execute.

> If you are using phpmyadmin, disable 'Enable foreign key checks' option (this option is on left-side of 'Go' button)

```sql
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE table1;
TRUNCATE TABLE table2;
TRUNCATE TABLE table3;
...

SET FOREIGN_KEY_CHECKS = 1;
```

#### 3. Reset AUTO_INCREMENT (optional)

```sql
ALTER TABLE `table1` AUTO_INCREMENT = 1;
ALTER TABLE `table2` AUTO_INCREMENT = 1;
...
```

