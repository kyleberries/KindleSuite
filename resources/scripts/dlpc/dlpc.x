#!/system/bin/sh
FILENAME_RESULT=$(ls /system/app/ | grep ^DownloadProvider.odex$)

if [ -z "$FILENAME_RESULT" ];
then
        echo "Changing to Amazon"
	su -c "mount -o remount,rw /system"
	su -c "rm /system/app/DownloadProvider.apk"
	su -c "rm /system/app/DownloadProviderUi.apk"
	su -c "cp /system/dlpc/DownloadProvider.apk /system/app/DownloadProvider.apk"
	su -c "cp /system/dlpc/DownloadProvider.odex /system/app/DownloadProvider.odex"
	su -c "cp /system/dlpc/DownloadProviderUi.apk /system/app/DownloadProviderUi.apk"
	su -c "cp /system/dlpc/DownloadProviderUi.odex /system/app/DownloadProviderUi.odex"
	su -c "chown 0.0 /system/app/DownloadProvider*"
	su -c "chmod 644 /system/app/DownloadProvider*"
	echo "rebooting now"
	su -c "system/bin/hotreboot"
	exit
else
        echo "Changing to Google"
	su -c "mount -o remount,rw /system"
	su -c "rm /system/app/DownloadProvider.apk"
	su -c "rm /system/app/DownloadProviderUi.apk"
	su -c "rm /system/app/DownloadProvider.odex"
	su -c "rm /system/app/DownloadProviderUi.odex"
	su -c "cp /system/dlpc/DownloadProvider.apkgg /system/app/DownloadProvider.apk"
	su -c "cp /system/dlpc/DownloadProviderUi.apkgg /system/app/DownloadProviderUi.apk"
	su -c "chown 0.0 /system/app/DownloadProvider*"
	su -c "chmod 644 /system/app/DownloadProvider*"
	echo "rebooting now"
	su -c "system/bin/hotreboot"
	exit
fi

exit
