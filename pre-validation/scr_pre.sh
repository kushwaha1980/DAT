#!/bin/sh
cd /tmp
pth=`pwd`
os=`uname -s`
if [ $os = Linux ];
then

echo =============SERVER DETAILS===================== > /tmp/details.txt
cat /etc/redhat-release >> /tmp/details.txt; dmidecode -t system >> /tmp/details.txt; uname -a >> /tmp/details.txt; date >> /tmp/details.txt; uptime >> /tmp/details.txt

echo =============DF Output=================== >> /tmp/details.txt
df -Ph >> /tmp/details.txt; chmod 777 /tmp/details.txt

echo ==============DF Count ============== >> /tmp/details.txt
df -Ph | wc -l >> /tmp/details.txt

echo ===============VGDISPLAY===================== >> /tmp/details.txt
vgdisplay -v >> /tmp/details.txt

echo =========================NFS Exported FS================ >> /tmp/details.txt
showmount -e >> /tmp/details.txt ;showmount -a >> /tmp/details.txt

echo ===============FSTAB DETAILS===================== >> /tmp/details.txt
cat /etc/fstab >> /tmp/details.txt

echo ================NETWORK DETAILS==================== >> /tmp/details.txt
netstat -rn >> /tmp/details.txt; netstat -tunlp >> /tmp/details.txt

echo ================Lan Details=========== >> /tmp/details.txt
ifconfig -a >> /tmp/details.txt;ls -ltr /etc/sysconfig/network-scripts/ifcfg* >> /tmp/details.txt;cat /etc/sysconfig/network-scripts/ifcfg* >> /tmp/details.txt

echo ================Disk Status/Multipathing ==================== >> /tmp/details.txt
fdisk -l >> /tmp/details.txt ; multipath -ll >> /tmp/details.txt ; adapter_info >> /tmp/details.txt

echo ================FC/SCSI Details=========== >> /tmp/details.txt
systool -c fc_host -v >> /tmp/details.txt ; systool -c scsi_host -v >> /tmp/details.txt

echo ================Running DBs =========== >> /tmp/details.txt
ps -ef | grep -i pmon >> /tmp/details.txt

echo =============Installed Pkg Details ========== >> /tmp/details.txt
rpm -qa >> /tmp/details.txt

sleep 5
chmod 777 /tmp/details.txt

elif [ $os = SunOS ];
then
break

elif [ $os = HP-UX ];
then
break

fi
