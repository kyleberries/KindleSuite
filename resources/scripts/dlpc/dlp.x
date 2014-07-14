#!/system/bin/sh
FILENAME_RESULT=$(ls /system/app/ | grep ^DownloadProvider.odex$)

if [ -z "$FILENAME_RESULT" ];
then
        echo "You can use Google's Appstore"
	exit
else
        echo "You can use Amazon's Appstore"
	exit
fi

exit
