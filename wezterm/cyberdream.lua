-- cyberdream theme for wezterm
return {
    foreground = "#ffffff",
    background = "#16181a",

    cursor_bg = "#ffffff",
    cursor_fg = "#16181a",
    cursor_border = "#ffffff",

    selection_fg = "#ffffff",
    selection_bg = "#3c4048",

    scrollbar_thumb = "#16181a",
    split = "#16181a",

    ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },

    tab_bar = {
        background = "#16181a",

        active_tab = {
            bg_color = "#ffbd5e", -- bright orange
            fg_color = "#16181a", -- black text
            intensity = "Bold",
            underline = "None",
            italic = false,
            strikethrough = false,
        },

        inactive_tab = {
            bg_color = "#1e2022",
            fg_color = "#5ea1ff", -- cold blue
        },

        inactive_tab_hover = {
            bg_color = "#3c4048",
            fg_color = "#ffffff",
            italic = true,
        },

        new_tab = {
            bg_color = "#16181a",
            fg_color = "#5ef1ff", -- cyan
        },

        new_tab_hover = {
            bg_color = "#3c4048",
            fg_color = "#ffffff",
            italic = true,
        },
    }
}
