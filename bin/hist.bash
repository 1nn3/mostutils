#!/usr/bin/env bash
# history

usage () {
	cat <<! >&2
	--help
		Diese Dokumentation anzeigen

	-k <4096>
		Keep

	-h <path/to/history.text>
		History file

		Default is ./history.text
!
}

TEMP=$(getopt -o 'h:k:' --long 'help' -n "$0" -- "$@")

if [ $? -ne 0 ]; then
	usage
	echo 'Terminating...' >&2
	exit 1
fi

# Note the quotes around "$TEMP": they are essential!
eval set -- "$TEMP"
unset TEMP

while true; do
	case "$1" in
		'--help')
			echo 'Option -h, --help'
			shift 1
			usage
			exit
		;;
		'-h')
			history="$2"
			shift 2
			continue
		;;
		'-k')
			keep="$2"
			shift 2
			continue
		;;
		'--')
			shift
			break
		;;
		*)
			echo 'Internal error!' >&2
			exit 1
		;;
	esac
done

keep="${keep:-4096}"
history="${history:-history.text}"

mkdir -p "`dirname "$history"`"
touch "$history"

comm -2 -3 <(sort) <(sort "$history") | tee -a "$history"

# History kürzen
temp="$(mktemp)"
tail -n "$keep" "$history" >"$temp"
mv "$temp" "$history"

