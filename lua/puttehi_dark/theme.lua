local blend = require('puttehi_dark.utils').blend

local M = {}

function M.get(config)
  local p = require 'puttehi_dark.palette'

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none) or groups.background,
    float_background = (config.disable_float_background and p.none) or groups.panel,
  }
  styles.nc_background = (config.dim_nc_background and not config.disable_background and groups.panel)
    or styles.background

  theme = {
    ColorColumn = { bg = p.lightGray2 },
    Conceal = { bg = p.none },
    CurSearch = { link = 'IncSearch' },
    -- Cursor = {},
    CursorColumn = { bg = p.background3 },
    -- CursorIM = {},
    CursorLine = { bg = p.background3 },
    CursorLineNr = { fg = p.text },
    DarkenedPanel = { bg = groups.panel },
    DarkenedStatusline = { bg = groups.panel },
    DiffAdd = { bg = blend(groups.git_add, groups.background, 0.5) },
    DiffChange = { bg = p.lightGray2 },
    DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.5) },
    DiffText = { bg = blend(groups.git_text, groups.background, 0.5) },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    Directory = { fg = p.darkCyan1, bg = p.none },
    -- EndOfBuffer = {},
    ErrorMsg = { fg = p.lightRed1, style = 'bold' },
    FloatBorder = { fg = groups.border },
    FloatTitle = { fg = p.lightSilver1 },
    FoldColumn = { fg = p.lightSilver1 },
    Folded = { fg = p.text, bg = groups.panel },
    IncSearch = { fg = p.lightPink1 },
    LineNr = { fg = p.lightSilver1 },
    MatchParen = { fg = p.white, style = 'bold' }, -- match for parenthesis under cursor / code block
    ModeMsg = { fg = p.darkCyan1 },
    MoreMsg = { fg = p.darkCyan1 },
    NonText = { fg = p.darkBlue1 },
    Normal = { fg = p.text, bg = styles.background },
    NormalFloat = { fg = p.text, bg = styles.float_background },
    NormalNC = { fg = p.text, bg = styles.nc_background },
    NvimInternalError = { fg = '#ffffff', bg = p.lightRed1 },
    Pmenu = { fg = p.lightGray2, bg = styles.float_background },
    PmenuSbar = { bg = p.lightSilver1 },
    PmenuSel = { fg = p.text, bg = p.background3 },
    PmenuThumb = { bg = p.lightGray3 },
    Question = { fg = p.lightYellow1 },
    -- QuickFixLine = {},
    -- RedrawDebugNormal = {}
    RedrawDebugClear = { fg = '#ffffff', bg = p.lightYellow1 },
    RedrawDebugComposed = { fg = '#ffffff', bg = p.brightRed1 },
    RedrawDebugRecompose = { fg = '#ffffff', bg = p.lightRed1 },
    Search = { fg = p.white },
    SpecialKey = { fg = p.lightBlue1 },
    SpellBad = { sp = p.lightRed1, style = 'undercurl' },
    SpellCap = { sp = p.brightCyan1, style = 'undercurl' },
    SpellLocal = { sp = p.lightYellow1, style = 'undercurl' },
    SpellRare = { sp = p.brightCyan1, style = 'undercurl' },
    SignColumn = { fg = p.text, bg = p.none },
    StatusLine = { fg = p.darkCyan1, bg = styles.float_background },
    StatusLineNC = { fg = p.darkCyan1, bg = styles.background },
    StatusLineTerm = { link = 'StatusLine' },
    StatusLineTermNC = { link = 'StatusLineNC' },
    TabLine = { fg = p.darkCyan1, bg = styles.float_background },
    TabLineFill = { bg = styles.float_background },
    TabLineSel = { fg = p.text, bg = p.background3 },
    Title = { fg = p.text },
    VertSplit = { fg = groups.border, bg = styles.vert_split },
    Visual = { fg = p.text, bg = p.lightGray3 },
    -- VisualNOS = {},
    WarningMsg = { fg = p.lightYellow1 },
    Whitespace = { fg = p.lightGray3 },
    WildMenu = { link = 'IncSearch' },

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = p.text }, -- (preferred) any constant
    String = { fg = p.lightBlue1 }, --   a string constant: "this is a string"
    Character = { fg = p.lightRed1 }, --  a character constant: 'c', '\n'
    Number = { fg = p.lightBlue1 }, --   a number constant: 234, 0xff
    Boolean = { fg = p.darkYellow1 }, --  a boolean constant: TRUE, false
    Float = { fg = p.lightBlue1 }, --    a floating point constant: 2.3e10

    Identifier = { fg = p.text }, -- (preferred) any variable name
    Function = { fg = p.lightBlue1 }, -- function name (also: methods for classes)

    Statement = { fg = p.text }, -- (preferred) any statement
    Conditional = { fg = p.brightRed1 }, --  if, then, else, endif, switch, etc.
    Repeat = { fg = p.brightRed1 }, --   for, do, while, etc.
    Label = { fg = p.brightRed1 }, --    case, default, etc.
    Operator = { fg = p.darkCyan1 }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = p.brightRed1 }, --  any other keyword
    Exception = { fg = p.brightRed1 }, --  try, catch, throw

    PreProc = { fg = p.text }, -- (preferred) generic Preprocessor
    Include = { fg = p.brightRed1 }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = p.darkYellow1 }, -- (preferred) int, long, char, etc.
    --[[ Structure = { fg = p.lightGray2 }, --  struct, union, enum, etc. ]]
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Typedef = { fg = p.lightGray2 }, --  A typedef

    Special = { fg = p.lightSilver1 }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    Tag = { fg = p.text }, --    you can use CTRL-] on this
    Delimiter = { fg = p.lightGray2 }, --  character that needs attention
    SpecialComment = { fg = p.lightGray2 }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Comment = { fg = p.lightGray2 }, -- (preferred) any special symbol

    Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = p.lightRed1 }, -- (preferred) any erroneous construct
    Todo = { fg = p.white, style = 'bold' }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = p.lightGray3 },
    qfFileName = { fg = p.lightSilver1 },

    htmlH1 = { fg = p.lightBlue1, style = 'bold' },
    htmlH2 = { fg = p.lightBlue1, style = 'bold' },

    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = p.background1, fg = p.text },
    mkdCodeStart = { fg = p.brightRed1, style = 'bold' },
    mkdCodeEnd = { fg = p.brightRed1, style = 'bold' },
    mkdLink = { fg = p.brightCyan1, style = 'underline' },

    markdownHeadingDelimiter = { fg = p.darkBlue1, style = 'bold' },
    markdownCode = { fg = p.lightGray2 },
    markdownCodeBlock = { fg = p.brightRed1 },
    markdownH1 = { fg = p.darkYellow1, style = 'bold' },
    markdownH2 = { fg = p.darkYellow1, style = 'bold' },
    markdownH3 = { fg = p.darkYellow1, style = 'bold' },
    markdownH4 = { fg = p.darkYellow1, style = 'bold' },
    markdownLinkText = { fg = p.brightCyan1, style = 'underline' },

    debugPC = { bg = p.background3 }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = p.background2, fg = p.lightRed1 }, -- used for breakpoint colors in terminal-debug
    DiagnosticError = { fg = groups.error },
    DiagnosticHint = { fg = groups.hint },
    DiagnosticInfo = { fg = groups.info },
    DiagnosticWarn = { fg = groups.warn },
    DiagnosticDefaultError = { fg = groups.error },
    DiagnosticDefaultHint = { fg = groups.hint },
    DiagnosticDefaultInfo = { fg = groups.info },
    DiagnosticDefaultWarn = { fg = groups.warn },
    DiagnosticFloatingError = { fg = groups.error },
    DiagnosticFloatingHint = { fg = groups.hint },
    DiagnosticFloatingInfo = { fg = groups.info },
    DiagnosticFloatingWarn = { fg = groups.warn },
    DiagnosticSignError = { fg = groups.error },
    DiagnosticSignHint = { fg = groups.hint },
    DiagnosticSignInfo = { fg = groups.info },
    DiagnosticSignWarn = { fg = groups.warn },
    DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
    DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
    DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
    DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
    DiagnosticUnderlineError = { sp = groups.error, style = 'undercurl' },
    DiagnosticUnderlineHint = { sp = groups.hint, style = 'undercurl' },
    DiagnosticUnderlineInfo = { sp = groups.info, style = 'undercurl' },
    DiagnosticUnderlineWarn = { sp = groups.warn, style = 'undercurl' },
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    -- Treesitter
    ['@variable'] = { fg = p.text },
    -- TSAttribute = {},
    -- TSKeywordReturn = { fg = p.brightRed1 },
    ['@boolean'] = { link = 'Boolean' },
    -- TSCharacter = { link = 'Character' },
    ['@comment'] = { link = 'Comment' },
    -- TSConditional = { link = 'Conditional' },
    ['@variable.builtin'] = { fg = p.darkYellow1 },
    ['@constant.builtin'] = { fg = p.darkYellow1 },
    -- TSConstMacro = {},
    -- TSConstant = { fg = p.text },
    ['@constructor'] = { fg = p.lightBlue1 },
    -- TSEmphasis = {},
    -- TSError = {},
    -- TSException = {},
    ['field'] = { fg = p.text },
    -- TSFloat = {},
    ['@function.builtin'] = { fg = p.darkYellow1 },
    -- TSFuncMacro = {},
    ['@function'] = { link = 'Function' },
    ['@function.call'] = { fg = p.text },
    TSInclude = { fg = p.darkYellow1 },
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.return'] = { fg = p.brightRed1 },
    ['@keyword.function'] = { fg = p.darkYellow1 },
    ['@keyword.operator'] = { fg = p.lightBlue1 },
    ['@label'] = { fg = p.darkCyan1 },
    -- TSLiteral = {},
    ['@method'] = { fg = p.lightBlue1 },
    -- TSNamespace = {},
    -- TSNone = {},
    -- TSNumber = { link = 'Number' },
    ['@operator'] = { link = 'Operator' },
    ['@parameter'] = { fg = p.text },
    -- TSParameterReference = {},
    ['@property'] = { fg = p.darkYellow1 },
    ['@punctuation.delimiter'] = { fg = groups.punctuation },
    ['@punctuation.special'] = { fg = groups.punctuation },
    ['@punctuation.bracket'] = { fg = p.text },
    -- TSRepeat = {},
    -- TSStrike = {},
    ['@string'] = { link = 'String' },
    ['@string.escape'] = { fg = p.lightRed1 },
    -- TSStringRegex = {},
    -- TSStringSpecial = { fg = p.lightBlue1 },
    -- TSSymbol = {},
    ['@tag'] = { fg = p.text },
    ['@tag.delimiter'] = { fg = p.text },
    ['@tag.attribute'] = { fg = p.darkCyan1, style = styles.italic },
    ['@text'] = { fg = p.text },
    ['@title'] = { fg = groups.headings.h1, style = 'bold' },
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    TSURI = { fg = groups.link },
    -- TSUnderline = {},

    -- tsx/jsx
    typescriptVariable = { fg = p.darkYellow1 },
    typescriptExport = { fg = p.lightBlue1 },
    typescriptDefault = { fg = p.lightBlue1 },
    typescriptConstraint = { fg = p.lightBlue1 },
    typescriptBlock = { fg = p.text },
    typescriptIdentifierName = { fg = p.lightSilver1 },
    typescriptTSInclude = { fg = p.lightBlue1 },
    typescriptCastKeyword = { fg = p.lightSilver1 },
    typescriptEnum = { fg = p.darkBlue1 },
    typescriptTypeCast = { fg = p.lightSilver1 },
    typescriptParenExp = { fg = p.lightSilver1 },
    typescriptObjectType = { fg = p.lightGray2 },

    -- lua
    luaTSConstructor = { fg = p.lightGray2 },

    -- css
    cssTSFunction = { fg = p.lightGray2 },
    cssTSProperty = { fg = p.darkYellow1 },
    cssTSType = { fg = p.lightBlue1 },
    cssTSKeyword = { fg = p.lightGray2 },
    cssClassName = { fg = p.brightRed1, style = styles.italic },
    cssPseudoClass = { fg = p.darkCyan1, style = styles.italic },
    cssDefinition = { fg = p.darkYellow1 },
    cssTSError = { link = 'cssClassName' },

    -- vim.lsp.buf.document_highlight()
    LspReferenceText = { bg = p.darkYellow1 },
    LspReferenceRead = { bg = p.darkYellow1 },
    LspReferenceWrite = { bg = p.darkYellow1 },

    -- lsp-highlight-codelens
    LspCodeLens = { fg = p.lightGray2 }, -- virtual text of code lens
    LspCodeLensSeparator = { fg = p.lightGray3 }, -- separator between two or more code lens

    -- nvim-ts-rainbow
    rainbowcol1 = { fg = p.brightRed1 },
    rainbowcol2 = { fg = p.lightMagenta1 },
    rainbowcol3 = { fg = p.lightTeal1 },
    rainbowcol4 = { fg = p.darkBlue1 },
    rainbowcol5 = { fg = p.lightRed1 },
    rainbowcol6 = { fg = p.darkCyan1 },
    rainbowcol7 = { fg = p.lightPink1 },

    -- romgrk/barbar.nvim
    BufferCurrent = { fg = p.text, bg = p.background2 },
    BufferCurrentIndex = { fg = p.text, bg = p.background2 },
    BufferCurrentMod = { fg = p.lightBlue1, bg = p.background2 },
    BufferCurrentSign = { fg = p.lightGray2, bg = p.background2 },
    BufferCurrentTarget = { fg = p.lightYellow1, bg = p.background2 },
    BufferInactive = { fg = p.lightGray2 },
    BufferInactiveIndex = { fg = p.lightGray2 },
    BufferInactiveMod = { fg = p.lightBlue1 },
    BufferInactiveSign = { fg = p.lightSilver1 },
    BufferInactiveTarget = { fg = p.lightYellow1 },
    BufferTabpageFill = { fg = groups.background, bg = groups.background },
    BufferVisible = { fg = p.lightGray2 },
    BufferVisibleIndex = { fg = p.lightGray2 },
    BufferVisibleMod = { fg = p.lightBlue1 },
    BufferVisibleSign = { fg = p.lightSilver1 },
    BufferVisibleTarget = { fg = p.lightYellow1 },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = groups.git_add },
    GitSignsChange = { fg = groups.git_change },
    GitSignsDelete = { fg = groups.git_delete },
    SignAdd = { link = 'GitSignsAdd' },
    SignChange = { link = 'GitSignsChange' },
    SignDelete = { link = 'GitSignsDelete' },

    -- mvllow/modes.nvim
    ModesCopy = { bg = p.lightYellow1 },
    ModesDelete = { bg = p.lightRed1 },
    ModesInsert = { bg = p.lightBlue1 },
    ModesVisual = { bg = p.lightYellow1 },

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = { fg = p.lightGray3 },
    NvimTreeFileDeleted = { fg = p.lightRed1 },
    NvimTreeFileDirty = { fg = p.darkBlue1 },
    NvimTreeFileMerge = { fg = p.darkYellow1 },
    NvimTreeFileNew = { fg = p.lightBlue1 },
    NvimTreeFileRenamed = { fg = p.lightGray3 },
    NvimTreeFileStaged = { fg = p.brightCyan1 },
    NvimTreeFolderIcon = { fg = p.darkCyan1 },
    NvimTreeFolderName = { fg = p.darkCyan1 },
    NvimTreeGitDeleted = { fg = groups.git_delete },
    NvimTreeGitDirty = { fg = groups.git_dirty },
    NvimTreeGitIgnored = { fg = groups.git_ignore },
    NvimTreeGitMerge = { fg = groups.git_merge },
    NvimTreeGitNew = { fg = groups.git_add },
    NvimTreeGitRenamed = { fg = groups.git_rename },
    NvimTreeGitStaged = { fg = groups.git_stage },
    NvimTreeImageFile = { fg = p.text },
    NvimTreeNormal = { fg = p.text },
    NvimTreeOpenedFile = { fg = p.text, bg = p.background3 },
    NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
    NvimTreeRootFolder = { fg = p.lightBlue1 },
    NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
    NvimTreeWindowPicker = { fg = groups.bg, bg = p.lightGray2 },

    -- folke/which-key.nvim
    WhichKey = { fg = groups.glowing }, -- key
    WhichKeyGroup = { fg = groups.glowing, style = "bold"}, -- key if its a group
    WhichKeySeparator = { fg = groups.punctuation }, -- key-label separator
    WhichKeyDesc = { fg = groups.comment }, -- key description
    WhichKeyFloat = { bg = groups.panel }, -- floating panel
    WhichKeyBorder = { fg = groups.border }, -- border
    WhichKeyValue = { fg = groups.text }, -- value if some plugin provides it

    -- luka-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = p.background3 },
    IndentBlanklineContextChar = { fg = p.lightYellow1, gui = 'nocombine' },
    IndentBlanklineContextStart = { fg = p.lightYellow1, gui = 'underline' },
    IndentBlanklineSpaceChar = { link = 'Whitespace' },
    IndentBlanklineSpaceCharBlankline = { link = 'Whitespace' },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = p.lightSilver1 },
    CmpItemAbbrDeprecated = { fg = p.lightRed1, style = 'strikethrough' },
    CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
    CmpItemAbbrMatchFuzzy = { fg = p.lightBlue1, style = 'bold' },
    CmpItemKind = { fg = p.darkCyan1 },
    CmpItemKindClass = { fg = p.lightYellow1 },
    CmpItemKindFunction = { fg = p.brightCyan1 },
    CmpItemKindInterface = { fg = p.darkYellow1 },
    CmpItemKindMethod = { fg = p.lightRed1 },
    CmpItemKindSnippet = { fg = p.lightGray2 },
    CmpItemKindVariable = { fg = p.lightBlue1 },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { bg = p.lightGray2 },

    -- rlane/pounce.nvim
    PounceAccept = { fg = p.lightRed1, bg = p.text },
    PounceAcceptBest = { fg = p.text, bg = p.text },
    PounceGap = { link = 'Search' },
    PounceMatch = { link = 'Search' },

    -- nvim-telescope/telescope.nvim
    TelescopeBorder = { fg = groups.border },
    TelescopeMatching = { fg = p.lightBlue1 },
    TelescopeNormal = { fg = p.text },
    TelescopePromptNormal = { fg = p.text },
    TelescopePromptPrefix = { fg = p.lightGray2 },
    TelescopeSelection = { fg = p.text, bg = p.lightGray2 },
    TelescopeSelectionCaret = { fg = p.lightMagenta1, bg = p.lightGray2 },
    TelescopeTitle = { fg = p.lightSilver1 },

    -- phaazon/hop.nvim
    HopNextKey = { fg = p.brightCyan1 },
    HopNextKey1 = { fg = p.lightBlue1 },
    HopNextKey2 = { fg = p.brightRed1 },
    HopUnmatched = { fg = p.lightGray3 },
    HopCursor = { fg = p.darkCyan1 },

    -- rcarriga/nvim-notify
    NotifyINFOBorder = { fg = p.lightBlue1 },
    NotifyINFOTitle = { link = 'NotifyINFOBorder' },
    NotifyINFOIcon = { link = 'NotifyINFOBorder' },
    NotifyWARNBorder = { fg = p.lightYellow1 },
    NotifyWARNTitle = { link = 'NotifyWARNBorder' },
    NotifyWARNIcon = { link = 'NotifyWARNBorder' },
    NotifyDEBUGBorder = { fg = p.brightCyan1 },
    NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
    NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
    NotifyTRACEBorder = { fg = p.brightCyan1 },
    NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
    NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
    NotifyERRORBorder = { fg = p.lightRed1 },
    NotifyERRORTitle = { link = 'NotifyERRORBorder' },
    NotifyERRORIcon = { link = 'NotifyERRORBorder' },
  }

  vim.g.terminal_color_0 = p.background1 -- black
  vim.g.terminal_color_8 = p.background1 -- bright black
  vim.g.terminal_color_1 = p.lightRed1 -- red
  vim.g.terminal_color_9 = p.lightRed1 -- bright red
  vim.g.terminal_color_2 = p.lightBlue1 -- green
  vim.g.terminal_color_10 = p.lightBlue1 -- bright green
  vim.g.terminal_color_3 = p.lightYellow1 -- lightYellow1
  vim.g.terminal_color_11 = p.lightYellow1 -- bright lightYellow1
  vim.g.terminal_color_4 = p.brightCyan1 -- blue
  vim.g.terminal_color_12 = p.darkYellow1 -- bright blue
  vim.g.terminal_color_5 = p.lightMagenta1 -- magenta
  vim.g.terminal_color_13 = p.lightMagenta1 -- bright magenta
  vim.g.terminal_color_6 = p.brightCyan1 -- brightCyan1
  vim.g.terminal_color_14 = p.darkYellow1 -- bright brightCyan1
  vim.g.terminal_color_7 = p.white -- white
  vim.g.terminal_color_15 = p.white -- bright white

  return theme
end

return M
