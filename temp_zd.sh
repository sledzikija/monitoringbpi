#!/bin/bash
###################################
timestamp=
temp0=$(cat /sys/class/thermal/thermal_zone0/temp)
temp1=$(cat /sys/class/thermal/thermal_zone1/temp)
now=$(date +"%Y-%m-%d %H:%M:%S")
echo $temp0 $temp1 $now >> /monitoringbpi/temp_monitoring
echo $temp0 $temp1 $now >> /monitoringbpi/temp_monitoring_all
NEW_DATA1="/monitoringbpi/temp_monitoring"
cat $NEW_DATA1 | \
while read _temp0 _temp1 _time
echo "insert into monitoring (temp0, temp1, data) values ('$_temp0', '$_temp1','$_time' );"  | mysql -u -p --host  dbname
done
echo " " > /monitoringbpi/temp_monitoring
