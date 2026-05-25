-- ============================================================================
-- Plugins
-- ============================================================================
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  { src = "https://github.com/folke/snacks.nvim" },
})

-- ============================================================================
-- Commands
-- ============================================================================
vim.api.nvim_create_user_command("PackUpdate", function(opts)
	-- checks if any argument is passed
	if opts.args:match("%S") then
		-- update specific plugins
		local plugins = vim.split(opts.args, "%s+", { trimempty = true })
		-- update only specified plugins
		vim.pack.update(plugins)
	else
		-- update all
		vim.pack.update()
	end
end, { nargs = "*", desc = "Update all plugins or specific ones" })

vim.api.nvim_create_user_command("LspInfo", function()
	vim.cmd("checkhealth vim.lsp")
end, {})

vim.api.nvim_create_user_command("LspClients", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	if vim.tbl_isempty(clients) then
		print("No LSP clients attached")
		return
	end

	for _, client in ipairs(clients) do
		print(client.name)
	end
end, {})

-- ============================================================================
-- LSP
-- ============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, {
				autotrigger = true,
			})
		end
	end,
})

-- EFM: formatting/linting
vim.lsp.config("efm", {
	cmd = { "efm-langserver" },

	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
		"lua",
	},

	root_markers = {
		"biome.json",
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".stylua.toml",
		".git",
	},

	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = false,
		documentSymbol = false,
		codeAction = false,
		completion = false,
	},

	settings = {
		languages = {
			javascript = {
				{
					formatCommand = "biome format --write --stdin-file-path ${INPUT}",
					formatStdin = true,
				},
			},
			javascriptreact = {
				{
					formatCommand = "biome format --write --stdin-file-path ${INPUT}",
					formatStdin = true,
				},
			},
			typescript = {
				{
					formatCommand = "biome format --write --stdin-file-path ${INPUT}",
					formatStdin = true,
				},
			},
			typescriptreact = {
				{
					formatCommand = "biome format --write --stdin-file-path ${INPUT}",
					formatStdin = true,
				},
			},
			lua = {
				{
					formatCommand = "stylua -",
					formatStdin = true,
				},
			},
		},
	},
})

-- TS/JS IntelliSense
vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	init_options = {
		hostInfo = "neovim",
	},
})

vim.lsp.enable({
	"efm",
	"ts_ls",
})

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({
		async = true,
		filter = function(client)
			return client.name == "efm"
		end,
	})
end, { desc = "Format with EFM" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)


-- ============================================================================
-- TreeSitter
-- ============================================================================
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local lang = vim.treesitter.language.get_lang(ft)

		if not lang then
			return
		end

		if not pcall(vim.treesitter.language.add, lang) then
			return
		end

		pcall(vim.treesitter.start, args.buf, lang)
	end,
})


-- ============================================================================
-- Snack
-- ============================================================================
require("snacks").setup({
	explorer = { enabled = true },
  picker = {
		enabled = true,
		sources = {
			explorer = {
				layout = {
					layout = {
						position = "right",
						width = 30,
					},
				},
			},
		},
	},
})
vim.keymap.set("n", "<leader>fe", function()
	Snacks.explorer()
end, { desc = "File explorer" })

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep files" })
