vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end

    --vim.keymap.set('n', 'gd', function()
    --  vim.lsp.buf.definition()
    --end)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Core LSP actions (built-in)
    map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("n", "<leader>f", function() vim.lsp.buf.format({ async = false }) end, "Format")

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
