return {
	cmd = { 'clangd' },
	root_markers = { '.clangd', 'compile_commands.json' },
	filetypes = { 'h', 'hpp', 'c', 'cpp' },
	on_new_config = function(new_config)
		local status, cmake = pcall(require, "cmake-tools")
		if status then
			cmake.clangd_on_new_config(new_config) -- Auto change resources to new config (Debug/Release/...)
		end
	end,
}
