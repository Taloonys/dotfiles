require 'overseer'.setup({
	vim.keymap.set('n', "<leader>jr", ":OverseerRun<CR>"),
	vim.keymap.set('n', "<leader>jv", ":OverseerToggle<CR>")
})
