#!/usr/bin/env python
# The program is used to confirm if the SIP Test Case is successful or not
import os
import sys
#Initiating the sipp UAC and saving the output in a .txt file
#print sys.argv[1]
#print sys.argv[2]
try:
       i = os.system("/usr/local/bin/sipp -i "+sys.argv[1]+ " -p "+sys.argv[2]+" -rtp_echo -sf /etc/sipp/proxytesting/TC6-uas.xml >/etc/sipp/proxytesting/TC6.txt")

except Exception as e:
        print e
        print "*****Fail*****"


