--[[ require 'poimandres.highlights' ]]
local utils = require 'puttehi_dark.utils'

local M = {}

local config = {
    bold_vert_split = false,
    dark_variant = 'main',
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    dim_nc_background = false,

    groups = {
        background = 'background2',
        background_float = 'background4',
        background_bright = 'background5',
        panel = 'background1',
        panel_float = 'background3',
        border = 'lightTeal1',
        comment = 'lightGray3',
        link = 'darkCyan1',
        punctuation = 'darkCyan1',
        text = 'text',
        text_bright = 'lightSilver1',
        glowing = 'white',
        nontext = 'darkBlue1',

        -- coding stuff
        const = 'lightSilver1',
        const2 = 'darkYellow1',
        str = 'lightBlue1',
        str2 = 'brightCyan1',
        varname = 'brightRed1',
        vartype = 'darkYellow1',
        func = 'lightBlue1',
        operator = 'darkCyan1',
        ifelse = 'brightRed1',
        keyword = 'brightRed1',

        error = 'lightRed1',
        hint = 'brightCyan1',
        info = 'darkCyan1',
        warn = 'lightYellow1',

        git_add = 'lightBlue1',
        git_change = 'darkYellow1',
        git_delete = 'lightRed1',
        git_dirty = 'darkBlue1',
        git_ignore = 'lightGray2',
        git_merge = 'darkYellow1',
        git_rename = 'lightTeal1',
        git_stage = 'brightCyan1',
        git_text = 'brightRed1',

        headings = {
            h1 = 'lightYellow1',
            h2 = 'darkYellow1',
            h3 = 'lightBlue1',
            h4 = 'darkBlue1',
            h5 = 'brightCyan1',
            h6 = 'darkCyan1',
        },
    },
    highlight_groups = {},
}

function M.setup(opts)
    opts = opts or {}
    -- vim.g.poimandres_variant = opts.dark_variant or 'main'

    -- if headings were given as a single string, set all to same string
    if opts.groups and type(opts.groups.headings) == 'string' then
        opts.groups.headings = {
            h1 = opts.groups.headings,
            h2 = opts.groups.headings,
            h3 = opts.groups.headings,
            h4 = opts.groups.headings,
            h5 = opts.groups.headings,
            h6 = opts.groups.headings,
        }
    end

    config.user_variant = opts.dark_variant or nil
    config = vim.tbl_deep_extend('force', config, opts)
end

function M.colorscheme()
    --if vim.g.colors_name then
    --    vim.cmd 'hi clear'
    --end

    vim.opt.termguicolors = true
    vim.g.colors_name = 'puttehi_dark'

    local theme = require('puttehi_dark.theme').get(config)

    -- Set theme highlights
    for group, color in pairs(theme) do
        -- Skip highlight group if user overrides
        if config.highlight_groups[group] == nil then
            utils.highlight(group, color)
        end
    end

    -- Set user highlights
    for group, color in pairs(config.highlight_groups) do
        utils.highlight(group, color)
    end
end

return M
