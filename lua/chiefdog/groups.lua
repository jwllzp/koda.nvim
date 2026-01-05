-- lua/chiefdog/groups.lua
local utils = require("chiefdog.utils")
local config = require("chiefdog.config")

local M = {}

local function fg_groups(c)
	return {
		Normal = { bg = c.bg, fg = c.fg },
		NormalFloat = { bg = c.bg, fg = c.fg },
		FloatBorder = { bg = c.bg, fg = c.line },
		Cursor = { bg = c.definition, fg = c.bg },
		TermCursor = { link = "Cursor" },
		CursorLine = { bg = c.cursor }, -- TODO: why is CursorLine not colored by line??
		CursorLineNr = { fg = c.definition, bold = true },
		LineNr = { fg = c.line },
		StatusLine = { bg = c.cursor, fg = c.fg },
		StatusLineNC = { bg = c.bg, fg = c.fg },
		StatusLineTerm = { bg = c.cursor, fg = c.fg },
		StatusLineTermNC = { bg = c.bg, fg = c.line },
		WinBar = { bg = c.bg, fg = c.fg, bold = true },
		WinBarNC = { bg = c.bg, fg = c.line },
		WinSeparator = { fg = c.line },
		Pmenu = { fg = c.fg, bg = c.transparent },
		PmenuSel = { bg = c.selection, fg = c.definition, bold = true },
		PmenuThumb = { bg = c.fg },
		PmenuMatch = { fg = c.constant, bold = true },
		Visual = { fg = c.definition, bg = c.selection },
		Search = { bg = c.constant, fg = c.bg },
		IncSearch = { link = "Search" },
		CurSearch = { link = "Search" },
		MatchParen = { fg = c.fg, bg = c.line },
		NonText = { fg = c.cursor },
		EndOfBuffer = { fg = c.bg },
		Question = { fg = c.constant },
		MoreMsg = { fg = c.constant },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.constant },
		ModeMsg = { fg = c.constant },
		Directory = { fg = c.hint },
		QuickFixLine = { fg = c.constant, underline = true },
		qfLineNr = { fg = c.line },

		-- Syntax
		Keyword = { fg = c.keyword },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { link = "Keyword" },
		Exception = { link = "Keyword" },
		Statement = { link = "Keyword" },
		Operator = { link = "Keyword" },
		Delimiter = { fg = c.definition },
		Type = { link = "Keyword" },
		Structure = { link = "Keyword" },
		Identifier = { fg = c.fg },
		PreProc = { link = "Keyword" },
		Include = { link = "Keyword" },
		Define = { link = "Keyword" },
		PreCondit = { link = "Keyword" },
		StorageClass = { link = "Keyword" },
		Typedef = { link = "Keyword" },
		Tag = { link = "Keyword" },
		Function = { fg = c.definition, bold = true },
		Title = { fg = c.definition, bold = true },
		String = { fg = c.definition, italic = false },
		Character = { link = "String" },
		Number = { fg = c.constant },
		Boolean = { fg = c.constant },
		Float = { fg = c.constant },
		Constant = { fg = c.constant },
		Macro = { fg = c.constant },
		Comment = { fg = c.comment, italic = true },
		Todo = { fg = c.bg, bg = c.hint, bold = true },
		Special = { fg = c.fg },
		SpecialChar = { link = "Special" },
		SpecialComment = { link = "Comment" },
		Underlined = { underline = true },
		Error = { fg = c.error },
		Debug = { fg = c.constant },
		LspInlayHint = { fg = c.comment },

		-- Treesitter
		["@function"] = { link = "Function" },
		["@function.call"] = { fg = c.fg },
		["@function.builtin"] = { fg = c.fg },
		["@function.macro"] = { link = "Macro" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { fg = c.fg },

		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.return"] = { fg = c.definition },
		["@keyword.conditional"] = { link = "Conditional" },
		["@keyword.exception"] = { link = "Exception" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.operator"] = { link = "Operator" },
		["@operator"] = { link = "Operator" },
		["@punctuation"] = { link = "Keyword" },
		["@punctuation.delimiter"] = { fg = c.definition },
		["@punctuation.bracket"] = { fg = c.definition },
		["@punctuation.special"] = { fg = c.definition },

		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { link = "Constant" },
		["@variable.parameter"] = { link = "Identifier" },
		["@variable.member"] = { link = "Identifier" },
		["@property"] = { link = "Identifier" },
		["@attribute"] = { link = "Keyword" },
		["@module"] = { link = "Structure" },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@string"] = { link = "String" },
		["@string.regexp"] = { link = "String" },
		["@string.escape"] = { link = "Special" },
		["@string.special"] = { link = "Special" },
		["@character"] = { link = "Character" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@constructor"] = { link = "Identifier" },

		["@tag"] = { link = "Keyword" },
		["@tag.delimiter"] = { link = "Keyword" },
		["@tag.attribute"] = { link = "Keyword" },

		["@markup.heading"] = { link = "Title" },
		["@markup.italic"] = { fg = c.fg, italic = true },
		["@markup.strong"] = { fg = c.fg, bold = true },
		["@markup.link"] = { link = "Underlined" },
		["@markup.link.uri"] = { link = "Underlined" },
		["@markup.list"] = { fg = c.constant },
		["@markup.raw"] = { link = "Constant" },
		["@markup.quote"] = { link = "Comment" },

		-- Diff / Git
		DiffAdd = { fg = c.add, bg = utils.blend(c.add, c.bg, 0.2) },
		DiffChange = { fg = c.change, bg = utils.blend(c.change, c.bg, 0.2) },
		DiffDelete = { fg = c.delete, bg = utils.blend(c.delete, c.bg, 0.2) },
		DiffText = { fg = c.change, bg = utils.blend(c.change, c.bg, 0.4) },

		["@text.diff.add"] = { link = "DiffAdd" },
		["@text.diff.delete"] = { link = "DiffDelete" },
		["@diff.plus"] = { link = "GitSignsAdd" },
		["@diff.minus"] = { link = "GitSignsDelete" },
		["@diff.delta"] = { link = "GitSignsChange" },

		-- Diagnostics
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.constant },
		DiagnosticHint = { fg = c.hint },
		DiagnosticInfo = { fg = c.fg },

		-- Gitsigns
		GitSignsAdd = { fg = c.add },
		GitSignsChange = { fg = c.change },
		GitSignsDelete = { fg = c.delete },

		-- Blink
		BlinkCmpLabelMatch = { fg = c.constant },

		-- Mini.pick
		MiniPickMatchRanges = { fg = c.constant },

		-- Oil
		OilCreate = { fg = c.add },

		-- Snacks
		SnacksPickerDir = { fg = c.keyword },
		SnacksPickerMatch = { fg = c.constant },
	}
end

local function bg_groups(c)
	-- Ensure we have a safe background color for blending
	local base_bg = (c.bg == "none" or not c.bg) and "#ffffff" or c.bg

	return {
		Normal = { bg = c.bg, fg = c.fg }, -- Main text is typically black/dark grey

		-- Logic: Text is dark, Background gets the color "Aura"
		Function = { fg = c.fg, bold = true }, -- No color, just bold
		String = { fg = c.fg, bg = utils.blend(c.string, base_bg, 0.15) },
		Constant = { fg = c.fg, bg = utils.blend(c.constant, base_bg, 0.2) },

		-- Keywords usually recede in this style (light grey), no background
		Keyword = { fg = c.keyword },

		-- ... (Add other BG-style groups here) ...
	}
end

function M.setup(palette)
	local p = vim.tbl_deep_extend("force", palette, config.options.overrides.palette or {})

	local groups = {}

	if vim.o.background == "light" and config.options.style == "background" then
		groups = bg_groups(p)
	else
		groups = fg_groups(p)
	end

	local ui_groups = {
		Cursor = { bg = p.cursor, fg = p.bg },
		LineNr = { fg = p.comment },
		Pmenu = { fg = p.fg, bg = p.transparent },
		Visual = { bg = p.selection },
	}

	groups = vim.tbl_deep_extend("force", groups, ui_groups)

	-- Apply User Overrides
	return vim.tbl_deep_extend("force", groups, config.options.overrides.groups or {})
end

return M
