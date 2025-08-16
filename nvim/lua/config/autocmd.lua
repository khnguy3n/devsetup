local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Prevent comment
autocmd("bufEnter", {
  group = vim.api.nvim_create_augroup("FormatOptions", {}),
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "r", "o" }
  end,
})

-- Remove trailing whitespaces
autocmd('BufWritePre', {
  pattern = '',
  command = '%s/\\s\\+$//e'
})

-- Highlight text on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '700' })
  end
})

-- Automatically rebalance windows on vim resize
autocmd('VimResized', {
  pattern = '',
  command = 'wincmd ='
})

-- Close man and help with just <q>
autocmd('FileType', {
  pattern = {
    'help',
    'man',
    'lspinfo',
    'checkhealth'
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file where some intermediate directory does not exist
autocmd('BufWritePre', {
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end
})

-- Check for spelling in text filetypes
autocmd('FileType', {
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.spell = true
  end
})
