local M = {}

function M.setup()
	-- Настройки notify (должны быть перед noice)
	require("notify").setup({
		background_colour = "#000000",
		stages = "fade",
		timeout = 3000,
		render = "minimal",
		top_down = false,
	})

	-- Основные настройки noice
	require("noice").setup({
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
			lsp_doc_border = false,
		},
		views = {
			notify = {
				background_colour = "#000000",
				border = { style = "none" },
			},
			popup = {
				border = { style = "none" },
			},
			cmdline_popup = {
				border = { style = "none" },
			},
		},
		routes = {
			{
				filter = { event = "msg_showmode" },
				opts = { skip = true },
			},
		},
	})

	-- Дополнительные настройки подсветки
	vim.api.nvim_set_hl(0, "NoiceBorder", { blend = 100 })
	vim.api.nvim_set_hl(0, "NotifyBorder", { blend = 100 })
	vim.api.nvim_set_hl(0, "NoicePopupBorder", { blend = 100 })
end

return M
