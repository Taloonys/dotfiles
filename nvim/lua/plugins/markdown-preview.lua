return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- you have to install yarn manually
    -- windows => winget install -e --id Yarn.Yarn
    -- if prebuild is not found => call manually in nvim `:call mkdp#util#install()`
    -- TODO: mdeval.nvim or sniprun.nvim
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        -- MarkDown View
        vim.keymap.set("n", "<leader>mdv", ":MarkdownPreview<CR>")
    end
}
