#!/bin/bash
read -p "user name to delete: " user

cat userdl_new.yaml|sed "s/uname/$user/" > userdl_final.yaml
ansible-playbook userdl_final.yaml -K
