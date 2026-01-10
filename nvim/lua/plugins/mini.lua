return {
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup({
				mappings = {
					comment = "gc",
				},
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup({})
		end,
		lazy = false,
	},
	{
		"echasnovski/mini.tabline",
		keys = {
			{ "<Tab>", "<cmd>:tabn<CR>", { "n" }, desc = "Tab Next" },
			{ "<S-Tab>", "<cmd>:tabp<CR>", { "n" }, desc = "Tab Prev" },
		},
		config = function()
			require("mini.tabline").setup({})
		end,
	},
	{
		"echasnovski/mini.jump2d",
		config = function()
			require("mini.jump2d").setup({
				mappings = {
					start_jumping = "S",
				},
			})
		end,
	},
	-- {
	-- 	"echasnovski/mini.extra",
	-- 	dependencies = { "echasnovski/mini.pick" },
	-- 	keys = {
	-- 		{
	-- 			"<leader>fd",
	-- 			function()
	-- 				require("mini.extra").pickers.diagnostic()
	-- 			end,
	-- 			desc = "Diagnostics",
	-- 		},
	-- 		{
	-- 			"<leader>fs",
	-- 			function()
	-- 				require("mini.extra").pickers.lsp({ scope = "document_symbol" })
	-- 			end,
	-- 			desc = "Document Symbols",
	-- 		},
	-- 		{
	-- 			"<leader>fS",
	-- 			function()
	-- 				require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
	-- 			end,
	-- 			desc = "Workspace Symbols",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("mini.extra").setup()
	-- 	end,
	-- },
	{
		"echasnovski/mini.statusline",
		config = function()
			require("mini.statusline").setup({})
		end,
	},
	-- 🔍 Picker (files, grep, buffers, etc.)
	-- {
	-- 	"echasnovski/mini.pick",
	-- 	keys = {
	-- 		{
	-- 			"<leader>ff",
	-- 			function()
	-- 				require("mini.pick").builtin.files()
	-- 			end,
	-- 			desc = "Find Files",
	-- 		},
	-- 		{
	-- 			"<leader>fg",
	-- 			function()
	-- 				require("mini.pick").builtin.grep_live()
	-- 			end,
	-- 			desc = "Live Grep",
	-- 		},
	-- 		{
	-- 			"<leader>fb",
	-- 			function()
	-- 				require("mini.pick").builtin.buffers()
	-- 			end,
	-- 			desc = "Buffers",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("mini.pick").setup({})
	-- 	end,
	-- },
	--	{
	--		"NeogitOrg/neogit",
	--		lazy = true,
	--		dependencies = {
	--			"nvim-lua/plenary.nvim", -- required
	--			"sindrets/diffview.nvim", -- optional - Diff integration
	--		},
	--		cmd = "Neogit",
	--		keys = {
	--			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	--		},
	--	},
}
