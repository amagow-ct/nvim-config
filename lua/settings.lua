local o = vim.opt
local g = vim.g

-- Visual
o.cmdheight = 1
o.pumheight = 10
o.showtabline = 2
o.title = true
o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'

-- Behaviour
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.smarttab = true
o.expandtab = true
o.tabstop = 8
o.softtabstop = 0
o.shiftwidth = 2
o.mouse = 'a'

g.mapleader = ' '

-- Netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Auto complete
o.completeopt = {'menu', 'menuone', 'noselect'}

-- treesitter folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
