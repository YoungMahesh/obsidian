
Local deployment
```yml
services:
  mysql:
    image: mysql:8.3.0
    container_name: cOpenemrMysql
    environment:
      MYSQL_ROOT_PASSWORD: <mysql_password>
      MYSQL_USER: openemr
      MYSQL_PASS: openemr
    ports:
      - 3311:3306
    volumes:
      - vOpenemrMysql:/var/lib/mysql

  openemr:
    image: openemr/openemr:8.0.0
    container_name: cOpenemr
    ports:
      - "3310:80"
    volumes:
      - vOpenemrLogs:/var/log
      - vOpenemrSite:/var/www/localhost/htdocs/openemr/sites
    environment:
      MYSQL_HOST: cOpenemrMysql
      MYSQL_ROOT_PASS: <mysql_password>
      MYSQL_USER: openemr
      MYSQL_PASS: openemr
      OE_USER: admin
      OE_PASS: pass
    depends_on:
      - mysql

volumes:
  vOpenemrLogs:
    name: vOpenemrLogs
  vOpenemrSite:
    name: vOpenemrSite
  vOpenemrMysql:
    name: vOpenemrMysql
```