function check_which_theme()
	local hour = os.date("*t").hour
	if (hour > vim.g.BackgroundNvimHour - 1) then
		vim.opt.background = 'dark'
	else
		vim.opt.background = 'light'
	end
end

local M = {}

function M.setup(options)
	if (not(vim.g.BackgroundNvimMS)) then
		vim.g.BackgroundNvimMS = 60000
	end

	if (not(vim.g.BackgroundNvimHour)) then
		vim.g.BackgroundNvimHour = 17
	end

	if (options) then
		if (options.ms) then
			vim.g.BackgroundNvimMS = options.ms
		end

		if (options.hour) then
			vim.g.BackgroundNvimHour = options.hour
		end
	end

	check_which_theme();
	
	vim.cmd([[
			func! ThemeChecker(timer)
				lua check_which_theme()
			endfunc
			let timer = timer_start(g:BackgroundNvimMS, 'ThemeChecker', {'repeat': -1})
	]])
end

return M
