vim.g.mapleader = " "

-- Tab expand
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Numberline
vim.cmd("set number relativenumber")

-- cursor
vim.cmd("set cursorcolumn cursorline")

-- Better Nav
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Move Text Up/Down in Visual Block Mode
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv")

-- Scrolling
vim.keymap.set('n', '<c-d>', '<C-d>zz')
vim.keymap.set('n', '<c-u>', '<C-u>zz')

-- Split
vim.keymap.set('n', 'sh', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

vim.cmd("set clipboard=unnamed")
vim.cmd("set encoding=utf-8")
vim.cmd("set mouse=")

