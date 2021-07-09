#!/usr/bin/env bash
# voldown (POSIX shell script)
step="${VOLUPDOWN_STEP:-10}"
amixer -q set "Master" "${step}%-"

