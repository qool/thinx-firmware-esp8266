#!/bin/bash

echo
echo "-=[ THiNX: Overriding header ]=-"
echo

# Use this before your own internal releases. Build server does it automatically.

THINX_FILE=$(find . | grep "/Thinx.h")
THINX_OWNER="eaabae0d5165c5db4c46c3cb6f062938802f58d9b88a1b46ed69421809f0bf7f" # todo: override with parameter
THINX_ALIAS="vanilla" # todo: override with parameter
THINX_CLOUD_URL="rtm.thinx.cloud" # IP causes crashes
THINX_MQTT_URL="${THINX_CLOUD_URL}" # mqtt://?

REPO_NAME='thinx-firmware-esp8266'
VERSION=$(git rev-list HEAD --count)
REPO_VERSION="1.6.${VERSION}"
BUILD_DATE=`date +%Y-%m-%d`

echo "//" > $THINX_FILE
echo "// This is an auto-generated file, it will be re-written by THiNX on cloud build." >> $THINX_FILE
echo "//" >> $THINX_FILE

echo "" >> $THINX_FILE

echo "static const String thinx_commit_id = \""$(git rev-parse HEAD)\"";" >> $THINX_FILE
echo "static const String thinx_cloud_url = \"${THINX_CLOUD_URL}\";" >> $THINX_FILE
echo "static const String thinx_mqtt_url = \"${THINX_MQTT_URL}\";" >> $THINX_FILE
echo "static const String thinx_firmware_version = \"${REPO_NAME}-${REPO_VERSION}:${BUILD_DATE}\";" >> $THINX_FILE
echo "static const String thinx_firmware_version_short = \"${REPO_VERSION}\";" >> $THINX_FILE
echo "String thinx_owner = \"${THINX_OWNER}\";" >> $THINX_FILE
echo "String thinx_alias = \"${THINX_ALIAS}\";" >> $THINX_FILE
echo "String thinx_api_key = \"VANILLA_API_KEY\";" >> $THINX_FILE
echo "String thinx_udid = \"\";" >> $THINX_FILE

echo "" >> $THINX_FILE

echo "int thinx_mqtt_port = 1883;" >> $THINX_FILE
echo "int thinx_api_port = 7442;" >> $THINX_FILE
