#
# Regular cron jobs for the mostutils package
#

# maintenance
0 4	* * *	root	[ -x /usr/bin/mostutils_maintenance ] && /usr/bin/mostutils_maintenance

