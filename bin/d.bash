#!/usr/bin/env bash
# calendar/date

cal -A 1

echo "Heute: $(date)"
calendar -A 0

echo "Morgen:"
calendar -t $(date --date "now + 1 day"  +"%y%m%d") -A 0

echo "Anstehend:"
calendar -t $(date --date "now + 2 days" +"%y%m%d") -A 5

