# The program is used to confirm if the SIP Test Case is successful or not

import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
#print sys.argv[1]
#print sys.argv[2]

i = os.system("./sipp "+ sys.argv[1]+":5060 -i "+sys.argv[2]+ " -p 5062 -s +19194392576 -sf TC1-uac.xml -m 1 >TC1.txt")    

#Filtering out the contents of .txt file and confirming if the test case is Pass/Fail

f = open("TC1.txt","r")
y = f.readlines()

# Reversing the contents of .txt file inorder to quickly locate the Success/Failed field
rev = y[: : -1]
#print rev
output =  rev[7]
z = output.split(' ')

#print z
#print z[45]


if z[45]!='0':
	print "*****Pass*****"
else:
	print "*****Fail*****"
