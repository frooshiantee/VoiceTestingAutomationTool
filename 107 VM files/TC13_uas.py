#!/usr/bin/env python
# The program is used to confirm if the SIP Test Case is successful or not
import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
#print sys.argv[1]
#print sys.argv[2]
try:
        print os.system("/usr/local/bin/sipp -i "+sys.argv[1]+ " -p "+sys.argv[2]+" -sf /etc/sipp/proxytesting/uas-603.xml >/etc/sipp/proxytesting/TC13.txt")

except Exception as e:
        print e
        print "*****Fail*****"


