#!/bin/bash

TEXT="$*"
FONT="doom"

if [[ -z "$TEXT" ]]; then
  echo "Usage: $0 \"your text here\""
  exit 1
fi


while read -rsn1 -t 0.1; do :; done # Flush any pending input

printf '\033]11;rgb:00/00/00\007'  # Set background color to black

while true; do
  figlet -f "$FONT" "$TEXT" | tte \
    --frame-rate 120 --canvas-width 0 --canvas-height 0 --reuse-canvas --anchor-canvas c --anchor-text c\
    random_effect
done
