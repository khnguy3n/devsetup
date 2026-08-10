# Khanh DevSetup

## Table of Contents

- [Install Rosetta](#install-rosetta)
- [Setting Mac Settings](#setting-mac-settings)
- [Homebrew Setup](#homebrew-setup)
- [Neovim Setup](#neovim-setup)

## Install rosetta

```zsh
softwareupdate --install-rosetta --agree-to-license
```

## Setting Mac Settings

Run the "macsettings.sh" script in scripts-to-install folder

## Homebrew Setup

Run the "install_homebrew.sh" script in the homebrew file and it will leverage the Brewfile
to install all the necessary softwares.

### Commands

1. To make snapshot

```
brew bundle dump --force
```

2. To install snapshot

```
brew bundle check --file={path/to/Brewfile}
```

## Neovim Setup

> Need to have nodejs installed for the typescript-language server and biome.
> In addition leverage brew to install the following: biome, lua-language-server, marksman, stylua, typescript-language-server

1. Clone this repo
2. Move the nvim folder to .config/nvim

# Create SSH key for github/gitlab

```
mkdir ~/.ssh
cd ~/.ssh
touch config
vi config

#Personal github
Host github github.com
    HostName github.com
    IdentityFile ~/.ssh/personal

ssh-keygen -t ecdsa -C "example@gmail.com"

#Type 'personal' for first question

#Copy personal.pub file content
pbcopy < ~/.ssh/personal.pub

#Add ssh key on website

ssh-add ~/.ssh/personal
ssh -T git@github.com
```

# Set Neovim as git editor

git config --global core.editor "nvim"
export GIT_EDITOR=nvim

## Other Useful Software

1. [Raycast](https://www.raycast.com)
2. [HiddenBar](https://github.com/dwarvesf/hidden)
3. [Rectangle](https://rectangleapp.com)
4. [Posting](https://github.com/darrenburns/posting)
5. [Harlequin](https://harlequin.sh)

## Additional Resources

1. [MacOS Terminal Themes](https://github.com/lysyi3m/macos-terminal-themes/tree/master)
2. [Terminal Themes](https://terminalcolors.com)
3. [Vim themes](https://vimcolorschemes.com/i/trending)
4. [Minimal Neovim Ref](https://github.com/smnatale/nvim_native)
