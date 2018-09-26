#!/bin/bash
#===============================================================================
#
#          FILE:  Deploy-Google-App.sh
# 
#         USAGE:  ./Deploy-Google-App.sh 
# 
#   DESCRIPTION:  Automates deploying app to Google Cloud.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Must be in folder that contains information to upload.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:39:37 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # treat unset variables as errors

#===============================================================================
#   GLOBAL DECLARATIONS
#===============================================================================
declare -rx SCRIPT=${0##*/}                     # the name of this script
declare -rx mkdir='/bin/mkdir'                  # the mkdir(1) command

#===============================================================================
#   SANITY CHECKS
#===============================================================================
if [ -z "$BASH" ] ; then
	printf "$SCRIPT:$LINENO: run this script with the BASH shell\n" >&2
	exit 192
fi

if [ ! -x "$mkdir" ] ; then
	printf "$SCRIPT:$LINENO: command '$mkdir' not available - aborting\n" >&2
	exit 192
fi

#===============================================================================
#   MAIN SCRIPT
#===============================================================================
echo 'What is the ProjectID?'
read projectID
gcloud app versions list
echo 'What should the next version be?'
read versionVariable
gcloud config set project $projectID
gcloud app deploy --quiet --version $versionVariable --stop-previous-version
echo 'What was the old version to delete?'
read versonOldVariable
gcloud app versions delete $versionOldVariable

#==============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

