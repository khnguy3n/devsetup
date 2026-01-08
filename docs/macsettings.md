# Mac System Preferences 

## Disable Animations 
Use the code block below to disable animations for better performance.
'''zsh
#!/usr/bin/env bash
set -euo pipefail

echo "Reverting animation/visual defaults..."

defaults delete NSGlobalDomain NSWindowResizeTime 2>/dev/null || true
defaults write com.apple.universalaccess reduceMotion -bool false
defaults write com.apple.universalaccess increaseContrast -bool false
defaults delete NSGlobalDomain NSAutomaticWindowAnimationsEnabled 2>/dev/null || true

defaults delete com.apple.dock expose-animation-duration 2>/dev/null || true
defaults delete com.apple.dock autohide-delay 2>/dev/null || true
defaults delete com.apple.dock autohide-time-modifier 2>/dev/null || true
defaults delete com.apple.dock mineffect 2>/dev/null || true
defaults delete com.apple.dock launchanim 2>/dev/null || true
defaults delete com.apple.dock workspaces-edge-delay 2>/dev/null || true

defaults delete com.apple.finder DisableAllAnimations 2>/dev/null || true

defaults delete -g QLPanelAnimationDuration 2>/dev/null || true
defaults delete NSGlobalDomain NSToolbarTitleViewRolloverDelay 2>/dev/null || true

defaults write com.apple.universalaccess reduceTransparency -bool false

killall Dock >/dev/null 2>&1 || true
killall Finder >/dev/null 2>&1 || true

echo "Done. Log out/in or reboot if anything seems stuck."
'''