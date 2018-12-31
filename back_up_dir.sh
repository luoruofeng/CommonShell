#!/bin/bash

backupdir="/back_up_dir"
time_str="`date +%Y%m%d`"
echo ${time_str}
tar -zcvf  $backupdir/imgs_back_up_$time_str.tar /imgs2
find $backupdir -name "imgs_bu_*.tar" -type f -mtime +2 -exec rm {}  \; > /dev/null 2>&1
