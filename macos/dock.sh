#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Dock...⚓"

# Dock icon size
defaults write com.apple.dock tilesize -int 32

# Disable magnification
defaults write com.apple.dock magnification -bool false

# Automatically hide Dock
defaults write com.apple.dock autohide -bool false

# Remove Dock show delay
defaults write com.apple.dock autohide-delay -float 0

# Faster Dock animation
defaults write com.apple.dock autohide-time-modifier -float 0.1

# Disable launch animation
defaults write com.apple.dock launchanim -bool false

# Minimize windows using scale effect
defaults write com.apple.dock mineffect -string scale

# Disable ruberband animation
defaults write -g NSScrollViewRubberbanding -int 0

echo "Configuring Dock...⚓ Completed!"
