#!/usr/bin/env python
# The program is used to confirm if the SIP Test Case is successful or not
import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
#print sys.argv[1]
#print sys.argv[2]
try:
	i = os.system("/usr/local/bin/sipp "+ sys.argv[1]+" -i "+sys.argv[2]+ " -p 5095 -s +14027658834 -sf /etc/sipp/proxytesting/OC7-uac.xml -rtp_echo -m "+sys.argv[3]+ " >/etc/sipp/proxytesting/OC7.txt")    

#Filtering out the contents of .txt file and confirming if the test case is Pass/Fail

	f = open("/etc/sipp/proxytesting/OC7.txt","r")
	y = f.readlines()

# Reversing the contents of .txt file inorder to quickly locate the Success/Failed field
	rev = y[: : -1]
#print rev
	output =  rev[7]
	z = output.split(' ')
	output1 = rev[6]
	z1 = output1.split(' ')
	#print output1
#	print z[45]
#	print z1[49]


	if z[45]!='0'and z1[49] == '0':
		print "*****Pass*****"
#		print "*****Pass*****" + z[45]
	else:
		print "*****Fail*****"
#		print "*****Fail*****" + z1[45]
except Exception as e:
	print e
	print "*****Fail*****"
