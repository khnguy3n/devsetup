return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim", opts = {} },
    },
config = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls" },
    automatic_enable = true,
  })

  -- Lua
  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  })

  -- TypeScript (newer name in lspconfig is often "ts_ls")
  vim.lsp.config("ts_ls", {
    -- add settings here if you want
  })
end

  },
}

