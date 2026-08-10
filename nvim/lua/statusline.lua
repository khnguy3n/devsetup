-- ============================================================================
-- STATUSLINE
-- ============================================================================
--
-- Active window:
--   NORMAL  main  src/components/Button.ts       1  2  typescript 42:17
--
-- Inactive window:
--   src/components/Button.ts                         typescript 42:17
--
-- Features:
--   - Current mode
--   - Git branch
--   - Git-root-relative file path
--   - LSP diagnostic counts
--   - Filetype
--   - Line/column
--   - Simpler inactive-window statusline
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Highlight groups
-- ----------------------------------------------------------------------------

local pms = vim.api.nvim_get_hl(0, {
	name = "PmenuSel",
	link = false,
})

local dir = vim.api.nvim_get_hl(0, {
	name = "Directory",
	link = false,
})

local vis = vim.api.nvim_get_hl(0, {
	name = "Visual",
	link = false,
})

-- Highlight for the current mode.
vim.api.nvim_set_hl(0, "StlMode", {
	fg = pms.fg,
	bg = vis.bg,
})

-- Highlight for the Git branch.
vim.api.nvim_set_hl(0, "StlGit", {
	fg = dir.fg,
	bg = pms.bg,
})

-- ----------------------------------------------------------------------------
-- Mode labels
-- ----------------------------------------------------------------------------

local modes = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	c = "COMMAND",
	t = "TERMINAL",
	R = "REPLACE",
	r = "REPLACE",
	s = "SELECT",
	S = "S-LINE",
	["\19"] = "S-BLOCK",
}

-- ----------------------------------------------------------------------------
-- Diagnostics
-- ----------------------------------------------------------------------------

local diagnostic_labels = {
	" ", -- Error
	" ", -- Warning
	" ", -- Info
	" ", -- Hint
}

local diagnostic_highlights = {
	"DiagnosticError",
	"DiagnosticWarn",
	"DiagnosticInfo",
	"DiagnosticHint",
}

local function diagnostics()
	local counts = vim.diagnostic.count(0) or {}
	local result = ""

	for i = 1, 4 do
		if counts[i] and counts[i] > 0 then
			result = result
				.. "%#"
				.. diagnostic_highlights[i]
				.. "#"
				.. diagnostic_labels[i]
				.. counts[i]
				.. "%* "
		end
	end

	return result
end

-- ----------------------------------------------------------------------------
-- Active statusline
-- ----------------------------------------------------------------------------

function _G._statusline_active()
	local mode = modes[vim.fn.mode()] or vim.fn.mode():upper()

	local branch = ""
	if vim.b.git_branch and vim.b.git_branch ~= "" then
		branch = "%#StlGit# " .. vim.b.git_branch .. " %*"
	end

	local path = vim.b.rel_path or "%f"
	local diag = diagnostics()

	return table.concat({
		"%#StlMode# ",
		mode,
		" %*",
		branch,
		" ",
		path,

		-- Push everything after this to the right.
		"%=",

		diag,
		vim.bo.filetype,
    "  %l/%L|%c",
	})
end

-- ----------------------------------------------------------------------------
-- Inactive statusline
-- ----------------------------------------------------------------------------
--
-- Keep inactive windows quieter so the active window is easier to identify.
-- No mode, Git branch, or diagnostics are shown here.

function _G._statusline_inactive()
	local path = vim.b.rel_path or "%f"

	return table.concat({
		" ",
		path,

		"%=",

		vim.bo.filetype,
    "  %l/%L|%c",
	})
end

-- ----------------------------------------------------------------------------
-- Git branch and relative path
-- ----------------------------------------------------------------------------
--
-- Store Git information buffer-locally so multiple repositories can be open
-- at the same time without sharing branch state.

local function update_git_info()
	local root = vim.fn.system(
		"git rev-parse --show-toplevel 2>/dev/null"
	):gsub("%s+$", "")

	if root ~= "" then
		vim.b.git_branch = vim.fn.system(
			"git branch --show-current 2>/dev/null"
		):gsub("%s+$", "")

		local full_path = vim.fn.expand("%:p")

		if full_path ~= "" then
			vim.b.rel_path = full_path:sub(#root + 2)
		else
			vim.b.rel_path = ""
		end
	else
		vim.b.git_branch = nil
		vim.b.rel_path = vim.fn.expand("%:p:~")
	end
end

-- Refresh Git/path information when entering a buffer.
vim.api.nvim_create_autocmd({
	"BufEnter",
	"FocusGained",
	"DirChanged",
}, {
	callback = function()
		update_git_info()
		vim.cmd("redrawstatus!")
	end,
})

-- ----------------------------------------------------------------------------
-- Active / inactive window handling
-- ----------------------------------------------------------------------------

vim.api.nvim_create_autocmd({
	"WinEnter",
	"BufEnter",
}, {
	callback = function()
		vim.opt_local.statusline = "%!v:lua._statusline_active()"
	end,
})

vim.api.nvim_create_autocmd({
	"WinLeave",
}, {
	callback = function()
		vim.opt_local.statusline = "%!v:lua._statusline_inactive()"
	end,
})

-- ----------------------------------------------------------------------------
-- Diagnostic refresh
-- ----------------------------------------------------------------------------
--
-- Redraw the statusline whenever LSP diagnostics change.

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.cmd("redrawstatus!")
	end,
})

-- ----------------------------------------------------------------------------
-- Initial statusline
-- ----------------------------------------------------------------------------

vim.o.statusline = "%!v:lua._statusline_active()"
