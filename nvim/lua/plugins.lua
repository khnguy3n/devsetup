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

-- ============================================================================
-- Mini - Completions
-- ============================================================================
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})
