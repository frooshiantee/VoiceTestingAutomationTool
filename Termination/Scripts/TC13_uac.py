#!/usr/bin/env python
# The program is used to confirm if the SIP Test Case is successful or not
import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
#print sys.argv[1]
#print sys.argv[2]
try:
	i = os.system("/home/cfernando/sipp-3.3/sipp "+ sys.argv[1]+":5060 -i "+sys.argv[2]+ " -p 5062 -s +15555555555 -sf /home/Termination/Scenarios/TC13-uac.xml -m "+sys.argv[3]+ " >/home/Termination/Results/TC13.txt")    

#Filtering out the contents of .txt file and confirming if the test case is Pass/Fail

	f = open("/home/Termination/Results/TC13.txt","r")
	y = f.readlines()
	f1= open("/home/Termination/Results/TC1.txt","r") 
	y1 = f1.readlines()
# Reversing the contents of .txt file inorder to quickly locate the Success/Failed field
	rev = y[: : -1]
	rev1= y1[: : -1]
#print rev
	output =  rev[7]
	output2 = rev1[7]
	z = output.split(' ')
	output1 = rev[6]
	z1 = output1.split(' ')
	z2 = output2.split(' ')
	
	#print output1
#	print z[45]
#	print z1[49]


	if z[45]!='0'and z1[49] == '0'and z2[45]!='0':
		print "*****Pass*****"
#		print "*****Pass*****" + z[45]
	else:
		print "*****Fail*****"
#		print "*****Fail*****" + z1[45]
except Exception as e:
	print e
	print "*****Fail*****"
