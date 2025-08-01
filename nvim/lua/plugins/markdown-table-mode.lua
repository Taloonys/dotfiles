return {
  'Kicamon/markdown-table-mode.nvim',
  config = function()
    require('markdown-table-mode').setup()
    -- call `:Mtm` to ensert this mode, it will attempt to trigget lines with `|`
  end
}
