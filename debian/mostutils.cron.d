#
# Regular cron jobs for the mostutils package
#

# maintenance
0 4	* * *	root	[ -x /usr/bin/mostutils_maintenance ] && /usr/bin/mostutils_maintenance
0 22,23,0,1,2,3	* * sun,mon,tue,wed,thu	root	[ -x /usr/bin/mute-cronjob ] && /usr/bin/mute-cronjob
0 8	* * *	root	[ -x /usr/bin/volreset ] && /usr/bin/volreset

