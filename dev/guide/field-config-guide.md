## 配置举例
**t_config_group** 配置类型
- **CONFIG**  域值配置
- **OPTION**  数据字典

**t_config_field** 数据类型
- **STRING**   字符类型
- **INTEGER**  整型
- **FLOAT**    浮点

### 单项配置

#### 分类配置
```shell
DELETE FROM t_config_group WHERE id IN (1,2,100,200);
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

#### 数据字典配置
```shell
DELETE FROM t_config_field WHERE id IN (201);
INSERT INTO `t_config_field` (`id`, `field`, `group_id`, `lang`, `name`, `value`, `data_type`, `description`)
             VALUES ('201', 'phoneType', '200', 'zh', '电话类型', NULL, 'STRING', NULL);

DELETE FROM t_config_field_item WHERE id IN (1,2,3);
INSERT INTO `t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) 
             VALUES ('1', 'phoneType', 'zh', 'telPhone', '手机电话');
INSERT INTO `t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) 
             VALUES ('2', 'phoneType', 'zh', 'companyPhone', '公司电话');
INSERT INTO `t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) 
             VALUES ('3', 'phoneType', 'zh', 'homePhone', '住宅电话');
```

