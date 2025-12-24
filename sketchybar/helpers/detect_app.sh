#!/bin/bash
# Helper script to detect current app name for debugging

echo "=== Current Front App ==="
osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true'

echo ""
echo "=== All Running Apps ==="
osascript -e 'tell application "System Events" to get name of every application process'
