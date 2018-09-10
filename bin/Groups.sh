#!/bin/bash
#===============================================================================
#
#          FILE:  Groups.sh
# 
#         USAGE:  ./Groups.sh 
# 
#   DESCRIPTION:  This will show groups on machine.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  05/20/2018 07:52:24 PM CDT
#      REVISION:  ---
#===============================================================================

sudo echo `cut -d: -f1 /etc/group`

