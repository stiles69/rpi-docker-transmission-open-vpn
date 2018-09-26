#!/bin/bash  
#=========================================================
#
#          FILE: Pull-Bin-ALL-TEST.sh
# 
#         USAGE: ./Pull-Bin-ALL-TEST.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/07/2018 02:15
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------
#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '
HOST1='pi64.roguedesigns.us'
HOST2='stiles.roguedesigns.us'
HOST3='stretch.roguedesigns.us'
HOST4='manjaro.roguedesigns.us'

#-------------------------------------
function Main ()
{
	ssh -t -o StrictHostKeyChecking=no "$HOST1" "$HOME/bin/update/Update-Manjaro.sh"
	wait
	ssh -t -o StrictHostKeyChecking=no "$HOST2" "$HOME/bin/update/Update-Debian.sh"
	ssh -t -o StrictHostKeyChecking=no "$HOST3" "$HOME/bin/update/Update-Debian.sh"
#	ssh -t -o StrictHostKeyChecking=no "$HOST4" "$HOME/bin/update/Update-Manjaro.sh"
	wait
	wait
	wait
}	# end Main

function rr ()
{
	while IFS='' read -r line || [[ -n "$line" ]]; 
	do    
		ssh -t -o StrictHostKeyChecking=no "$line" $HOME/bin/update/Update-Manjaro.sh
	done < "$1"
}	# end Main
Main

#===EXIT===
exit 0


#ssh -t -o StrictHostKeyChecking=no brettsalemink@pi64.roguedesigns.us $HOME/bin/update/Update-Manjaro.sh
