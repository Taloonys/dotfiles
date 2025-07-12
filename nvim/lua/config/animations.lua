local neoscroll = require 'neoscroll'

neoscroll.setup({
    easing_function = "quadratic", -- Плавность анимации
    respect_scrolloff = true,      -- Учитывать scrolloff при скроллинге:cite[4]
})

-- scroll + center
local function scroll_with_center(direction)
    return function()
        if direction == "up" then
            neoscroll.scroll(-vim.wo.scroll, true, 250)
        else
            neoscroll.scroll(vim.wo.scroll, true, 250)
        end
        -- eventual center screen
        vim.schedule(function()
            vim.cmd("normal! zz")
        end)
    end
end

-- search (by n/N) + center
local function search_with_center(forward)
    return function()
        vim.cmd(forward and "normal! n" or "normal! N")
        vim.schedule(function()
            vim.cmd("normal! zzzv")
        end)
    end
end

local keymap = {
    -- Скролл с центрированием
    ["<C-u>"] = scroll_with_center("up"),
    ["<C-d>"] = scroll_with_center("down"),

    -- Поиск с центрированием
    ["n"]     = search_with_center(true),  -- Вперёд
    ["N"]     = search_with_center(false), -- Назад

    -- Остальные стандартные для neoscroll
    ["<C-b>"] = function() neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 450) end,
    ["<C-f>"] = function() neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 450) end,
    ["<C-y>"] = function() neoscroll.scroll(-0.1, false, 100) end,
    ["<C-e>"] = function() neoscroll.scroll(0.1, false, 100) end,
    ["zt"]    = function() neoscroll.zt(250) end,
    ["zz"]    = function() neoscroll.zz(250) end,
    ["zb"]    = function() neoscroll.zb(250) end,
}

-- modes: Normal, Visual, Select
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func, { silent = true })
end
