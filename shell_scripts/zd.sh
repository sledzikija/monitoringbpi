#!/bin/bash
###################################
#ZMIENNE PROGRAMU
tst=$(date +%s)
cpu=$(uptime|grep -oP '\S+(?:\s+\S+){2} *$' | tr '.' ',')
#temp=$(/opt/vc/bin/vcgencmd measure_temp |grep -o '[0-9][0-9].[0-9]' | tr '.' ',')
memtotal=$(cat /proc/meminfo | grep MemTotal: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memfree=$(cat /proc/meminfo | grep MemFree: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memava=$(cat /proc/meminfo | grep MemAvailable: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memswca=$(cat /proc/meminfo | grep SwapCached: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memca=$(cat /proc/meminfo | grep Cached: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
###################################
#ZMIENNE SQL
hostip=XXX
namedb=cXXX
nametb=XXX
userdb=XXX
userps=XXX



echo $tst $cpu $memtotal $memfree $memava $memswca $memca >> /tmp/monitoring
#$temp
#1533722585 0,00, 0,01, 0,02 1783164 1615240 1583436 0 45408 0 43
NEW_DATA="/tmp/monitoring"
cat $NEW_DATA | \
while read time cpu1 cpu2 cpu3 mtot mfre mava msw mca
do
echo -n $time "${cpu1%?}" "${cpu2%?}" "${cpu3%}" $mtot $mfre $mava $msw $mca >> /tmp/_monitoring
echo " " >> /tmp/_monitoring
#echo "insert into testable (name,lastname,address,telephone) values ($uuname  , '$_lastname', '$_address' , '$_tel')  ;"  #| mysql -uroot -proot
done

NEW_DATA1="/tmp/_monitoring"
cat $NEW_DATA1 | \
while read _time _cpu1 _cpu2 _cpu3 _mtot _mfre _mava _msw _mca
do
#echo -n $_time $_cpu1 $_cpu2 $_cpu3 $_mtot $_mfre $_mava $_msw $_mca
#echo " "
echo "insert into monitoring (time, cpu1, cpu2, cpu3, mtot, mfree, mava, msw, mca, temp) values ('$_time' , '$_cpu1', '$_cpu2' , '$_cpu3', '$_mtot', '$_mfre', '$_mava', '$_msw', '$_mca', NULL);"  | mysql -uXXX -pXXX --host XXX XXX
#INSERT INTO `mydb`.`monitoring` (`time`, `cpu1`, `cpu2`, `cpu3`, `mtot`, `mfree`, `mava`, `msw`, `mca`, `temp`) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
done

