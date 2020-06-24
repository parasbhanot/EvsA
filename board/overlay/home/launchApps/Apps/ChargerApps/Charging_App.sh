#!/bin/sh

export LD_LIBRARY_PATH=/usr/local/lib

a=$(sqlite3 /home/launchApps/Apps/ChargerApps/sqlite/charger.db "SELECT value FROM keys where key = 'fwdir';")
echo $a
/home/launchApps/Apps/ChargerApps/$a/./EvdcApp -platform xcb

while [ $? != "0"  ]
do
  	sleep 10s
	echo "Re-executing Application"
	b=$(sqlite3 /home/launchApps/Apps/ChargerApps/sqlite/charger.db "SELECT value FROM keys where key = 'fwdir';")
	echo $b	
	/home/launchApps/Apps/ChargerApps/$b/./EvdcApp -platform xcb
done
echo "Closed"
