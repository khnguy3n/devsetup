# Khanh DevSetup

## Disable All Animations

```zsh
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true
```
## Ghostty

Install Ghostty [here](https://ghostty.org).

## DevBox

Install Devbox
```
curl -fsSL https://get.jetify.com/devbox | bash
```
[Documentation](https://www.jetify.com/docs/devbox/devbox_global/) to leverage Devbox as primary package manager.

### Install dependencies
Once Devbox is installed use it to install dependencies like bat, eza, Neovim, ripgrep, ect.
```shell
#Use the following command to list out global installed dependencies
devbox global list

#Install example
devbox global add bat eza ripgrep

#Removal example
devbox global rm bat
```

## Neovim Setup
1. Clone this repo
2. Move the nvim folder to .config/nvim
3. Open nvim and Lazy should install plugins
4. To check run ```:Lazy```

## Other Useful Software
1. [Raycast](https://www.raycast.com)
2. [HiddenBar](https://github.com/dwarvesf/hidden)
3. [Rectangle](https://rectangleapp.com)
