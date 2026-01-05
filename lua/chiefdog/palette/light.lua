local utils = require("chiefdog.utils")

return {
	transparent = "none",
	bg = "#fAf9F5",
	fg = "#101010",
	comment = "#808080",
	line = "#EBEBEB",
	keyword = "#202020",
	string = "#86cd82",
	definition = "#8ebeec",
	constant = "#d9ba73",
	hint = "#8ebeec",
	cursor = "#D6D6D6",
	selection = utils.blend("#0058D0", "#FAF9F5", 0.4),
	search = "#FFE66D",
	error = "#ff7676",
	add = "#86CD82",
	change = "#d9ba73",
	delete = "#ff7676",
}
