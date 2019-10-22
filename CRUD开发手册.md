## CRUD类代码参考

### 单实体 

### 一对多实体

### 分组实体


## CRUD 可配置化编程
- 对实体表的 status 变更 说明
  无需花时间编写代码，通过 meta 配置
  

## 代码规范
- CRUD实体新建请求 在 api 目录新建请求类 ${Entity}Request (e.g. DeviceRequest), 通过swagger 向前端提供紧凑的参数请求（过滤 id, 时间等)
- CRUD实体列表查询请求 使用扁平类 ${Entity}Record (e.g.  DeviceRecord)
- CRUD一对多实体，使用 ${Entity}Model （e.g. DeviceModel)
- 程序错误提示编码需依据 业务错误编码规范[Business Code](https://github.com/kequandian/dev_docs/blob/master/Business%20Code.md), 不能自定义。

## 最佳实践

### 如何通过更改表字段更改 实体字段 ？

### 单实体列表增加一对一多表关联字段

直接通过更变dao层查询语句代, 通常通过 LEFT JOIN 实现

### 单实体详情增加一对一多表关联字段
CRUD Feature

### 一对多实体列表关联字段 

