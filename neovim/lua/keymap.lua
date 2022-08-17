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



