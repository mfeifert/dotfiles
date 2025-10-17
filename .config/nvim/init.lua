vim.o.number = false
vim.o.relativenumber = false
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 4
vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoread = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.laststatus = 1
vim.o.clipboard = 'unnamedplus'

vim.cmd(':colorscheme lunaperche')
vim.cmd(':syntax on')

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', ':set wrap!<cr>')
vim.keymap.set('n', '<leader>n', ':set number!<cr>')
vim.keymap.set('n', '<leader>t', ':lua toggle_background()<cr>')
vim.keymap.set('n', '<leader>s', ':if exists("g:syntax_on") | syntax off | else | syntax enable | endif<CR>')
vim.keymap.set('n', '<leader>h', ':let @/ = ""<cr>')
vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('n', 'H', ':bn<cr>')
vim.keymap.set('n', 'L', ':bp<cr>')
vim.keymap.set('n', '<Tab>', ':tabnext<cr>')
vim.keymap.set('n', '<S-Tab>', ':tabprevious<cr>')
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '"', '""<Left>')
vim.keymap.set('n', '<leader>f', ':FZF<cr>')
vim.keymap.set('n', '<leader>g', ':Rg<cr>')  -- requires fzf.vim plugin
vim.keymap.set('n', '<leader>b', ':Buffers<cr>')  -- requires fzf.vim plugin

-- vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
-- vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
-- vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
-- vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('i', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('i', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('i', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('i', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.api.nvim_create_autocmd({ 'TermOpen', 'WinEnter' }, {
  pattern = 'term://*',
  command = 'startinsert'
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.c', '*.h' },
  command = ":silent !maf-indent %"
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.go',
  command = ":silent !go fmt %"
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*',
  callback = function ()
    if vim.tbl_contains({ 'sh', 'bash', 'zsh' }, vim.bo.filetype) then
      vim.cmd(':silent !maf-shfmt %')
    end
  end
})

function toggle_background()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end
