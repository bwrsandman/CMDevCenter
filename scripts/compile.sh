#!/bin/bash

device=$1
branch=$2
package=$3

echo "Compiling device: $device"
echo "Branch: $branch"

# Check existance of repository
if [ ! -d Makefile || -n build/envsetup.sh ]; then
	echo

        echo "Repository empty or corrupted.\nRun Sync again." >&2
        read -p "Ok [Enter]"
fi


read -p "Press [Enter] to start compile"
source build/envsetup.sh
lunch full_$device-userdebug
mka $package

echo
if [ $? -eq 0 ]; then
	read -p "Compile complete [Enter] to quit"
else
	read -p "Error [Enter] to quit"
fi

exit 0
