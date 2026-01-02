return {
  {'nvim-mini/mini.icons', version = false},
  {
    "nanotech/jellybeans.vim",
    name = "jellybeans",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("jellybeans")
    end,
  },
}
