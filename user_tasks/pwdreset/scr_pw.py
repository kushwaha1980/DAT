#!/usr/bin/python
from passlib.hash import sha512_crypt 
import getpass
import subprocess
import os
uname = raw_input("Please enter user name: ")
pwd = sha512_crypt.encrypt(getpass.getpass(prompt="Please enter the password (Note:pwd will not show on screen): "))

#with open("pwd.txt", "w") as f:
#	f.write(pwd)
#pss=os.popen("cat pwd.txt").read()
#uid=uname
#subprocess.call("cat pwreset1.yaml| sed 's/uname/%s/'| sed 's/pwd/%s' > pwreset2.yaml" % (uname, pss), shell=True)

#/bin/bash -c "cat pwreset1.yaml| sed "s~uname~$uid"| sed "s~pwd~$pss~" > pwreset2.yaml"

#fin = open("pwreset2.yaml", "rt")
#fout = open("pwreset3.yaml", "w")

#for line in fin:
#	fout.write(line.replace("pwd", pwd))
#	fout.write(line.replace("uname", uname))

#fin.close()
#fout.close()

fin = open("pwreset2.yaml", "rt")
data = fin.read()
data = data.replace("uname", uname)
data = data.replace("pwd", pwd)
fin.close()

fin = open("pwreset2.yaml", "wt")
fin.write(data)
fin.close()
