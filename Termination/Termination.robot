*** Settings ***
Documentation       Voice Automation Tool

Library     SSHLibrary
Library     Selenium2Library
Library     OperatingSystem
Library     String

*** Variables ***
${UAC_IP}              192.168.100.110
${USERNAME}            calltesting
${PASSWORD}            
${PATH_C}              /home/Termination/Scripts/
${SBC_IP}              216.82.232.100
${UAS_IP}              192.168.100.107
${PORT}                5091
${PATH_S}              /etc/sipp/proxytesting/
${COUNT}                1
${SLEEPTIMER}
${SYMBOL}               ]#

*** Test Cases ***
Test0: Pinging SBC
   [Documentation]  Checking reachability of SBC from UAC and UAS
   [Tags]   unit test
    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write   ${PATH_C}Calvin_ping.py ${SBC_IP}

    Set Client Configuration    prompt=$
    Set Client Configuration    timeout=10000
    ${output}=    Read Until Prompt
    Should End With     ${output}    $
    Log     ${output}
    Should Not Contain Any      ${output}   Fail

    close connection

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}


Test1: Termination call through CUSBC to SBC proxy to Carrier
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   10s
    write  cd ${PATH_S}
    write  ${PATH_S}TC1_uas.py ${UAS_IP} ${PORT}


    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]     Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s

    write   cd ${PATH_C}
    write   ${PATH_C}TC1_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}


Test2: Termination call, test DTMF functionality
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   10s
    write  cd ${PATH_S}
    write  ${PATH_S}TC6_uas.py ${UAS_IP} ${PORT}


    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]     Terminating/Outbound
    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s
    write  cd ${PATH_C}
    write   ${PATH_C}TC6_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail
    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT} + ${COUNT}
    sleep  ${SLEEPTIMER}


Test3: Termination call, test 711u
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}



    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   10s
    write  cd ${PATH_S}
    write  ${PATH_S}TC7_uas.py ${UAS_IP} ${PORT}

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC7_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}


Test4: Termination call, test 729
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   30s
    write  cd ${PATH_S}
    write  ${PATH_S}TC8_uas.py ${UAS_IP} ${PORT}

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC8_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}


Test5: Termination call, transcoding 711/729
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep  10s
    write  cd ${PATH_S}
    write  ${PATH_S}TC10_uas.py ${UAS_IP} ${PORT}

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC10_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should not Contain Any      ${output1}   Fail

    close all connections
    close all connections
    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}


Test6: Termination call, BYE from carrier
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep  10s
    write  cd ${PATH_S}
    write  ${PATH_S}TC11_uas.py ${UAS_IP} ${PORT}

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC11_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}



Test7: Termination call, CANCEL after 18x
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep  30s
    write  cd ${PATH_S}
    write  ${PATH_S}TC12_uas.py ${UAS_IP} ${PORT}

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC12_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
     sleep  ${SLEEPTIMER}


Test8: Termination call, call to invalid TN (555-555-5555)
 
    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   10s
    write   cd ${PATH_C}
    write   ${PATH_C}TC13_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}



# Test9: Termination call,911
  #  Open Connection    ${UAS_IP}
   # Login    ${USERNAME}    ${PASSWORD}

   # write		sudo su
   # ${outputS}=	Read Until	:
   # Should Contain	${outputS}	[sudo] password for calltesting:
   # write	${PASSWORD}
   # sleep  10s
   # write  cd ${PATH_S}
   # write  ${PATH_S}TC15_uas.py ${UAS_IP} ${PORT}

   # [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
   # [Tags]     Terminating/Outbound

   # Open Connection    ${UAC_IP}
   # Login    ${USERNAME}    ${PASSWORD}

   # write		sudo su
   # ${outputC}=	Read Until	:
   # Should Contain	${outputC}	[sudo] password for calltesting:
   # write	${PASSWORD}
   # sleep   2s
   # write   cd ${PATH_C}
   # write   ${PATH_C}TC15_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

   # Set Client Configuration    prompt=#
   # Set Client Configuration    timeout=10000
   # ${output1}=    Read Until Prompt
   # Should End With     ${output1}    ]#
   # Log     ${output1}
   # Should Not Contain Any      ${output1}   Fail

   # close all connections

   # ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
   # sleep  ${SLEEPTIMER}


Test10: Termination call, CASBC direct media enabled
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputS} =        Read Until     :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   30s
    write  cd ${PATH_S}
    write        ${PATH_S}TC16_uas.py ${UAS_IP} ${PORT}
    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]   Terminating/Outbound

    get connection

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC} =        Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write  ${PATH_C}TC16_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    switch connection  1
    Set Client Configuration    timeout=30
    ${output1}=    Read Until       '.

    Log     ${output1}
    Should Contain Any      ${output1}   IN IP4 192.168.100.104	 IN IP4 192.168.100.108
    close all connections
   
   

    sleep 	20s
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    
    write               sudo su
    ${outputS}= 	Read Until      :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   30s
    write  cd ${PATH_S}
    write  ${PATH_S}TC16Call_uas.py ${UAS_IP} ${PORT}


    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}


    write               sudo su
    ${outputC}= 	Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC16Call_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${outputZ}=    Read Until Prompt
    Should End With     ${outputZ}    ]#
    Log     ${outputZ}
    Should not Contain Any      ${outputZ}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}




Test11: Termination call,911 "410 error code"
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputS}= 	Read Until      :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep  10s
    write  cd ${PATH_S}
    write  ${PATH_S}TC410_uas.py ${UAS_IP} ${PORT}

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]     Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC}= 	Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   2s
    write   cd ${PATH_C}
    write   ${PATH_C}TC10_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}

    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    	Read Until Prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Contain Any      ${output1}   503 Service Unavailable

    close all connections



Test12: Termination call to TN +19195550002: should return "404" 

    [Documentation]  Running UAC that accepts SBC IP(216.x.x.x) and Client IP(192.168.x.x)
    [Tags]     Terminating/Outbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC}= 	Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   10s

    write   cd ${PATH_C}
    write   ${PATH_C}TC18_uac.py ${SBC_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}
