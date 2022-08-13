#!/bin/bash - 
#===============================================================================
#
#          FILE: quality-check.sh
# 
#         USAGE: ./quality-check.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/13/2022 14:24:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
SCRIPT_DIR=`dirname "$(greadlink -f "$BASH_SOURCE")"`
ROOT_DIR=${SCRIPT_DIR%/*}

cd $ROOT_DIR/client/shop-angular-cloudfront && ng lint

cd $ROOT_DIR/client/shop-angular-cloudfront && ng test

echo "Linting and test done."

