## About ##

This is a perl script to colorize your logs. Useful for system administrators to check daily logs, it will highlight the important parts of every log line.

It uses coherent colors for every log formats which is pretty cool but you can use your own colors by modifying the configuration file in your home directory (~/.colorizerc) or system-wide (/etc/colorizerc).

## Install ##

### MacOS ###

Install my tap from [raszi/homebrew-tap][3] with the following command:

```shell
brew tap raszi/tap
```

Then install the formula with:

```shell
brew install raszi/tap/colorize
```

### FreeBSD ###

It is in the [ports][2], you can install with any preferred way.

### Manual ###

#### Dependencies ####

This script depends on [Term::ANSIColor][1], so you will need to install it first.

Under Debian GNU/Linux:

```shell
apt-get install perl-modules
```

Gentoo:

```shell
emerge -vta perl-core/Term-ANSIColor
```

#### Installing the script ####

```shell
make install
```

## Usage ##

Just pipe the logs in the script, and have fun.

## Examples ##

```shell
cat /var/log/daemon.log | colorize
tail -0f /var/log/daemon.log /var/log/apache/access.log | colorize
colorize < /var/log/messages
```

## Tips ##

In the TIPS file and in the examples directory.

[1]: http://search.cpan.org/perldoc/Term::ANSIColor
[2]: http://svnweb.freebsd.org/ports/head/sysutils/colorize
[3]: https://github.com/raszi/homebrew-tap
