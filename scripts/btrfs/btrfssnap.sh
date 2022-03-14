#!/bin/sh
mount /dev/sda1 /mnt
cd /mnt
[ -d @-BACKUP ] && sudo btrfs sub del @-BACKUP #Checks is backup exists and deletes it
[ -d @home-BACKUP ] && sudo btrfs sub del @home-BACKUP
btrfs sub snap @ @-BACKUP
btrfs sub snap @home @home-BACKUP
cd /
umount /mnt

