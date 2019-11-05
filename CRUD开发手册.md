# CRUD类代码参考

## 单实体开发

### 单实体CRUD 
- 通过工具生成
```shell
$ cg-cli crud one <table-name>
```

- 代码片断
```java

/// 实体服务接口 继承自CRUD框架服务接口
public interface CRUDTestSaasEntityService  extends CRUDServiceOnly<TestSaasEntity> {
}

/// 实体继承自 CRUD服务接口
public interface TestSaasEntityService extends CRUDTestSaasEntityService {
}
```
```java

/// 实体实现类 继续自 标准CRUD服务实现类
@Service
public class CRUDTestSaasEntityServiceImpl extends CRUDServiceOnlyImpl<TestSaasEntity> implements CRUDTestSaasEntityService {
    @Resource
    protected TestSaasEntityMapper testSaasEntityMapper;
    @Override
    protected BaseMapper<TestSaasEntity> getMasterMapper() {
        return testSaasEntityMapper;
    }
}

/// 实体实现类
@Service("TestSaasEntityService")
public class TestSaasEntityServiceImpl extends CRUDTestSaasEntityServiceImpl implements TestSaasEntityService {
}
```

### 单实体表单字段处理原则
- 实体字段 在API 的CRUD 操作中保持原 字段类型不变， 如**sex**字段为**int**类型, 男=0，女=1,  API不能提供为 "sex":"男", 提交时也不能提交字符类型 "男"


### 单实体关联实体ID

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
   

**方案二**
通过 crud-gateway 解决方案 配置转换 entityName->{associated_id,  associated_table_name, associated_field_array}
- [待讨论]


### 单体体分组管理


### 单实体状态变更

通过 MBCS 基础模块处理，具体使用可参考测试报告 [meta API测试报告](https://github.com/zelejs/saas-test-cases/tree/master/meta)




## 一对多实体开发


## API 业务要求
- 提交数据或输入参数错误是否有提示？
- 业务错误代号是否依照了 [Business Code](https://github.com/kequandian/dev_docs/blob/master/Business%20Code.md) 规范


