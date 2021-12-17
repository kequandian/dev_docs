```java
    @PostMapping
    public Tip createEntity(@RequestBody TestEntity entity) {
        Integer affected = 0;
        try {
            CRUDFilterResult<TestEntity> filter = new DefaultFilterResult<TestEntity>();
            affected = testEntityService.createMaster(entity, filter);
            Long id = (Long)filter.result().get(CRUD.primaryKey);
            Assert.notNull(id, "fail to insert master entity!");
            
        } catch (DuplicateKeyException e) {
            throw new BusinessException(BusinessCode.DuplicateKey);
        }

        return SuccessTip.create(affected);
    }
 ```
