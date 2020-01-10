#!/bin/bash
cd ./adhoc
cat adhoc.yaml|sed "s/xyz/$target/g" > adhoc2.yaml
read -p "Enter your command: " usr_input
usr_cmd="$(print - "$usr_input" | sed 's/[&=\|/]/\&/g')"
sed -i 's|usr_input|'"${usr_cmd}"'|' adhoc2.yaml
