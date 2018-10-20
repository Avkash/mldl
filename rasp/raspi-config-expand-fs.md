

** Here is the output of raspi-config when expaning the disk to 64GB **

$ sudo raspi-config

Welcome to fdisk (util-linux 2.29.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): Disk /dev/mmcblk0: 58.6 GiB, 62881005568 bytes, 122814464 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x2a479984

Device         Boot Start       End   Sectors  Size Id Type
/dev/mmcblk0p1       8192     97890     89699 43.8M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      98304 122814463 122716160 58.5G 83 Linux

Command (m for help): Partition number (1,2, default 2):
Partition 2 has been deleted.

Command (m for help): Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): Partition number (2-4, default 2): First sector (2048-122814463, default 2048): Last sector, +sectors or +size{K,M,G,T,P} (98304-122814463, default 122814463):
Created a new partition 2 of type 'Linux' and of size 58.5 GiB.
Partition #2 contains a ext4 signature.

Command (m for help):
Disk /dev/mmcblk0: 58.6 GiB, 62881005568 bytes, 122814464 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x2a479984

Device         Boot Start       End   Sectors  Size Id Type
/dev/mmcblk0p1       8192     97890     89699 43.8M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      98304 122814463 122716160 58.5G 83 Linux

Command (m for help): The partition table has been altered.
Calling ioctl() to re-read partition table.
Re-reading the partition table failed.: Device or resource busy

The kernel still uses the old table. The new table will be used at the next reboot or after you run partprobe(8) or kpartx(8).

Connection to 10.0.0.37 closed by remote host.
Connection to 10.0.0.37 closed.
