#!/bin/bash

BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
NORMAL="\033[0;39m"

clr=`>/tmp/perf.log`
LOC="/tmp/perf.log"

current_time=$(date "+%d.%m.%y-%H:%M")
host1=`uname -a | awk '{print $2}' | cut -d "." -f1`
uptme=`uptime`
echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC
echo -e $BICyan"Date:$current_time" >> $LOC
echo "Server Name: $host1" >> $LOC
echo "kernelrelease: $(uname -r)" >> $LOC
echo "Internal IP: $(hostname -I)" >> $LOC
echo "External IP: $(dig +short myip.opendns.com @resolver1.opendns.com)" >> $LOC
echo "uptime: $uptme"$NORMAL >> $LOC

echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC
                      echo -e $BIPurple"\t\tTop CPU Process Using top command"$NORMAL >> $LOC
echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC

        echo -e $BIBlue"$(top -bn1 | head -20)"$NORMAL >> $LOC

        echo -e "\nSummary:" >> $LOC

        echo -e $BIBlue"$(sar -u 5 5)"$NORMAL >> $LOC

echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC
                echo -e $BIPurple"\t\tTop Memory Process Using top command"$NORMAL >> $LOC
echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC

        echo -e $BIBlue"$(top -b -o +%MEM | head -n 20)"$NORMAL >> $LOC
        echo -e "\nSummary:" >> $LOC

        echo -e $BIBlue"$(free -m)"$NORMAL >> $LOC

echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC
                echo -e $BIPurple"\t\tFileSystem Utilization Report"$NORMAL >> $LOC
echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC

        echo -e $BIBlue"$(df -h|awk '{ if ($5 > 60) print $0}')"$NORMAL >> $LOC
        echo "" >> $LOC

echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC
                echo -e $BIPurple"\t\tOverall I/O Activities Report"$NORMAL >> $LOC
echo -e $BIPurple"+------------------------------------------------------------------+"$NORMAL >> $LOC


                              echo -e $BIBlue"$(sar -b 1 3)"$NORMAL >> $LOC
                                echo -e " " >> $LOC
                              echo -e $BIBlue"$(sar -p -d 1 1)"$NORMAL >> $LOC
                                echo -e " " >> $LOC
echo -e "Abbreviations:" >> $LOC
echo -e $BICyan"rd_sec/s: This shows you the total number of sectors on that device which is being read" >> $LOC
echo -e "wr_sec/s: If rd_sec/s is sectors being read per second then obviously wr_sec is sectors being written per second" >> $LOC
echo -e "avgrq-sz: This column shows the average" >> $LOC
echo -e "await   : This shows the total number of time that the processor waited for requests regarding IO" >> $LOC
echo -e "%util   : This column shows the usage of cpu in percentage when the request was generated" >> $LOC
echo -e "tps     : Transactions per second (this includes both read and write)" >> $LOC
echo -e "rtps    : Read transactions per second" >> $LOC
echo -e "wtps    : Write transactions per second" >> $LOC
echo -e "bread/s : Bytes read per second" >> $LOC
echo -e "bwrtn/s : Bytes written per second \n"$NORMAL >> $LOC
