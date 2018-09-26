#!/bin/bash
#===============================================================================
#
#          FILE:  Make-Stretch-Image.sh
# 
#         USAGE:  ./Make-Stretch-Image.sh 
# 
#   DESCRIPTION:  This will make a backup image os sdcard.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/21/2018 07:52:46 PM CDT
#      REVISION:  ---
#===============================================================================
#FILEDATE=$(date +%Y%m%d%T)
FILENAME=STRETCH-$(date +%Y%m%d%T).img

sudo dd if=/dev/mmcblk0 of=/mnt/FreeAgent/Backups/$FILENAME bs=1M status=progress
