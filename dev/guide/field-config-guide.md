## 配置举例

```
DELETE FROM t_config_group WHERE id IN (100,101,110,111);
INSERT INTO `t_config_group` (`id`,`pid`,`lang`,`name`,`comment`,`sort`,`type`)
            VALUES (100,null, 'zh','自定义配置',null,0,'CONFIG'),
                   (101,100,  'zh','联系人配置',null,0,'CONFIG');

INSERT INTO `t_config_group` (`id`,`pid`,`lang`,`name`,`comment`,`sort`,`type`)
            VALUES (110,null, 'en','Configuration',null,0,'CONFIG'),
                   (111,110,  'en','Contact',null,0,'CONFIG');

DELETE FROM t_config_field WHERE id IN (100,110);

INSERT INTO `t_config_field` (`id`,`field`,`group_id`,`name`,`value`,`lang`,`data_type`)
             VALUES (100, 'contactLimitation', 101, '联系人可查询最大值', 10, 'zh', 'INTEGER');

INSERT INTO `t_config_field` (`id`,`field`,`group_id`,`name`, `value`,`lang`,`data_type`)
            VALUES (110, 'contactLimitation', 111, 'Contact Limitation', 10, 'en', 'INTEGER');

INSERT INTO `power`.`t_config_field` (`id`, `field`, `group_id`, `lang`, `name`, `value`, `data_type`, `description`) VALUES ('127', 'phoneType', '3', 'zh', '电话类型', NULL, 'STRING', NULL);
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('151', 'phoneType', 'zh', 'telPhone', '手机电话');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('152', 'phoneType', 'zh', 'companyPhone', '公司电话');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('153', 'phoneType', 'zh', 'homePhone', '住宅电话');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('154', 'phoneType', 'zh', 'otherPhone', '其他电话');

INSERT INTO `power`.`t_config_field` (`id`, `field`, `group_id`, `lang`, `name`, `value`, `data_type`, `description`) VALUES ('128', 'emailType', '3', 'zh', '邮箱类型', NULL, 'STRING', NULL);
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('146', 'emailType', 'zh', 'personalEmail', '个人邮箱');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('147', 'emailType', 'zh', 'companyEmail', '公司邮箱');

INSERT INTO `power`.`t_config_field` (`id`, `field`, `group_id`, `lang`, `name`, `value`, `data_type`, `description`) VALUES ('129', 'addressType', '3', 'zh', '地址类型', NULL, 'STRING', NULL);
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('148', 'addressType', 'zh', 'personalAddress', '个人地址');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('149', 'addressType', 'zh', 'companyAddress', '公司地址');
INSERT INTO `power`.`t_config_field_item` (`id`, `field`, `lang`, `name`, `value`) VALUES ('150', 'addressType', 'zh', 'postAddress', '邮寄地址');
```
