#!/usr/bin/env bash
WIDTH="${SUNSHINE_CLIENT_WIDTH:-1920}"
HEIGHT="${SUNSHINE_CLIENT_HEIGHT:-1080}"
FPS="${SUNSHINE_CLIENT_FPS%.*}"
FPS="${FPS:-60}"
FPS_MHZ=$(( FPS * 1000 ))
RES="${WIDTH}x${HEIGHT}"

NAME="sunshine-vmon"

# Create virtual display at client resolution
krfb-virtualmonitor --resolution "$RES" --name "$NAME" --password "sunshinepass" --port 5905 &
echo $! > /tmp/sunshine-vmon.pid

# Wait for KDE to register the new display
sleep 3

# Disable physical monitor(s) and make virtual display primary
# Replace DP-1 with your actual output name (check with: kscreen-doctor -o)
# Disables all OTHER monitors
kscreen-doctor --json |
jq -r --arg vname "Virtual-$NAME" '
  .outputs[]
  | select(.name != $vname)
  | .name
' |
while read -r output; do
  kscreen-doctor "output.${output}.disable"
  sleep 0.5
done

# Add custom mode support for the correct frame rate
kscreen-doctor output.Virtual-${NAME}.addCustomMode.${WIDTH}.${HEIGHT}.${FPS_MHZ}.full

# Make virtual display primary
kscreen-doctor \
  output.Virtual-${NAME}.enable \
  output.Virtual-${NAME}.mode.${RES}@${FPS} \
  output.Virtual-${NAME}.priority.1

# Tell Sunshine to capture this display
CONF="${HOME}/.config/sunshine/sunshine.conf"
sed -i '/^output_name/d' "$CONF"
echo "output_name = Virtual-${NAME}" >> "$CONF"
