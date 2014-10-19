#!/bin/sh

BASE=../../../vendor/samsung/logan2g/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  # My way of pulling blobs without the device
  cd
  mkdir android
  cd android
  mkdir starpro
  cd starpro
  mkdir dump
  cd dump
  adb devices
  adb pull /system
  cp ~/android/starpro/dump/$FILE $BASE/$FILE
done

./setup-makefiles.sh
