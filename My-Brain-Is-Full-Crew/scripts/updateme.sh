#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$SCRIPT_DIR/../wrappers/claude/scripts/update.sh"

echo "Deprecated entrypoint: use bash wrappers/claude/scripts/update.sh"
exec bash "$TARGET" "$@"