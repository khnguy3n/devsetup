return {
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment = "gc",
        },
      })
    end,
  },
  {
    "echasnovski/mini.diff",
    config = function()
      require("mini.diff").setup({
        view = {
          style = "sign",
          signs = {
            add = "❇️",
            change = "🦋",
            delete = "⌫"
          }
        }
      })
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup({})
    end,
  },
  {
    "echasnovski/mini.tabline",
    keys = {
      { "<Tab>",   "<cmd>:tabn<CR>", { "n" }, desc = "Tab Next" },
      { "<S-Tab>", "<cmd>:tabp<CR>", { "n" }, desc = "Tab Prev" },
    },
    config = function()
      require("mini.tabline").setup({})
    end,
  },
  {
    "echasnovski/mini.jump2d",
    config = function()
      require("mini.jump2d").setup({
        mappings = {
          start_jumping = "S",
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require('mini.indentscope').setup({})
    end,
  },
  {
    "echasnovski/mini.statusline",
    config = function()
      require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })
    end,
  },
}

