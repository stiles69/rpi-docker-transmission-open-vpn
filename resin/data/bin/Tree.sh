#!/bin/bash
#===============================================================================
#
#          FILE:  Tree.sh
# 
#         USAGE:  ./Tree.sh 
# 
#   DESCRIPTION:  This will display a directory tree.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/13/2018 09:57:57 AM CDT
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
#!/bin/sh
#######################################################
#  UNIX TREE                                                            
#  Version: 2.3                                       
#  File: ~/apps/tree/tree.sh                          
#                                                     
#  Displays Structure of Directory Hierarchy          
#  -------------------------------------------------  
#  This tiny script uses "ls", "grep", and "sed"      
#  in a single command to show the nesting of         
#  sub-directories.  The setup command for PATH       
#  works with the Bash shell (the Mac OS X default).  
#                                                     
#  Setup:                                             
#     $ cd ~/apps/tree                                
#     $ chmod u+x tree.sh                             
#     $ ln -s ~/apps/tree/tree.sh ~/bin/tree          
#     $ echo "PATH=~/bin:\${PATH}" >> ~/.profile      
#                                                     
#  Usage:                                             
#     $ tree [directory]                              
#                                                     
#  Examples:                                          
#     $ tree                                          
#     $ tree /etc/opt                                 
#     $ tree ..                                       
#                                                     
#  Public Domain Software -- Free to Use as You Like  
#  http://www.centerkey.com/tree  -  By Dem Pilafian  
#######################################################

echo
if [ "$1" != "" ]  #if parameter exists, use as base folder
   then cd "$1"
   fi
pwd
ls -R | grep ":$" |   \
   sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
# 1st sed: remove colons
# 2nd sed: replace higher level folder names with dashes
# 3rd sed: indent graph three spaces
# 4th sed: replace first dash with a vertical bar
if [ `ls -F -1 | grep "/" | wc -l` = 0 ]   # check if no folders
   then echo "   -> no sub-directories"
   fi
echo
exit
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

