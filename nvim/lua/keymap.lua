local map 	= vim.keymap.set

--[[ Could be used
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }      -- disable recursive mappings + no feedback about command completion
    if opts then
        options = vim.tbl_extend("force", options, opts)  -- rewrite options if presented
    end
    vim.keymap.set(mode, lhs, rhs, options)
end
--]]

vim.g.mapleader = " "

-- Defaults edit
map('n', '<leader>pv', vim.cmd.Ex)

-- System buffer
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- selected
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- whole line

vim.keymap.set({'n', 'v'}, '<leader>d', '"+d') -- selected
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D') -- whole line

vim.keymap.set('n', '<leader>p', '"+p')  -- after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- before cursor

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- drag selected text 1 line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- drag selected text 1 line down

vim.keymap.set("v", "<", "<gv")  -- drag 1 tab left (and don't lose selection!)
vim.keymap.set("v", ">", ">gv")  -- drag 1 tab right (and don't lose selection!)

-- Tabs
vim.keymap.set("n", "<TAB>", ":bn<CR>")
vim.keymap.set("n", "<S-TAB>", ":bp<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>") 

-- Basic stuff enchancements
vim.keymap.set("n", "J", "mzJ`z")          -- concatenate lines, BUT keeps cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz")    -- scroll down AND center cursor pos on screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")    -- scroll up AND center cursor pos on screen
vim.keymap.set("n", "n", "nzzzv")          -- find next occurence AND center cursor + open fold
vim.keymap.set("n", "N", "Nzzzv")          -- find previous occurence AND center cursor + open fold
