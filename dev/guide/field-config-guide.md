## 配置举例
t_config_group 配置类型
- CONFIG  域值配置
- OPTION  数据字典

t_config_field 数据类型
- STRING   字符类型
- INTEGER  整型
- FLOAT    浮点

### 单项配置


#### 分类配置
```
DELETE FROM t_config_group WHERE id IN (100,101);
DELETE FROM t_config_field WHERE id IN (100,110);

INSERT INTO `t_config_group` (`id`,`pid`,`lang`,`name`,`comment`,`sort`,`type`)
            VALUES (100, null, 'zh','自定义配置',null,0,'CONFIG'),
                   (101, 100,  'zh','联系人配置',null,0,'CONFIG');
INSERT INTO `t_config_field` (`id`,`field`,`group_id`,`name`,`value`,`lang`,`data_type`)
             VALUES (1, 'contactLimitation', 101, '联系人可查询最大值', 10, 'zh', 'INTEGER');
```

#### 系统配置
```
DELETE FROM t_config_field WHERE id IN (1);
DELETE FROM t_config_field_item WHERE id IN (1,2,3);

INSERT INTO `power`.`t_config_field` (`id`, `field`, `group_id`, `lang`, `name`, `value`, `data_type`, `description`) VALUES ('1', 'phoneType', '3', 'zh', '电话类型', NULL, 'STRING', NULL);

INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('1', 'phoneType', 'zh', 'telPhone', '手机电话');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('2', 'phoneType', 'zh', 'companyPhone', '公司电话');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('3', 'phoneType', 'zh', 'homePhone', '住宅电话');
```

### 数据字典置

