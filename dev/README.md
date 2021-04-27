最佳方案
```
# 提交时转换为LF，检出时不转换
git config --global core.autocrlf input
# 拒绝提交包含混合换行符的文件
git config --global core.safecrlf true
```
