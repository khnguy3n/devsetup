-- ============================================================================
-- Plugins
-- ============================================================================
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  { src = "https://github.com/folke/snacks.nvim" },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
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

vim.api.nvim_create_user_command("PackList", function()
  vim.pack.update(nil, { offline = true })
end, {})

vim.api.nvim_create_user_command('PackDel', function(opts)
  vim.pack.del({ opts.args })
end, { nargs = 1 })

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

vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", Snacks.picker.lsp_declarations, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", Snacks.picker.lsp_references, { desc = "References", nowait = true })
vim.keymap.set("n", "gI", Snacks.picker.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", Snacks.picker.lsp_type_definitions, { desc = "Goto Type Definition" })
vim.keymap.set("n", "gai", Snacks.picker.lsp_incoming_calls, { desc = "Calls Incoming" })
vim.keymap.set("n", "gao", Snacks.picker.lsp_outgoing_calls, { desc = "Calls Outgoing" })
vim.keymap.set("n", "<leader>ss", Snacks.picker.lsp_symbols, { desc = "LSP Symbols" })

-- ============================================================================
-- Mini
-- ============================================================================
require("mini")

