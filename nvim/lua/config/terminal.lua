require("toggleterm").setup({
    -- [[
    -- Settings are applied only by wsl (for example) relaunching...
    -- ]]
    open_mapping = [[<c-\>]],
    -- shell = "nu",
    shell = "powershell.exe",
    autochdir = false,
    direction = "float",
    float_opts = {
        border = "rounded", -- also possible "single", "double", "shadow"
        width = function() return math.floor(vim.o.columns * 0.8) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
        winblend = 0,        -- transperancy (0-100)
    },
    shade_terminals = false, -- idk, but required for float
    persist_size = false,
    persist_mode = false,
})
