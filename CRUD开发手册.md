## CRUD类代码参考

### 标准单实体 
- 通过工具生成
```shell
$ cg-cli crud one <table-name>
```

- 代码片断
```java
public interface CRUDTestSaasEntityService  extends CRUDServiceOnly<TestSaasEntity> {
}
public interface TestSaasEntityService extends CRUDTestSaasEntityService {
}
```
```java
@Service
public class CRUDTestSaasEntityServiceImpl extends CRUDServiceOnlyImpl<TestSaasEntity> implements CRUDTestSaasEntityService {
    @Resource
    protected TestSaasEntityMapper testSaasEntityMapper;
    @Override
    protected BaseMapper<TestSaasEntity> getMasterMapper() {
        return testSaasEntityMapper;
    }
}
@Service("TestSaasEntityService")
public class TestSaasEntityServiceImpl extends CRUDTestSaasEntityServiceImpl implements TestSaasEntityService {
}
```

### 关联实体ID

####  列表API增加关联表字段
如实体中有关联表字段, 如部门ID, 列表中需要显示部门名称

**步聚**
  - 在 ${entity}Record 增加列表字段
  ```java 
  public class DeviceRecord extend Device {
      private String departmentName;
  }
  ```
  - 在DAO层 通过 LEFT JOIN 进行多表查询
 ```java 
    SELECT a.id,a.name,a.department_id as departmentId, b.department_name as departmentName from t_device as e LEFT JOIN t_department as b ON a.department_id=b.id WHERE 1=1 
 ``` 
  
  - 前端 对实体**新建**与**编辑**表单中对关联实体的录入与更新
   



### 单实体关联实体ID

**方案一**
[列出 LEFT JOIN 例子]

**方案二**
通过 crud-gateway 解决方案 配置转换 entityName->{associated_id,  associated_table_name, associated_field_array}
- [待讨论]

### 标准一对多实体


### 分组实体


## CRUD 可配置化编程
- 对实体表的 status 变更 说明
  无需花时间编写代码，通过 meta 配置
  

## 代码规范
- CRUD实体新建请求 在 api 目录新建请求类 ${Entity}Request (e.g. DeviceRequest), 通过swagger 向前端提供紧凑的参数请求（过滤 id, 时间等)
- CRUD实体列表查询请求 使用扁平类 ${Entity}Record (e.g.  DeviceRecord)
- CRUD一对多实体，使用 ${Entity}Model （e.g. DeviceModel)
- 程序错误提示编码需依据 业务错误编码规范[Business Code](https://github.com/kequandian/dev_docs/blob/master/Business%20Code.md), 不能自定义。

