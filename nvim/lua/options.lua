-- ============================================================================
-- OPTIONS
-- ============================================================================
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.showmatch = true
opt.cmdheight = 1
opt.completeopt = "menuone,noinsert,noselect,popup"
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.conceallevel = 0
opt.concealcursor = ""
opt.lazyredraw = true
opt.synmaxcol = 300
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = false
--vim.opt.undodir = undodir -- set the undo directory
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 50
opt.autoread = true
opt.autowrite = false

opt.backspace = "indent,eol,start"
opt.autochdir = false -- do not autochange directories
opt.iskeyword:append("-") -- include - in words
opt.path:append("**") -- include subdirs in search
opt.selection = "inclusive"
opt.clipboard:append("unnamedplus") -- use system clipboard
opt.modifiable = true -- allow buffer modifications
opt.encoding = "utf-8" -- set encoding
opt.splitbelow = true -- horizontal splits go below
opt.splitright = true -- vertical splits go right

opt.wildmenu = true -- tab completion
opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
opt.diffopt:append("linematch:60") -- improve diff display
opt.redrawtime = 10000 -- increase neovim redraw tolerance
opt.maxmempattern = 20000 -- increase max memory

vim.o.autocomplete = true
