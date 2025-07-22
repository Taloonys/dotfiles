return {
    "sindrets/diffview.nvim",
    config = function()
        vim.keymap.set("n", "<leader>dif", ":DiffviewOpen<CR>")
    end
}
