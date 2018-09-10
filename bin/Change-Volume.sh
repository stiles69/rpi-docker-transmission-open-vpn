#!/bin/bash
#===============================================================================
#
#          FILE:  change-Volume.sh
# 
#         USAGE:  ./change-Volume.sh 
# 
#   DESCRIPTION:  Changes the volume up or down
#									10 percent.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/09/2017 07:47:33 PM CST
#      REVISION:  ---
#===============================================================================
echo 'Do you want to increase (+) or decrease (-)? '
read change
amixer -D pulse sset Master 10%$change


