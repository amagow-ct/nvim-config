local vim = vim
local api = vim.api

vim.cmd('colorscheme onedark')

-- Does not work unless is a callback
local foldCallback = function() vim.schedule(function() vim.cmd("normal zR") end) end
local treesitterFoldGroup = api.nvim_create_augroup("TreesitterOpenFolds", { clear = true })
api.nvim_create_autocmd({"BufReadPost", "FileReadPost"}, {
  pattern = "*",
  group = treesitterFoldGroup,
  callback = foldCallback
})

local autoformatGroup = api.nvim_create_augroup("Autoformat", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  pattern = '*',
  group = autoformatGroup,
  command = 'lua vim.lsp.buf.format()',
})
