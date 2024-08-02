#!bin/bash
#
#
#dfrisardi - 20190828
#
#
#######################
#Freigegeben - 20190828 - dfrisardi
########################################


FILE=/home/linux/bfw_test/existiert.txt	#Variable gesetzt

if test -e $FILE			#datei mit test suchen
	then
		rm $FILE		#wenn vorhanden löschen

	else
		touch $FILE		#sonst anlegen

fi
