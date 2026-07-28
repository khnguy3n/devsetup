-- ============================================================================
-- Plugins
-- ============================================================================
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  "https://github.com/folke/snacks.nvim",
--  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
})

-- ============================================================================
-- Commands
-- ============================================================================

vim.api.nvim_create_user_command("PackUpdate", function(opts)
  if opts.args:match("%S") then
    local plugins = vim.split(opts.args, "%s+", {
      trimempty = true,
    })

    vim.pack.update(plugins)
  else
    vim.pack.update()
  end
end, {
  nargs = "*",
  desc = "Update all plugins or specific plugins",
})

vim.api.nvim_create_user_command("PackList", function()
  vim.pack.update(nil, {
    offline = true,
  })
end, {
  desc = "List installed plugins",
})

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del({ opts.args })
end, {
  nargs = 1,
  desc = "Delete a plugin",
})

-- ============================================================================
-- Treesitter
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    local language = vim.treesitter.language.get_lang(filetype)

    if not language then
      return
    end

    if not pcall(vim.treesitter.language.add, language) then
      return
    end

    pcall(vim.treesitter.start, args.buf, language)
  end,
})

-- ============================================================================
-- Snacks
-- ============================================================================

local Snacks = require("snacks")

Snacks.setup({
  explorer = {
    enabled = true,
  },

  picker = {
    enabled = true,

    sources = {
      explorer = {
        layout = {
          layout = {
            position = "right",
            width = 30,
          },
        },

        win = {
          -- Normal-mode mappings while focused on the file list.
          list = {
            keys = {
              ["t"] = "tab",
              ["<C-t>"] = "tab",

              ["s"] = "split",
              ["v"] = "vsplit",
            },
          },

          -- Insert and normal-mode mappings while focused on picker input.
          input = {
            keys = {
              ["<C-t>"] = {
                "tab",
                mode = { "i", "n" },
              },
            },
          },
        },
      },
    },
  },
})

-- ============================================================================
-- Snacks Explorer and Picker Keymaps
-- ============================================================================

vim.keymap.set("n", "<leader>fe", function()
  Snacks.explorer()
end, {
  desc = "File Explorer",
})

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, {
  desc = "Find Files",
})

vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.grep()
end, {
  desc = "Grep Files",
})

-- ============================================================================
-- Snacks LSP Keymaps
-- ============================================================================

local lsp_maps = {
  gd = { Snacks.picker.lsp_definitions, "Goto Definition" },
  gD = { Snacks.picker.lsp_declarations, "Goto Declaration" },
  gr = { Snacks.picker.lsp_references, "References" },
  gI = { Snacks.picker.lsp_implementations, "Goto Implementation" },
  gy = { Snacks.picker.lsp_type_definitions, "Goto Type Definition" },
  gai = { Snacks.picker.lsp_incoming_calls, "Incoming Calls" },
  gao = { Snacks.picker.lsp_outgoing_calls, "Outgoing Calls" },
  --["<leader>ss"] = { Snacks.picker.lsp_symbols, "Workspace Symbols" },
}

for lhs, map in pairs(lsp_maps) do
  vim.keymap.set("n", lhs, map[1], { desc = map[2] })
end

vim.keymap.set("n", "<leader>ss", function()
  Snacks.picker.lsp_symbols()
end, {
  desc = "LSP Symbols",
})

-- ============================================================================
-- Mini
-- ============================================================================
require("mini")
