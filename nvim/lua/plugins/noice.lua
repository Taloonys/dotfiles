-- lazy.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	opts = {
		-- Отключить предупреждение о background_colour
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
	},
	init = function()
		-- Настройка nvim-notify для прозрачности
		local notify = require("notify")
		notify.setup({
			background_colour = "#000000", -- Это должно убрать предупреждение
			-- Альтернативно, можно попробовать:
			-- background_colour = "NotifyBackground",
			-- или
			-- render = "minimal",
			stages = "fade", -- Плавное исчезновение уведомлений
			timeout = 3000,
			max_width = 60,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "rounded" })
				-- Full transparent notify body
				vim.api.nvim_win_set_option(win, "winblend", 0) -- 0-100 (0 - полностью непрозрачный, 100 - полностью прозрачный)
			end,
		})

		-- Переопределить стандартные сообщения vim.notify
		vim.notify = notify
	end,
}
