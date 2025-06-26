vim.g.Mapleader = " "       -- <leader> is now whitespace

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }      -- disable recursive Mappings + no feedback about command completion
    if opts then
        options = vim.tbl_extend("force", options, opts)   -- rewrite options if presented
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- System buffer
Map({'n', 'v'}, '<leader>sy', '"+y') -- selected
Map({'n', 'v'}, '<leader>sY', '"+Y') -- whole line

Map({'n', 'v'}, '<leader>sd', '"+d') -- selected
Map({'n', 'v'}, '<leader>sD', '"+D') -- whole line

Map('n', '<leader>sp', '"+p')  -- after cursor (Somehow it's slow*)
Map('n', '<leader>sP', '"+P')  -- before cursor

-- Split navigation
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")

Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual mode
Map("v", "J", ":m '>+1<CR>gv=gv") -- drag selected text 1 line up
Map("v", "K", ":m '<-2<CR>gv=gv") -- drag selected text 1 line down

Map("v", "<", "<gv")  -- drag 1 tab left (and don't lose selection!)
Map("v", ">", ">gv")  -- drag 1 tab right (and don't lose selection!)

-- Tabs
Map("n", "<TAB>", ":bn<CR>")
Map("n", "<S-TAB>", ":bp<CR>")
Map("n", "<leader>bd", ":bd<CR>") 

-- Basic stuff enchancements
Map("n", "J", "mzJ`z")          -- concatenate lines, BUT keeps cursor position
Map("n", "<C-d>", "<C-d>zz")    -- scroll down AND center cursor pos on screen
Map("n", "<C-u>", "<C-u>zz")    -- scroll up AND center cursor pos on screen
Map("n", "n", "nzzzv")          -- find next occurence AND center cursor + open fold
Map("n", "N", "Nzzzv")          -- find previous occurence AND center cursor + open fold
