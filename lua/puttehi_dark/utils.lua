local utils = {}

local function byte(value, offset)
    return bit.band(bit.rshift(value, offset), 0xFF)
end

-- color is: #RRGGBB or nvim_get_color_by_name byte value

local function rgb(color)
    local color_type = type(color)
    -- #RRGGBB
    if color_type == "string" then
        -- assuming it's correctly formatted already
        color = vim.api.nvim_get_color_by_name(color)
    end

    if color == -1 then
        color = vim.opt.background:get() == 'dark' and 000 or 255255255
    end

    return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

local function parse_color(color)
    local color_type = type(color)
    if color_type ~= "string" then
        print(vim.inspect({ 'invalid color', color_type, color }))
        return
    end

    if not color:find '#' and color ~= 'none' then
        color = require('puttehi_dark.palette')[color] or vim.api.nvim_get_color_by_name(color)
    end

    return color
end

---@param f string foreground color
---@param b string background color
---@param alpha number number between 0 (background) and 1 (foreground)
utils.blend = function(f, b, alpha)
    local fg = rgb(parse_color(f))
    local bg = rgb(parse_color(b))

    local function blend_channel(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end

---@param group string
---@param color table<string, string>
utils.highlight = function(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. parse_color(color.fg) or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. parse_color(color.bg) or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. parse_color(color.sp) or ''

    vim.cmd(string.format('highlight %s %s %s %s %s', group, style, fg, bg, sp))

    if color.link then
        vim.cmd(string.format('highlight! link %s %s', group, color.link))
    end
end

return utils
