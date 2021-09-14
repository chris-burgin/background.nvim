local M = {}
local opts = {
	ms = 60 * 1000, -- 60 seconds
	hour = 17, -- 5pm
}

function M.check_which_theme()
	local hour = os.date("*t").hour
	if (hour > opts.hour) then
		vim.opt.background = 'dark'
	else
		vim.opt.background = 'light'
	end
end

function M.setup(options)
	if (options) then
		if (options.ms) then
			opts = options.ms
		end

		if (options.hour) then
			opts = options.hour
		end
	end

	M.check_which_theme();

	if (vim.g.background_nvim_timer) then
		vim.cmd("call timer_stop(" .. vim.g.background_nvim_timer .. ")")
	end

	vim.cmd([[
			func! ThemeChecker(timer)
				lua require('background_nvim').check_which_theme()
			endfunc
			let g:background_nvim_timer = timer_start(]] .. opts.ms .. [[, 'ThemeChecker', {'repeat': -1})
	]])
end

return M
