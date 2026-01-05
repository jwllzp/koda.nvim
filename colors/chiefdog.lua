local config = require("chiefdog.config")
local groups = require("chiefdog.groups")

-- Determine which palette to load
local palette_name = vim.o.background -- "dark" or "light"
local palette = require("chiefdog.palette." .. palette_name)

-- Clear existing highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "chiefdog"

-- Generate and apply highlights
local hl_groups = groups.setup(palette, config.options)

for group, hl in pairs(hl_groups) do
	vim.api.nvim_set_hl(0, group, hl)
end
