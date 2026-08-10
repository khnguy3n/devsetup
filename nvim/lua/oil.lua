local M = {}

local function picker(items, prompt, callback)
	local query = ""

	local function filter()
		local filtered = {}

		for _, item in ipairs(items) do
			if query == "" or item:lower():find(query:lower(), 1, true) then
				table.insert(filtered, item)
			end
		end

		return filtered
	end

	local buf = vim.api.nvim_create_buf(false, true)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = math.floor(vim.o.columns * 0.7),
		height = math.floor(vim.o.lines * 0.5),
		row = math.floor(vim.o.lines * 0.25),
		col = math.floor(vim.o.columns * 0.15),
		border = "rounded",
		title = prompt,
		title_pos = "center",
	})

	local function render()
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, filter())
	end

	local function close()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end

	render()

	vim.keymap.set("n", "<Esc>", close, {
		buffer = buf,
	})
	vim.keymap.set("n", "q", close, {
		buffer = buf,
	})

	vim.keymap.set("n", "<CR>", function()
		local line = vim.api.nvim_get_current_line()

		close()
		callback(line)
	end, {
		buffer = buf,
	})

	vim.keymap.set("n", "/", function()
		vim.ui.input({
			prompt = "Search: ",
			default = query,
		}, function(input)
			query = input or ""
			render()
		end)
	end, {
		buffer = buf,
	})
end

function M.oldfiles()
	picker(vim.v.oldfiles, "Recent files", function(file)
		vim.cmd("edit " .. vim.fn.fnameescape(file))
	end)
end

function M.files()
	--local files = vim.fn.systemlist("find . -type f")
  local files = vim.fn.systemlist({ "fd", "--type", "f" })

	picker(files, "Files", function(file)
		vim.cmd("edit " .. vim.fn.fnameescape(file))
	end)
end

function M.buffers()
	local items = {}
	local lookup = {}

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			local name = vim.api.nvim_buf_get_name(buf)

			if name ~= "" then
				local display = vim.fn.fnamemodify(name, ":~:.")

				table.insert(items, display)
				lookup[display] = buf
			end
		end
	end

	picker(items, "Buffers", function(item)
		local buf = lookup[item]

		if buf and vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_set_current_buf(buf)
		end
	end)
end

function M.grep()
	local text = vim.fn.input("Search: ")

	if text == "" then
		return
	end

	local results = vim.fn.systemlist({
		"rg",
		"--vimgrep",
		"--smart-case",
		"--",
		text,
		".",
	})

	if #results == 0 then
		vim.notify("No matches found", vim.log.levels.INFO)
		return
	end

	vim.fn.setqflist({}, " ", {
		title = "rg: " .. text,
		lines = results,
		efm = "%f:%l:%c:%m",
	})

	vim.cmd("copen")

	vim.keymap.set("n", "<CR>", function()
		vim.cmd("cc")
		vim.cmd("cclose")
	end, {
		buffer = 0,
	})
end

vim.keymap.set("n", "fr", M.oldfiles, {
	desc = "Recent files",
})

vim.keymap.set("n", "ff", M.files, {
	desc = "Find files",
})

vim.keymap.set("n", "fb", M.buffers, {
	desc = "Find buffers",
})

vim.keymap.set("n", "fg", M.grep, {
	desc = "Grep files",
})

return M
