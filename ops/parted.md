## Linux 通过parted工具扩容
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
(parted) select /dev/xvdb
(parted) p
Model: Xen Virtual Block Device (xvd)
Disk /dev/xvdb: 42.9GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      32.3kB  42.9GB  42.9GB  primary
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
$ sudo e2fsck -f /dev/xvdb1
$ sudo resize2fs /dev/xvdb1
```
