return {
	"ellisonleao/glow.nvim", 
	config = function() 
		require('glow').setup({
			border = "curved",
			style = "dark",
			width = 120,
		})
	end, 
	cmd = "Glow"
}
