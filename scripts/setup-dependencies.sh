#!/bin/sh

CURRENT_PATH="$(pwd)"
LOCAL_DEP_DIR="local-dependencies"
LOCAL_DEP_PATH="$CURRENT_PATH/$LOCAL_DEP_DIR"

GAM_SDK_VERSION="8.3.0"

GAM_SDK_URL="https://dl.google.com/googleadmobadssdk/googlemobileadssdkios.zip"
GAM_SDK_ZIP_FILE="$LOCAL_DEP_PATH/googlemobileadssdkios.zip"
GAM_SDK_UNZIPPED_DIR="GoogleMobileAdsSdkiOS-$GAM_SDK_VERSION"
GAM_SDK_UNZIPPED_PATH="$LOCAL_DEP_DIR/$GAM_SDK_UNZIPPED_DIR"

echo "Removing the local dependecies directory at $LOCAL_DEP_PATH"

rm -rf $LOCAL_DEP_PATH

echo "Recreating the local dependecies directory at $LOCAL_DEP_PATH"

mkdir $LOCAL_DEP_PATH

echo "Fetching GAM SDK into $LOCAL_DEP_PATH"

# fetch GAM SDK
curl -L $GAM_SDK_URL -o $GAM_SDK_ZIP_FILE

if [ -f $GAM_SDK_ZIP_FILE ]; then
  echo "Fetched GAM zip file"

  # unzip GAM SDK
  echo "GAM SDK Fetched. Unzipping."
  unzip -q -d $LOCAL_DEP_PATH $GAM_SDK_ZIP_FILE

else
  echo "Fetching GAM zip file failed."
  exit 1
fi

echo "checking if directory is present at $GAM_SDK_UNZIPPED_PATH"

if [ -d $GAM_SDK_UNZIPPED_PATH ]; then
    echo "directory exists, removing zip file"
    rm -rf $GAM_SDK_ZIP_FILE
else
    echo "unzipped directory at $GAM_SDK_UNZIPPED_PATH does not exist"
    exit 1
fi

echo "Moving GAM binaries into $LOCAL_DEP_PATH"

mv $GAM_SDK_UNZIPPED_PATH/*.xcframework $LOCAL_DEP_PATH

echo "Removing $GAM_SDK_UNZIPPED_PATH"

rm -rf $GAM_SDK_UNZIPPED_PATH