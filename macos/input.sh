#!/usr/bin/env bash
set -euo pipefail

echo "Configuring keyboard...⌨️"

# Faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 2

# Shorter delay before repeating
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold accent picker
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Configuring keyboard...⌨️ Completed"

echo "Configuring scrolling...🖱️"

# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string Always

echo "Configuring scrolling...🖱️ Completed"
