ABOUT:
  This is a perl script to colorize your logs. Useful for system administrators
  to check daily logs, it will highlight the important parts of every log line.

  It uses coherent colors for every log formats which is pretty cool but you
  can use your own colors by modifying the configuration file in your home
  directory (~/.colorizerc) or system-wide (/etc/colorizerc).

INSTALL:
  Put somewhere in your path or set the PATH environment variable.

  You will need to install the Term::ANSIColor Perl module by Russ Allbery and
  Zenin to use this script.
	
  You can download from the CPAN archive:
    http://www.cpan.org/modules/by-module/Term/

  or under Debian GNU/Linux:
    apt-get install perl-modules

  or under Gentoo:
    emerge -vta perl-core/Term-ANSIColor

USAGE:
  Just pipe the logs in the script, and	have fun.

EXAMPLES:
  cat /var/log/daemon.log | colorize
  tail -0f /var/log/daemon.log /var/log/apache/access.log | colorize
  colorize < /var/log/messages

TIPS:
  In the TIPS file and in the examples directory.
