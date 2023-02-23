-- General keymaps that are not pluggin dependant
local Utils = require('utils')

local km = vim.keymap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap

-- Copy to clipboard
km.set({'n', 'x'}, '<leader>y', '"+y')

-- Paste from clipboard
km.set({'n', 'x'}, '<leader>p', '"+p')

-- Delete without changing register
km.set({'n', 'x'}, 'x', '"_x')

-- Select all text current buffer
nnoremap('<leader>a', ':keepjumps normal! ggVG<cr>')

-- File explorer
nnoremap('<F2>', '<Cmd>NvimTreeToggle<CR>') 

  -- Gitsigns
km.set({'n', 'v'}, '<leader>hs', '<Cmd>Gitsigns stage_hunk<CR>')
km.set({'n', 'v'}, '<leader>hr', '<Cmd>Gitsigns reset_hunk<CR>')
nnoremap('<leader>hS', '<Cmd>Gitsigns stage_buffer<CR>')
nnoremap('<leader>hy', '<Cmd>Gitsigns undo_stage_hunk<CR>')
nnoremap('<leader>hR', '<Cmd>Gitsigns reset_buffer<CR>')
nnoremap('<leader>hp', '<Cmd>Gitsigns preview_hunk<CR>')
nnoremap('<leader>hb', '<Cmd>Gitsigns blame_line<CR>')
nnoremap('<leader>tb', '<Cmd>Gitsigns toggle_current_line_blame<CR>')
nnoremap('<leader>hd', '<Cmd>Gitsigns diffthis<CR>')
nnoremap('<leader>hD', '<Cmd>Gitsigns diffthis ~<CR>')
nnoremap('<leader>td', '<Cmd>Gitsigns toggle_deleted<CR>')
km.set('n', ']c', function() 
  if vim.wo.diff then return ']c' end 
  vim.schedule(function() vim.cmd('Gitsigns next_hunk') end)
  return '<Ignore>'
end, {expr=true})
km.set('n', '[c', function() 
  if vim.wo.diff then return '[c' end 
  vim.schedule(function() vim.cmd('Gitsigns prev_hunk') end)
  return '<Ignore>'
end, {expr=true})

