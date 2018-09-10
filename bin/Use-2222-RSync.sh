#!/bin/bash
#===============================================================================
#
#          FILE:  Use-2222-RSync.sh
# 
#         USAGE:  ./Use-2222-RSync.sh 
# 
#   DESCRIPTION:  This performs a rsync with ssh 
#		  port 2222.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/05/2018 12:40:50 AM CST
#      REVISION:  ---
#===============================================================================

rsync -rvz -e 'ssh -p 2222' --progress ./ 
brettsalemink@192.168.1.5:/storage/emulated/legacy$/home/brettsalemink



