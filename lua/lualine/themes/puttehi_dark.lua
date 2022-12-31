-- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/powerline.lua
-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local Colors = {
  white          = '#ffffff',
  darkestgreen   = '#005f00',
  brightgreen    = '#afdf00',
  darkestcyan1    = '#005f5f',
  mediumcyan1     = '#87dfff',
  darkestblue    = '#005f87',
  darkred        = '#870000',
  brightRed1      = '#df0000',
  brightorange   = '#ff8700',
  gray0          = '#131313',
  gray1          = '#262626',
  gray2          = '#303030',
  gray4          = '#585858',
  gray5          = '#606060',
  gray7          = '#9e9e9e',
  gray10         = '#f0f0f0',
}

local puttehi_dark = {
  normal = {
    a = { fg = Colors.darkestgreen, bg = Colors.brightgreen, gui = 'bold' },
    b = { fg = Colors.gray10, bg = Colors.gray5 },
    c = { fg = Colors.gray7, bg = Colors.gray1 },
  },
  insert = {
    a = { fg = Colors.darkestcyan1, bg = Colors.white, gui = 'bold' },
    b = { fg = Colors.darkestcyan1, bg = Colors.mediumcyan1 },
    c = { fg = Colors.mediumcyan1, bg = Colors.darkestblue },
  },
  visual = { a = { fg = Colors.darkred, bg = Colors.brightorange, gui = 'bold' } },
  replace = { a = { fg = Colors.white, bg = Colors.brightRed1, gui = 'bold' } },
  inactive = {
    a = { fg = Colors.gray1, bg = Colors.gray5, gui = 'bold' },
    b = { fg = Colors.gray1, bg = Colors.gray5 },
    c = { fg = Colors.gray5, bg = Colors.gray0 },
  },
}

return puttehi_dark
