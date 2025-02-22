 return {
   "embark-theme/vim",
   lazy = false,
   priority = 1000,
   opts = {},
   config = function()
     vim.cmd [[colorscheme embark]]
   end
 }
