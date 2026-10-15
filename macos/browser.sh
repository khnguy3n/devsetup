
#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Safari...🌎"

# Safari must be closed before changing preferences
if pgrep -x Safari >/dev/null; then
  echo "Please quit Safari before running this script."
  exit 1
fi

# Helper: Safari settings may require Full Disk Access
safari_default() {
  if ! defaults write com.apple.Safari "$@" 2>/dev/null; then
    echo "WARNING: Could not set Safari preference: $1"
  fi
}

# ----------------------------------------
# Developer tools
# ----------------------------------------

# Enable Develop menu
safari_default IncludeDevelopMenu -bool true

# Enable Web Inspector
safari_default WebKitDeveloperExtrasEnabledPreferenceKey -bool true

safari_default \
  "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" \
  -bool true

# ----------------------------------------
# General
# ----------------------------------------

# Show full website addresses (may be ignored on newer Safari)
safari_default ShowFullURLInSmartSearchField -bool true

# Disable automatic opening of downloaded "safe" files
safari_default AutoOpenSafeDownloads -bool false

# ----------------------------------------
# Tabs
# ----------------------------------------

# Enable Command+1 through Command+9 to switch tabs
safari_default Command1Through9SwitchesTabs -bool true

# ----------------------------------------
# Privacy
# ----------------------------------------

# Disable website tracking for search suggestions
# Some Safari privacy settings are not exposed via defaults.

# ----------------------------------------
# Debugging
# ----------------------------------------

# Enable developer extras for WebKit views
defaults write NSGlobalDomain \
  WebKitDeveloperExtras -bool true

echo "Safari configuration complete."
echo "Restart Safari to apply changes."
echo "Some settings may need to be enabled manually."

echo "Configuring Safari...🌎 Completed"
