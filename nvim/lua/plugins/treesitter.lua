return {
  {
    'nvim-treesitter/nvim-treesitter',
    "nvim-treesitter/nvim-treesitter-context",
    build = ':TSUpdate',
    event = {
      'BufReadPost',
      'BufNewFile'
    },
    opts = {
      ensure_installed = {'lua'},
      auto_install = true,
      matchup = {
        enabled = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      require("treesitter-context").setup()
    end,
  },
}
