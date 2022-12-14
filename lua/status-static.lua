local M = {}

function M.run()
	local modules = require('status-static.modules')

	return table.concat {
		modules.mode(),
		modules.file_size(),
		modules.fileName(),
		modules.LSP_status() or '',
		modules.LSP_Diagnostics(),

		'%=',
		modules.LSP_progress(),
		'%=',

		modules.git(),
		modules.cwd(),
		modules.cursor_position(),
	}
end

M.setup = function()
	vim.opt.statusline = "%!v:lua.require('status-static').run()"
end

return M
