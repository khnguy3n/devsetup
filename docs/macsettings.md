>Go back to [README](../README.md)
# Mac System Preferences 🍎

These are the common setting I set for my Macs.

## Disable Animations
Use the code block below to disable animations for better performance.
```zsh
#!/usr/bin/env bash
set -euo pipefail

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
```
