## springboot的时区问题

> application配置中的url需要加时区配置 `&serverTimezone=Asia/Shanghai`

```
jdbc:mysql://HOST/dbname?autoReconnect=true&useUnicode=true&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai

```

#### 时间格式定义

```java
@TableName("t_test_saas_entity")
public class TestSaasEntity extends Model<TestSaasEntity> {
  
   @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	@TableField("created_time")
	private Date createdTime;
}
```

