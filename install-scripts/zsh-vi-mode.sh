#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/jeffreytse/zsh-vi-mode.git"
INSTALL_DIR="$HOME/.config/zsh-vi-mode"
ZSHRC="$HOME/.zshrc"
SOURCE_LINE='source $HOME/.config/zsh-vi-mode/zsh-vi-mode.plugin.zsh'

# Clone the repository if it doesn't already exist
if [ ! -d "$INSTALL_DIR" ]; then
  git clone "$REPO_URL" "$INSTALL_DIR"
else
  echo "Repository already exists at $INSTALL_DIR, skipping clone."
fi

# Append source line to ~/.zshrc if missing
if ! grep -Fxq "$SOURCE_LINE" "$ZSHRC"; then
  echo "" >> "$ZSHRC"
  echo "# Enable zsh-vi-mode" >> "$ZSHRC"
  echo "$SOURCE_LINE" >> "$ZSHRC"
  echo "Added zsh-vi-mode to ~/.zshrc"
else
  echo "zsh-vi-mode already sourced in ~/.zshrc"
fi

echo "Done. Restart your shell or run: source ~/.zshrc"

