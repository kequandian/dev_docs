## springboot的时区问题

> application配置中的url需要加时区配置 `&serverTimezone=Asia/Shanghai`

```
jdbc:mysql://HOST/dbname?autoReconnect=true&useUnicode=true&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai

```

