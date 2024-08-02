#!/bin/bash
#
#
#dfrisardi - 20190828
#
# wie spät ist es Ver. 0.1
#
#
#######################
#Freigegeben - 20190828 - dfrisardi
########################################



echo "Wie spät ist es?"

read antwort

if [[ "$antwort" -le 599 ]]
	then
		echo "Gute Nacht"
	else

		if [[ "$antwort" -ge 600 && "$antwort" -le 1159 ]]
			then
				echo "Guten Morgen"
			else

				if [[ "$antwort" -ge 1200 && "$antwort" -le 1759 ]]
					then
						echo "GutenTag"
					else

						if [[ "$antwort" -ge 1800 && "$antwort" -le 2159 ]]
							then
								echo "Guten Abend"
							else

								if [[ "$antwort" -ge 2200 && "$antwort" -le 559 ]]
									then
										echo "Gute Nacht"
								fi
						fi
				fi
		fi
fi

exit 
