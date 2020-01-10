#!/usr/bin/python
import subprocess
user = raw_input("please enter \033[31mALL \033[0muser names seperated by comma: ")
#user_list=sys.argv
l1 = user.split(",")
l2 = []
for i in range(0, len(l1)):
	l2.append(l1[i].strip())

while True:
	req = raw_input("please enter request number against \033[31mEACH \033[0muser: ")
	r1 = req.split(",")
	r2 = []
	if len(r1) == len(l1):
		for i in range(0, len(r1)):
			r2.append(r1[i].strip())
		break

while True:
	day = raw_input("please enter the number of days against \033[31mEACH \033[0muser: ")
	d1 = day.split(",")
	d2 = []
	if len(d1) == len(l1):
		for i in range(0, len(d1)):
			d2.append(d1[i].strip())
		break
#print(l2)
#print(r2)
subprocess.call("cat tsudo3.yaml|sed 's/user_list/%s/'|sed 's/req_list/%s/'|sed 's/day_list/%s/' > tsudo2.yaml" % (l2, r2, d2), shell=True)
subprocess.call("ansible-playbook tsudo2.yaml -K", shell=True)
#subprocess.call("cat outnew.yaml|sed 's/req_list/%s/' > outfinal.yaml" % r2, shell=True)
#fin = open("ans.yaml", "rt")
#fout= open("out.yaml", "wt")

#for line in fin:
#	fout.write(line.replace('req_list", "r2"))
#fin.close()
#fout.close()

