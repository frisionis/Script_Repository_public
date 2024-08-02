#!/bin/sh
#
#automatisierung Virtualisierung VM clonen
#
#erstellt 20191203 - dfrisardi
#
# Version 0.1
#
#freigegeben - 20191209 - dfrisardi
##########################################################
# vmname="VM01"
# vmid=$(vim-cmd vmsvc/getallvms | grep "$vmname" | awk '{print $1}')
# #
# # stat1=$(vim-cmd vmsvc/power.getstate "$vmid" | grep "off")
# # #
# # if [ "$stat1" == "Powered off" ]
# # then vim-cmd vmsvc/power.on "$vimd"
# # fi
# #

###########################################################

#Ueberprüfung
vim-cmd vmsvc/power.getstate 11 | grep "on" &>/dev/null
#Herunterfahren der VM
if [ $? == 0 ]
    then vim-cmd /vmsvc/power.shutdown 11
         vim-cmd /vmsvc/power.getstate 11 | grep "off" &>/dev/null
            until [ $? == 0 ]
                do vim-cmd vmsvc/power.getstate 11 | grep "off" &>/dev/null
                    done
                    echo "Ausgeschaltet"  
#loeschen des alten Backups und neu klonen  
                        vmkfstools -U /vmfs/volumes/datastore1/VM02/VM02.vmdk
                        vmkfstools -i /vmfs/volumes/datastore1/VM01/VM01.vmdk /vmfs/volumes/datastore1/VM02/VM02.vmdk -d thin
                        vim-cmd /vmsvc/power.on 12
                            else vim-cmd vmsvc/power.getstate 12 | grep "on" &>/dev/null
                                if [ $? == 0 ]
                                    then vim-cmd /vmsvc/power.shutdown 12
                                         vim-cmd /vmsvc/power.getstate 12 | grep "off" &>/dev/null
                                            until [ $? == 0 ]
                                                do vim-cmd vmsvc/power.getstate 12 | grep "off" &>/dev/null
                                                    done
                                                    echo "Ausgeschaltet"
                                                    echo "abgeschlossen"
                                                    fi

                                                    vim-cmd vmsvc/power.getstate 12 | grep "off" &>/dev/null
                                                    if [ $? == 0 ]
                                                        then vmkfstools -U /vmfs/volumes/datastore1/VM01/VM01.vmdk
                                                            vmkfstools -i /vmfs/volumes/datastore1/VM02/VM02.vmdk /vmfs/volumes/datastore1/VM01/VM01.vmdk -d thin
                                                                vim-cmd /vmsvc/power.on 11
                                fi                  fi
