#!/usr/bin/env -S awk -f
# lineratio
{
	counter[$0]++
}
END {
	# write header line to STDERR
	#print "count      % \n" | "cat 1>&2"

	# output
	for (line in counter) {
		ratio = 100 / NR * counter[line]
		printf "%5d %5.3g%% %s\n", counter[line], ratio, line
	}
}

