#!/usr/bin/env bash
set -euo pipefail

echo "Setting General Stuff"

# Show hidden MacOS folders
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder

# Save to disk (not to iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Avoid creating .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Show access path
defaults write com.apple.finder ShowPathbar -bool true

# Display all file extensions
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show home folder as default in new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Search in current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## DOCK

# Minimum size
defaults write com.apple.dock tilesize -int 32

# Active magnification
defaults write com.apple.dock magnification -bool true

# Maximum size for magnification
defaults write com.apple.dock largesize -float 128

# Accelerated opening
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Disable natural scrolling (content follows scrollbar, not fingers)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Check availability of updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Check for updates automatically
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Safari: enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo "Disabling / reducing macOS animations & visual effects..."

defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.1
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock workspaces-edge-delay -float 0.1
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write -g QLPanelAnimationDuration -float 0
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true

echo "Restarting affected services (Dock, Finder)..."
killall Dock >/dev/null 2>&1 || true
killall Finder >/dev/null 2>&1 || true

echo "Done."
echo "For full effect, consider logging out and back in (or rebooting)."

