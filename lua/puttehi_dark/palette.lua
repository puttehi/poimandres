--- palette variants
local variants = {
  main = { -- main palette
    darkYellow1 = '#E1B800', -- git change, md h1-h4, funct, incsearch
    lightYellow1 = '#FCE94F', -- copy+visual modes, warn, buffertarget etc.
    lightTeal1 = '#42675A', -- git_rename
    darkBlue1 = '#3465A4', -- git_dirty, nontext, ts-enum
    lightBlue1 = '#729FCF', -- normal mode, types, html h1h2, ts keywords
    darkCyan1 = '#69ABBC', -- link, punct, info, more, status, tab, keyword, exc, cssClass, ..
    brightCyan1 = '#89DDFF', -- insert mode, git_stage, hint, md h5+link, border, spellcap+rare
    lightMagenta1 = '#AD7FA8', -- telescope selection
    lightPink1 = '#FAE4FC', -- not used
    lightRed1 = '#EE5555', -- replace, Errors
    brightRed1 = '#EF2929', -- git_text, ```, return, cssClass, ...
    lightGray2 = '#505050', -- comment, bufferinac/visible, treepicker, cssTSFuncKeyword
    lightGray3 = '#505050', -- linenr, matchparen, search
    lightSilver1 = '#D3D7CF', -- titles
    background1 = '#0A0B0B',
    background2 = '#0B0C0B',
    background3 = '#1D1E1D',
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
