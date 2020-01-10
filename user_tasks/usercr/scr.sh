#!/bin/bash

read -p "enter username:" uname
read -p "enter primary group:" pgrp
read -p "enter secondary group:" sgrp
read -p "enter comment:" cmnt
read -p "enter home:" hme

cat usercr3.yaml | sed "s/uname/$uname/g"| sed "s/pgrp/$pgrp/g"| sed "s/sgrp/$sgrp/g"| sed "s/cmnt/$cmnt/g"| sed "s/hme/$hme/g" > usercr2.yaml
ansible-playbook usercr2.yaml -K
sleep 2
