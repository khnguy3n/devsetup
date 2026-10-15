#!/usr/bin/env bash
set -euo pipefail
defaults write com.apple.dock tilesize -int 74
defaults write com.apple.dock magnification -bool 0
defaults write com.apple.dock largesize -float 16
defaults write com.apple.dock launchanim -bool 0
defaults write com.apple.finder AppleShowAllFiles -bool 1
defaults write com.apple.finder ShowPathbar -bool 1
defaults write com.apple.finder _FXSortFoldersFirst -bool 1
defaults write NSGlobalDomain AppleShowScrollBars -string Always
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool 0

killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
