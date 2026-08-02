-- ============================================================================
-- Plugins
-- ============================================================================
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  "https://github.com/folke/snacks.nvim",
--  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
})

-- ============================================================================
-- Commands
-- ============================================================================

vim.api.nvim_create_user_command("PackUpdate", function(opts)
  if opts.args:match("%S") then
    local plugins = vim.split(opts.args, "%s+", {
      trimempty = true,
    })

    vim.pack.update(plugins)
  else
    vim.pack.update()
  end
end, {
  nargs = "*",
  desc = "Update all plugins or specific plugins",
})

vim.api.nvim_create_user_command("PackList", function()
  vim.pack.update(nil, {
    offline = true,
  })
end, {
  desc = "List installed plugins",
})

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del({ opts.args })
end, {
  nargs = 1,
  desc = "Delete a plugin",
})

-- ============================================================================
-- Treesitter
-- ============================================================================
vim.api.nvim_create_user_command("TSInstallAll", function()
  vim.treesitter.install({
    "lua",
    "vim",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "yaml",
    "bash",
  })
end, {})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    local language = vim.treesitter.language.get_lang(filetype)

    if not language then
      return
    end

    if not pcall(vim.treesitter.language.add, language) then
      return
    end

    pcall(vim.treesitter.start, args.buf, language)
  end,
})

-- ============================================================================
-- OTHER PLUGINS CONFIGURATIONS
-- ============================================================================
require("snackconfig")
require("mini")
