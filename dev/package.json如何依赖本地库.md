### 前端项目依赖本地库 
1. 先把`package-lock.json`删掉
2. 本地 clone 依赖 至本地
3. 在`package.json`中增加依赖

```json
{
   "dependencies": {
      "zero-element-boot":"file:../local/zero-element-boot"
   }
}
```
