local extensions = require('el.extensions')
local subscribe = require('el.subscribe')
local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')

local generator = function()
	local segments = {}

	table.insert(segments, '[ GOD MODE ]')

	-- Option 2, just a function that returns a string.
	table.insert(segments, extensions.gen_mode{
        format_string = ' %s '
    })

	-- mode returns the current mode.
	-- ...
	table.insert(segments, subscribe.buf_autocmd(
		"el_git_status",
		"BufWritePost",
		function(window, buffer)
			return extensions.git_changes(window, buffer)
		end
	))
	table.insert(segments, subscribe.buf_autocmd(
		"el_git_branch",
		"BufEnter",
		function(window, buffer)
			return extensions.git_branch(window, buffer)
		end
	))
	table.insert(
		segments,
		subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, buffer)
			return extensions.file_icon(_, buffer)
		end)
	)

	return segments
end

require('el').setup({generator = generator})
