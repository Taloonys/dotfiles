return {
	'Civitasv/cmake-tools.nvim', 
	config = function()
		require 'cmake-tools'.setup({
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
		})
	end,
	opts = {} 
}
