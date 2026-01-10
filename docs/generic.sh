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
