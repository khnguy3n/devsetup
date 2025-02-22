return {
  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup()
    end,
  },
  {
    "echasnovski/mini.jump2d",
    config = function()
      require("mini.jump2d").setup()
    end,
  },
  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup()
    end,
  },
  {
    "echasnovski/mini.tabline",
    config = function()
      require("mini.tabline").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup()
    end,
  },
  {
    "echasnovski/mini.cursorword",
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.completion",
    config = function()
      require("mini.completion").setup()
    end,
  },
  {
    "echasnovski/mini.base16",
    config = function()
      require("mini.base16").setup({
        palette = {
          base00 = "#232323", -- Background
          base01 = "#2C3034", -- Dark gray (used for status bars, etc.)
          base02 = "#3A3A3A", -- Slightly lighter dark gray
          base03 = "#838383", -- Comments, inactive text
          base04 = "#C6C7CD", -- Darker foreground (e.g. for statuslines)
          base05 = "#D9D9D9", -- Default foreground
          base06 = "#E0E0E0", -- Lighter foreground
          base07 = "#FFFFFF", -- Lightest foreground
          base08 = "#E56BEE", -- Red
          base09 = "#FACADD", -- Orange (using Duotone Dark's yellow)
          base0A = "#FACADD", -- Yellow
          base0B = "#95C682", -- Green
          base0C = "#84DCD6", -- Cyan
          base0D = "#84C8EE", -- Blue
          base0E = "#BC8BAE", -- Magenta
          base0F = "#FACADD", -- Extra (fallback using yellow)
        },
      })
    end,
  },
}
