#!/usr/bin/env -S sed -E -f
# Entfernt überflüssigen Leerraum (Whitespace) und nicht druckbare Zeichen

s/[[:space:]]+/ /g;
s/[^[:print:]]+/ /g;
s/\s*$//;
s/^\s*//;

