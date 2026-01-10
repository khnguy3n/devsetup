--bread crumb
return {
	"SmiteshP/nvim-navic",
	event = "LspAttach",
	config = function()
		local navic = require("nvim-navic")
		navic.setup({
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			highlight = true,
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
		})
	end,
	opts = {
		icons = {
			File = " ",
			Module = " ",
			Namespace = " ",
			Package = " ",
			Class = " ",
			Method = " ",
			Property = " ",
			Field = " ",
			Constructor = " ",
			Enum = " ",
			Interface = " ",
			Function = " ",
			Variable = " ",
			Constant = " ",
			String = " ",
			Number = " ",
			Boolean = " ",
			Array = " ",
			Object = " ",
			Key = " ",
			Null = " ",
			EnumMember = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		},
	},
}
