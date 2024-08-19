## Neovim Instructions
1. Copy the nvim folder to .config directory
1. Open nvim and run the following command
    ```
    :Lazy
    ```
1. Run the update for Lazy
## Disable All Animations
```
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

## Git log single line pretty
```
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

## Useful Softwares
These software are useful can be downloaded via apple app store
1. Harlequin
1. HiddenBar
1. Raycast

### Resources
https://gist.github.com/nat-418/d76586da7a5d113ab90578ed56069509
https://github.com/lysyi3m/macos-terminal-themes/blob/master/themes/Jellybeans.terminal
https://ma.ttias.be/pretty-git-log-in-one-line/
https://harlequin.sh/docs/getting-started
