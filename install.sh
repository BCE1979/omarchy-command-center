#!/usr/bin/env bash
# Install Omarchy Command Center to ~/.local/bin.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="$HOME/.local/bin"
TARGET="$BIN/omarchy-command-center"

echo "→ checking requirements"

if ! command -v omarchy >/dev/null 2>&1; then
    echo "✗ omarchy not found on PATH — this tool manages an Omarchy installation." >&2
    exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
    echo "✗ python3 not found." >&2
    exit 1
fi

if ! python3 -c 'import textual' >/dev/null 2>&1; then
    echo "→ installing dependency: textual"
    python3 -m pip install --user --quiet textual
fi

mkdir -p "$BIN"
install -m 0755 "$REPO_DIR/omarchy-command-center" "$TARGET"

echo "✓ installed to $TARGET"
echo "  run: omarchy-command-center"