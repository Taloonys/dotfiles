local osys = require "cmake-tools.osys"
require "cmake-tools".setup {
	cmake_generate_options = {
		"-GNinja",
		"-DCMAKE_C_COMPILER=C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Enterprise\\VC\\Tools\\MSVC\\14.29.30133\\bin\\Hostx64\\x64\\cl.exe\\cl.exe",
		"-DCMAKE_CXX_COMPILER=C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Enterprise\\VC\\Tools\\MSVC\\14.29.30133\\bin\\Hostx64\\x64\\cl.exe\\cl.exe",
		"-DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake",
		"-DVCPKG_TARGET_TRIPLET=edr-x64-windows",
		"-DEDR_FULL_BUILD=ON",
		"-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
	},
	cmake_build_directory = function()
		if osys.iswin32 then
			return "out\\${variant:buildType}"
		end
		return "out/${variant:buildType}"
	end,
	cmake_executor = {
		name = "overseer",
	}
}
