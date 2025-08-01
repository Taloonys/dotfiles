return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require "colorizer".setup() -- required call!!
        vim.keymap.set("n", "<leader>clr", ":ColorizerToggle<CR>")
    end
}
