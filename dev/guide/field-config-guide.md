系统配置分为两种类型
- 一种是系统固定 **配置域**，用户只可更改配置值，不可增加或删除 配置域
 1)  e.g.  1. 最低提款额  2. 微信公众号相关配置
  
- 另一种是数据字典，同样 **数据域** 是固定的，用户不可增加或删减数据域，但可对 数据域 增加或删减 选项
 1) e.g.  1. 兴趣爱好   2. 电话类型   3. 税费类型


## 配置举例
**t_config_field_group** 数据库表中的 type 字段有两种选项
- **CONFIG**  域值配置
- **OPTION**  数据字典

**t_config_field**  数据库表的中 data_type 字段有以下三种选项
- **STRING**   字符类型
- **INTEGER**  整型
- **FLOAT**    浮点

### 单项配置

#### 分类配置
```shell
DELETE FROM t_config_field_group WHERE id IN (1,2,100,200);
INSERT INTO `t_config_group` (`id`,`pid`,`lang`,`name`,`comment`,`sort`,`type`)
            VALUES (1, null, 'zh','自定义配置',null,1,'CONFIG'),
                   (2, null, 'zh','数据字典',null,1,'OPTION'),
                   (100, 1,  'zh','联系人配置',null,2,'CONFIG'),
                   (200, 2,  'zh','联系人配置',null,1,'OPTION');
```

#### 系统配置
```shell
DELETE FROM t_config_field WHERE id IN (101);
INSERT INTO `t_config_field` (`id`,`field`,`group_id`,`name`,`value`,`lang`,`data_type`)
             VALUES (101, 'contactLimitation', 100, '联系人可查询最大值', 10, 'zh', 'INTEGER');
```

#### 数据字典配置 （选项由用户录入）
```shell
DELETE FROM t_config_field WHERE id IN (201);
INSERT INTO `t_config_field` (`id`, `field`, `group_id`, `lang`, `name`, `value`, `data_type`, `description`)
             VALUES ('201', 'phoneType', '200', 'zh', '电话类型', NULL, 'STRING', NULL);
```
