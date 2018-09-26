#!/bin/bash
#===============================================================================
#
#          FILE:  Find-Directory-Names.sh
# 
#         USAGE:  ./Find-Directory-Names.sh 
# 
#   DESCRIPTION:  This will list all the Directory Names.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/15/2018 10:02:00 PM CDT
#      REVISION:  ---
#===============================================================================
#========================== SHELL LIBRARY =====================================
# ./home/brettsalemink/lib/sh/NAMEOFFILE.sh
#===========================END SHELL LIBRARY==================================

#============================LOCAL DECLARATIONS===============================
VERSION="1.0"
#USAGE="/home/brettsalemink/BashScripts/Find-Directory-Names.sh [Option put in your path to search such as /home/my/path/to/search"
#=========================END LOCAL DECLARATIONS==============================

# ===================== OPTIONS PROCESSING==========================
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

#param1=$1
#param2=$2
#==========================END OPTIONS PROCESSING========================

# ========================= LOCKS =======================================
LOCK_FILE=/tmp/$SUBJECT.lock
if [ -f "$LOCK_FILE" ]; then
   echo "Script is already running"
   exit
fi

trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE
#==========================END LOCKS====================================

#==========================MAIN SCRIPT==================================
#  SCRIPT LOGIC GOES HERE

#for file in $(find ~/lab2/students -maxdepth 1 -type d) #or you can use the awk one here
#for file in $(find $param1 -maxdepth 1 -type d) #or you can use the awk one here
#do
#DIR=${1:-`pwd`}
#SPACING=${2:-|}
#cd $DIR
for x in * ; do
    [ -d "$DIR/$x" ] &&  echo "$SPACING\`-{$x" && $0 "$DIR/$x" "$SPACING  " || \
    echo "$SPACING $x : MD5=" && md5sum "$DIR/$x"
done
#done
#==========================END MAIN SCRIPT==============================

#======================= STATISTICS / CLEANUP ==========================


#==========================END STATISTICS / CLEANUP=====================
exit 0


