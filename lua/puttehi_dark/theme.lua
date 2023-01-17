local blend = require('puttehi_dark.utils').blend

local M = {}

function M.get(config)
    local p = require 'puttehi_dark.palette'

    local groups = config.groups or {}
    local h1 = groups.headings.h1 or "text"
    local h2 = groups.headings.h2 or "text"
    local h3 = groups.headings.h3 or "text"
    local h4 = groups.headings.h4 or "text"
    local h5 = groups.headings.h5 or "text"
    local h6 = groups.headings.h6 or "text"

    local theme = {
        ColorColumn = { bg = groups.comment },
        Conceal = { bg = p.none },
        CurSearch = { link = 'IncSearch' },
        -- Cursor = {},
        CursorColumn = { bg = groups.background_bright },
        -- CursorIM = {},
        CursorLine = { bg = groups.background_bright },
        CursorLineNr = { fg = groups.text },
        DarkenedPanel = { bg = groups.panel },
        DarkenedStatusline = { bg = groups.panel },
        DiffAdd = { bg = blend(groups.git_add, groups.background, 0.5) },
        DiffChange = { bg = groups.comment },
        DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.5) },
        DiffText = { bg = blend(groups.git_text, groups.background, 0.5) },
        diffAdded = { link = 'DiffAdd' },
        diffChanged = { link = 'DiffChange' },
        diffRemoved = { link = 'DiffDelete' },
        Directory = { fg = groups.punctuation, bg = p.none },
        -- EndOfBuffer = {},
        ErrorMsg = { fg = groups.error, style = 'bold' },
        FloatBorder = { fg = groups.border },
        FloatTitle = { fg = groups.text_bright },
        FoldColumn = { fg = groups.text_bright },
        Folded = { fg = groups.text, bg = groups.panel },
        IncSearch = { fg = groups.glowing },
        LineNr = { fg = groups.text_bright },
        MatchParen = { fg = groups.glowing, style = 'bold' }, -- match for parenthesis under cursor / code block
        ModeMsg = { fg = groups.info },
        MoreMsg = { fg = groups.info },
        NonText = { fg = groups.nontext },
        -- custom for inactive window dimming
        WindowActive = { fg = groups.text, bg = groups.background },
        Normal = { fg = groups.text, bg = groups.background },
        NormalFloat = { fg = groups.text, bg = groups.background_float },
        WindowInactive = { fg = groups.text, bg = p.background1 }, -- none doesn't work for transparent for some reason
        NormalNC = { link = "WindowInactive" },
        NvimInternalError = { groups.glowing, bg = groups.error },
        Pmenu = { fg = groups.comment, bg = groups.background_float },
        PmenuSbar = { bg = groups.text_bright },
        PmenuSel = { fg = groups.text, bg = groups.panel_float },
        PmenuThumb = { bg = groups.comment },
        Question = { fg = groups.warn },
        -- QuickFixLine = {},
        -- RedrawDebugNormal = {}
        RedrawDebugClear = { fg = groups.glowing, bg = groups.warn },
        RedrawDebugComposed = { fg = groups.glowing, bg = h1 },
        RedrawDebugRecompose = { fg = groups.glowing, bg = groups.error },
        Search = { fg = groups.glowing },
        SpecialKey = { fg = h5 },
        SpellBad = { sp = groups.error, style = 'undercurl' },
        SpellCap = { sp = groups.hint, style = 'undercurl' },
        SpellLocal = { sp = groups.warn, style = 'undercurl' },
        SpellRare = { sp = groups.hint, style = 'undercurl' },
        SignColumn = { fg = groups.text, bg = p.none },
        StatusLine = { fg = groups.punctuation, bg = groups.background_float },
        StatusLineNC = { fg = groups.link, bg = groups.background },
        StatusLineTerm = { link = 'StatusLine' },
        StatusLineTermNC = { link = 'StatusLineNC' },
        TabLine = { fg = groups.link, bg = groups.background_float },
        TabLineFill = { bg = groups.background_float },
        TabLineSel = { fg = groups.text, bg = groups.panel_float },
        Title = { fg = groups.text },
        VertSplit = { fg = groups.border, bg = groups.border },
        Visual = { fg = groups.text, bg = groups.background_float },
        -- VisualNOS = {},
        WarningMsg = { fg = groups.warning },
        Whitespace = { fg = groups.comment },
        WildMenu = { link = 'IncSearch' },

        -- These groups are not listed as default vim groups,
        -- but they are defacto standard group names for syntax highlighting.
        -- commented out groups should chain up to their "preferred" group by
        -- default,
        -- Uncomment and edit if you want more specific syntax highlighting.

        Constant = { fg = groups.const }, -- (preferred) any constant
        String = { fg = groups.str }, --   a string constant: "this is a string"
        Character = { fg = groups.str2 }, --  a character constant: 'c', '\n'
        Number = { fg = groups.const2 }, --   a number constant: 234, 0xff
        Boolean = { fg = groups.const2 }, --  a boolean constant: TRUE, false
        Float = { fg = groups.const2 }, --    a floating point constant: 2.3e10

        Identifier = { fg = groups.varname }, -- (preferred) any variable name
        Function = { fg = groups.func }, -- function name (also: methods for classes)

        Statement = { fg = groups.statement }, -- (preferred) any statement
        Conditional = { fg = groups.ifelse }, --  if, then, else, endif, switch, etc.
        Repeat = { fg = groups.ifelse }, --   for, do, while, etc.
        Label = { fg = groups.func }, --    case, default, etc.
        Operator = { fg = groups.link }, -- "sizeof", "+", "*", etc.
        Keyword = { fg = groups.func }, --  any other keyword
        Exception = { fg = groups.func }, --  try, catch, throw

        PreProc = { fg = groups.const }, -- (preferred) generic Preprocessor
        Include = { fg = groups.const }, --  preprocessor #include
        -- Define        = { }, --   preprocessor #define
        -- Macro         = { }, --    same as Define
        -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

        Type = { fg = groups.vartype }, -- (preferred) int, long, char, etc.
        --[[ Structure = { fg = groups.comment }, --  struct, union, enum, etc. ]]
        -- StorageClass  = { }, -- static, register, volatile, etc.
        -- Typedef = { fg = groups.comment }, --  A typedef

        Special = { fg = groups.text_bright }, -- (preferred) any special symbol
        -- SpecialChar   = { }, --  special character in a constant
        Tag = { fg = groups.text }, --    you can use CTRL-] on this
        Delimiter = { fg = groups.warn }, --  character that needs attention
        SpecialComment = { fg = groups.comment }, -- special things inside a comment
        -- Debug         = { }, --    debugging statements

        Comment = { fg = groups.comment }, -- (preferred) any special symbol

        Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
        Bold = { style = 'bold' },
        Italic = { style = 'italic' },

        -- ("Ignore", below, may be invisible...)
        -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

        Error = { fg = groups.error }, -- (preferred) any erroneous construct
        Todo = { fg = groups.glowing, style = 'bold' }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        qfLineNr = { fg = groups.comment },
        qfFileName = { fg = groups.text_bright },

        htmlH1 = { fg = h1, style = 'bold' },
        htmlH2 = { fg = h2, style = 'bold' },

        -- mkdHeading = { fg = c.orange, style = "bold" },
        -- mkdCode = { bg = c.terminal_black, fg = c.fg },
        mkdCodeDelimiter = { bg = groups.background, fg = groups.text },
        mkdCodeStart = { fg = h1, style = 'bold' },
        mkdCodeEnd = { fg = h1, style = 'bold' },
        mkdLink = { fg = groups.hint, style = 'underline' },

        markdownHeadingDelimiter = { fg = groups.nontext, style = 'bold' },
        markdownCode = { fg = groups.comment },
        markdownCodeBlock = { fg = h1 },
        markdownH1 = { fg = h1, style = 'bold' },
        markdownH2 = { fg = h2, style = 'bold' },
        markdownH3 = { fg = h3, style = 'bold' },
        markdownH4 = { fg = h4, style = 'bold' },
        markdownLinkText = { fg = groups.hint, style = 'underline' },

        debugPC = { bg = groups.panel_float }, -- used for highlighting the current line in terminal-debug
        debugBreakpoint = { bg = p.background2, fg = groups.error }, -- used for breakpoint colors in terminal-debug
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
        -- TSAttribute = {},
        -- TSKeywordReturn = { fg = h1 },
        ['@boolean'] = { fg = groups.const2 },
        -- TSCharacter = { link = 'Character' },
        ['@comment'] = { fg = groups.comment },
        -- TSConditional = { link = 'Conditional' },
        ['@constant'] = { fg = groups.text },
        ['@constant.builtin'] = { fg = groups.vartype },
        -- TSConstMacro = {},
        -- TSConstant = { fg = groups.text },
        ['@constructor'] = { fg = groups.vartype },
        -- TSEmphasis = {},
        TSError = { fg = groups.error },
        -- TSException = {},
        ['field'] = { fg = groups.text },
        -- TSFloat = {},
        -- TSFuncMacro = {},
        ['@function'] = { fg = groups.func },
        ['@function.call'] = { fg = groups.text },
        ['@function.name'] = { fg = groups.vartype },
        ['@function.builtin'] = { fg = groups.vartype },
        ['@include'] = { fg = groups.keyword }, -- import, include etc.
        ['@keyword'] = { fg = groups.keyword },
        ['@keyword.function'] = { fg = groups.keyword }, -- func, def etc.
        ['@keyword.operator'] = { fg = groups.keyword }, -- in, of etc.
        ['@label'] = { fg = groups.link },
        -- TSLiteral = {},
        ['@method'] = { fg = groups.text_bright },
        ['@namespace'] = { fg = groups.text },
        -- TSNamespace = {},
        -- TSNone = {},
        TSNumber = { fg = groups.const2 },
        ['@operator'] = { fg = groups.link },
        ['@parameter'] = { fg = groups.text },
        -- TSParameterReference = {},
        ['@property'] = { fg = groups.text },
        ['@punctuation.delimiter'] = { fg = groups.punctuation },
        ['@punctuation.special'] = { fg = groups.punctuation },
        ['@punctuation.bracket'] = { fg = groups.text },
        -- TSRepeat = {},
        -- TSStrike = {},
        ['@string'] = { fg = groups.str }, -- abc = "abba", call("somestr") etc.
        ['@string.escape'] = { fg = groups.text }, -- \n, \t etc.
        -- TSStringRegex = {},
        -- TSStringSpecial = { fg = h5 },
        -- TSSymbol = {},
        ['@tag'] = { fg = groups.text },
        ['@tag.delimiter'] = { fg = groups.text },
        ['@tag.attribute'] = { fg = groups.link, style = "italic" },
        ['@text'] = { fg = groups.text },
        ['@title'] = { fg = h1, style = 'bold' },
        ['@type'] = { fg = groups.vartype },
        ['@type.builtin'] = { fg = groups.vartype },
        TSURI = { fg = groups.link },
        -- TSUnderline = {},
        ['@variable'] = { fg = groups.text },
        ['@variable.function'] = { fg = groups.func },
        ['@variable.builtin'] = { fg = groups.varname },
        ['@field'] = { fg = groups.text },
        ['@number'] = { fg = groups.str }, -- a = 1, call(number=1) etc.

        -- tsx/jsx
        typescriptVariable = { fg = h6 },
        typescriptExport = { fg = h5 },
        typescriptDefault = { fg = h5 },
        typescriptConstraint = { fg = h5 },
        typescriptBlock = { fg = groups.text },
        typescriptIdentifierName = { fg = groups.text_bright },
        typescriptTSInclude = { fg = h5 },
        typescriptCastKeyword = { fg = groups.text_bright },
        typescriptEnum = { fg = groups.nontext },
        typescriptTypeCast = { fg = groups.text_bright },
        typescriptParenExp = { fg = groups.text_bright },
        typescriptObjectType = { fg = groups.comment },

        -- lua
        luaTSConstructor = { fg = groups.comment },

        -- css
        cssTSFunction = { fg = groups.comment },
        cssTSProperty = { fg = h6 },
        cssTSType = { fg = h5 },
        cssTSKeyword = { fg = groups.comment },
        cssClassName = { fg = h1, style = "italic" },
        cssPseudoClass = { fg = groups.link, style = "italic" },
        cssDefinition = { fg = h6 },
        cssTSError = { link = 'cssClassName' },

        -- vim.lsp.buf.document_highlight()
        LspReferenceText = { bg = h6 },
        LspReferenceRead = { bg = h6 },
        LspReferenceWrite = { bg = h6 },

        -- lsp-highlight-codelens
        LspCodeLens = { fg = groups.comment }, -- virtual text of code lens
        LspCodeLensSeparator = { fg = groups.comment }, -- separator between two or more code lens

        -- nvim-ts-rainbow
        rainbowcol1 = { fg = groups.keyword },
        rainbowcol2 = { fg = groups.const2 },
        rainbowcol3 = { fg = groups.str },
        rainbowcol4 = { fg = groups.info },
        rainbowcol5 = { fg = groups.operator },
        rainbowcol6 = { fg = groups.str2 },
        rainbowcol7 = { fg = groups.nontext },

        -- lewis6991/gitsigns.nvim
        GitSignsAdd = { fg = groups.git_add },
        GitSignsChange = { fg = groups.git_change },
        GitSignsDelete = { fg = groups.git_delete },
        SignAdd = { link = 'GitSignsAdd' },
        SignChange = { link = 'GitSignsChange' },
        SignDelete = { link = 'GitSignsDelete' },

        -- folke/which-key.nvim
        WhichKey = { fg = groups.glowing }, -- key
        WhichKeyGroup = { fg = groups.glowing, style = "bold" }, -- key if its a group
        WhichKeySeparator = { fg = groups.punctuation }, -- key-label separator
        WhichKeyDesc = { fg = groups.comment }, -- key description
        WhichKeyFloat = { bg = groups.panel }, -- floating panel
        WhichKeyBorder = { fg = groups.border }, -- border
        WhichKeyValue = { fg = groups.text }, -- value if some plugin provides it

        -- hrsh7th/nvim-cmp
        CmpItemAbbr = { fg = groups.text_bright },
        CmpItemAbbrDeprecated = { fg = groups.error, style = 'strikethrough' },
        CmpItemAbbrMatch = { fg = groups.text, style = 'bold' },
        CmpItemAbbrMatchFuzzy = { fg = h5, style = 'bold' },
        CmpItemKind = { fg = groups.link },
        CmpItemKindClass = { fg = groups.warn },
        CmpItemKindFunction = { fg = groups.hint },
        CmpItemKindInterface = { fg = h6 },
        CmpItemKindMethod = { fg = groups.error },
        CmpItemKindSnippet = { fg = groups.comment },
        CmpItemKindVariable = { fg = h5 },

        -- ray-x/lsp_signature.nvim
        LspSignatureActiveParameter = { bg = groups.comment },

        -- nvim-telescope/telescope.nvim
        TelescopeBorder = { fg = groups.border },
        TelescopeMatching = { fg = groups.glowing },
        TelescopeNormal = { fg = groups.text },
        TelescopePromptNormal = { fg = groups.text },
        TelescopePromptPrefix = { fg = groups.comment },
        TelescopeSelection = { fg = groups.text, bg = groups.comment },
        TelescopeSelectionCaret = { fg = h4, bg = groups.comment },
        TelescopeTitle = { fg = h1 },
    }

    vim.g.terminal_color_0 = groups.background -- black
    vim.g.terminal_color_8 = groups.background -- bright black
    vim.g.terminal_color_1 = groups.error -- red
    vim.g.terminal_color_9 = groups.error -- bright red
    vim.g.terminal_color_2 = h5 -- green
    vim.g.terminal_color_10 = h5 -- bright green
    vim.g.terminal_color_3 = groups.warn -- lightYellow1
    vim.g.terminal_color_11 = groups.warn -- bright lightYellow1
    vim.g.terminal_color_4 = groups.hint -- blue
    vim.g.terminal_color_12 = h6 -- bright blue
    vim.g.terminal_color_5 = h4 -- magenta
    vim.g.terminal_color_13 = h4 -- bright magenta
    vim.g.terminal_color_6 = groups.hint -- brightCyan1
    vim.g.terminal_color_14 = h6 -- bright brightCyan1
    vim.g.terminal_color_7 = groups.glowing -- white
    vim.g.terminal_color_15 = groups.glowing -- bright white

    return theme
end

return M
