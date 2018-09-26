#!/bin/bash
#====================================================
#
#          FILE:  Update-Rogue-Designs-Website.sh
# 
#         USAGE:  ./Update-Rogue-Designs-Website.sh 
# 
#   DESCRIPTION:  This will rsync and then deploy Rogue Designs Website.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  Gcloud components, Rsync.
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/02/2018 10:10:12 PM CST
#      REVISION:  1.0
#====================================================
set -o nounset                                  # treat unset variables as errors
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
SITEDIR="$1"
#-------------------------------------
function Main ()
{
	read -p 'This will rsync the $SITEDIR for the deployment. Do you want to proceed? [Y/n]' ANSWER
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
	gcloud app versions list
	echo 'What should the next version be?'
	read VERSIONVARIABLE
	gcloud app deploy --quiet --version "$VERSIONVARIABLE" "$HOME/development/stiles69/Hometown-Cab-Google-Cloud-Deployment/Webserver1/app.yaml"
	gcloud app versions list
	echo 'What was the old version to delete?'
	read VERSIONOLDVARIABLE
	gcloud app versions --quiet delete "$VERSIONOLDVARIABLE"
	echo 'Done Updating Website'
}	# end

Main

#===EXIT===
exit 0
