local builtin = require('telescope.builtin')

local map = vim.keymap.set

vim.g.mapleader = " "

map('n', '<leader>pf', builtin.find_files, {}) 	            -- main use
map('n', '<C-p>', builtin.git_files, {})		            -- browse git files
map('n', '<leader>ps', function() 				            -- Can find <input> inside project files
	builtin.grep_string( { search = vim.fn.input("Grep > ") });
end)
map('n', '<leader>vh', builtin.help_tags, {})	-- find through manual

map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")   -- find all files (include hidden)
map("n", "<leader>fe", "<cmd> Telescope file_browser <CR>")

-- Buffers overview
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
