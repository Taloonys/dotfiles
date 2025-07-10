local opt              = vim.opt -- aka options

-- ru-en layouts transfer
vim.g.translate_source = 'ru'
vim.g.translate_target = 'en'

-- ui enhacements
opt.termguicolors      = true -- 24-bit rgb color support

-- lines
opt.number             = true
opt.relativenumber     = true
opt.cursorline         = true

-- tabulation
opt.shiftwidth         = 4    -- shift left 4 spaces on tab press
opt.tabstop            = 4    -- 1 tab = 4 spaces
opt.expandtab          = true -- tab is made by spaces
opt.smartindent        = true -- new line auto tabbed

-- splits
opt.splitright         = true -- vertical split вправо
opt.splitbelow         = true -- horizontal split вниз

-- miscellaneous
opt.mouse              = "a" -- allow mouse input
opt.showmode           = false
