#!/bin/bash
# Init script to print color logs at any tty with any user
#
# Copyright(C) 2000, KARASZI Istvan, License under GPL version 2 or higher.
#
# Version 0.3 -- Wed Jun 26 11:56:30 CEST 2002

PATH="/bin/:/sbin/:/usr/sbin/:/usr/bin/";
LOGFILES="/var/log/syslog /var/log/auth.log /var/log/messages";
TTY="/dev/tty12";
USER="root"
NICE="19"
TAIL="/usr/bin/tail";
COLORIZE="/usr/local/bin/colorize";
PIDFILE="/var/run/colorize.pid";

start () {
	su $USER -c "$TAIL -q -c 0 --follow=name --retry $LOGFILES 2> /dev/null | nice -$NICE $COLORIZE > $TTY 2> /dev/null &"
	PID=`pgrep -n -u $USER \`basename $TAIL\``;
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
