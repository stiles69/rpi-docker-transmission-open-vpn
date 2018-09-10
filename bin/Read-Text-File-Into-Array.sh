#!/bin/bash  
#=========================================================
#
#          FILE: Read-Text-File-Into-Array.sh
# 
#         USAGE: ./Read-Text-File-Into-Array.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/07/2018 04:28
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
function ReadTextFile ()
{
	IFS=$'\n' read  -d'' -r -a inlines  < "$HOME/bin/allmachines/Hosts.txt"
	IFS=$'\n' read  -d'' -r -a  outlines < "$HOME/bin/allmachines/Hosts.txt"
	counter=0
	cat "$HOME/bin/allmachines/Hosts.txt" | while read line; 
	do    
		echo "$counter ${inlines[$counter]}"   
	       	ssh -t -o StrictHostKeyChecking=no brettsalemink@"${inlines[$counter]}" "$HOME/bin/update/Update-Upgrade.sh"	
		counter=$(($counter+1))
	done
}	# end Main

ReadTextFile

#===EXIT===
exit 0
