# 高效编程参考 

#### 时间格式定久
```java
@TableName("t_alliance")
public class Device extends Model<Device> {
   
   @DateTimeFormat(pattern = "YYYY-MM-DD")
   @JsonFormat(pattern = "yyyy-MM-dd")
   @TableField("register_time")
   private Date registerTime;
   
}
```
