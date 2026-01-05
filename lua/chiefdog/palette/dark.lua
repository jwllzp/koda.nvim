-- lua/chiefdog/palette/dark.lua
local utils = require("chiefdog.utils")

return {
	transparent = "none",
	bg = "#101010",
	fg = "#b0b0b0",
	comment = "#50585d",
	line = "#444444",
	keyword = "#777777",
	definition = "#ffffff",
	constant = "#d9ba73",
	hint = "#8ebeec",
	cursor = "#272727",
	selection = utils.blend("#0058D0", "#101010", 0.4),
	search = "#333333",
	error = "#ff7676",
	add = "#86CD82",
	change = "#d9ba73",
	delete = "#ff7676",
}
