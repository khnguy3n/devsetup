local opt = vim.opt
local g = vim.g

-- Make terminal support truecolor
opt.termguicolors = false

-- Cursor highlighting
opt.cursorline = false
opt.cursorcolumn = false

-- Pane splitting
opt.splitright = true
opt.splitbelow = true

-- Searching
opt.smartcase = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true

-- Auto indent
opt.autoindent = true

-- Make neovim use the system clipboard
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

-- Disable old vim status
opt.showmode = false

-- Set relative line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Tab config
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Code folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "1"

-- Decrease update time
opt.timeout = true
opt.timeoutlen = 500
opt.updatetime = 300

-- Disable swapfile
opt.swapfile = false

-- Enable persistent undo
opt.undofile = false

-- cmp config
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Always show tabline
opt.showtabline = 2

-- Disable mouse support
opt.mouse = {}

-- Scrolloff
opt.scrolloff = 999
opt.sidescrolloff = 8

-- Disable wrapping
opt.wrap = true

-- Enable list
opt.list = true

-- Fill chars
opt.fillchars = [[vert:|,horiz:-,eob: ]]

-- Enable lazy redraw for performance
opt.lazyredraw = true

-- Have the statusline only display at the bottom
opt.laststatus = 2

-- Confirm to save changed before exiting the modified buffer
opt.confirm = true

-- My Own options
opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true
opt.hlsearch = false
opt.ruler = false
opt.wildmenu = true
opt.title = true
opt.autoread = true
opt.cmdheight = 0
opt.backspace = "indent,eol,start"
opt.wildignorecase = true
opt.wildmode = "full"
opt.shell = "/usr/bin/zsh"

-- Disable certain builtins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logipat = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_fzf = 1

-- Disable provider warnings in the healthcheck
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
