return {
	'Civitasv/cmake-tools.nvim',
	config = function()
		require 'cmake-tools'.setup({
			cmake_generate_options = {
				"-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
				"-Bbuild",
				"-DCMAKE_TOOLCHAIN_FILE=c:/vcpkg/scipts/buildsystems/vcpkg.cmake",
				"-DVCPKG_TARGET_TRIPLET=edr-x64-windows",
			},
		})
	end,
	opts = {},
}
