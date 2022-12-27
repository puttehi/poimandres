--- palette variants
local variants = {
  main = { -- main palette
    yellow = '#E1B800', -- copy+visual modes, warn, buffertarget etc.
    teal1 = '#3465A4', -- normal mode, types, html h1h2, ts keywords,
    teal2 = '#CC0000', -- git_text, ```, return, cssClass, ...
    teal3 = '#42675A', -- git_rename
    blue1 = '#89DDFF', -- insert mode, git_stage, hint, md h5+link, border, spellcap+rare
    blue2 = '#FCE94F', -- git change, md h1-h4, funct, incsearch
    blue3 = '#69ABBC', -- link, punct, info, more, status, tab, keyword, exc, cssClass, ..
    blue4 = '#729FCF', -- git_dirty, nontext, ts-enum
    pink1 = '#FAE4FC', -- not used
    pink2 = '#AD7FA8', -- telescope selection
    pink3 = '#EE5555', -- replace, Errors
    blueGray1 = '#555753', -- comment, bufferinac/visible, treepicker, cssTSFuncKeyword
    blueGray2 = '#d3d7cf', -- titles
    blueGray3 = '#454743', -- linenr, matchparen, search
    background1 = '#2B2D2B',
    background2 = '#1D1E1D',
    background3 = '#0B0C0B',
    text = '#AAAAAA',
    white = '#EEEEEC',
    none = 'NONE',
  },
}

local palette = {}

palette = variants.main

-- if vim.o.background == "light" then
-- 	palette = variants.main
-- else
-- 	palette = variants[(vim.g.poimandres_variant == "storm" and "storm") or "main"]
-- end

return palette
