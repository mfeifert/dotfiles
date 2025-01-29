vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoread = true
vim.o.clipboard = 'unnamedplus'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.writebackup = false

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>f', ':FZF<cr>')
vim.keymap.set('n', '<leader>w', ':set wrap!<cr>')
vim.keymap.set('n', '<leader>h', ':let @/ = ""<cr>')
vim.keymap.set('n', '<leader>b', ':lua toggle_background()<cr>')
vim.keymap.set('n', 'H', ':bn<cr>')
vim.keymap.set('n', 'L', ':bp<cr>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<leader>t', ':tabnew<cr>')
vim.keymap.set('n', '<Tab>', ':tabnext<cr>')
vim.keymap.set('n', '<S-Tab>', ':tabprevious<cr>')

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.c", "*.h"},
  callback = function ()
    vim.cmd(":silent !indent -kr %")
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function ()
    if vim.tbl_contains({ 'sh', 'bash', 'zsh' }, vim.bo.filetype) then
      vim.cmd(":silent !shfmt -w -i 2 -ci %")
    end
  end,
})

function toggle_background()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end
