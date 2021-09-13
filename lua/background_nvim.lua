function check_which_theme()
	local hour = os.date("*t").hour
	if (hour > 16) then
		vim.opt.background = 'dark'
	else
		vim.opt.background = 'light'
	end
end

local background_nvim = {}

local function background_nvim.setup(options)
	vim.g.BackgroundNvimMS = options.ms

	check_which_theme();
	
	vim.cmd([[
			func! ThemeChecker(timer)
				lua check_which_theme()
			endfunc
			let timer = timer_start(g:BackgroundNvimMS, 'ThemeChecker', {'repeat': -1})
	]])
end

return background_nvim
