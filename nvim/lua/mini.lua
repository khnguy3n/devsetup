-- ============================================================================
-- Mini Completion
-- ============================================================================
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})

-- ============================================================================
-- Mini - AI
-- ============================================================================

require("mini.ai").setup()

-- ============================================================================
-- Mini - Icons
-- ============================================================================

require("mini.icons").setup()

-- ============================================================================
-- Mini - Indent Scope
-- ============================================================================

require("mini.indentscope").setup({
  draw = {
    delay = 0,
    animation = require("mini.indentscope").gen_animation.none(),
  },

  symbol = "│",

  options = {
    try_as_border = true,
  },
})

-- ============================================================================
-- Mini - Git
-- ============================================================================

require("mini.git").setup()

-- ============================================================================
-- STATUSLINE (highlights in colorscheme.lua)
-- ============================================================================
require("mini.statusline").setup({
  use_icons = true,
  set_vim_settings = true,
})

-- ============================================================================
-- COLORSCHEME - Kanagawa-style using mini.colors
-- ============================================================================
local palette = {
  -- Backgrounds
  bg_dark = "#16161D",
  bg = "#1F1F28",
  bg_light = "#2A2A37",
  bg_menu = "#223249",
  bg_sel = "#2D4F67",

  -- Foregrounds
  fg = "#DCD7BA",
  fg_dark = "#C8C093",
  fg_dim = "#727169",

  -- Colors
  red = "#E82424",
  orange = "#FFA066",
  yellow = "#E6C384",
  green = "#98BB6C",
  aqua = "#7AA89F",
  blue = "#7E9CD8",
  cyan = "#9CABCA",
  violet = "#957FB8",
  pink = "#D27E99",

  -- Diagnostics/Diff
  error = "#FF5D62",
  warn = "#FF9E3B",
  info = "#7E9CD8",
  hint = "#7AA89F",
  add = "#76946A",
  change = "#DCA561",
  delete = "#E82424",
}

local groups = {
  -- Base
  Normal = { fg = palette.fg, bg = palette.bg },
  NormalFloat = { fg = palette.fg, bg = palette.bg_menu },
  FloatBorder = { fg = palette.fg_dim, bg = palette.bg_menu },
  Cursor = { fg = palette.bg, bg = palette.fg },
  CursorLine = { bg = palette.bg_light },
  CursorColumn = { bg = palette.bg_light },
  ColorColumn = { bg = palette.bg_light },
  LineNr = { fg = palette.fg_dim },
  CursorLineNr = { fg = palette.yellow, bold = true },
  SignColumn = { fg = palette.fg_dim, bg = palette.bg },
  VertSplit = { fg = palette.bg_light },
  WinSeparator = { fg = palette.bg_light },
  Folded = { fg = palette.fg_dim, bg = palette.bg_light },
  FoldColumn = { fg = palette.fg_dim },
  NonText = { fg = palette.bg_light },
  SpecialKey = { fg = palette.fg_dim },
  Visual = { bg = palette.bg_sel },
  VisualNOS = { bg = palette.bg_sel },
  Search = { fg = palette.bg, bg = palette.yellow },
  IncSearch = { fg = palette.bg, bg = palette.orange },
  MatchParen = { fg = palette.orange, bold = true },
  Pmenu = { fg = palette.fg, bg = palette.bg_menu },
  PmenuSel = { fg = palette.fg, bg = palette.bg_sel },
  PmenuSbar = { bg = palette.bg_light },
  PmenuThumb = { bg = palette.fg_dim },
  StatusLine = { fg = palette.fg, bg = palette.bg_light },
  StatusLineNC = { fg = palette.fg_dim, bg = palette.bg_dark },
  TabLine = { fg = palette.fg_dim, bg = palette.bg_dark },
  TabLineFill = { bg = palette.bg_dark },
  TabLineSel = { fg = palette.fg, bg = palette.bg },
  WildMenu = { fg = palette.bg, bg = palette.blue },
  Directory = { fg = palette.blue },
  Title = { fg = palette.blue, bold = true },
  ErrorMsg = { fg = palette.error },
  WarningMsg = { fg = palette.warn },
  MoreMsg = { fg = palette.aqua },
  ModeMsg = { fg = palette.fg_dark },
  Question = { fg = palette.aqua },
  SpellBad = { undercurl = true, sp = palette.error },
  SpellCap = { undercurl = true, sp = palette.warn },
  SpellLocal = { undercurl = true, sp = palette.info },
  SpellRare = { undercurl = true, sp = palette.hint },

  -- Syntax
  Comment = { fg = palette.fg_dim, italic = true },
  Constant = { fg = palette.orange },
  String = { fg = palette.green },
  Character = { fg = palette.green },
  Number = { fg = palette.pink },
  Boolean = { fg = palette.orange },
  Float = { fg = palette.pink },
  Identifier = { fg = palette.yellow },
  Function = { fg = palette.blue },
  Statement = { fg = palette.violet },
  Conditional = { fg = palette.violet },
  Repeat = { fg = palette.violet },
  Label = { fg = palette.violet },
  Operator = { fg = palette.fg },
  Keyword = { fg = palette.violet },
  Exception = { fg = palette.violet },
  PreProc = { fg = palette.pink },
  Include = { fg = palette.violet },
  Define = { fg = palette.violet },
  Macro = { fg = palette.pink },
  PreCondit = { fg = palette.pink },
  Type = { fg = palette.aqua },
  StorageClass = { fg = palette.violet },
  Structure = { fg = palette.aqua },
  Typedef = { fg = palette.aqua },
  Special = { fg = palette.cyan },
  SpecialChar = { fg = palette.cyan },
  Tag = { fg = palette.blue },
  Delimiter = { fg = palette.fg },
  Debug = { fg = palette.pink },
  Underlined = { fg = palette.blue, underline = true },
  Ignore = { fg = palette.fg_dim },
  Error = { fg = palette.error },
  Todo = { fg = palette.bg, bg = palette.yellow, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = palette.error },
  DiagnosticWarn = { fg = palette.warn },
  DiagnosticInfo = { fg = palette.info },
  DiagnosticHint = { fg = palette.hint },
  DiagnosticUnderlineError = { undercurl = true, sp = palette.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = palette.warn },
  DiagnosticUnderlineInfo = { undercurl = true, sp = palette.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = palette.hint },

  -- Diff
  DiffAdd = { bg = "#2B3328" },
  DiffChange = { bg = "#252535" },
  DiffDelete = { fg = palette.delete, bg = "#3C2C2E" },
  DiffText = { bg = "#3D5066" },

  -- Git signs
  Added = { fg = palette.add },
  Changed = { fg = palette.change },
  Removed = { fg = palette.delete },

  -- Treesitter
  ["@variable"] = { fg = palette.fg },
  ["@variable.parameter"] = { fg = palette.fg },
  ["@constant"] = { fg = palette.orange },
  ["@constant.builtin"] = { fg = palette.orange },
  ["@string"] = { fg = palette.green },
  ["@string.escape"] = { fg = palette.cyan },
  ["@character"] = { fg = palette.green },
  ["@number"] = { fg = palette.pink },
  ["@boolean"] = { fg = palette.orange },
  ["@function"] = { fg = palette.blue },
  ["@function.builtin"] = { fg = palette.blue },
  ["@function.call"] = { fg = palette.blue },
  ["@method"] = { fg = palette.blue },
  ["@keyword"] = { fg = palette.violet },
  ["@keyword.return"] = { fg = palette.violet },
  ["@keyword.function"] = { fg = palette.violet },
  ["@keyword.operator"] = { fg = palette.violet },
  ["@operator"] = { fg = palette.fg },
  ["@type"] = { fg = palette.aqua },
  ["@type.builtin"] = { fg = palette.aqua },
  ["@property"] = { fg = palette.yellow },
  ["@field"] = { fg = palette.yellow },
  ["@parameter"] = { fg = palette.fg },
  ["@punctuation"] = { fg = palette.cyan },
  ["@punctuation.bracket"] = { fg = palette.cyan },
  ["@punctuation.delimiter"] = { fg = palette.fg },
  ["@tag"] = { fg = palette.violet },
  ["@tag.attribute"] = { fg = palette.yellow },
  ["@tag.delimiter"] = { fg = palette.fg_dim },
  ["@comment"] = { fg = palette.fg_dim, italic = true },

  -- LSP
  LspReferenceText = { bg = palette.bg_light },
  LspReferenceRead = { bg = palette.bg_light },
  LspReferenceWrite = { bg = palette.bg_light },

  -- Mini.statusline
  MiniStatuslineModeNormal = { fg = palette.bg, bg = palette.blue, bold = true },
  MiniStatuslineModeInsert = { fg = palette.bg, bg = palette.green, bold = true },
  MiniStatuslineModeVisual = { fg = palette.bg, bg = palette.violet, bold = true },
  MiniStatuslineModeCommand = { fg = palette.bg, bg = palette.yellow, bold = true },
  MiniStatuslineModeReplace = { fg = palette.bg, bg = palette.error, bold = true },
  MiniStatuslineModeOther = { fg = palette.bg, bg = palette.aqua, bold = true },
  MiniStatuslineFilename = { fg = palette.fg, bg = palette.bg_light },
  MiniStatuslineDevinfo = { fg = palette.fg_dark, bg = palette.bg_light },
  MiniStatuslineFileinfo = { fg = palette.fg_dark, bg = palette.bg_light },
  MiniStatuslineInactive = { fg = palette.fg_dim, bg = palette.bg_dark },

    -- ==========================================================================
  -- Snacks picker / explorer
  -- ==========================================================================

  -- Main explorer window
  SnacksPicker = {
    fg = palette.fg,
    bg = palette.bg,
  },

  SnacksPickerBorder = {
    fg = palette.bg_light,
    bg = palette.bg,
  },

  SnacksPickerTitle = {
    fg = palette.blue,
    bg = palette.bg,
    bold = true,
  },

  -- Explorer list
  SnacksPickerList = {
    fg = palette.fg,
    bg = palette.bg,
  },

  SnacksPickerListCursorLine = {
    fg = palette.fg,
    bg = palette.bg_light,
  },

  -- File and directory labels
  SnacksPickerFile = {
    fg = palette.fg,
  },

  SnacksPickerDirectory = {
    fg = palette.blue,
    bold = true,
  },

  SnacksPickerTree = {
    fg = palette.fg_dim,
  },

  SnacksPickerDimmed = {
    fg = palette.fg_dim,
    italic = true,
  },

  -- Hidden and ignored paths
  SnacksPickerPathHidden = {
    fg = palette.fg_dim,
    italic = true,
  },

  SnacksPickerPathIgnored = {
    fg = palette.fg_dim,
  },

  -- Matching characters
  SnacksPickerMatch = {
    fg = palette.orange,
    bold = true,
  },

  -- Search input
  SnacksPickerInput = {
    fg = palette.fg,
    bg = palette.bg_menu,
  },

  SnacksPickerInputBorder = {
    fg = palette.fg_dim,
    bg = palette.bg_menu,
  },

  SnacksPickerInputTitle = {
    fg = palette.blue,
    bg = palette.bg_menu,
    bold = true,
  },

  -- Preview window
  SnacksPickerPreview = {
    fg = palette.fg,
    bg = palette.bg,
  },

  SnacksPickerPreviewBorder = {
    fg = palette.bg_light,
    bg = palette.bg,
  },

  SnacksPickerPreviewTitle = {
    fg = palette.aqua,
    bg = palette.bg,
    bold = true,
  },

  -- Git status
  SnacksPickerGitStatusAdded = {
    fg = palette.add,
  },

  SnacksPickerGitStatusModified = {
    fg = palette.change,
  },

  SnacksPickerGitStatusDeleted = {
    fg = palette.delete,
  },

  SnacksPickerGitStatusRenamed = {
    fg = palette.aqua,
  },

  SnacksPickerGitStatusUntracked = {
    fg = palette.green,
  },

  SnacksPickerGitStatusIgnored = {
    fg = palette.fg_dim,
  },
}

-- Create and apply colorscheme
require("mini.colors").setup()

local colorscheme = require("mini.colors").as_colorscheme({
  name = "kanagawa-mini",
  groups = groups,
})

-- Add cterm attributes for terminal compatibility and apply
colorscheme:add_cterm_attributes():apply()

-- To tweak interactively, run:
--   :lua MiniColors.interactive()
-- Then use methods like:
--   chan_add("saturation", 10)  -- more colorful
--   chan_add("lightness", -5, { filter = "bg" })  -- darker backgrounds
-- Press <M-a> to apply, <M-w> to save as new colorscheme
