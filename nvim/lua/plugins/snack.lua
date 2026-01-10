return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			explorer = {
				enabled = true,
				replace_netrw = true,
			},
			indent = {
				enabled = true,
			},
			bigfile = {
				enabled = true,
			},
			picker = {
				enable = true,
				sources = {
					explorer = {
						layout = {
							layout = {
								position = "right",
							},
						},
					},
				},
			},
			terminal = {
				enabled = true,
			},
		},
		keys = {
			{
				"<leader>fe",
				function()
					require("snacks").explorer()
				end,
				desc = "Snacks Explorer",
			},
			{
				"<leader>tt",
				function()
					require("snacks").terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>,",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
		},
	},
}
