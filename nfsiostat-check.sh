#!/bin/bash
##################################
# Zabbix monitoring script
#
# iostat:
#  - IO
#  - running / blocked processes
#  - swap in / out
#  - block in / out
#
# Info:
#  - vmstat data are gathered via cron job
##################################
# Contact:
#  vincent.viallet@gmail.com
##################################
# ChangeLog:
#  20100922     VV      initial creation
##################################

# Zabbix requested parameter
ZBX_REQ_DATA="$2"
ZBX_REQ_DATA_MOUNT_POINT="$1"

# source data file
#NFS_IO_STAT_CMD=$(nfsiostat-sysstat |grep -v Linux |grep -v Filesystem |grep -v -e "^$"|cut -f2 -d':')
NFS_IO_STAT_CMD=$(nfsiostat $ZBX_REQ_DATA_MOUNT_POINT | sed "1,4d" | grep -v read | grep -v write)
#echo $NFS_TO_STAT_CMD
# Error handling:
#  - need to be displayable in Zabbix (avoid NOT_SUPPORTED)
#  - items need to be of type "float" (allow negative + float)
#
ERROR_NO_DATA_FILE="-0.9900"
ERROR_OLD_DATA="-0.9901"
ERROR_WRONG_PARAM="-0.9902"
ERROR_MISSING_PARAM="-0.9903"

# Missing device to get data from
if [ -z "$ZBX_REQ_DATA_MOUNT_POINT" ]; then
  echo $ERROR_MISSING_PARAM
  exit 1
fi


case $ZBX_REQ_DATA in
#  rkB_nor/s)   echo $NFS_IO_STAT_CMD | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk '{print $2}';;
#  wkB_nor/s)     echo $NFS_IO_STAT_CMD | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk '{print $3}';;
#  rkB_dir/s)        echo $NFS_IO_STAT_CMD | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk '{print $4}';;
#  wkB_dir/s)        echo $NFS_IO_STAT_CMD | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk '{print $5}';;
#  rkB_svr/s)      echo $NFS_IO_STAT_CMD | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk '{print $6}';;
#  wkB_svr/s)      echo $NFS_IO_STAT_CMD | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk '{print $7}';;
  rpcbacklog) echo $NFS_IO_STAT_CMD | awk '{print $2}' ;;
  rretrans) echo $NFS_IO_STAT_CMD | awk '{print $6}' ;;
  wretrans) echo $NFS_IO_STAT_CMD | awk '{print $13}' ;;
  rkB/s) echo $NFS_IO_STAT_CMD | awk '{print $4}' ;;
  wkB/s) echo $NFS_IO_STAT_CMD | awk '{print $11}' ;;
  rkB/ops) echo $NFS_IO_STAT_CMD | awk '{print $5}' ;;
  wkB/ops) echo $NFS_IO_STAT_CMD | awk '{print $12}' ;;
  rRTT) echo $NFS_IO_STAT_CMD | awk '{print $8}' ;;
  rEXE) echo $NFS_IO_STAT_CMD | awk '{print $9}' ;;
  wRTT) echo $NFS_IO_STAT_CMD | awk '{print $15}' ;;
  wEXE) echo $NFS_IO_STAT_CMD | awk '{print $16}' ;;
  ops/s)   echo $NFS_IO_STAT_CMD | awk '{print $1}' ;;
  rops/s)   echo $NFS_IO_STAT_CMD | awk '{print $3}' ;;
  wops/s)      echo $NFS_IO_STAT_CMD | awk '{print $10}';; 
  *) echo $ERROR_WRONG_PARAM; exit 1;;
esac

exit 0
