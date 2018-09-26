#!/bin/bash
#=========================================================
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
#=========================================================
set -o nounset                                  # treat unset variables as errors
set -e
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
DELIMITER='#############################################'
LINE=' '
DEPLOYDIR="$HOME/development/stiles69/Rogue-Designs-Google-Cloud-Deployment/Webserver1"
BUILDDIR="$1"
#-------------------------------------
function Main ()
{
	echo '**********DANGER THIS WILL USE RSYNC FROM THE CURRENT DIR USE CTRL-C IF YOU MADE A MISTAKE**************'
	sleep 6
	rsync -avz --delete-before --progress "$BUILDDIR" $DEPLOYDIR/files/
	gcloud app versions list
	echo 'What should the next version be?'
	read VERSIONVARIABLE
	
	gcloud app deploy --version $VERSIONVARIABLE --quiet $DEPLOYDIR/app.yaml
	
	gcloud app versions list
	echo 'What was the old version to delete?'
	read VERSIONVARIABLEOLD
	gcloud app versions delete "$VERSIONVARIABLEOLD"
	echo "$DELIMITER"
	echo "DONE UPDATING WEBSITE"
	echo "$DELIMITER"
}	# end Main

Main

#===EXIT===
exit 0
