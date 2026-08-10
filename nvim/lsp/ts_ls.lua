---@type vim.lsp.Config
return {
	cmd = {
		"typescript-language-server",
		"--stdio",
	},

	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},

	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
	},

	init_options = {
		preferences = {
			includeInlayParameterNameHints = "literals",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
}
