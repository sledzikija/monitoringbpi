#!/bin/bash
###################################
#ZMIENNE PROGRAMU
tst=$(date +%s)
cpu=$(uptime|grep -oP '\S+(?:\s+\S+){2} *$' | tr ',' '.')
temp0=$(cat /sys/class/thermal/thermal_zone0/temp)
temp1=$(cat /sys/class/thermal/thermal_zone1/temp)
memtotal=$(cat /proc/meminfo | grep MemTotal: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memfree=$(cat /proc/meminfo | grep MemFree: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memava=$(cat /proc/meminfo | grep MemAvailable: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memswca=$(cat /proc/meminfo | grep SwapCached: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
memca=$(cat /proc/meminfo | grep Cached: |grep -oP '\S+(?:\s+\S+){1} *$'| awk '{print $1;}')
now=$(date +"%Y-%m-%d %H:%M:%S")
pingwp=$(ping wp.pl -c 3 | grep rtt | tr '/' ' '| awk '{print $7" "$8" "$9" "$10 ;}')
pingl=$(ping wp.pl -c 3 | grep rtt | tr '/' ' '| awk '{print $7" "$8" "$9" "$10;}')
net=$(netstat -i | grep eth0 |awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11;}')
nspeed=$(cat /sys/class/net/eth0/speed)
echo $nspeed $net $pingl $pingwp $tst $cpu $memtotal $memfree $memava $memswca $memca $temp0 $temp1 $now >> /var/monitoring
echo $nspeed $net $pingl $pingwp $tst $cpu $memtotal $memfree $memava $memswca $memca $temp0 $temp1 $now $pingwp >> /var/monitoring_cp
NEW_DATA="/var/monitoring"
cat $NEW_DATA | \
while read ntspeed mtu met rxok exerr rxdrp rxovr txok txerr txdrp txovr pminl pavgl pmaxl pmdevl pmin pavg pmax pmdev time cpu1 cpu2 cpu3 mtot mfre mava msw mca temp0 temp1 dzien
do
echo -n $ntspeed $mtu $met $rxok $exerr $rxdrp $rxovr $txok $txerr $txdrp $txovr $pminl $pavgl $pmaxl $pmdevl $pmin $pavg $pmax $pmdev $time "${cpu1%?}" "${cpu2%?}" "${cpu3%}" $mtot $mfre $mava $msw $mca $temp0 $temp1 $dzien $pmin $pavg $pmax $pmdev >> /var/_monitoring
echo " " >> /var/_monitoring
done
echo " " > /var/monitoring
