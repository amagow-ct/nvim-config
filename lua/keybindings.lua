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

-- Buffer navigation
nnoremap('gt', '<Cmd>bnext<CR>')
nnoremap('gT', '<Cmd>bprevious<CR>')

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

-- vim fugitive
-- nnoremap <space>ga :Git add %:p<CR><CR>
-- nnoremap <space>gs :Gstatus<CR>
-- nnoremap <space>gc :Gcommit -v -q<CR>
-- nnoremap <space>gt :Gcommit -v -q %:p<CR>
-- nnoremap <space>gd :Gdiff<CR>
-- nnoremap <space>ge :Gedit<CR>
-- nnoremap <space>gr :Gread<CR>
-- nnoremap <space>gw :Gwrite<CR><CR>
-- nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
-- nnoremap <space>gp :Ggrep<Space>
-- nnoremap <space>gm :Gmove<Space>
-- nnoremap <space>gb :Git branch<Space>
-- nnoremap <space>go :Git checkout<Space>
-- nnoremap <space>gps :Dispatch! git push<CR>
-- nnoremap <space>gpl :Dispatch! git pull<CR>
