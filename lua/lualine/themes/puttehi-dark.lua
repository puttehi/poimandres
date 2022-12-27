local palette = require('puttehi-dark.palette')

local puttehi-dark = {}

puttehi-dark.normal = {
	a = { fg = palette.background2, bg = palette.teal1, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
	c = { fg = palette.blueGray1, bg = palette.none },
}

puttehi-dark.insert = {
	a = { fg = palette.background2, bg = palette.blue1, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

puttehi-dark.visual = {
	a = { fg = palette.background2, bg = palette.yellow, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

puttehi-dark.replace = {
	a = { fg = palette.background2, bg = palette.pink3, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

puttehi-dark.command = {
	a = { fg = palette.background2, bg = palette.yellow, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

puttehi-dark.inactive = {
	a = { fg = palette.blueGray3, bg = palette.background1, gui = 'bold' },
	b = { fg = palette.blueGray3, bg = palette.background1 },
	c = { fg = palette.blueGray3, bg = palette.none },
}

return puttehi-dark
