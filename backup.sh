#!/bin/bash
# wget https://raw.githubusercontent.com/rubo77/rsync-homedir-excludes/master/rsync-homedir-excludes.txt -O /opt/ignorelist
# # vi /opt/user-list.txt
# daygeek
# sudha
# u1
# u2
# u3
# u4
# u5
# user1
# user2
# # vi /opt/shell-scripts/home-dir-backup-1.sh
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/data1/linuxbackup"
#To create a new directory in the backup directory location
mkdir -p $BACKUP_DIR/$DATE
#To backup user's home directory
for user in `more /opt/user-list.txt`; do 
rsync -aP --exclude-from=/opt/ignorelist /home/$user/ /data1/linuxbackup/$user/home/
tar -zcvpf $BACKUP_DIR/$DATE/$user-$DATE.tar.gz /data1/linuxbackup/$user/home
done #To delete files older than 10 days
#find $BACKUP_DIR/* -mtime +10 -exec rm {} \;