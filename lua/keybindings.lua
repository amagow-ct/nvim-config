-- General keymaps that are not pluggin dependant
local Utils = require('utils')

local km = vim.keymap
local nnoremap = Utils.nnoremap

km.set('n', '<C-q>', '<Cmd>qa<CR>')

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
nnoremap('<F3>', '<Cmd>NvimTreeFocus<CR>') 
nnoremap('<F4>', '<Cmd>NvimTreeFindFile<CR>') 

-- Buffer navigation
nnoremap('gt', '<Cmd>bnext<CR>')
nnoremap('gT', '<Cmd>bprevious<CR>')

-- Buffer control
nnoremap('<leader>bd', '<Cmd>bdelete<CR>')

-- Telescope
local builtin = require('telescope.builtin') 
km.set('n', '<leader>ff', builtin.find_files)
km.set('n', '<leader>fG', builtin.grep_string)
km.set('n', '<leader>fg', builtin.live_grep)
km.set('n', '<leader>fb', builtin.buffers)
km.set('n', '<leader>fh', builtin.help_tags)
km.set('n', '<leader>fc', builtin.git_commits)
km.set('n', '<leader>fC', builtin.git_bcommits)

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
nnoremap('<leader>gg', '<Cmd>Git<CR>')
nnoremap('<leader>ga', '<Cmd>Git add %:p<CR>')
nnoremap('<leader>gA', '<Cmd>Git add %:p<CR>')
nnoremap('<leader>gs', '<Cmd>Git status<CR>')
nnoremap('<leader>gc', '<Cmd>Git commit -v -q<CR>')
nnoremap('<leader>gC', '<Cmd>Git commit -v -q %:p<CR>')
nnoremap('<leader>gd', '<Cmd>Git diff<CR>')
nnoremap('<leader>gL', '<Cmd>Git log<CR>')
