-- LSP helper function

local cmd = vim.cmd

local M = {}

cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

-- This function defines the on_attach function for several languages which share the same key-bidings
function M.common_on_attach(client, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Helper function
  local opts = {noremap = true, silent = true}
  local function bufnoremap(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end

  bufnoremap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  bufnoremap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  bufnoremap('n', '<leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')

  bufnoremap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
  bufnoremap('n', 'gr', '<Cmd>Telescope lsp_references<CR>')  -- Uses Telescope

  bufnoremap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  bufnoremap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')

  bufnoremap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')

  bufnoremap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')

  bufnoremap('n', '<leader>F', '<Cmd>lua vim.lsp.buf.format()<CR>')

  bufnoremap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
  bufnoremap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>')

  if client.server_capabilities.document_formatting then
    cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

return M
