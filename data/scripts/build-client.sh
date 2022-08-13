#!/bin/bash - 
#===============================================================================
#
#          FILE: build-client.sh
# 
#         USAGE: ./build-client.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/12/2022 19:58:23
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SCRIPT_DIR=`dirname "$(greadlink -f "$BASH_SOURCE")"`
ROOT_DIR=${SCRIPT_DIR%/*}
CLIENT_BUILD_DIR=$ROOT_DIR/dist/static

clientBuildFile=$ROOT_DIR/dist/client-app.zip

# for testing environment variables from .env
#export $(grep -v '^#' $ROOT_DIR/.env | xargs -d '\n')

if [ -e "$clientBuildFile" ]; then
  rm "$clientBuildFile"
  echo "$clientBuildFile was removed."
fi

echo "PATHHH $ROOT_DIR/client"
ENV_CONFIGURATION=$ROOT_DIR/client/shop-angular-cloudfront/src/environments/environment.prod.ts
echo "ENVVV $ENV_CONFIGURATION"
#cd $ROOT_DIR/client/shop-angular-cloudfront && ng install
cd $ROOT_DIR/client/shop-angular-cloudfront && ng build --configuration=production --output-path=$CLIENT_BUILD_DIR

zip -r $clientBuildFile $CLIENT_BUILD_DIR
echo "Client app was built with $ENV_CONFIGURATION configuration."

: 'NOTE: for compressing files was used 7zip program (by adding it to `PATH` env variable), as script
was writing on Win10 and this OS  do not support "zip" command without additional installations.
Probably, for others OS will be more suitable next command:'
#zip -r $clientBuildFile $CLIENT_BUILD_DIR/*

