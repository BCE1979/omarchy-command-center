#!/usr/bin/env bash
# Install Omarchy Command Center to ~/.local/bin as `omarchy-command-center`.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="$HOME/.local/bin"
TARGET="$BIN/omarchy-command-center"
VERSION="${1:-v3}"

usage() {
    echo "usage: $0 [v1|v2|v3]" >&2
    echo "  v3  (default)  install omarchy-command-center-v3 as omarchy-command-center" >&2
    echo "  v2             install omarchy-command-center-v2" >&2
    echo "  v1             install the original omarchy-command-center" >&2
}

available_versions() {
    local names=()
    [[ -f "$REPO_DIR/omarchy-command-center" ]] && names+=(v1)
    [[ -f "$REPO_DIR/omarchy-command-center-v2" ]] && names+=(v2)
    [[ -f "$REPO_DIR/omarchy-command-center-v3" ]] && names+=(v3)
    if ((${#names[@]})); then
        printf '%s' "${names[*]}"
    else
        printf '%s' "(none)"
    fi
}

case "$VERSION" in
    -h|--help|help)
        usage
        exit 0
        ;;
    v1|1|original)
        SOURCE="$REPO_DIR/omarchy-command-center"
        ;;
    v2|2)
        SOURCE="$REPO_DIR/omarchy-command-center-v2"
        ;;
    v3|3)
        SOURCE="$REPO_DIR/omarchy-command-center-v3"
        ;;
    *)
        echo "✗ Unknown version '$VERSION'. Available: $(available_versions)" >&2
        usage
        exit 1
        ;;
esac

if [[ ! -f "$SOURCE" ]]; then
    echo "✗ Version '$VERSION' not found at $SOURCE" >&2
    echo "  Available: $(available_versions)" >&2
    usage
    exit 1
fi

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
install -m 0755 "$SOURCE" "$TARGET"

echo "✓ installed $SOURCE"
echo "  as $TARGET (version: $VERSION)"
echo "  run: omarchy-command-center"
