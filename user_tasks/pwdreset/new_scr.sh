#!/bin/bash
read -p "Enter the user's name: " uname
#read -p "Please enter the password: " pwd
#python -c "from passlib.hash import sha512_crypt; import getpass; pwd=sha512_crypt.encrypt(getpass.getpass())" > pwd.txt
pwd=$(mkpasswd -m sha-512)
cat pwreset1.yaml| sed "s~uname~$uname~"| sed "s~pwd~$pwd~" > pwreset2.yaml
