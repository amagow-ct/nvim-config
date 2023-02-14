-- General keymaps that are not pluggin dependant
local Utils = require('utils')

local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap

-- Copy to clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y')

-- Paste from clipboard
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- Delete without changing register
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- Select all text current buffer
nnoremap('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- File explorer
nnoremap('<F2>', '<Cmd>NvimTreeToggle<CR>') 
