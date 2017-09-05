# The path to the Android SDK and NDK should be CONDITIONALLY added here

if [ -z ${ANDROID_SDK_PATH+x} ]; then
  ANDROID_SDK_PATH=~/Downloads/android-sdk-linux/platform-tools/
  UNSET_ANDROID_SDK_PATH=1
else
  UNSET_ANDROID_SDK_PATH=0
fi

if [ -z ${ANDROID_NDK_PATH+x} ]; then
  ANDROID_NDK_PATH=~/Downloads/android-ndk/
  UNSET_ANDROID_NDK_PATH=1
else
  UNSET_ANDROID_NDK_PATH=0
fi

if [ -e ${ANDROID_SDK_PATH} ]; then
  PATH=${PATH}:${ANDROID_SDK_PATH}
fi

if [ -e ${ANDROID_NDK_PATH} ]; then
  PATH=${PATH}:${ANDROID_NDK_PATH}
fi

if [ ${UNSET_ANDROID_SDK_PATH} -eq "1" ]; then
  unset ANDROID_SDK_PATH
fi

if [ ${UNSET_ANDROID_NDK_PATH} -eq "1" ]; then
  unset ANDROID_NDK_PATH
fi

unset UNSET_ANDROID_SDK_PATH
unset UNSET_ANDROID_NDK_PATH
