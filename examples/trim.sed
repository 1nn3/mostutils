#!/usr/bin/env -S sed -f
# Entfernt Leerraum (Whitespace) am Anfang/links und Ende/rechts

s/^\s*//;
s/\s*$//;

