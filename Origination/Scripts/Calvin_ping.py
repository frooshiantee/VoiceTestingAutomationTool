#!/usr/bin/env python

import os
import sys
#print sys.argv[1]
print os.system("ping -c 5 " + sys.argv[1] + " > Ping.txt")
f = open("Ping.txt","r")
y = f.readlines()
#print y[8]
try:
	z = y[8].split(' , ')
	print z
	output = z[0].split(' ')
	print output[3]
	if output[3] != '0':
		print '****Pass****'
	else:
		print '****Fail****'
except:
	print '****Fail****'

