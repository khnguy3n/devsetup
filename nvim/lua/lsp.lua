-- ============================================================================
-- LSP
-- ============================================================================
--vim.lsp.enable({ "lua_ls", "ts_ls" })
vim.lsp.enable({ "lua_ls", "tsgo" })
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, {
				autotrigger = true,
			})
		end

		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "ss", vim.lsp.buf.document_symbol, opts)

		vim.keymap.set("n", "<leader>sS", function()
			vim.ui.input({ prompt = "Symbol: " }, function(query)
				if query then
					vim.lsp.buf.workspace_symbol(query)
				end
			end)
		end, opts)
	end,
})

vim.cmd("set completeopt+=noselect")
