return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  keys = {
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
	config = function()
    require("neo-tree").setup({
 			close_if_last_window = true,
 			enable_git_status = true,
 			enable_diagnostics = true,
 			window = {
 				position = "right",
 			},
 			default_component_configs = {
 				indent = {
 					indent_marker = "│",
 				},
 				modified = {
 					symbol = "[+]",
 					highlight = "NeoTreeModified",
 				},
 				git_status = {
 					symbols = {
 						-- Change type
 						added = "✚",
 						modified = "",
 						deleted = "✖",
 						renamed = "",
 						-- Status type
 						untracked = "",
 						ignored = "",
 						unstaged = "",
 						staged = "",
 						conflict = "",
 					},
 				},
 			},
 		})
	end,
}

