#!/bin/bash
#
#Portscanner
#
#erstellt 20191127 - dfrisardi
#
# Version 1.0
#
#freigegeben - 20191127 - dfrisardi
##########################################################

#Defining the variables
IP=$1
firstport=$2
lastport=$3

#checking the ports
function portscan

{
for ((counter=$firstport; counter<=$lastport; counter++))

do
(echo >/dev/tcp/$IP/$counter) > /dev/null 2>&1 && echo “$counter
open”
done
}

#run the function
portscan