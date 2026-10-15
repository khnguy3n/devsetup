#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Finder...🔍"

# Show hidden MacOS folders
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder

# Save to disk (not to iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# Open new Finder windows in home folder
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Avoid creating .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show home folder as default in new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Search in current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable quit in finder
defaults write com.apple.finder QuitMenuItem -bool true; killall Finder

echo "Configuring Finder...🔍 Completed"
