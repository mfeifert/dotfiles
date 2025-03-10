vim.o.number = false
vim.o.relativenumber = false
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 4
vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoread = true
vim.o.clipboard = 'unnamedplus'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.laststatus = 1
vim.cmd(":colorscheme vim")
vim.cmd(":syntax off")

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
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.c", "*.h"},
  callback = function ()
    vim.cmd(":silent !maf-indent %")
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function ()
    if vim.tbl_contains({ 'sh', 'bash', 'zsh' }, vim.bo.filetype) then
      vim.cmd(":silent !maf-shfmt %")
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
