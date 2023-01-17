-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- stylua: ignore
-- source: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/powerline.lua

local palette = require('puttehi_dark.palette')

-- powerline colors
local Colors = {
    white        = '#ffffff', -- insert bg a, replace fg a
    darkestgreen = '#005f00', -- normal fg a
    brightgreen  = '#afdf00', -- normal bg a
    darkestcyan1 = '#005f5f', -- insert fg a
    mediumcyan1  = '#87dfff', -- insert fg b c, insert bg b
    darkestblue  = '#005f87', -- insert fg c
    darkred      = '#870000', -- visual fg a
    brightRed1   = '#df0000', -- replace bg a
    brightorange = '#ff8700', -- visual bg a
    gray1        = '#262626', -- inactive fg a b, normal bg c
    gray2        = '#303030',
    -- gray4          = '#585858', -- unused
    gray5        = '#606060', -- inactive bg a b, inactive fg c, normal bg b
    gray7        = '#9e9e9e', -- normal fg b
    gray10       = '#f0f0f0', -- normal fg b
}

-- override with custom palette
Colors.white = palette.white
Colors.darkestgreen = palette.lightTeal1
Colors.darkestcyan1 = palette.darkCyan1
Colors.mediumcyan1 = palette.brightCyan1
Colors.darkestblue = palette.darkBlue1
Colors.darkred = palette.lightRed1 -- TODO: Use some dark brown on top of darkYellow1?
Colors.brightRed1 = palette.brightRed1
Colors.brightorange = palette.darkYellow1
-- Shift gray1 -> 2 and replace 1 with even darker override
Colors.gray2 = Colors.gray1
Colors.gray1 = palette.background2 -- background1 is editor bg, shouldn't blend..
Colors.gray5 = palette.lightGray2
Colors.gray10 = palette.lightSilver1

local puttehi_dark = {
    normal = {
        a = {
            fg = Colors.darkestgreen,
            bg = Colors.brightgreen,
            gui = 'bold'
        },
        b = {
            fg = Colors.gray10,
            bg = Colors.gray5
        },
        c = {
            fg = Colors.gray7,
            bg = Colors.gray2
        },
    },
    insert = {
        a = {
            fg = Colors.darkestcyan1,
            bg = Colors.white,
            gui = 'bold'
        },
        b = {
            fg = Colors.darkestcyan1,
            bg = Colors.mediumcyan1
        },
        c = {
            fg = Colors.mediumcyan1,
            bg = Colors.darkestblue
        },
    },
    visual = {
        a = {
            fg = Colors.darkred,
            bg = Colors.brightorange,
            gui = 'bold'
        }
    },
    replace = {
        a = {
            fg = Colors.white,
            bg = Colors.brightRed1,
            gui = 'bold'
        }
    },
    inactive = {
        a = {
            fg = Colors.gray2,
            bg = Colors.gray5,
            gui = 'bold'
        },
        b = {
            fg = Colors.brightorange,
            bg = Colors.gray5,
            gui = 'bold'
        },
        c = {
            fg = Colors.gray5,
            bg = Colors.gray1
        },
    },
}

return puttehi_dark
