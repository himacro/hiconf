local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- Settings for filetypes:
-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
  'yaml', 'lua'
},
command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Terminal settings:
-- Open a Terminal on the right tab
autocmd('CmdlineEnter', {
--  command = 'command! Term :botright vsplit term://$SHELL'
  command = 'command! Term :botright vsplit term://nu'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})

