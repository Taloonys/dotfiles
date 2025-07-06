function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "none" })

	vim.api.nvim_set_hl(0, "NoicePopup", { bg = "none" })
	vim.api.nvim_set_hl(0, "NoicePopupBorder", { bg = "none", fg = "none" })

	-- Fix telescope borders colors
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })

	-- Fix colors for inactive windows (also for split & telescope)
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

ColorMyPencils()
