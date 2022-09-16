require'FTerm'.setup({
  cmd = 'nu',
  border = 'double',
  blend = 10,
  dimensions  = {
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5
  },
  auto_close = false,
})

-- Example keybindings
-- vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
