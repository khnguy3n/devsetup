return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      -- Formatters by filetype
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
      },

      -- Optional: enable format-on-save
      -- Comment this out if you ONLY want manual formatting via <leader>f
      format_on_save = function(bufnr)
        -- avoid formatting special buffers
        if vim.bo[bufnr].buftype ~= "" then return end
        return { timeout_ms = 2000, lsp_fallback = true }
      end,
    },
  },
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

      -- One keymap for formatting (we'll route it to Biome via conform.nvim)
      -- If conform isn't installed for some reason, it falls back to LSP format.
      local format = function(bufnr)
        local ok, conform = pcall(require, "conform")
        if ok then
          conform.format({ bufnr = bufnr, async = true, lsp_fallback = true })
        else
          vim.lsp.buf.format({ async = true })
        end
      end

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "<leader>f", function() format(bufnr) end, opts)
        vim.keymap.set("v", "<leader>f", function() format(bufnr) end, opts)
      end

      -- Lua (allow LSP formatting for now)
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      -- TypeScript (Biome will format, so disable ts_ls formatting)
      vim.lsp.config("ts_ls", {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          on_attach(client, bufnr)
        end,
      })
    end,
  },
}

