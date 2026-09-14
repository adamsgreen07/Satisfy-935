#!/bin/sh
set -e
mkdir -p bin
if ! command -v monkeyc >/dev/null 2>&1; then
  echo "monkeyc not found. Install the Garmin Connect IQ SDK and add its bin directory to PATH."
  exit 1
fi
if [ -z "$DEVELOPER_KEY" ]; then
  echo "Set DEVELOPER_KEY to your Garmin developer_key.der"
  echo "Example: export DEVELOPER_KEY="$HOME/DeveloperKey/developer_key.der""
  exit 1
fi
monkeyc -d fr935 -f monkey.jungle -o bin/Satisfy935.prg -y "$DEVELOPER_KEY" -r -w
echo "Built: bin/Satisfy935.prg"
