## Linux系统扩容

开启虚拟机并且登录后，使用命令查看磁盘状态，可以看到`/dev/mapper/centos-root` 磁盘容量为`8G`
```shell
$ df -h
d文件系统                 容量  已用  可用 已用% 挂载点
 devtmpfs                 475M     0  475M    0% /dev
 tmpfs                    487M     0  487M    0% /dev/shm
 tmpfs                    487M  7.7M  479M    2% /run
 tmpfs                    487M     0  487M    0% /sys/fs/cgroup
 /dev/mapper/centos-root  8.0G  3.0G  5.1G   38% /
 /dev/sda1               1014M  197M  818M   20% /boot
 tmpfs                     98M     0   98M    0% /run/user/0
```

可看到当前并未扩容,首先先通过命令fdisk -l查看到新磁盘的分区

可以看到两个分区，分别是`/dev/sda1`和`/dev/sda2`
```shell
$ fdisk -l
磁盘 /dev/sda：16.1 GB, 16106127360 字节，31457280 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节
磁盘标签类型：dos
磁盘标识符：0x000cae17

   设备 Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    20971519     9436160   8e  Linux LVM  

磁盘 /dev/mapper/centos-root：8585 MB, 8585740288 字节，16769024 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节


磁盘 /dev/mapper/centos-swap：1073 MB, 1073741824 字节，2097152 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节

```
然后对新加的磁盘进行分区操作：
```shell
$ fdisk /dev/sda    //选择新增的硬盘
欢迎使用 fdisk (util-linux 2.23.2)。
更改将停留在内存中，直到您决定将更改写入磁盘。
使用写入命令前请三思。
命令(输入 m 获取帮助)：p   //这里输入p,查看已分区数量

磁盘 /dev/sda：16.1 GB, 16106127360 字节，31457280 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节
磁盘标签类型：dos
磁盘标识符：0x000cae17

   设备 Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    20971519     9436160   8e  Linux LVM
命令(输入 m 获取帮助)：n     //这里输入命令n，新增一个分区
Partition type:
   p   primary (2 primary, 0 extended, 2 free)
   e   extended
Select (default p): p    //这里输入命令p,分区类型选择主分区
分区号 (3,4，默认 3)：3    //选择分区号，这里一般选择默认3
起始 扇区 (20971520-31457279，默认为 20971520)： //这里直接enter，默认
将使用默认值 20971520
Last 扇区, +扇区 or +size{K,M,G} (20971520-31457279，默认为 31457279)：  //这里也直接enter，默认
将使用默认值 31457279
分区 3 已设置为 Linux 类型，大小设为 5 GiB
命令(输入 m 获取帮助)：p   //这里输入p,查看当前分区

磁盘 /dev/sda：16.1 GB, 16106127360 字节，31457280 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节
磁盘标签类型：dos
磁盘标识符：0x000cae17

   设备 Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    20971519     9436160   8e  Linux LVM
/dev/sda3        20971520    31457279     5242880   83  Linux      //可以看到这里已经多出了一个分区
命令(输入 m 获取帮助)：w  //输入w写入磁盘，并且保存

The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: 设备或资源忙.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
正在同步磁盘。

```
期间，如果需要将分区类型的Linux修改为Linux LVM的话需要在新增了分区之后，选择t，然后选择8e，之后可以将新的分区修改为linux LVM
之后我们可以再次用以下命令查看到磁盘当前情况，可以看到已经多出了一个分区 /dev/sda3
```shell
$ fdisk -l
磁盘 /dev/sda：16.1 GB, 16106127360 字节，31457280 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节
磁盘标签类型：dos
磁盘标识符：0x000cae17

   设备 Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    20971519     9436160   8e  Linux LVM
/dev/sda3        20971520    31457279     5242880   83  Linux         //这里已经多出了一个分区

磁盘 /dev/mapper/centos-root：8585 MB, 8585740288 字节，16769024 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节


磁盘 /dev/mapper/centos-swap：1073 MB, 1073741824 字节，2097152 个扇区
Units = 扇区 of 1 * 512 = 512 bytes
扇区大小(逻辑/物理)：512 字节 / 512 字节
I/O 大小(最小/最佳)：512 字节 / 512 字节
```
重启虚拟机格式化新建分区
```shel
$ reboot
```
然后将新添加的分区添加到已有的组实现扩容
首先查看卷组名,查看到卷名为centos

```shell
$ vgdisplay
--- Volume group ---
  VG Name               centos  //卷名
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <9.00 GiB
  PE Size               4.00 MiB
  Total PE              2303
  Alloc PE / Size       2303 / <9.00 GiB
  Free  PE / Size       0 / 0   
  VG UUID               uGjto2-ncxw-9aVs-v8Fl-SOtw-MqRH-LYO4OD
```
初始化刚刚的分区 /dev/sda3
```shell
$ pvcreate /dev/sda3
Physical volume "/dev/sda3" successfully created.
```
将初始化过的分区加入到虚拟卷组名
vgextend 虚拟卷组名 新增的分区
```shell
$ vgextend centos /dev/sda3
Volume group "centos" successfully extended
```
再次查看卷组情况
```shell
$ vgdisplay
--- Volume group ---
  VG Name               centos
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               13.99 GiB
  PE Size               4.00 MiB
  Total PE              3582
  Alloc PE / Size       2303 / <9.00 GiB
  Free  PE / Size       1279 / <5.00 GiB     //这里可以看到有5G空间是空闲的，本教程只扩展5G空间
  VG UUID               uGjto2-ncxw-9aVs-v8Fl-SOtw-MqRH-LYO4OD
```
这里可以看到，有5G的空间是空闲的
查看当前磁盘情况并记下需要扩展的文件系统名，我这里因为要扩展根目录，本机是 /dev/mapper/centos-root
```shell
$ df -h
文件系统                 容量  已用  可用 已用% 挂载点
devtmpfs                 475M     0  475M    0% /dev
tmpfs                    487M     0  487M    0% /dev/shm
tmpfs                    487M  7.7M  479M    2% /run
tmpfs                    487M     0  487M    0% /sys/fs/cgroup
/dev/mapper/centos-root  8.0G  3.0G  5.1G   38% /
/dev/sda1               1014M  197M  818M   20% /boot
tmpfs                     98M     0   98M    0% /run/user/0
```
扩容已有的卷组容量（这里有个细节，就是不能全扩展满，比如空闲空间是5G，然后这里的话5G不能全扩展上，这里我扩展的是4G。加满会报错）

lvextend -L +需要扩展的容量 需要扩展的文件系统名
```shell 
$ lvextend -L +4G /dev/mapper/centos-root
Size of logical volume centos/root changed from <8.00 GiB (2047 extents) to <12.00 GiB (3071 extents).
Logical volume centos/root successfully resized.
```
然后我们用命令查看当前卷组
```shell
$ pvdisplay
 --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               centos
  PV Size               <9.00 GiB / not usable 3.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              2303
  Free PE               0
  Allocated PE          2303
  PV UUID               P1WGaj-d583-tAsZ-pVh4-N9E3-ZaRj-wtORWx
   
  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               centos
  PV Size               5.00 GiB / not usable 4.00 MiB     //这里可以看到，卷组已经扩容
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              1279
  Free PE               255
  Allocated PE          1024
  PV UUID               8wxKEU-pVcq-8iD7-gnTY-L3w4-mQtS-R5nQQK
```
这里可以看到，卷组已经扩容了
以上只是卷的扩容，然后我们需要将文件系统扩容

首先查看文件系统的格式
```shell
$ cat /etc/fstab | grep centos-root
/dev/mapper/centos-root /                       xfs     defaults        0 0
```
这里可以看到，文件系统是xfs，所以需要xfs的命令来扩展磁盘空间
执行命令 xfs_growfs 文件系统名
```shell
$ xfs_growfs /dev/mapper/centos-root
meta-data=/dev/mapper/centos-root isize=512    agcount=4, agsize=524032 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2096128, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 2096128 to 3144704
```
之后我们再次用命令查看磁盘状态
```shell
$ df -h
文件系统                 容量  已用  可用 已用% 挂载点
devtmpfs                 475M     0  475M    0% /dev
tmpfs                    487M     0  487M    0% /dev/shm
tmpfs                    487M  7.7M  479M    2% /run
tmpfs                    487M     0  487M    0% /sys/fs/cgroup
/dev/mapper/centos-root   12G  3.0G  9.1G   25% /                 
/dev/sda1               1014M  197M  818M   20% /boot
tmpfs                     98M     0   98M    0% /run/user/0
```
/dev/mapper/centos-root 磁盘容量为12G，已经实现了扩容
可以看到，现在已经扩容成功了！

Linux扩容另一种方法请查看
- [扩容方法二](parted.md)
