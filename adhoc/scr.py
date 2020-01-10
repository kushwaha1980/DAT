#!/usr/bin/python
import sys, subprocess
cmd_input=raw_input("Please enter your command: ")

if "init" in cmd_input or "shutdown" in cmd_input:
	print("Sorry!!!....currently this action is not allowed")
	sys.exit(0)
else:
	fo=open("adhoc3.yaml", "rt")
	data=fo.read()
	data=data.replace("usr_input", cmd_input)
	fo.close()

	nfo=open("adhoc2.yaml", "wt")
	nfo.write(data)
	nfo.close()
	subprocess.call("ansible-playbook ~/DAT/adhoc/adhoc2.yaml -K", shell=True)
