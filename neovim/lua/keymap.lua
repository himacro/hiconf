local function map(mode, lhs, rhs, opts)
    local options = {noremap=true, silent=true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

----------------------------------------------------------
-- Leader key
----------------------------------------------------------
vim.g.mapleader = ','


----------------------------------------------------------
-- Search
----------------------------------------------------------
map('n', '<leader>c', ':nohl<CR>')


----------------------------------------------------------
-- Navigation
----------------------------------------------------------
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')
map('i', '<A-h>', '<C-\\><C-N><C-w>h')
map('i', '<A-j>', '<C-\\><C-N><C-w>j')
map('i', '<A-k>', '<C-\\><C-N><C-w>k')
map('i', '<A-l>', '<C-\\><C-N><C-w>l')
map('t', '<A-h>', '<C-\\><C-N><C-w>h')
map('t', '<A-j>', '<C-\\><C-N><C-w>j')
map('t', '<A-k>', '<C-\\><C-N><C-w>k')
map('t', '<A-l>', '<C-\\><C-N><C-w>l')

local function has_module(module_name)
  local status_ok, _ = pcall(require, module_name)
  return status_ok
end

if has_module('telescope') then
  map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
  map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
  map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
  map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
  map('n', '<leader>fr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
  map('n', '<leader>fw', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>")

  map('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
  map('i', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
  map('i', '<F2>', "<cmd>lua require('telescope.builtin').builtin()<cr>")
  map('n', '<F2>', "<cmd>lua require('telescope.builtin').builtin()<cr>")
  -- map('n', '<C-S-f>', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
  -- map('i', '<C-S-f>', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
end


if has_module('neo-tree') then
  map('n', '\\', '<cmd>Neotree reveal<cr>')
end

if has_module('FTerm') then
   map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<cr>')
   map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<cr>')
   map('n', '<C-`>', '<CMD>lua require("FTerm").toggle()<cr>')
   map('t', '<C-`>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<cr>')
end
