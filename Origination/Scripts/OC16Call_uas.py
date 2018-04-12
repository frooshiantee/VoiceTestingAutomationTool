#!/usr/bin/env python
# The program is used to confirm if the SIP Test Case is successful or not
import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
#print sys.argv[1]
#print sys.argv[2]
try:
	print  os.system("/home/cfernando/sipp-3.3/sipp -i "+sys.argv[1]+ " -p "+sys.argv[2]+" -sf /home/Origination/Scenarios/OC16Call-uas.xml >/home/Origination/Results/OC16Call.txt")

except Exception as e:
        print e
        print "*****Fail*****"


