#### `$ df -h`
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda5       9.3G  8.6G  229M  98% /
```

#### `fdisk -l`
> 硬盘显示大小为 `20 GiB`
```
$ sudo fdisk -l
Disk /dev/loop0: 219 MiB, 229638144 bytes, 448512 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

...
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: VBOX HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x444122f2

Device     Boot   Start      End  Sectors  Size Id Type
/dev/sda1  *       2048  1050623  1048576  512M  b W95 FAT32
/dev/sda2       1050624 20971519 19920896  9.5G  5 Extended
/dev/sda5       1052672 20971519 19918848  9.5G 83 Linux
```

#### 用图形界面的`gpart`
设置为由光盘启动, 选择 `Try Ubuntu`进入`ubuntu`系统，搜索`gpart`应用进行扩容操作
