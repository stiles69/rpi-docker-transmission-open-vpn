#!/bin/bash
#===============================================================================
#
#          FILE:  Test.sh
# 
#         USAGE:  ./Test.sh 
# 
#   DESCRIPTION:  Test
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/14/2018 01:51:51 AM CDT
#      REVISION:  ---
#===============================================================================
#   GLOBAL DECLARATIONS
#===============================================================================
declare -rx SCRIPT=${0##*/}                     # the name of this script
declare -rx mkdir='/bin/mkdir'                  # the mkdir(1) command

#================================================================
#          Variable Declarations
#================================================================

# --- Locks -------------------------------------------------------
LOCK_FILE=/tmp/$SUBJECT.lock
if [ -f "$LOCK_FILE" ]; then
   echo "Script is already running"
   exit
fi
#-----------------------------------------------------------------

trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE

USAGE="This is usage"
VERSION="1.O"
OPTARG=" "
param1=$1
param2=$2
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
# --- Options processing -------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

while getopts ":i:vh" optname
  do
    case "$optname" in
      "v")
        echo "Version $VERSION"
        exit 0;
        ;;
      "i")
        echo "-i argument: $OPTARG"
        ;;
      "h")
        echo $USAGE
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

shift $(($OPTIND - 1))

param1=$1
param2=$2


# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE

find . -name \*$param1 -exec cp {} $param2 \;
#echo $param1
#echo $param2
# -----------------------------------------------------------------

#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0


