#!/bin/bash

device=$1
branch=$2
package=$3
menu=full_$device-userdebug

echo "Compiling device: $device"
echo "Branch: $branch"
echo "Menu: $menu"

# Check existance of repository
if [[ ! -e Makefile || ! -e build/envsetup.sh ]]; then
	echo

        echo "Repository empty or corrupted. Run Sync again." >&2
        read -p "Ok [Enter]"
	exit 1
fi


read -p "Press [Enter] to start compile"
source build/envsetup.sh
lunch $menu
mka $package

echo
if [ $? -eq 0 ]; then
	read -p "Compile complete [Enter] to quit"
else
	read -p "Error [Enter] to quit"
fi

exit 0
