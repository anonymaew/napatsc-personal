#!/bin/sh

# https://fonts.google.com/icons
ICON_NAMES="""
menu
search
translate
link
content_copy
check
light_mode
dark_mode
brightness_6
"""

ICONS_PARAM=""

for ICON_NAME in $(echo "$ICON_NAMES" | sort); do
  ICONS_PARAM="$ICONS_PARAM,$ICON_NAME"
done

wget -q -O - "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,FILL@20..48,1&icon_names=${ICONS_PARAM#?}&display=swap" \
  -U "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:137.0) Gecko/20100101 Firefox/137.0" | \
    grep -E -o "https[^\)]*?" | \
    xargs wget -q -O "MaterialSymbolFill-Stripped.woff2"

