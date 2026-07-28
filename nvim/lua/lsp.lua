local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

--vim.lsp.config("lua_ls", {
--    settings = {
--        Lua = {
--            diagnostics = { globals = { "vim" } },
--        },
--    },
--})

local configs = {
    lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = {
        { ".luarc.json", ".luarc.jsonc" },
        { ".stylua.toml", "stylua.toml" },
        { ".git" },
      },
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          codeLens = { enable = true },
          hint = { enable = true, semicolon = "Disable" },
        },
      },
    },

    marksman = {
      cmd = { "marksman", "server" },
      filetypes = { "markdown", "markdown.mdx" },
      root_markers = { ".marksman.toml", ".git" },
    },

    ts_ls = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      root_markers = {
        {
          "package-lock.json",
          "yarn.lock",
          "pnpm-lock.yaml",
          "bun.lock",
          "bun.lockb",
        },
        { ".git" },
      },
    },

    biome = {
      cmd = { "biome", "lsp-proxy" },
      filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescriptreact",
        "vue",
      },
      workspace_required = true,
      root_markers = { "biome.json", "biome.jsonc" },
    },
  }

  for name, config in pairs(configs) do
    vim.lsp.config(name, config)
  end

vim.lsp.enable({
    "lua_ls",
    "marksman",
    "ts_ls",
    "biome",
})

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

-- ponytail: monkey-patch for rounded borders; cleaner if upstream adds a global option
local orig_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  return orig_preview(contents, syntax, vim.tbl_extend("keep", opts or {}, { border = "rounded" }), ...)
end
