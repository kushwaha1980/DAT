#!/usr/bin/python
import os
pwd=os.getcwd()

fin = open("perf.yaml", "rt")
data = fin.read()
data = data.replace("dir", pwd)
fin.close()

fin = open("perf2.yaml", "wt")
fin.write(data)
fin.close()

