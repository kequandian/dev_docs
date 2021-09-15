#### 检查类型
```java
 String[] types = new String[]{"SMALLINT", "INT", "BIGINT", "DECIMAL", "VARCHAR", "TEXT", "TIMESTAMP", "DATE", "TIME", "DATETIME"};
 Assert.isTrue(Stream.of(types).anyMatch(u->u.equals(fieldType)), "仅支持有限的数持据类型: "+ Stream.of(types).collect(Collectors.joining(",")));
```

