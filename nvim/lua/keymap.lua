--
-- function Map(mode, lhs, rhs, opts)
--     local options = { noremap = true, silent = true }      -- disable recursive Mappings + no feedback about command completion
--     if opts then
--         options = vim.tbl_extend("force", options, opts)   -- rewrite options if presented
--     end
--     vim.keymap.set(mode, lhs, rhs, options)
-- end

-- ╔═══════════════════════╗
-- ║    General Keymaps    ║
-- ╚═══════════════════════╝

-- btw `Mapleader` is not an error, but it wouldn't work...
vim.g.mapleader = " " -- <leader> is now whitespace

-- System buffer
vim.keymap.set({ 'n', 'v' }, '<leader>sy', '"+y') -- selected
vim.keymap.set({ 'n', 'v' }, '<leader>sY', '"+Y') -- whole line

vim.keymap.set({ 'n', 'v' }, '<leader>sd', '"+d') -- selected
vim.keymap.set({ 'n', 'v' }, '<leader>sD', '"+D') -- whole line

vim.keymap.set('n', '<leader>sp', '"+p')          -- after cursor (Somehow it's slow*)
vim.keymap.set('n', '<leader>sP', '"+P')          -- before cursor

-- (NOT RLY USEFUL) Split navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- drag selected text 1 line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- drag selected text 1 line down

vim.keymap.set("v", "<", "<gv")              -- drag 1 tab left (and don't lose selection!)
vim.keymap.set("v", ">", ">gv")              -- drag 1 tab right (and don't lose selection!)

-- Basic stuff enchancements
vim.keymap.set("n", "J", "mzJ`z") -- concatenate lines, BUT keeps cursor position

-- through neoscroll animation setup!
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")    -- scroll down AND center cursor pos on screen
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")    -- scroll up AND center cursor pos on screen
-- vim.keymap.set("n", "n", "nzzzv")          -- find next occurence AND center cursor + open fold
-- vim.keymap.set("n", "N", "Nzzzv")          -- find previous occurence AND center cursor + open fold

-- Misellaneous
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- sync new changes in config with current session
