local builtin = require('telescope.builtin')

local map = vim.keymap.set

vim.g.mapleader = " "

map('n', '<leader>pf', builtin.find_files, {}) 	-- main use
map('n', '<C-p>', builtin.git_files, {})		-- browse git files
map('n', '<leader>ps', function() 				-- Can find <input> inside project files
	builtin.grep_string( { search = vim.fn.input("Grep > ") }); 
end)

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })

-- IDK about this one
-- map('n', '<leader>fg', builtin.live_grep, {})
-- map('n', '<leader>fb', builtin.buffers, {})
-- map('n', '<leader>fh', builtin.help_tags, {})
