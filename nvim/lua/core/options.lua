vim.wo.number = true
vim.o.relativenumber = true

vim.o.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.scrolloff = 999
vim.o.sidescrolloff = 8
vim.o.cursorline = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hlsearch = false
vim.o.showmode = false
vim.opt.termguicolors = false
vim.o.whichwrap = "bs<>[]hl"
vim.o.numberwidth = 4
vim.o.swapfile = false
vim.o.showtabline = 2
vim.o.backspace = "indent,eol,start"
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.wo.signcolumn = "yes"
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 0
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = false
vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
