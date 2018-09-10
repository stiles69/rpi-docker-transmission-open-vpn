#!/bin/bash
#===============================================================================
#
#          FILE:  Upload-To-Google-Cloud-Static-files.sh
# 
#         USAGE:  ./Upload-To-Google-Cloud-Static-files.sh 
# 
#   DESCRIPTION:  This uploads a folder to a cloud bucket on Google Cloud and serves
#									the static pages.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/05/2017 02:08:36 AM CST
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
# Upload files to bucket
gsutil cp -r /home/brettsalemink/Websites/hometown-cab/ gs://hometown-cab

# Change permissions on files that were upload3ed
gsutil acl -r ch -u AllUsers:R gs://hometown-cab
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

