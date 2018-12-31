#!/bin/bash

backupdir="/back_up_dir"
time_str="`date +%Y%m%d`"
echo ${time_str}

mysqldump -uroot -pc1o5d8e0 --databases code158 > $backupdir/back_up_db_data_${time_str}.sql

find $backupdir -name "back_up_db_data_*.sql" -type f -mtime +2 -exec rm {}  \; > /dev/null 2>&1
