*** Settings ***
Documentation       Voice Automation Tool

Library     SSHLibrary
Library     Selenium2Library
Library     OperatingSystem
Library     String

*** Variables ***
${UAC_IP}              192.168.100.107
${USERNAME}            calltesting
${PASSWORD}            
${PATH_C}              /etc/sipp/proxytesting/
${SIG_IP}              192.168.126.71
${DM_SIG_IP}           192.168.126.72
${UAS_IP}              192.168.100.110
${PORT}                5061
${PATH_S}              /home/Origination/Scripts/
${COUNT}                1
${SLEEPTIMER}
${SYMBOL}               ]#

*** Test Cases ***

Test1: Origination call to through CASBC to SBC proxy then CUSBC to 10 digit number
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC3_uas.py ${UAS_IP} ${PORT}

    
    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC3_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}





Test2: Origination call to through CASBC to SBC proxy then CUSBC to Toll Free number(+1855XXXXXXX)
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC4_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC4_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}




Test3: Origination call test DTMF functionality
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC5_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC5_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}



Test4: Origination call, test 711u
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC6_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC6_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}




Test5: Origination call, test 729a
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC7_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC7_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}




Test6: Origination call, CNAM
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write               sudo su
    ${outputS}= 	Read Until      :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s
    write  cd ${PATH_S}
    write  ./OC10_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC}= 	Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s
    write   cd ${Path_C}
    write   ./OC10_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    switch connection  1
    Set Client Configuration    timeout=30
    ${output1}=    Read Until       '.

    Log     ${output1}
    Should Contain       ${output1}   received 'INVITE
    Should Contain	 ${output1}   From: "VoiceAutoTool"
    Should Contain       ${output1}   P-Asserted-Identity: "VoiceAutoTool"    

  
    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}




Test7: Origination call, transcoding 711/729
    
    sleep 	5s
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC11_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC11_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}



Test8: Origination call, BYE from customer
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write               sudo su
    ${outputS}= 	Read Until      :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC12_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC}= 	Read Until 	:
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC12_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}



Test9: Origination call, CANCEL after 18x
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=		Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC13_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write    ${PATH_C}OC13_uac.py ${SIG_IP} ${UAC_IP} ${COUNT}
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}





Test10: Origination call, set CAC low and verify that 486 sent to carrier
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write		sudo su
    ${outputS}=	Read Until	:
    Should Contain	${outputS}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC15_uas.py ${UAS_IP} ${PORT}

    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write		sudo su
    ${outputC}=	Read Until	:
    Should Contain	${outputC}	[sudo] password for calltesting:
    write	${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC15_uac.py ${SIG_IP} ${UAC_IP} 3
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

    ${SLEEPTIMER}=   Evaluate    ${COUNT}+ ${COUNT}
    sleep  ${SLEEPTIMER}





Test11: Origination call, CASBC direct media enabled
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write               sudo su
    ${outputS}=         Read Until      :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC16_uas.py ${UAS_IP} ${PORT}

     get connection
    [Tags]     Origination/Inbound

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC}=         Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC16_uac.py ${DM_SIG_IP} ${UAC_IP} ${COUNT}
    get connection
    Set Client Configuration    timeout=100
    ${output1}=    Read Until       a=sendrecv

    Log     ${output1}
    Should Contain Any       ${output1}   IN IP4 192.168.100.108  IN IP4 192.168.100.104 	IN  	IP4 192.168.126.72
    close all connections
    
    sleep 	25s
    
    Open Connection    ${UAS_IP}
    Login    ${USERNAME}    ${PASSWORD}
    write               sudo su
    ${outputS}= 	Read Until      :
    Should Contain      ${outputS}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s

    write  ${PATH_S}OC16Call_uas.py ${UAS_IP} ${PORT}

    Open Connection    ${UAC_IP}
    Login    ${USERNAME}    ${PASSWORD}

    write               sudo su
    ${outputC}= 	Read Until      :
    Should Contain      ${outputC}      [sudo] password for calltesting:
    write       ${PASSWORD}
    sleep   5s

    write   ${PATH_C}OC16Call_uac.py ${DM_SIG_IP} ${UAC_IP} 1
    Set Client Configuration    prompt=#
    Set Client Configuration    timeout=10000
    ${output1}=    read until prompt
    Should End With     ${output1}    ]#
    Log     ${output1}
    Should Not Contain Any      ${output1}   Fail

    close all connections

