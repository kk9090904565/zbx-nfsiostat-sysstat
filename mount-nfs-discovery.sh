#!/bin/bash
nfs_mounts=($(findmnt -lo target -n -t nfs4 | cut -f2 -d':'))
#nfs_mounts=$(($nfs_mounts-1))
echo "{" 
echo "\"data\":[" 
for nfs_mount in ${nfs_mounts[@]} 
do
    echo -n "    {\"{#MOUNT_POINT}\":\"$nfs_mount\"}," 
done | sed 's/,$//' 
# Added sed in the end of for loop, because old zabbix doesn't accept json with trailing commas

echo "]" 
echo "}" 

