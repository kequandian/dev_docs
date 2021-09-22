## 挂载新硬盘

#### 查看分区
```shell
fdisk -l
```

#### 查看卷信息
```
lvdisplay  
```

## 挂载共享目录

## 
- 共享文件夹名称: vworkspace
- 用户名: ubuntu
- mount_point 挂载点: workspace

```shell
mkdir /home/ubuntu/workspace
sudo mount -t vboxsf vworkspace /home/ubuntu/workspace
```
