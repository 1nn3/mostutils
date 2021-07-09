#!/usr/bin/env bash

export TZDIR="${TZDIR:-/usr/share/zoneinfo/posix/}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

tz="$XDG_CONFIG_HOME/tz/tz"

mkdir -p "`dirname "$tz"`"
touch "$tz"

while read REPLY; do
	env TZ="$REPLY" date "+$REPLY:	%R %F (%z)"
done <"$tz"

