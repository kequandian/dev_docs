### run h2 server
```
java -jar BOOT-INF/lib/h2-1.4.200.jar
```

### run h2 shell
```
$ java -cp BOOT-INF/lib/h2-1.4.200.jar org.h2.tools.Shell

Welcome to H2 Shell 1.4.200 (2019-10-14)
Exit with Ctrl+C
[Enter]   jdbc:h2:~/test
URL       jdbc:h2:mem:test;MODE=MYSQL;DB_CLOSE_DELAY=-1;DATABASE_TO_UPPER=false;
[Enter]   org.h2.Driver
Driver
[Enter]
User      sa
Password  Password  ><
Type the same password again to confirm database creation.
Password  Password  ><
Connected
Commands are case insensitive; SQL statements end with ';'
help or ?      Display this help
list           Toggle result list / stack trace mode
maxwidth       Set maximum column width (default is 100)
autocommit     Enable or disable autocommit
history        Show the last 20 statements
quit or exit   Close the connection and exit

sql> show tables;
TABLE_NAME | TABLE_SCHEMA
(0 rows, 24 ms)
```
