#!/usr/bin/env bash
set -euo pipefail

OUTPUT="macos-settings.sh"

cat > "$OUTPUT" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
EOF

export_setting() {
  local domain="$1"
  local key="$2"
  local type="$3"
  local value

  if value=$(defaults read "$domain" "$key" 2>/dev/null); then
    printf 'defaults write %q %q -%s %q\n' \
      "$domain" "$key" "$type" "$value" >> "$OUTPUT"
  fi
}

# Dock
export_setting com.apple.dock tilesize int
export_setting com.apple.dock magnification bool
export_setting com.apple.dock largesize float
export_setting com.apple.dock autohide bool
export_setting com.apple.dock launchanim bool

# Finder
export_setting com.apple.finder AppleShowAllFiles bool
export_setting com.apple.finder ShowPathbar bool
export_setting com.apple.finder _FXSortFoldersFirst bool

# Global
export_setting NSGlobalDomain AppleShowScrollBars string
export_setting NSGlobalDomain com.apple.swipescrolldirection bool

cat >> "$OUTPUT" <<'EOF'

killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
EOF

chmod +x "$OUTPUT"

echo "Generated $OUTPUT"
