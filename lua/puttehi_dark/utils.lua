local utils = {}

local function byte(value, offset)
  return bit.band(bit.rshift(value, offset), 0xFF)
end

-- color is: #RRGGBB or nvim_get_color_by_name byte value

local function rgb(color)

  color_type = type(color)
  -- #RRGGBB
  if color_type == "string" then
      -- assuming it's correctly formatted already
      color = vim.api.nvim_get_color_by_name(color)
  end
  -- byte value (number) - do nothing, already what we are looking for

  if color == -1 then
    color = vim.opt.background:get() == 'dark' and 000 or 255255255
  end

  return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

local function print_to_vim(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

local function parse_color(color)
  color_type = type(color)
  if color_type ~= "string" then
    return print_to_vim({'invalid color', color_type, color})
  end

  if not color:find '#' and color ~= 'none' then
    color = require('puttehi_dark.palette')[color] or vim.api.nvim_get_color_by_name(color)
  end

  return color
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 (background) and 1 (foreground)
utils.blend = function(fg, bg, alpha)
  fg = rgb(parse_color(fg))
  bg = rgb(parse_color(bg))

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
