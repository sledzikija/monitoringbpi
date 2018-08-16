\#!/bin/bash
#ZMIENNE SQL
hostip=
namedb=
nametb=
userdb=
userps=
####################################
NEW_DATA1="/var/_monitoring"
cat $NEW_DATA1 | \
while read _ntspeed _mtu _met _rxok _exerr _rxdrp _rxovr _txok _txerr _txdrp _txovr _pminl _paval _pmaxl _pmdevl _pmin _pava _pmax _pmdev _time _cpu1 _cpu2 _cpu3 _mtot _mfre _mava _msw _mca _temp0 _temp1 _dzien
do
echo "insert into monitoring (eth0speed, mtu, met, rxok, rxerr, rxdrp, rxovr, txok, txerr, txdrp, txovr, data, cpu1, cpu2, cpu3, mtot, mfree, mava, msw, mca, temp0, temp1, time, pmin, pavg, pmax, pmdev, pminl, pavgl, pmaxl, pmdevl) values ('$_ntspeed', '$_mtu', '$_met', '$_rxok', '$_exerr', '$_rxdrp', '$_rxovr', '$_txok', '$_txerr', '$_txdrp', '$_txovr', '$_time' , '$_cpu1', '$_cpu2' , '$_cpu3', '$_mtot', '$_mfre', '$_mava', '$_msw', '$_mca', '$_temp0', '$_temp1', '$_dzien', '$_pmin', '$_pava', '$_pmax', '$_pmdev','$_pminl', '$_paval', '$_pmaxl', '$_pmdevl');"  | mysql -u -p --host  dbname
#INSERT INTO `mydb`.`monitoring` (`time`, `cpu1`, `cpu2`, `cpu3`, `mtot`, `mf4ree`, `mava`, `msw`, `mca`, `temp`) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
#echo $_time $_cpu1 $_cpu2 $_cpu3 $_mtot $_mfre $_mava $_msw $_mca $_temp0 $_tempo $_temp1 $_dzien $_pmin $_pava $_pmax #$_pmdev
done
echo " " > /var/_monitoring
