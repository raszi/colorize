#!/bin/bash
# Init script to print color logs at any tty with any user and any shell
#
# Copyright(C) 2003, KARASZI Istvan, License under GPL version 2 or higher.
#
# Version 0.5 -- Fri Feb 21 23:14:45 CET 2003

PATH="/bin/:/sbin/:/usr/sbin/:/usr/bin/";
DEVICE="/dev/colorize";
TTY="/dev/tty12";
USER="colorize";
SHELL="/bin/bash";
NICE="19";
COLORIZE="/usr/local/bin/colorize";
PIDFILE="/var/run/colorize.pid";

start () {
	su $USER -s $SHELL -c "nice -$NICE $COLORIZE < $DEVICE > $TTY 2> /dev/null &"
	PID=`pgrep -n -u $USER \`basename $COLORIZE\``;
	if [ "$PID" != "" ]; then
		echo $PID > $PIDFILE
		echo -n " started";
	else
		echo -n " failed";
	fi
}

stop () {
	if [ -e $PIDFILE ]; then
		PID=`cat $PIDFILE`;
		if [ "$PID" != "" ]; then
			kill "$PID" 2> /dev/null
			if [ $? -ne 0 ]; then
				echo " failed ($PID)";
				exit -1
			else
				rm $PIDFILE
				echo -n " stopped"
			fi
			
		else
			echo -n " failed";
		fi
	fi
} 

case "$1" in
	start)
		echo -n "Starting log on $TTY...";
		start
		echo;
		;;
	stop)
		echo -n "Stopping log on $TTY...";
		stop
		echo;
		;;
	restart)
		echo -n "Restarting log on $TTY...";
		stop
		start
		echo;
		;;
	*)
		echo "Usage $0 {start|stop|restart}" 1>&2
		exit 1;
		;;
esac
