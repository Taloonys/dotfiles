local neoscroll = require 'neoscroll'
local neoscroll = require('neoscroll')

-- Настройки плагина (опционально)
neoscroll.setup({
    easing_function = "quadratic", -- Плавность анимации
    respect_scrolloff = true,      -- Учитывать scrolloff при скроллинге:cite[4]
})

-- Кастомные функции для скроллинга с центрированием
local function scroll_with_center(direction)
    return function()
        -- Плавный скролл через neoscroll
        if direction == "up" then
            neoscroll.scroll(-vim.wo.scroll, true, 250) -- Вверх
        else
            neoscroll.scroll(vim.wo.scroll, true, 250)  -- Вниз
        end
        -- Центрирование через vim.cmd (после скролла)
        vim.schedule(function()
            vim.cmd("normal! zz")
        end)
    end
end

-- Поиск с центрированием (n/N)
local function search_with_center(forward)
    return function()
        vim.cmd(forward and "normal! n" or "normal! N") -- Поиск
        vim.schedule(function()
            vim.cmd("normal! zzzv")                     -- Центрирование + открытие фолда
        end)
    end
end

-- Клавиши с плавным скроллом + центрированием
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

-- Применяем для режимов: Normal, Visual, Select
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func, { silent = true })
end


require 'tiny-glimmer'.setup()
