local neoscroll = require 'neoscroll'

neoscroll.setup({
    easing = "quadratic",                              -- quadratic / circular / sine
    respect_scrolloff = true,                          -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' }, -- only default mappings
})
