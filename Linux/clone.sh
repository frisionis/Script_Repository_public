#!/bin/sh
#
#Automatisierung VM klonen VM01 <-> VM02
#
#erstellt 20191203 - dfrisardi
#
# Version 1.0
#
#freigegeben - 201912010 - dfrisardi
##########################################################
#AUTOMATISCHES AUSLESEN DER ID.... JETZT DEAKTIVIERT DA NUR 2 VM
# vmname="VM01"
# vmid=$(vim-cmd vmsvc/getallvms | grep "$vmname" | awk '{print $1}')
# 
# stat1=$(vim-cmd vmsvc/power.getstate "$vmid" | grep "off")
# 
# if [ "$stat1" == "Powered off" ]
# then vim-cmd vmsvc/power.on "$vimd"
# fi
# 
###########################################################

#Ueberprüfung  des aktuellen Status
vim-cmd vmsvc/power.getstate 11 | grep "on" &>/dev/null
#Herunterfahren der eingeschalteten VM
if [ $? == 0 ]
    then vim-cmd /vmsvc/power.shutdown 11
         vim-cmd /vmsvc/power.getstate 11 | grep "off" &>/dev/null
            until [ $? == 0 ]
                do vim-cmd vmsvc/power.getstate 11 | grep "off" &>/dev/null
                    done
                    echo "Ausgeschaltet und bereit zum Klonen von VM01 -> VM02"  
#loeschen des alten Backups und klonen von VM01 -> VM02 
                        vmkfstools -U /vmfs/volumes/datastore1/VM02/VM02.vmdk
                        vmkfstools -i /vmfs/volumes/datastore1/VM01/VM01.vmdk /vmfs/volumes/datastore1/VM02/VM02.vmdk -d thin
                        vim-cmd /vmsvc/power.on 12
						echo "klonen erfolgreich abgeschlossen"

                            else vim-cmd vmsvc/power.getstate 12 | grep "on" &>/dev/null
                                if [ $? == 0 ]
                                    then vim-cmd /vmsvc/power.shutdown 12
                                         vim-cmd /vmsvc/power.getstate 12 | grep "off" &>/dev/null
                                            until [ $? == 0 ]
                                                do vim-cmd vmsvc/power.getstate 12 | grep "off" &>/dev/null
                                                    done
                                                    echo "Ausgeschaltet und bereit zum Klonen von VM02 -> VM01"
                                fi
#loeschen des alten Backups und klonen von VM02 -> VM01 
                                                    vim-cmd vmsvc/power.getstate 12 | grep "off" &>/dev/null
                                                    if [ $? == 0 ]
                                                        then vmkfstools -U /vmfs/volumes/datastore1/VM01/VM01.vmdk
                                                             vmkfstools -i /vmfs/volumes/datastore1/VM02/VM02.vmdk /vmfs/volumes/datastore1/VM01/VM01.vmdk -d thin
                                                             vim-cmd /vmsvc/power.on 11
															 echo "klonen erfolgreich abgeschlossen"
															
                                                    fi                  
fi
exit

