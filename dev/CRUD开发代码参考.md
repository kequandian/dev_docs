# CRUD类代码参考

### 单实体CRUD开发
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

### 一对多实体CRUD开发

### 分组管理实体CRUD开发


