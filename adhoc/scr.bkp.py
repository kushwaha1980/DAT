#!/usr/bin/python
cmd_input=raw_input("Please enter your command: ")

fo=open("adhoc3.yaml", "rt")
data=fo.read()
data=data.replace("usr_input", cmd_input)
fo.close()

nfo=open("adhoc2.yaml", "wt")
nfo.write(data)
nfo.close()
