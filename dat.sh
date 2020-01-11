#!/bin/bash
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
NORMAL="\033[0;39m"
target=$BIRed"None"$NORMAL

my_heading()
{
echo -e $BIGreen"========================================================================================"
echo -e "Welcome to the \"Daily Activity Tool!!\"\c"
echo -e "\tTarget Servers: $target"
        echo -e "========================================================================================"$NORMAL
}

while true; do
        my_heading
        echo -e "1. Pre-validation task.\n"
        echo -e "2. User admin task.\n"
        echo -e "3. Run Ad-hoc command.\n"
	echo -e "4. Health Check.\n"
        echo -e "22. Please select Target Servers Group.\n"
        echo -e "0. Exit.\n"
        read -p "Please enter your choice: " choice

        case $choice in
                0)
                        break;;
                1)
                        clear
                        if [ $target = $BIRed"None"$NORMAL ]; then
				echo ""
                                echo -e $BIRed"Please select the Target Servers Group first...Press Enter to continue !!!\n"$NORMAL
				read dummy
                        else
				echo -e "\n"
				read -p "Have you updated $target section in hosts file ? y/n: " response
				if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                                	echo -e "Welcome to the Pre-validation.\n"
					cd ~/DAT/pre-validation
					cat ~/DAT/pre-validation/preval.yaml| sed "s/xyz/$target/g" > ~/DAT/pre-validation/preval2.yaml
					ansible-playbook ~/DAT/pre-validation/preval2.yaml -K
				else
					echo -e $BIYellow"Please update the Target section first"$NORMAL
				fi
                        fi;;
                2)
                        clear
                        if [ $target = $BIRed"None"$NORMAL ]; then
				echo ""
                                echo -e $BIRed"Please select the Target Servers Group first...Press Enter to continue !!!\n"$NORMAL
				read dummy
                        else
				echo -e "\n"
                                read -p "Have you updated Target section in hosts file ? y/n: " response
                                if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                                	echo -e "Welcome to the User admin tasks.\n"
                                	while true; do
                                        	my_heading
                                        	echo -e "1) Local user creation.\n"
                                        	echo -e "2) Local user deletion.\n"
                                        	echo -e "3) Temporary sudo access.\n"
						echo -e "4) Password reset for local user.\n"
                                        	echo -e "0) Exit.\n"
                                        	read -p "Please enter your choice: " user_choice
                                        	case $user_choice in
                                                	0)
                                                        	break;;
                                                	1)
                                                        	echo -e "Welcome to the User creation.\n"
								cd ~/DAT/user_tasks/usercr
								cat ~/DAT/user_tasks/usercr/usercrl.yaml| sed "s/xyz/$target/g" > ~/DAT/user_tasks/usercr/usercr3.yaml
								~/DAT/user_tasks/usercr/scr.sh
								sleep 5;;
                                                	2)
                                                        	echo -e "Welcome to the User deletion.\n"
								cd ~/DAT/user_tasks/userdl
								cat ~/DAT/user_tasks/userdl/userdl.yaml| sed "s/abc/$target/g" > ~/DAT/user_tasks/userdl/userdl_new.yaml
								./scrdl.sh
								sleep 5;;
                                                	3)
                                                        	echo -e "Welcome to the temporary sudo access.\n"
								cd ~/DAT/user_tasks/sudo
								cat ~/DAT/user_tasks/sudo/tsudo.yaml|sed "s/xyz/$target/g" > ~/DAT/user_tasks/sudo/tsudo3.yaml
								~/DAT/user_tasks/sudo/scr_sudo.py
								sleep 5;;
							4)	echo -e "Welcome to the local user's password reset section.\n"
								cd ~/DAT/user_tasks/pwdreset
							cat ~/DAT/user_tasks/pwdreset/pwreset1.yaml|sed "s/abc/$target/g" > ~/DAT/user_tasks/pwdreset/pwreset2.yaml
								~/DAT/user_tasks/pwdreset/scr_pw.py
								ansible-playbook ~/DAT/user_tasks/pwdreset/pwreset2.yaml -K
								sleep 5;;
                                                	*)
                                                        	echo -e "Wrong choice, please enter valid option.\n"
                                                        	read dummy
                                                        	continue;;
                                        	esac
                                	done
				 else
                                        echo -e $BIYellow"Please update the $target section first"$NORMAL
                                fi

                        fi;;
                3)
                        clear
                        if [ $target = $BIRed"None"$NORMAL ]; then
				echo ""
                                echo -e $BIRed"Please select the Target Servers Group first...Press Enter to continue !!!\n"$NORMAL
				read dummy
                        else
                                echo -e "\n"
				read -p "Have you updated Target section in hosts file ? y/n: " input
				if [[ "$input" =~ ^([yY][eE][sS]|[yY])$ ]]; then
					cd ~/DAT/adhoc
					cat ~/DAT/adhoc/adhoc.yaml|sed "s/xyz/$target/g" > ~/DAT/adhoc/adhoc3.yaml
					~/DAT/adhoc/scr.py
				else
					break
				fi
                        fi;;
		4)
			clear
                        if [ $target != "perf" ]; then
				echo ""
                                echo -e $BIRed'Please select the "perf" Target Servers Group from option 22.....Press Enter to continue !!!\n'$NORMAL
				read dummy
                        else
                                echo -e "\n"
				read -p "Have you updated Target "perf" section in hosts file ? y/n: " input
				if [[ "$input" =~ ^([yY][eE][sS]|[yY])$ ]]; then
					echo -e "Welcome to the Health check section.\n"
					while true; do
						my_heading
						echo -e $BIPurple"1). Top CPU consuming process. \n"
						echo -e "2). Top Memory consuming process. \n"
						echo -e	"3). Memory Utilization. \n"
						echo -e "4). CPU Utilization. \n"
						echo -e "5). Overall I/O activities. \n"
						echo -e "6). Report run queue and load average. \n"
						echo -e "7). Report network statistics \n"
						echo -e "11). PERFORMANCE REPORT \n"
						echo -e "0). Exit \n"$NORMAL
						read -p "Enter your choice: " Hcho
					
						case $Hcho in
							0)
								break;;
							1)
                            clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"################# Top CPU Consuming Process ############################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
                            echo " "
                ansible $target -m shell -a 'ps -eo pid,user,ppid,cmd,%mem,%cpu --sort=-%cpu | head; echo "=========================================================="'
                            echo " "
                            sleep 5
                             ;;
                            				2)
                            clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"#################### Top Memory Consuming Process #####################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
                            echo " "
ansible $target -m shell -a 'ps -eo rss,vsz,pid,cputime,cmd --width 100 --sort rss,vsz | tail --lines 10; echo "======================================================"'
                            echo " "
                            sleep 5
                            ;;

							3)
								clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"###################### Memory Utilization Statistics #####################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
                               echo "  "
                               ansible $target -m shell -a 'sar -r 2 3; echo "=================================="'
                               echo "  "
echo -e "kbmemfree: This shows the amount of free memory"
echo -e "Kbmemused: Memory used"
echo -e "%memused:  Percentage of memory used"
echo -e "kbbuffers: Buffer memory used by the kernel"
echo -e "kbcached:  Cached memory used by the kernel"
echo -e "Most likely you’ll focus on 'kbmemfree' and 'kbmemused' for free and used memory. \n"
                              					sleep 5
                              					;;
							4)
				clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"#################### CPU Utilization Statistics ##########################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
				echo " "
				ansible $target -m shell -a 'sar -u 2 3;echo "=================================="'
				echo " "
echo -e "%user   :The total time that the processor is spending on different process"
echo -e "%sys    :The percentage of time spend by the processor for operating system tasks"
echo -e "%iowait :The time spend by processor waiting for devices(input and output)"
echo -e "%steal  :The amount to time spend by a CPU (which is virtualized), for resources from the physical CPU"
echo -e "%idle   :The idle time spend by the processor \n"
                              	sleep 5
                              	;;
							5)
								clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"#################### I/O activity Statistics ##########################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
								echo " "
				ansible $target -m shell -a 'sar -b 2 3; echo "------------------ "; sar -p -d 1 1; echo "========================================="'
								echo " "
echo -e "rd_sec/s: The total number of sectors on that device which is being read"
echo -e "wr_sec/s: The sectors being written per second"
echo -e "avgrq-sz: This column shows the average"
echo -e "await   : The total number of time that the processor waited for requests regarding IO"
echo -e "%util   : The usage of cpu in percentage when the request was generated"
echo -e "tps     : Transactions per second (this includes both read and write)"
echo -e "rtps    : Read transactions per second"
echo -e "wtps    : Write transactions per second"
echo -e "bread/s : Bytes read per second"
echo -e "bwrtn/s : Bytes written per second \n"
							;;
			                             6)
                              clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"################# Run queue and Load average Statistics ####################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
                             echo " "
                             ansible $target -m shell -a "sar -q 1 3"
echo -e "This reports the run queue size and load average of last 1 minute, 5 minutes, and 15 minutes. '1 3' reports for every 1 seconds a total of 3 times. \n"
echo -e "runq-sz- The number of kernel threads in memory that are waiting for a CPU to run. Typically, this value should be less than 2. 
		Consistently higher values mean that the system might be CPU-bound."
                             sleep 5
                             ;;
                             				7)
                             clear
echo -e $BIYellow"######################################################################" $NORMAL
echo -e $BIGreen"##################### Report network statistics ########################" $NORMAL
echo -e $BIYellow"######################################################################" $NORMAL
                            echo " "
                            ansible $target -m shell -a 'sar -n DEV 1 1; echo "===================================================="'
                            echo " "
echo -e "IFACE   :Stands for the nic card interface name"
echo -e "rxpck/s :This shows the total packets received per second"
echo -e "txpck/s :Transmitted packets per second"
echo -e "rxcmp/s :Compressed packets received"
echo -e "txcmp/s :Compressed packets transmitted"
echo -e "rxmcst/s:Packets multicasted per second \n"
                            echo " "
                            sleep 5;;
							11)
						echo -e "\n"
             echo -e "Welcome to the PERF HC section, after giving sudo password please standby for the moment........it would take some time to pull report.\n"
						cat ~/DAT/perf/perf.yaml|sed "s/abcz/$target/g" > ~/DAT/perf/perf2.yaml
						ansible-playbook ~/DAT/perf/perf2.yaml -K
						;;
							*)
								echo -e "Wrong Choice !!!!"
								read dummy
								continue;;
						esac
					done

				else
					echo -e $BIYellow"Please update the $target section first"$NORMAL
				fi
                        fi
			;;

                22)
                        while true; do
                                clear
                                my_heading
                                echo -e "1) Target Servers.\n"
                                echo -e "0) Exit.\n"
                                echo -e "Please enter your choice: \c"
                                read server_choice
                                case $server_choice in
                                        0)
                                                break;;
                                        1)
                                                echo -e "============================================================"
                                                echo -e "Ansible Env: All -> For all servers in this Env or Host IP"
                                                cat /home/kumar/hosts|grep -i "\["|sed "s/\[//"|sed "s/\]//"
                                                echo -e "============================================================"
                                                echo -e "Please enter your choice: \c"
                                                read target;;
                                esac
                        done;;

                *)
                        clear
                        echo -e "Wrong choice, please enter valid option.\n";;
        esac
done
