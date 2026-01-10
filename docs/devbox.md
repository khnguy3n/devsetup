>Go back to [README](../README.md)
# 🚀 What is Jetify
Jetify is a tool I used to setup my machine with any application I need.
I use it as an alternative to Homebrew. In addition, it can be used
on a project's scope instead of global like what I'm doing here.

# Goals
- One folder (e.g. ~/.config/devbox/global/) that contains devbox.json
- A shell hook so those binaries are always on your PATH

# Setup Guide
1. Run the command to install devbox
```
curl -fsSL https://get.jetify.com/devbox | bash
```
2. Once installed it maybe necessary to restart your terminal
3. Run the following command to verify devbox's installation ```devbox version```
4. Then create the devbox global config folder with the commands below and initialize
```zsh
mkdir -p ~/.config/devbox/global
cd ~/.config/devbox/global
devbox init
```
5. Then in the global devbox folder run the following commands to add application
```zsh
devbox add neovim bat ripgrep
```

# Other useful commands
<em>All of the following needs to be in the "global" folder</em>
``` zsh
devbox rm [target] # delete an app
devbox list # list apps already installed
```

# Gotchas
- Although this doc says "global" it's not quite "global"
When running following command you'll see it's not actually global
```zsh
devbox global list

#will see warning
```
- Neovim plugins may sometimes needs to point to devbox locations for stuff like:

| Gotcha | Resolution |
|:-------|:-----------|
| When trying to use lsp | Instead of having devbox install lsp. I've leverage mason as a plugin to install languages servers I may need.|
|When trying to use fugit2 neovim plugin  | Ensure libgit2 was installed and update plugin to point to libgit2 location from devbox. See example below [fugit nvim devbox resolution](#Fugit2-and-Libgit2)|



## Fugit2 and Libgit2
``` lua
{
  "SuperBo/fugit2.nvim",
  opts = function()
    local devbox_dir = vim.env.DEVBOX_PACKAGES_DIR

    -- Find something like:
    --   $DEVBOX_PACKAGES_DIR/lib/libgit2.dylib
    -- or versioned variants like libgit2.1.7.dylib
    local lib = nil
    if devbox_dir then
      local matches = vim.fn.glob(devbox_dir .. "/lib/libgit2*.dylib", false, true)
      lib = matches and matches[1] or nil
    end

    return {
      width = 100,
      libgit2_path = lib or "libgit2",
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    {
      "chrisgrieser/nvim-tinygit",
      dependencies = { "stevearc/dressing.nvim" },
    },
  },
  cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
  keys = {
    { "<leader>gg", mode = "n", "<cmd>Fugit2<cr>" },
  },
}
```

## Additional Resources
[Installation Documentation](https://www.jetify.com/docs/devbox/installing-devbox)
[Global Documentation](https://www.jetify.com/docs/devbox/devbox_global/)
[Horse's Mouth](https://www.jetify.com/docs/devbox)
