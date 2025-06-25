local opt = vim.opt -- aka options

-- lines
opt.number 			= true                   
opt.relativenumber 	= true          

-- tabulation
opt.shiftwidth 	= 4					-- short tab
opt.tabstop 	= 4					-- short tab
opt.smartindent = true				-- new line auto tabbed
opt.splitright  = true              -- vertical split вправо
opt.splitbelow  = true              -- horizontal split вниз

-- miscellaneous
opt.mouse	= "a"				-- allow mouse input
