#!/bin/bash
#===============================================================================
#
#          FILE:  Refresh-bin.sh
# 
#         USAGE:  ./Refresh-bin.sh 
# 
#   DESCRIPTION:  This will update bin with git.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  06/23/2018 12:32:15 AM CDT
#      REVISION:  ---
#===============================================================================

cd '/home/brettsalemink/bin'
git pull

cd '/home/brettsalemink/bin'
git add .
git commit -m 'Update'
git push

echo "Finished Update"
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0



