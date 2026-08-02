-- ============================================================================
-- Snacks
-- ============================================================================

local Snacks = require("snacks")

Snacks.setup({
  animate = { enabled = false },
  blame = { enabled = false },
  bufdelete = { enabled = false },
  dashboard = { enabled = false },
  debug = { enabled = false },
  dim = { enabled = false },
  image = { enabled = false },
  input = { enabled = false },
  lazygit = { enabled = false },
  layout = { enabled = false },
  notifier = { enabled = false },
  notify = { enabled = false },
  profiler = { enabled = false },
  quickfile = { enabled = false },
  rename = { enabled = false },
  explorer = {
    enabled = true,
  },

  picker = {
    enabled = true,
    icons = {
      files = {
        enabled = true,
      },
    },
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
  ["<leader>ss"] = { Snacks.picker.lsp_symbols, "Workspace Symbols" },
}

for lhs, map in pairs(lsp_maps) do
  vim.keymap.set("n", lhs, map[1], { desc = map[2] })
end

--vim.keymap.set("n", "<leader>ss", function()
--  Snacks.picker.lsp_symbols()
--end, {
--  desc = "LSP Symbols",
--})

