{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "<username>";
    homeDirectory = "/Users/<username>";
    packages = with pkgs; [
          bat
          eza
          fira-code-nerdfont
          ripgrep
          nodejs
          hurl
          bitwarden-cli
          gitu
    ];
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      c = "clear";
      ch = "history -p";
      gs = "git status";
      cat = "bat --paging=never";
      la = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale";
      ls = "eza --group-directories-first --git --icons";
      lt = "eza --icons --color=auto --tree --level=2";
      nixclean = "nix-env --delete-generations old";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "jeffreytse/zsh-vi-mode"; }
        { name = "agkozak/agkozak-zsh-prompt"; }
      ];
    };
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
