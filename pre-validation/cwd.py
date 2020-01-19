#!/usr/bin/python
import os
pwd=os.getcwd()

fin = open("preval.yaml", "rt")
data = fin.read()
data = data.replace("dir", pwd)
fin.close()

fin = open("preval2.yaml", "wt")
fin.write(data)
fin.close()

