#!/bin/bash -e

# ABOUT THIS FILE
#   Please see the root README.md file for instructions.
#
#   This file is provided FOR REFERENCE ONLY. The values below are
#   automatically populated by your store server.

# REQUIREMENTS
#   fswatch

# HOW TO USE
#   Please see the root README.md file for instructions.

DATE=$(date +%Y%m%d%H%M%S)
export DATE
export TOKEN='__CUSTOMER_BASE_TOKEN__'
export THEME_TOKEN='__HMAC_THEME_TOKEN__'
export BASE_URL='__BASE_TEAM_URL__'
export TEAM_NAME='__BASE_STORE_NAME__'
export THEME_ASSET_ID='__BASE_THEME_ASSET_ID__'
mkdir -p ./crank_shaft
zip -r ./crank_shaft/"${DATE}".zip engine_cms spree theme_assets
export ZIP_FILE_PATH="./crank_shaft/${DATE}.zip"

RESPONSE=$(curl -v -X PUT \
https://${BASE_URL}/api/themes/${THEME_ASSET_ID} \
-F "theme[name]=${TEAM_NAME}_${DATE}" \
-F "theme[import_file]=@${ZIP_FILE_PATH}" \
-F "token=$TOKEN" \
-F "theme_token=$THEME_TOKEN")
echo "${RESPONSE}"
echo "Successfully updated the theme!"
rm -rf ./crank_shaft
fswatch -0 -1 . | xargs -0 -I $ ./upload.sh
