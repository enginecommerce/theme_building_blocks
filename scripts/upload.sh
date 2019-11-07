#!/bin/bash -e

# REQUIREMENTS
#   fswatch
#
# HOW TO USE
# 1. Make this file executable with the following:
#   `chmod 700 upload.sh`
# 2. Add the following function to your shell (bash or zsh):
#   `function crank_shaft { fswatch -0 -1 . | xargs -0 -I $ ./upload.sh }`
# 3. In the theme directory, run `crank_shaft`
# 4. After about 30 seconds, edits saved in local files will appear on the site

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
