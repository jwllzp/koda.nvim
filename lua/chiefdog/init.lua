-- lua/chiefdog/init.lua
local M = {}
local config = require("chiefdog.config")

---@param opts table|nil User configuration
function M.setup(opts)
	config.setup(opts)
end

-- call require("chiefdog").load() to force-reload the theme manually.
function M.load()
	vim.cmd("colorscheme chiefdog")
end

return M
