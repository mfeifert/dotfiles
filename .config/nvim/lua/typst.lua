local M = {}

function M.watch()
  local current_file = vim.fn.expand('%')
  local win_width = vim.api.nvim_win_get_width(0)
  local threshold = 120

  if win_width >= threshold then
	  vim.cmd('belowright vsplit')
	  vim.cmd('vertical resize 30')
	  local cmd = 'typst watch ' .. current_file
	  vim.cmd('terminal ' .. cmd)
	  vim.api.nvim_input([[<C-w>h]])
  else
	  vim.cmd('belowright split')
	  vim.cmd('resize 10')
	  local cmd = 'typst watch ' .. current_file
	  vim.cmd('terminal ' .. cmd)
	  vim.api.nvim_input([[<C-w>k]])
  end

end

function M.open_pdf_in_zathura()
  local pdf_path = vim.fn.expand('%:p:r') .. '.pdf'
  vim.fn.jobstart({ 'zathura', '--fork', pdf_path }, { detach = true })
end

return M
