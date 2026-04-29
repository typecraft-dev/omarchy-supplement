#!/bin/bash

# Toggle a reserved area on the right 1/5 of the BenQ external monitor for streaming overlays.
# Uses a state file to track whether the reserved area is currently active.

STATE_FILE="/tmp/stream-reserved-active"
MONITOR_NAME="DP-4"

# Get monitor width
MONITOR_WIDTH=$(hyprctl monitors -j | python3 -c "
import json, sys
monitors = json.load(sys.stdin)
for m in monitors:
    if m['name'] == '$MONITOR_NAME':
        print(m['width'])
        break
" 2>/dev/null)

if [ -z "$MONITOR_WIDTH" ]; then
    notify-send "Stream Reserved Area" "Monitor $MONITOR_NAME not found"
    exit 1
fi

RESERVED_RIGHT=$((MONITOR_WIDTH / 10))

if [ -f "$STATE_FILE" ]; then
    # Turn off - subtract the reserved area using negative value
    CURRENT=$(cat "$STATE_FILE")
    hyprctl keyword monitor "$MONITOR_NAME, addreserved, 0, 0, 0, -$CURRENT"
    rm "$STATE_FILE"
    notify-send "Stream Reserved Area" "OFF — reserved area removed on $MONITOR_NAME"
else
    # Turn on - add reserved area on the right
    hyprctl keyword monitor "$MONITOR_NAME, addreserved, 0, 0, 0, $RESERVED_RIGHT"
    echo "$RESERVED_RIGHT" > "$STATE_FILE"
    notify-send "Stream Reserved Area" "ON — ${RESERVED_RIGHT}px reserved on right of $MONITOR_NAME"
fi
