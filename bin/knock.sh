#!/bin/bash 
#====================================================
#
#          FILE: knock.sh
# 
#         USAGE: ./knock.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/22/2018 23:11
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
HOST=$1
#-------------------------------------
function Main ()
{
	shift
	for ARG in "$@"
	do
		nmap -Pn --host_timeout 100 --max-retries 0 -p $ARG $HOST
	done
}	# end Main

Main

#===EXIT===
exit 0
