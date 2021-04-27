## 业务错误代码

|     **Code**       | **Business Code**    |   **Business Exception**             |
| ------------------ | -------------------- | -------------------------------------|
| 4000 | CodeBase | 业务错误 | 
| 4001 | NotImplement | 服务未实现 |
| 4002 | NotSupport	| 服务不支持 |
| 4003 | DatabaseConnectFailure	| 数据库连接异常 |
| 4004 | PartiallyAffectedError | 部分操作有效 |
| 4005 | ErrorStatus  | 状态错误 |
| 4006 | InvalidKey	 | 非法键值 |
| 4007 | DuplictedKey	 | 重复键值 |
| 4008 | DeleteAssociatedOne | 尝试删除关联项 |
| 4009 | DeleteNotEmptyOne  | 尝试删除非空项 |
| 4010 | ReservedCode10	 | 预留业务错误 |
| 4011 | InsertError  | 数据库插入错误 |
| 4012 | DatabaseUpdateError | 数据库更新错误 |
| 4013 | DatabaseDeleteError | 数据库删除错误 |
| 4014 | ThridPartyError | 调用第三方出错 |
|Request||	
| 4020 | BadRequest | 请求参数错误 |
| 4021 | OutOfRange | 超出范围 |
| 4022 | EmptyNotAllowed | 不允许空值 |
| 4023 | Reserved | 预留 |
| 4024 | Reserved | 预留 |
| 4025 | SytaxError | 语法错误 |
| 4026 | JsonSytaxError	JSON | 语法错误 |
|Account||
| 4040 | 	AuthorizationError | 权限异常 |
| 4041 | 	NoPermission | 没有权限 |
| 4042 | 	UserAlreadyReg | 该用户已经注册 |
| 4043 | 	UserNotExisted | 没有此用户 |
| 4044 | 	PasswordIncorrect | 密码不正确 |
| 4045 | 	PasswordMismatch | 两次输入密码不一致 |
| 4046 | 	LoginFailure | 登录失败 |
| 4047 | 	InvalidToken | 非法验证码 |
|File||
| 4060 | 	GeneralIOError | 文件操作错误 |
| 4061 | 	UploadFileError | 上传文件出错 |
| 4062 | 	FileReadingError | 读取文件出错 |
| 4063 | 	FileNotFound | 找不到文件 |
| | | |		
| 4100 | UserBusinessCode | 业务定义 |
| | | |		
| 4201 | 暂无 | 授权服务异常 |
| 4202 | 暂无 | 未注册或已过期 |
