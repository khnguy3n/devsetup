#!/usr/bin/env bash
set -euo pipefail

echo "Reducing macOS animations..."

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

