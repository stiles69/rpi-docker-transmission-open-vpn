#!/bin/bash
#===========================================================
#
#          FILE: funcRunRemoteCommand.sh
# 
#         USAGE: ./funcRunRemoteCommand.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 23:24
#      REVISION:  ---
#==========================================================
set -o nounset                              # Treat unset variables as an error


function RunRemoteCommand ()
{

	DELIMITER="#########################################################"
	LINE=" "
	USAGE="The correct usage is source the file $HOME/lib/sh/funcRunRemoteCommand.sh and to call function RenRemoteCommand [MACHINENAME] [COMMAND]"
	if [ "$2" ]
	then
		MACHINENAME="$1"
		COMMAND="$2"
		ssh -t -o StrictHostKeyChecking=no brettsalemink@"$MACHINENAME" "$COMMAND"
		echo "Done running $COMMAND on $MACHINENAME"
		echo "$DELIMITER"
		echo "$LINE"
	else
		echo "$USAGE"
		echo "Exiting ..."
		exit 1
	fi
}	# end RunRemoteCommand


