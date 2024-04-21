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
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup({})
    end,
    lazy = false,
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
      require('mini.statusline').setup({})
    end,
  },
  {
    "nanotech/jellybeans.vim",
    name = "jellybeans",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme = "jellybeans"
    end,
  },
  {
    "echasnovski/mini.base16",
    config = function()
      require("mini.base16").setup({
        palette = {
          base00= "#0E1112",
          base01= "#1B2225",
          base02= "#2E3233",
          base03= "#6C7172",
          base04= "#87918A",
          base05= "#C0C5CE",
          base06= "#E3E8E6",
          base07= "#EAEFF2",
          base08= "#B45EA4",
          base09= "#FF9655",
          base0A= "#FFC377",
          base0B= "#99CF50",
          base0C= "#66C2C3",
          base0D= "#6699CC",
          base0E= "#C594C5",
          base0F= "#AB7967",
        },
      })
    end,
  },
}

