#!/usr/bin/python
from passlib.hash import sha512_crypt 
import getpass
uname = raw_input("Please enter user name: ")
pwd = sha512_crypt.encrypt(getpass.getpass(prompt="Please enter the password (Note:pwd will not show on screen): "))

fin = open("pwreset2.yaml", "rt")
data = fin.read()
data = data.replace("uname", uname)
data = data.replace("pwd", pwd)
fin.close()

fin = open("pwreset2.yaml", "wt")
fin.write(data)
fin.close()
