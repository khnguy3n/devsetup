-- Prevent comment
vim.api.nvim_create_autocmd("bufEnter", {
	group = vim.api.nvim_create_augroup("FormatOptions", {}),
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "",
	command = "%s/\\s\\+$//e",
})

-- Highlight text on yank
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "700" })
	end,
})

-- Automatically rebalance windows on vim resize
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "",
	command = "wincmd =",
})

-- Close man and help with just <q>
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"man",
		"lspinfo",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Auto create dir when saving a file where some intermediate directory does not exist
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserConfig", { clear = true }),
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
