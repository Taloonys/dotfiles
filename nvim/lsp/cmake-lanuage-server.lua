return {
    -- Well... it require python 3 venv for install, type `sudo apt install python3-venv`
    cmd = { 'cmake-language-server' },
    root_markers = { '.git', 'build', 'out', 'CMakePresets.json' },
    filetypes = { 'cmake' },
}
