vim.cmd('colorscheme lunaperche')
vim.cmd('syntax on')

vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = false
vim.o.laststatus = 1
vim.o.linebreak = true
vim.o.ruler = false
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.sidescrolloff = 8
vim.o.writebackup = false

vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>b', '<Cmd>FzfLua buffers<CR>')
vim.keymap.set('n', '<Leader>c', ':colorscheme ')
vim.keymap.set('n', '<Leader>f', '<Cmd>FzfLua files<CR>')
vim.keymap.set('n', '<Leader>g', '<Cmd>FzfLua live_grep<CR>')
vim.keymap.set('n', '<Leader>h', '<Cmd>set hlsearch!<CR>')
vim.keymap.set('n', '<Leader>n', '<Cmd>set number!<CR>')
vim.keymap.set('n', '<Leader>s', '<Cmd>if exists("g:syntax_on") | syntax off | else | syntax on | endif<CR>')
vim.keymap.set('n', '<Leader>w', '<Cmd>set wrap!<CR>')
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR><Cmd>echo<CR>')
vim.keymap.set('n', 'H', '<Cmd>bprevious<CR>')
vim.keymap.set('n', 'L', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<Tab>', '<Cmd>tabnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>tabprevious<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '"', '""<Left>')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cinoptions = ':0,l1,t0'
    vim.opt_local.formatprg = 'maf-indent'
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.go',
  command = 'silent !go fmt %'
})

vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI', 'InsertEnter' }, {
  callback = function() vim.cmd('echo') end,
})
