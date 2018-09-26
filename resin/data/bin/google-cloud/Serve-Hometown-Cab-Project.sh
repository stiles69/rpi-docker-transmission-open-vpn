#!/bin/bash
#====================================================
#
#          FILE: Serve-Hometown-Cab-Project.sh
# 
#         USAGE: ./Serve-Hometown-Cab-Project.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/14/2018 09:05
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
SITEDIR="$1"
#-------------------------------------
function Main ()
{
	echo "This will rsync the $SITEDIR for the deployment. Do you want to proceed? [Y/n]"
	read ANSWER

	case "$ANSWER" in
		Y|y)
		Proceed
		;;
		N|n)
		exit 0
		;;
		*)
		Proceed
		;;
	esac
}	# end Main

function Proceed ()
{
	rsync -avz --progress --delete-before "$SITEDIR/" "$HOME/development/stiles69/Hometown-Cab-Google-Cloud-Deployment/Webserver1/files/"

	cd $HOME/development/stiles69/Hometown-Cab-Google-Cloud-Deployment/Webserver1/
	goapp serve --host 10.0.0.11
}	# end
Main

#===EXIT===
exit 0
