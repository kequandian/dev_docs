## Linux扩容方法二
用parted命令进入磁盘操作
```shell
$ sudo parted 
(parted) p list
Model: Xen Virtual Block Device (xvd)
Disk /dev/xvdb: 42.9GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      32.3kB  42.9GB  42.9GB  primary


Model: Xen Virtual Block Device (xvd)
Disk /dev/xvda: 21.5GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  21.5GB  21.5GB  primary  ext4         boot
```
选择`/dev/xvdb`磁盘
```shell
(parted) select /dev/xvdb
(parted) p
Model: Xen Virtual Block Device (xvd)
Disk /dev/xvdb: 42.9GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      32.3kB  42.9GB  42.9GB  primary
```
rm 1移除分区1，
```
(parted) rm 1
(parted) unit s
(parted) p free                                                           
Model: Xen Virtual Block Device (xvd)
Disk /dev/xvdb: 83886080s
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start  End        Size       Type  File system  Flags
        63s    83886079s  83886017s        Free Space

(parted) mkpart primary ext3 63s 83886079s 
(parted) q
```
检查磁盘/dev/xvdb1
$ sudo e2fsck -f /dev/xvdb1
调整
$ sudo resize2fs /dev/xvdb1
