#!/usr/bin/env python
# The program is used to confirm if the SIP Test Case is successful or not
import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
try:
	i = os.system("/home/cfernando/sipp-3.3/sipp "+ sys.argv[1]+":5060 -i "+sys.argv[2]+ " -p 5062 -s +12012000050 -sf /home/Termination/Scenarios/TC1-uac.xml -m "+sys.argv[3]+ " >/home/Termination/Results/TC1.txt")    

#Filtering out the contents of .txt file and confirming if the test case is Pass/Fail

	f = open("/home/Termination/Results/TC1.txt","r")
	y = f.readlines()

# Reversing the contents of .txt file inorder to quickly locate the Success/Failed field
	rev = y[: : -1]
#print rev
	output =  rev[7]
	z = output.split(' ')
	output1 = rev[6]
	z1 = output1.split(' ')

	if z[45]!='0'and z1[49] == '0':
		print "*****Pass*****"
	else:
		print "*****Fail*****"		
except Exception as e:
	print e
	print "*****Fail*****"




