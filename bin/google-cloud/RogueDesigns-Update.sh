#!/bin/bash
#===============================================================================
#
#          FILE:  Update-RogueDesigns-2.sh
# 
#         USAGE:  ./Update-RogueDesigns-2.sh 
# 
#   DESCRIPTION:  This will update Roguedesigns website. Must be in dist!!!
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/23/2018 06:52:09 PM CDT
#      REVISION:  ---
#===============================================================================
DEPLOYDIR='/home/brettsalemink/stiles69/roguedesigns-190602-google-cloud'
sudo rm -r dist
npm run build
wait
cd dist
rm -r $DEPLOYDIR/Webserver1/files
mkdir $DEPLOYDIR/Webserver1/files 
rsync -rvz --progress ./ $DEPLOYDIR/Webserver1/files
wait
cd $DEPLOYDIR/Webserver1
gcloud app versions list
read -p 'What is the next version:' versionanswer
gcloud app deploy -v $versionanswer .
gcloud app versions list
read -p 'What version to delete:' deleteanswer
gcloud app versions delete $deleteanswer
 
