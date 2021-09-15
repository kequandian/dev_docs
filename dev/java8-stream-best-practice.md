#### 检查类型
```java
 String[] types = new String[]{"SMALLINT", "INT", "BIGINT", "DECIMAL"};
 
 String typesLine = Stream.of(types).collect(Collectors.joining(","));
 Assert.isTrue(Stream.of(types).anyMatch(u->u.equals(fieldType)), "仅支持有限的数持据类型: " + typesLine);
```

#### 依据实体中的某个字段键值进行分组
> 如果键值为空，填充
```java
  Map<String, List<FieldMeta>> groupedFields = fields.stream()
      .map(u->{
          if(u.getUniqueKey()==null){
              u.setUniqueKey(u.getFieldName());
              return u;
          }
          return u;
      })
      .collect(Collectors.groupingBy(FieldMeta::getUniqueKey));
```

#### 比较两个列表找出不同项
```java
  var queryOrigin = Stream.of("SMALLINT","INT","BIGINT")
          .collect(Collectors.toList());

  var query = Stream.of("SMALLINT","INT","BIGINT","VARCHAR")
                  .filter(not(queryOrigin::contains))
                  .sorted()
                  .collect(Collectors.toList());

  query.stream().forEach(u->{
            System.out.println(u)
       }
   )
// VARCHAR
```
