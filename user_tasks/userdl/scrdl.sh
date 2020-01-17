#!/bin/bash
read -p "user name to delete: " user

cat ~/DAT/user_tasks/userdl/userdl_new.yaml|sed "s/uname/$user/" > ~/DAT/user_tasks/userdl/userdl_final.yaml
ansible-playbook ~/DAT/user_tasks/userdl/userdl_final.yaml -K
