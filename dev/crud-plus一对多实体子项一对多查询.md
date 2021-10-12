## 1. 整体设计

- 主表：LowMainPage

  ​	实体子项：LowAction

  ​			子项一对多：ModalItemBasic

- 关联字段：page_id、modal_id;

- 关联方式：实体子项通过字段page_id与主表ID建立关联；子项一对多通过modal_id与实体子项ID建立关联；


## 2. API接口

- /api/crud/lowMainPage/lowMainPages
- /api/crud/lowActions/lowActionses

## 3. 查询方式

- POST数据通过page_id、modal_id建立关联，通过GET主表id返回一对多实体子项的一对多数据；

  主表设计(LowMainPage)：

```java
   @Resource
   QueryLowActionsDao queryLowActionsDao;
  
  
   public Tip getLowMainPage(@PathVariable Long id) {
          CRUDObject<LowMainPageModel> entity = lowMainPageOverModelService
                  .registerQueryMasterDao(queryLowMainPageDao)
				  // 需要注册子项列表查询Dao服务
                  .registerQuerySlaveModelListDao(LowActions.class, queryLowActionsDao)
                  .retrieveMaster(id, null, null, null);
  
          if (entity != null) {
              return SuccessTip.create(entity.toJSONObject());
          } else {
              return SuccessTip.create();
          }
    }
```


实体子表(LowActions)：

> QueryLowActionsDao.xml
>
> `queryMasterModelList` 为 `crud-plus` 框架保留, 无需变更
>

```xml
 <select id="queryMasterModelList" resultMap="ActionItem">
    SELECT
         lc_low_actions.*,lc_modal_item_basic.*
    FROM lc_low_actions
    left join lc_modal_item_basic on lc_low_actions.id=lc_modal_item_basic.modal_id
    LEFT JOIN lc_low_main_page ON lc_low_actions.page_id=lc_low_main_page.id
    WHERE lc_low_main_page.id = #{masterId}
</select>

<resultMap id="ActionItem" type="LowActionsModel">
    <id column="id" property="id" />
    <result column="title" property="title" />
    <result column="type" property="type" />
    <collection property="items" ofType="ModalItemBasic">
        <result column="modal_items_layout" property="modalItemsLayout" />
        <result column="modal_items_comp" property="modalItemsComp" />
        <result column="modal_content_layout" property="modalContentLayout" />
        <result column="modal_id" property="modalId" />
    </collection>
</resultMap>
```

## 4.请求示例

- 请求方式： GET
- 请求地址： /api/crud/lowMainPage/lowMainPages/{id}
- 返回结果：

```json
{
  "code": 200,
  "data": {
      "id":1,
      "···":"",
      "lowActions":
      [
        {
          "id": 1,
           "·····":"",
          "items":
           [
             "modalId":1,
             "···":""
            ]
        }
      ]
  },
  "message": "Success"
}
```

