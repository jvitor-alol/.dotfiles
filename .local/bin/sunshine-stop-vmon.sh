#!/usr/bin/env bash
# Kill virtual display
if [ -f /tmp/sunshine-vmon.pid ]; then
  kill "$(cat /tmp/sunshine-vmon.pid)" 2>/dev/null || true
  rm -f /tmp/sunshine-vmon.pid
fi

# Restore physical monitor
kscreen-doctor --json | jq -r '.outputs[].name' | while read -r output; do
  kscreen-doctor "output.${output}.enable"
  sleep 0.5
done

# Restore Sunshine output to physical display
CONF="${HOME}/.config/sunshine/sunshine.conf"
sed -i '/^output_name/d' "$CONF"
echo "output_name = DP-1" >> "$CONF"
